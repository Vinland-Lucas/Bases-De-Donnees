-- 2.6 - TP Requetes SQL

/* Donner quelques raisons à l’utilisation de Postgres plutôt qu’un autre SGBD ou autre type
de base de données pour le large dataset sur lequel nous allons travailler. */


-- 1. Récupérez les stations qui possèdent le service "Vente de gaz domestique"
-- 1.a Affichez uniquement le code postal de ces stations
SELECT code_postal FROM point_de_vente
    INNER JOIN service_point_de_vente spdv ON point_de_vente.id = spdv.point_de_vente_id
    INNER JOIN service ON spdv.service_id = service.id
    WHERE service.nom = 'Vente de gaz domestique';

-- 1.b Retirez les doublons
SELECT DISTINCT code_postal FROM point_de_vente
    INNER JOIN service_point_de_vente spdv ON point_de_vente.id = spdv.point_de_vente_id
    INNER JOIN service ON spdv.service_id = service.id
    WHERE service.nom = 'Vente de gaz domestique';

-- 2. Sélectionner le nombre de stations se trouvant à Annecy
-- a. Affichez les stations qui sont ouvertes 24h/24
SELECT * FROM point_de_vente
    WHERE ville = 'ANNECY' AND automate_24_24 = 'true';

/* SELECT ville, COUNT(automate_24_24) FROM point_de_vente
    WHERE ville = 'ANNECY' AND automate_24_24 = 'true'
    GROUP BY ville; */

-- 3. Récupérez le nombre total de stations en France
-- a. Filtrez pour afficher le nombre de stations se trouvant dans le département 29, 23 et 69
SELECT * FROM point_de_vente
    WHERE (code_postal LIKE '29%') OR (code_postal LIKE '23%') OR (code_postal LIKE '69%');

-- 4. Calculez la moyenne des prix du Gazole en France :
-- a. En 2007
SELECT AVG(valeur) FROM prix
    INNER JOIN carburant ON prix.carburant_id = carburant.id
    WHERE (carburant.nom = 'Gazole' AND date::text LIKE '2007%');

-- b. En 2014
SELECT AVG(valeur) FROM prix
    INNER JOIN carburant ON prix.carburant_id = carburant.id
    WHERE (carburant.nom = 'Gazole' AND date::text LIKE '2014%');

-- c. En 2023
SELECT AVG(valeur) FROM prix
    INNER JOIN carburant ON prix.carburant_id = carburant.id
    WHERE (carburant.nom = 'Gazole' AND date::text LIKE '2023%');