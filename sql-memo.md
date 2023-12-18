# INITIATION SQL

Source : https://www.youtube.com/watch?v=Cz3WcZLRaWc

https://sql.sh/cours

## Comment créer une base de données ?
Il faut rentrer dans le terminal la ligne de commande ci-dessous : 
```
Terminal - Create a Database

mysql> CREATE DATABASE "datebase_name";

mysql> SHOW DATABASES; --> to verify if the database was well created 
```

**OU**

DL l'extension VSCode **"SQLTools"** qui permet également de créer et visualiser une base de données

## Comment faire un commentaire ?

Tout simplement en effectuant un **double-dash (double-tiret)** devant l'élément voulant être mis en **commentaire**

```SQL
Commentaire en SQL

-- commentaire

-- @block --> permet de d'implémenter un "bouton play" au dessus du commentaire nous permettant de lancer le commentaire que l'on veut sans parcourir tout un tas de fichiers/commentaires
```

## Comment créer une table et des colonnes ?
Pour créer une TABLE c'est très simple : on a juste à écrire les mots-clés **"CREATE TABLE"** suivi de **l'Identifiant** de la table, en soit le nom de la table.

Pour créer des colonnes, à la suite de la déclaration de la table, on ouvre des parenthèses dans lesquelles on placera les différentes colonnes en les nommant avec un identifiant qui sera leur nom.
On doit également préciser le **type de données (data type)** des colonnes et optionnellement 1 ou plusieurs **contraintes**(cf. liste contraintes).<br>
Si dans une colonne, on essaye de stocker une donnée d'un autre type que celui spécifié, cela nous enverra une erreur car SQL est très strict par rapport à l'intégrité des données, au type de donnée.

``` SQL
Créer une Table en SQL

CREATE TABLE name(
    id INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE AUTO_INCREMENT,
    bio TEXT,
    country VARCHAR(2)
);
```

## Listez les types de données que vous utiliserez le plus souvent
```SQL
Les types de données les plus courants :

INT = stock un nombre entier
FLOAT = stock nombre décimal
VARCHAR(255) = stock une string (chaine de caractères), entre les parenthèses on va écrire le nombre maximale (max length) de caractères que cette string pourra contenir (le max pouvant être compté est 255)
TEXT = une string pouvant contenir énormément de caractères
```

## Listez des contraintes utiles pour vos colonnes :
 ### - comment préciser qu'une valeur est obligatoire pour une colonne ?
 ```SQL
    CREATE TABLE name(
    id INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL, -- la contrainte "NOT NULL" permet de préciser qu'une valeur doit être spécifiée/obligatoire dans le champs
    bio TEXT,
    country VARCHAR(2)
);
 ```
 ### - comment définir l'id d'une table ?
 ```SQL
    CREATE TABLE name(); --> le troisième mot "name" sert à définir l'identifiant de la table, généralement on lui applique le nom que le l'on veut donner à la table
 ```

 ## Comment préciser que la valeur d'une colonne doit être unique ?(pour une adresse email par exemple)
```SQL
    CREATE TABLE name(
    id INT PRIMARY KEY, -- Dans le langage SQL la “PRIMARY KEY”, autrement la clé primaire, permet d’identifier chaque enregistrement dans une table de base de données. Chaque enregistrement de cette clé primaire doit être UNIQUE et ne doit pas contenir de valeur NULL.
    -- La clé primaire est un index, chacune des tables ne peut contenir qu’une seule clé primaire, composée d’une ou plusieurs colonnes.
    email VARCHAR(255) NOT NULL UNIQUE, -- la contrainte "UNIQUE" permet de préciser qu'une valeur doit être unique, ici chaque email devra être unique
);
 ``` 

 ## Comment insérer des données dans une table ?
Il faut utiliser le mot-clé **"INSERT INTO"** puis ajouter le **nom de la table** en question. Entre les parenthèses, il faudra écrire **l'id des colonnes** que l'on veut updaté dans l'ordre.<br>
Pourquoi dans l'ordre ? Car nous allons par la suite utiliser le mot-clé **"VALUES"** qui va contenir entre ses parenthèses les valeurs qui seront ajoutées dans les colonnes et ce dans l'ordre ou ces valeurs auront été déclarées

 ```SQL
     INSERT INTO id_de_la_table (email, bio, country)
     VALUES (
        'hello@world.com',
        'i love strangers!',
        'US'
     );
 ```
 Ce code permet donc d'ajouter la première ligne de la database et chaque élément sera placé dans la colonne qui lui correspond.

 On peut insérer plusieurs lignes en même temps avec cette notation :
 ```SQL
     INSERT INTO id_de_la_table (email, bio, country)
     VALUES
        ('hello@world.com', 'foo', 'US'),
        ('hola@munda.com', 'bar', 'MX'),
        ('bonjour@monde.com', 'baz', 'FR');
 ```

## Comment récupérer les données insérées ?
Il faut comme toujours utiliser un mot-clé ici ça sera **"SELECT"**. Ce mot-clé nous permet de lire une donnée de la database, de nous la retourner dans une "result table"

```SQL
    Ce mot-clé "SELECT" nous permet de lire une donnée de la database, de nous la retourner dans une "result table" :
    SELECT;

    Si on veut lire l'entièreté d'une table on écrit ça :
    SELECT * FROM nom_de_la_table;
```

## Comment ne sélectionner qu'un certain nombre de résultats ?
Il faut juste séparer la déclaration des éléments/colonnes par des virgules :

```SQL
    SELECT email, id FROM nom_de_la_table;
```

## Comment trier les résultats ?
Pour sélectionner seulement un certains nombre de ligne parmis ces seules colonnes ciblées, on utilise le mot-clé **"LIMIT"** + nb ligne voulue :

``` SQL
     SELECT email, id FROM nom_de_la_table;
     LIMIT 2;
```

Pour sélectionner seulement un certains nombre de ligne parmis ces seules colonnes ciblées, et d'ordonner ces lignes selon un id/champs on utilise le mot-clé **"ORDER BY id ASC/DESC
 "** + nb ligne voulue :

 ``` SQL
      SELECT email, id FROM nom_de_la_table;
      ORDER BY id ASC/DESC
      LIMIT 2;
```
## Comment filtrer les données et chaîner les conditions de filtres ?
Avec le mot clé **"WHERE"**

```SQL
    Dans ce cas, ça va seulement nous retourner les lignes ayant pour valeur "US" dans la colonne "country"
    SELECT email, id FROM nom_de_la_table;

    WHERE country = 'US'

    ORDER BY id ASC/DESC
    LIMIT 2;

    On peut également chaîner les conditions en utilisant les connecteurs logiques "AND" ou "OR"
    Ici ça nous retournera toutes les lignes ayant pour valeur "US" dans la colonne "country" et ayant une valeur supérieure à 1 dans la colonne "id" : 
    SELECT email, id FROM nom_de_la_table;

    WHERE country = 'US'
    AND id > 1 

    ORDER BY id ASC/DESC
    LIMIT 2;
```

## Comment filtrer une colonne avec une valeur commençant par un certain caractère ?
Avec le mot clé **"LIKE"** qui sert à rechercher du texte

```SQL
    Dans ce cas ça va nous renvoyer les lignes ayant pour valeur "US" dans la colonne "country" et ayant une valeur dans la colonne "email" commencant par "h"
    SELECT email, id FROM nom_de_la_table;

    WHERE country = 'US'
    AND email LIKE 'h%'

    ORDER BY id ASC/DESC
    LIMIT 2;
```

## A quoi servent les INDEX ? Comment en créer ?
Un **INDEX** est une table de consultation qui permet de récupérer facilement et rapidement des données.<br>
Un index aide la database à rechercher une donnée sans pour autant toutes les parcourir

```SQL
CREATE INDEX email_index ON "nom_de_la_table"(email);
```

## Comment créer une relation entre 2 tables ?

```SQL
    CREATE TABLE Rooms(
        id INT AUTO_INCREMENT,
        street VARCHAR(255),
        owner_id INT NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (owner_id) REFERENCES Users(id)
    )
```

Si on a plusieurs **PRIMARY KEY** on les déclare de cette manière 
```SQL
    CREATE TABLE users_users(
    user1_id INTEGER NOT NULL UNIQUE,
    user2_id INTEGER NOT NULL UNIQUE,
    PRIMARY KEY (user1_id, user2_id),
    FOREIGN KEY (user1_id) REFERENCES users(id),
    FOREIGN KEY (user2_id) REFERENCES users(id)
);
```

## Comment sélectionner les données de plusieurs tables ?

Avec le mot-clé **"JOIN"**. Quand on utilise JOIN on va en fait lire des données de 2 tables différentes.

Plus précisément : Les jointures en SQL permettent d’associer plusieurs tables dans une même requête. Cela permet d’exploiter la puissance des bases de données relationnelles pour obtenir des résultats qui combinent les données de plusieurs tables de manière efficace.

Il existe plusieurs types de JOIN et chacun ont une utilité spécifique :
- LEFT : jointure externe pour retourner tous les enregistrements de la table de gauche (LEFT = gauche) même si la condition n’est pas vérifié dans l’autre table
- RIGHT :  jointure externe pour retourner tous les enregistrements de la table de droite (RIGHT = droite) même si la condition n’est pas vérifié dans l’autre table
- INNER :  jointure interne pour retourner les enregistrements quand la condition est vrai dans les 2 tables. C’est l’une des jointures les plus communes.
- OUTER :  jointure externe pour retourner les résultats quand la condition est vrai dans au moins une des 2 tables

```SQL 
    SELECT * FROM Users(name_table_1);
    INNER JOIN Rooms(name_table_2);
    ON Rooms.owner_id = Users.id; -- "ON" = la condition qui si elle est vraie, va permettre de sélectionner des données de plusieurs tables
```
<font size = 2>
Sources : https://sql.sh/cours/jointures
</font>

## Comment ne sélectionner que certaines colonnes et les renommer dans la liste de résultats ?

## Comment supprimer une table et une base de données ?
On peut supprimer une donnée avec le mot-clé **"DROP"** 

Pour supprimer une table il suffit d'écrire **"DROP TABLE nom_de_la_table;"**

Pour supprimer une base de données : **"DROP DATABASE nom_de_la_BDD;"**

```SQL
DROP TABLE name;
DROP DATABASE name;
DROP VIDEO name/link;

