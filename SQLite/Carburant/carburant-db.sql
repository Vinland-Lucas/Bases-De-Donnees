-- SQLite

-- SUPPRESSION DE POTENTIELLES TABLES EXISTANTES
DROP TABLE IF EXISTS point_de_vente;
DROP TABLE IF EXISTS carburant;
DROP TABLE IF EXISTS service;
DROP TABLE IF EXISTS horaires;
DROP TABLE IF EXISTS fermeture;
DROP TABLE IF EXISTS point_de_vente_service;
DROP TABLE IF EXISTS prix;
DROP TABLE IF EXISTS rupture;

-- Creation des TABLES PRINCIPALES
CREATE TABLE point_de_vente(
    idPDV INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    latitude REAL NOT NULL,
    longitude REAL NOT NULL,
    code_postal INT NOT NULL,
    type TEXT CHECK (type IN ('A', 'R')) NOT NULL,
    adresse TEXT NOT NULL,
    ville TEXT NOT NULL,
    automate_24_24 BOOLEAN NOT NULL
);

CREATE TABLE carburant(
    nom TEXT PRIMARY KEY NOT NULL
);

CREATE TABLE service(
    nom TEXT PRIMARY KEY NOT NULL
);

CREATE TABLE horaires(
    idHoraire INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    jour TEXT,
    ferme BOOLEAN,
    horaire_ouverture TEXT,
    horaire_fermeture TEXT,
    PDV_id INTEGER NOT NULL,
    FOREIGN KEY (PDV_id) REFERENCES point_de_vente(idPDV)
);

CREATE TABLE fermeture(
    idFermeture INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    type TEXT NOT NULL,
    debut TEXT NOT NULL,
    fin TEXT NOT NULL,
    PDV_id INTEGER NOT NULL,
    FOREIGN KEY (PDV_id) REFERENCES point_de_vente(idPDV)
);

-- CREATION DES TABLES DE LIAISON
CREATE TABLE point_de_vente_service(
    PDV_id INTEGER NOT NULL,
    service_nom TEXT NOT NULL,
    PRIMARY KEY (PDV_id, service_nom),
    FOREIGN KEY (PDV_id) REFERENCES point_de_vente(idPDV),
    FOREIGN KEY (service_nom) REFERENCES service(nom)
);

CREATE TABLE prix(
    idPrix INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    valeur FLOAT NOT NULL,
    date TEXT NOT NULL,
    PDV_id INTEGER NOT NULL,
    carburant_nom TEXT NOT NULL,
    FOREIGN KEY (PDV_id) REFERENCES point_de_vente(idPDV),
    FOREIGN KEY (carburant_nom) REFERENCES carburant(nom)
);

CREATE TABLE rupture(
    idRupture INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    debut TEXT NOT NULL,
    fin TEXT NOT NULL,
    PDV_id INTEGER NOT NULL,
    carburant_nom TEXT NOT NULL,
    FOREIGN KEY (PDV_id) REFERENCES point_de_vente(idPDV),
    FOREIGN KEY (carburant_nom) REFERENCES carburant(nom)
);

-- INSERTION DES DONNEES DANS LES TABLES
INSERT INTO point_de_vente (latitude, longitude, code_postal, type, adresse, ville, automate_24_24)
    VALUES
        (46.201, 5.198, '01000', 'R', '596 AVENUE DE TREVOUX', 'ANNECY', '0'),
        (46.21842, 5.22767, '01000', 'R', '16 AVENUE DE MARBOZ', 'ANNECY', '0'),
        (46.188, 5.245, '01000', 'R', '20 AVENUE DU MARÉCHAL JUIN', 'ANNECY', '1'),
        (46.20094, 5.19942, '01000', 'R', '642 AVENUE DE TRÉVOUX', 'ANNECY', '0');

-- SELECT * FROM point_de_vente

INSERT INTO carburant (nom)
    VALUES
        ('Gazole'),
        ('SP95'),
        ('SP98'),
        ('E85');

-- SELECT * FROM carburant

INSERT INTO service (nom)
    VALUES
        ('Lavage Automatique'),
        ('Lavage Manuel'),
        ('Aspirateur'),
        ('Gonfle Pneus');

-- SELECT * FROM service

INSERT INTO horaires (jour, ferme, horaire_ouverture, horaire_fermeture, PDV_id)
    VALUES
        ('Lundi', 0, '09.00', '21.00', 1),
        ('Mardi', 0, '09.00', '21.00', 1),
        ('Mercredi', 0, '09.00', '21.00', 1),
        ('Jeudi', 0, '09.00', '21.00', 1),
        ('Vendredi', 0, '09.00', '21.00', 1),
        ('Samedi', 0, '09.00', '22.00', 1),
        ('Dimanche', 0, '09.00', '22.00', 1),
        ('Lundi', 0, '07.00', '20.00', 2),
        ('Mardi', 0, '07.00', '20.00', 2),
        ('Mercredi', 0, '07.00', '20.00', 2),
        ('Jeudi', 0, '07.00', '20.00', 2),
        ('Vendredi', 0, '07.00', '20.00', 2),
        ('Samedi', 0, '07.00', '21.00', 2),
        ('Dimanche', 0, '07.00', '21.00', 2),
        ('Lundi', 0, '00.00', '00.00', 3),
        ('Mardi', 0, '00.00', '00.00', 3),
        ('Mercredi', 0, '00.00', '00.00', 3),
        ('Jeudi', 0, '00.00', '00.00', 3),
        ('Vendredi', 0, '00.00', '00.00', 3),
        ('Samedi', 0, '00.00', '00.00', 3),
        ('Dimanche', 0, '00.00', '00.00', 3),
        ('Lundi', 1, '', '', 4),
        ('Mardi', 0, '06.00', '23.00', 4),
        ('Mercredi', 0, '06.00', '23.00', 4),
        ('Jeudi', 0, '06.00', '23.00', 4),
        ('Vendredi', 0, '06.00', '23.00', 4),
        ('Samedi', 0, '06.00', '23.00', 4),
        ('Dimanche', 1, '', '', 4);

-- SELECT * FROM horaires

INSERT INTO fermeture (type, debut, fin, PDV_id)
    VALUES
        ('temporaire', '2024-07-01 07:00:00', '2024-09-01 07:00:00', 2),
        ('temporaire', '2024-03-01 09:00:00', '2024-04-01 09:00:00', 1);

-- SELECT * FROM fermeture

INSERT INTO point_de_vente_service (pdv_id, service_nom)
    VALUES
        (1, 'Lavage Automatique'),
        (2, 'Lavage Manuel'),
        (3, 'Aspirateur'),
        (4, 'Gonfle Pneus');

-- SELECT * FROM point_de_vente_service

INSERT INTO prix (valeur, date, PDV_id, carburant_nom)
    VALUES
        (1.456, '2023-06-08', 1, 'Gazole'),
        (1.885, '2023-06-08', 1, 'SP95'),
        (1.998, '2023-06-08', 1, 'SP98'),
        (1.009, '2023-06-08', 1, 'E85'),
        (1.456, '2023-05-31', 2, 'Gazole'),
        (1.885, '2023-05-31', 2, 'SP95'),
        (1.998, '2023-05-31', 2, 'SP98'),
        (1.009, '2023-05-31', 2, 'E85'),
        (1.456, '2023-05-28', 3, 'Gazole'),
        (1.885, '2023-05-28', 3, 'SP95'),
        (1.998, '2023-05-28', 3, 'SP98'),
        (1.009, '2023-05-28', 3, 'E85'),
        (1.456, '2023-06-01', 4, 'Gazole'),
        (1.885, '2023-06-01', 4, 'SP95'),
        (1.998, '2023-06-01', 4, 'SP98'),
        (1.009, '2023-06-01', 4, 'E85');

-- SELECT * FROM prix

INSERT INTO rupture (debut, fin, PDV_id, carburant_nom)
    VALUES
        ('2023-05-30 09:00:00', '2023-06-08 09:00:00', 1, 'Gazole'),
        ('2023-05-30 09:00:00', '2023-06-08 09:00:00', 1, 'SP95'),
        ('2023-05-30 09:00:00', '2023-06-08 09:00:00', 1, 'SP98'),
        ('2023-05-30 09:00:00', '2023-06-08 09:00:00', 1, 'E85'),
        ('2023-05-20 07:00:00', '2023-05-31 07:00:00', 2, 'Gazole'),
        ('2023-05-20 07:00:00', '2023-05-31 07:00:00', 2, 'SP95'),
        ('2023-05-20 07:00:00', '2023-05-31 07:00:00', 2, 'SP98'),
        ('2023-05-20 07:00:00', '2023-05-31 07:00:00', 2, 'E85'),
        ('2023-05-20 07:00:00', '2023-05-28 07:00:00', 3, 'Gazole'),
        ('2023-05-20 07:00:00', '2023-05-28 07:00:00', 3, 'SP95'),
        ('2023-05-20 07:00:00', '2023-05-28 07:00:00', 3, 'SP98'),
        ('2023-05-20 07:00:00', '2023-05-28 07:00:00', 3, 'E85'),
        ('2023-05-25 06:00:00', '2023-06-01 06:00:00', 4, 'Gazole'),
        ('2023-05-25 06:00:00', '2023-06-01 06:00:00', 4, 'SP95'),
        ('2023-05-25 06:00:00', '2023-06-01 06:00:00', 4, 'SP98'),
        ('2023-05-25 06:00:00', '2023-06-01 06:00:00', 4, 'E85');

-- SELECT * FROM rupture