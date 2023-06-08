-- SQLite

-- SUPRESSION DES TABLES EXISTANTES
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tweets;
DROP TABLE IF EXISTS hashtags;
DROP TABLE IF EXISTS users_users;
DROP TABLE IF EXISTS tweets_users;
DROP TABLE IF EXISTS hashtags_tweets;

-- Creation des tables principales
CREATE TABLE users(
    idUser INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    address TEXT,
    postal_code INTEGER,
    city TEXT,
    country TEXT
);

CREATE TABLE tweets(
    idTweet INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    content TEXT NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(idUser)
);

CREATE TABLE hashtags(
    name TEXT PRIMARY KEY NOT NULL UNIQUE
);

-- Creation des TABLES DE LIAISONS
CREATE TABLE users_users(
    user1_id INTEGER NOT NULL,
    user2_id INTEGER NOT NULL,
    PRIMARY KEY (user1_id, user2_id),
    FOREIGN KEY (user1_id) REFERENCES users(idUser),
    FOREIGN KEY (user2_id) REFERENCES users(idUser)
);

CREATE TABLE tweets_users(
    user_id INTEGER NOT NULL,
    tweet_id INTEGER NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, tweet_id),
    FOREIGN KEY (user_id) REFERENCES users(idUser),
    FOREIGN KEY (tweet_id) REFERENCES tweets(idTweet)
);

CREATE TABLE hashtags_tweets(
    hashtag_name TEXT NO NULL,
    tweet_id INTEGER NO NULL,
    PRIMARY KEY (hashtag_name, tweet_id),
    FOREIGN KEY (hashtag_name) REFERENCES hashtags(name),
    FOREIGN KEY (tweet_id) REFERENCES tweets(idTweet)
);

-- Insertion des DONNEES dans les TABLES
INSERT INTO users (username, email, address, postal_code, city, country)
VALUES
    ('luczer', 'luczer@gmail.com', 'Les Papeteries', 74000, 'Annecy', 'France'),
    ('ugzer', 'ugzer@gmail.com', 'Les Papeteries', 74000, 'Annecy', 'France'),
    ('romzer', 'romzer@gmail.com', 'Les Papeteries', 74000, 'Annecy', 'France');

-- SELECT * FROM users

INSERT INTO tweets (content, user_id)
VALUES
    ('Je suis trop bg les gars', 1),
    ('Je suis trop guez les gars', 2),
    ('Je suis trop chaud les gars', 3),
    ('Je suis trop petit les gars', 1),
    ('Je suis trop grand les gars', 2),
    ('Je suis trop fort les gars', 3),
    ('Je suis trop faible les gars', 1),
    ('Je suis trop moyen les gars', 2),
    ('JAMAL MUSIALAAAA', 3);

-- SELECT * FROM tweets







