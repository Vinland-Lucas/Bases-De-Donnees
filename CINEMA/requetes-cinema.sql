/* 4. Requêtes SQL - cinema_db */


/* Écrire les requêtes de sélection sur une table */

    -- 1. Lister l'ensemble des films */
        SELECT * from films;

    -- 2. Liste des films plus long que 2 heures
        SELECT * from films
        WHERE film_length > '02:00:00';

    -- 3. Liste des films par ordre alphabétique décroissant
        SELECT * from films
        ORDER BY title DESC;

    -- 4. Liste des séances sur les 10 derniers jours
        SELECT * from sessions
        WHERE date BETWEEN SUBDATE(NOW(), INTERVAL 10 DAY) AND NOW();

#         SELECT * from sessions
#         WHERE date >= '2023-12-10 00:00:00'
#         AND date < '2023-12-21 00:00:00'


/* Créer les différentes tables de la base de données */

    -- 1. Liste des films avec Harrison Ford dans son casting
        SELECT * FROM films
        INNER JOIN film_casting ON films.id_films = film_casting.films_id
        WHERE actors_id = 16;

#         SELECT * FROM actors
#         JOIN film_casting ON actors.id_actors = film_casting.actors_id
#         WHERE lastname = 'Ford';

    -- 2. Liste des toutes les salles avec un film ayant Bruce Willis ou Harrison Ford dans son casting
        SELECT r.id_rooms, r.cinemas_id, r.room_number, s.id_sessions, f.title, a.id_actors, a.lastname, a.firstname, fc.role FROM rooms AS r
        INNER JOIN sessions AS s ON r.id_rooms = s.rooms_id
        INNER JOIN films AS f ON s.films_id = f.id_films
        INNER JOIN film_casting AS fc ON f.id_films = fc.films_id
        INNER JOIN actors AS a ON fc.actors_id = a.id_actors
        WHERE actors_id = 11 OR actors_id = 16;

        SELECT DISTINCT r.* FROM rooms AS r
        INNER JOIN sessions AS s ON r.id_rooms = s.rooms_id
        INNER JOIN films AS f ON s.films_id = f.id_films
        INNER JOIN film_casting AS fc ON f.id_films = fc.films_id
        INNER JOIN actors AS a ON fc.actors_id = a.id_actors
        WHERE actors_id = 11 OR actors_id = 16;

    -- 3. Nombre de places totale pour le cinéma Mégarama
        SELECT c.name, SUM(r.number_of_seats) AS number_of_seats FROM rooms AS r
        INNER JOIN cinemas AS c ON r.cinemas_id = c.id_cinemas
        WHERE company = 'Megarama';

    -- 4. Liste des films projetés dans une salle entre 100 et 200 places
        SELECT f.title, c.name, r.room_number, r.number_of_seats FROM films AS f
        INNER JOIN sessions ON f.id_films = sessions.films_id
        INNER JOIN rooms AS r ON sessions.rooms_id = r.id_rooms
        INNER JOIN cinemas AS c ON r.cinemas_id = c.id_cinemas
        WHERE number_of_seats BETWEEN 100 AND 200;

        SELECT DISTINCT f.* FROM films AS f
        INNER JOIN sessions ON f.id_films = sessions.films_id
        INNER JOIN rooms AS r ON sessions.rooms_id = r.id_rooms
        INNER JOIN cinemas AS c ON r.cinemas_id = c.id_cinemas
        WHERE number_of_seats BETWEEN 100 AND 200;

    -- 5. Tous les cinémas qui ont passé ou vont passer star wars
        SELECT DISTINCT c.name FROM cinemas AS c
        INNER JOIN rooms ON c.id_cinemas = rooms.cinemas_id
        INNER JOIN sessions ON rooms.id_rooms = sessions.rooms_id
        INNER JOIN films ON sessions.films_id = films.id_films
        WHERE title = 'Star Wars';

    -- 6. Nombre total de place par cinéma
        SELECT c.id_cinemas, SUM(number_of_seats) AS number_of_seats FROM cinemas AS c
        JOIN rooms AS r ON c.id_cinemas = r.cinemas_id
        GROUP BY c.id_cinemas;

    -- 7. Budget total de tous les films par année de sortie
        SELECT f.release_year, SUM(budget) AS budget FROM films AS f
        GROUP BY f.release_year;


/* Insertion, mise à jour et suppression */

    -- 1. Créer un film avec au moins trois projections pour le mois prochain
        INSERT INTO films (title, release_year, type, budget, film_length)
            VALUES
                ('Jujutsu Kaisen 0', 2022, 'Anime', 100000000, '01:45:00');

        INSERT INTO sessions (films_id, rooms_id, date)
            VALUES
                (8, 1, '2024-01-05 16:30:00'),
                (8, 2, '2024-01-05 21:00:00'),
                (8, 7, '2024-01-07 18:00:00');

        # Plus automatisé mais ça marche aussi comme ça normalement
        #         INSERT INTO sessions (films_id, rooms_id, date)
        #         VALUES
        #             (LAST_INSERT_ID(), 1, DATE_ADD('2023-12-22 16:30:00', INTERVAL 1 MONTH )),
        #             (LAST_INSERT_ID(), 2, DATE_ADD('2023-12-22 21:00:00', INTERVAL 1 MONTH )),
        #             (LAST_INSERT_ID(), 7, DATE_ADD('2023-12-23 18:00:00', INTERVAL 1 MONTH));


    -- 2. Ajouter un cinéma et ses salles
        INSERT INTO cinemas (name, adress, city, phone_number, company)
            VALUES
                ('Ciné Cluses', '110 Chemin de l\'Epinette', 'Cluses', '04 50 62 98 41', 'CinéMonde');

#         DELETE FROM cinemas
#         WHERE id_cinemas = 7;
#
#         ALTER TABLE cinemas AUTO_INCREMENT=3;

        INSERT INTO rooms (cinemas_id, room_number, number_of_seats)
            VALUES
                (4, 1, 120),
                (4, 2, 220),
                (4, 3, 330);

#         Plus automatisé mais ça marche aussi comme ça normalement
#         INSERT INTO rooms (cinemas_id, room_number, number_of_seats)
#             VALUES
#                 (LAST_INSERT_ID(), 1, 120),
#                 (LAST_INSERT_ID(), 2, 220),
#                 (LAST_INSERT_ID(), 3, 330);


    -- 3. Ajouter 1 000 000 au budget du film que vous avez créé
        UPDATE films
        SET budget = budget + 1000000
        WHERE id_films = 8;


    -- 4. Augmenter de 5% le budget de tous les films
        UPDATE films
        SET budget = budget * 1.05;


    -- 5. Supprimer un film
        DELETE FROM films
        WHERE id_films = 8;


    -- 6. Supprimer les films n’ayant aucune projection
        SELECT DISTINCT * FROM films AS f
        LEFT JOIN sessions AS s ON f.id_films = s.films_id
        WHERE s.films_id IS NULL;

        DELETE FROM films
        WHERE id_films = 7;


/* Pour aller plus loin (optionnel) */

    -- 1. Liste de tous les films qui passent aujourd’hui
        SELECT * FROM films AS f
        INNER JOIN sessions AS s ON f.id_films = s.films_id
        WHERE DATE(s.date) = CURRENT_DATE;


    -- 2. Durée totale de projection pour chaque cinéma
        SELECT c.name, SEC_TO_TIME(SUM(TIME_TO_SEC(f.film_length))) AS durée_total_projection FROM films AS f
        INNER JOIN sessions AS s ON f.id_films = s.films_id
        INNER JOIN rooms AS r ON s.rooms_id = r.id_rooms
        INNER JOIN cinemas AS c ON r.cinemas_id = c.id_cinemas
        GROUP BY c.id_cinemas;


    -- 3. Liste de tous les films ne contenant pas Harrison Ford
        SELECT f.title FROM films AS f
        WHERE f.id_films NOT IN (
            SELECT fc.films_id FROM film_casting AS fc
            WHERE fc.actors_id = 16
        );

        SELECT * FROM films AS f
        WHERE f.id_films NOT IN (
            SELECT fc.films_id FROM film_casting AS fc
            JOIN actors AS a ON fc.actors_id = a.id_actors
            WHERE a.lastname = 'FORD'
        );

        SELECT DISTINCT f.title FROM films AS f
        WHERE f.title NOT IN (
            SELECT films.title FROM films
            INNER JOIN film_casting AS fc ON films.id_films = fc.films_id
            WHERE actors_id = 16
        );


    -- 4. Liste des cinémas qui passent tous les films
         SELECT film_per_cinema.cine_name, film_per_cinema.count, films.count FROM (
            SELECT COUNT(DISTINCT f.title) as count, c.name AS cine_name FROM films AS f
            INNER JOIN sessions AS s ON f.id_films = s.films_id
            INNER JOIN rooms AS r ON s.rooms_id = r.id_rooms
            INNER JOIN cinemas AS c ON r.cinemas_id = c.id_cinemas
            GROUP BY c.name) film_per_cinema
            INNER JOIN (SELECT COUNT(DISTINCT f.id_films) AS count FROM films AS f) films
            WHERE film_per_cinema.count = films.count;