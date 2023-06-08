# SQLite

**SOURCES :**
- https://kinsta.com/fr/blog/sqlite-vs-mysql/
- http://www.finalclap.com/faq/180-sqlite-definition
- https://sqlite.org/index.html
- https://www.sqlite.org/datatype3.html


## Qu’est-ce que SQLite et ses avantages ?

SQLite est un système de base de données qui a la particularité de fonctionner sans serveur, on dit aussi "standalone" ou "base de données embarquée". On peut l'utiliser avec beaucoup de langages : PHP, Python, C# (.NET), Java, C/C++, Delphi, Ruby...

L'intérêt c'est que c'est très léger et rapide à mettre en place, on peut s'en servir aussi bien pour stocker des données dans une vraie base de données sur une application pour smartphone (iPhone ou Android), pour une application Windows, ou sur un serveur web.

Une base de données SQLite est bien plus performante et facile à utiliser que de stocker les données dans des fichiers XML ou binaires, d'ailleurs ces performances sont même comparables aux autres SGBD fonctionnant avec un serveur comme MySQL, Microsoft SQL Server ou PostgreSQL.

**Pourquoi utiliser SQLite ?**<br>
Ce qu'il faut bien garder à l'esprit, c'est que SQLite n'est pas vraiment un concurrent des serveurs de base de données relationnelles, c'est plus une extension de leur champ d'application à des applications offline (là ou avant elles n'étaient utilisé que sur des serveurs sur un modèle client/serveur).

SQLite peut aussi s'avérer très utile sur un site web pour créer des fonctionnalités qui ne sont pas directement liées au site (comme par exemple organiser un jeu concours avec un formulaire où les gens peuvent d'inscrire), évitant ainsi de polluer la base de données principale (fonctionnant sur MySQL par exemple) avec des données temporaires.

L'autre avantage est la simplicité : il n'y a aucune manipulation à faire, le fichier sqlite est créé automatiquement à la volée, toute la base est stockée dans un fichier unique qu'il est facile d'échanger en FTP...

**Avantage de SQLite :**
- Faibles performances du serveur et besoins en mémoire
- Diminue la consommation d’énergie
- Autonome et portable
- Inclus par défaut dans toutes les installations de PHP