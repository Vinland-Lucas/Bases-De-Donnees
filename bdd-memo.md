# LES BASES DE DONNEES

## Introduction

### Qu'est ce qu'un SGBD ?
<b>Définition</b> : Un système de gestion de base de données (SGBD) est le logiciel qui permet à un ordinateur de stocker, récupérer, ajouter, supprimer et modifier des données. Un SGBD gère tous les aspects primaires d'une base de données, y compris la gestion de la manipulation des données, comme l'authentification des utilisateurs, ainsi que l'insertion ou l'extraction des données. Un SGBD définit ce qu'on appelle le schéma de données ou la structure dans laquelle les données sont stockées.

Le SGBD gère trois choses importantes : les données, le moteur de base de données qui permet d'accéder aux données, de les verrouiller et de les modifier, et le schéma de base de données, qui définit la structure logique de la base de données. Ces trois éléments fondamentaux contribuent à assurer la concomitance, la sécurité, l'intégrité des données et l'uniformité des procédures administratives.

Exemple : Les outils que nous utilisons tous au quotidien nécessitent des SGBD en coulisse. Cela comprend les guichets automatiques bancaires, les systèmes de réservation de vols, les systèmes d'inventaire au détail et les catalogues de bibliothèques, par exemple.

Source : 

https://www.oracle.com/fr/database/systeme-gestion-base-de-donnees-sgbd-definition.html

https://www.youtube.com/watch?v=Ecv0PEOvLq0

### Qu'est ce qu'un système d'information ?
<b>Définition</b> : Le système d’information (SI) est un ensemble de ressources et de dispositifs permettant de collecter, stocker, traiter et diffuser les informations nécessaires au fonctionnement d’une organisation (administration, entreprise…).

Les informations peuvent être de tous types : fiscales, financières comptables, commerciales, manégériales...

Le système d'information a un rôle central dans le fonctionnement de l’entreprise. 

En pratique, il permet d’améliorer l’efficacité du fonctionnement interne et externe de l’entreprise. Grâce au système d’information, les informations circulent simplement au sein de l’entreprise mais aussi entres ses partenaires. Par exemple, le système d’information peut permettre :

- d’améliorer la communication entre les différentes équipes de l’entreprise et les partenaires externes ; 

- de supprimer les tâches répétitives ;

- d’optimiser la coordination des tâches au sein de l’entreprise.

Le système d’information permet de faciliter la <b>prise de décision</b>. Grâce au système d’information, le décideur possède toutes les données nécessaires pour prendre une décision.

Source : 

https://payfit.com/fr/fiches-pratiques/systeme-information/


### Qu'est qu'une base de données ?
<b>Définition :</b> Une base de données est un ensemble d'informations qui est organisé de manière à être facilement accessible, géré et mis à jour. Elle est utilisée par les organisations comme méthode de stockage, de gestion et de récupération de l’informations.

Les données sont organisées en lignes, colonnes et tableaux et sont indexées pour faciliter la recherche d'informations. Les données sont mises à jour, complétées ou encore supprimées au fur et à mesure que de nouvelles informations sont ajoutées. Elles contiennent généralement des agrégations d'enregistrements ou de fichiers de données, tels que les transactions de vente, les catalogues et inventaires de produits et les profils de clients.

Une base de données est stockée sous la forme d'un fichier ou d'un ensemble de fichiers sur support de stockage. L'information contenue dans ces fichiers peut être divisée en enregistrements. Ces enregistrements sont constitués d'un ou de plusieurs champs. Un champ constitue une seule pièce d’information, et chaque champ contient généralement des informations se rapportant à un aspect ou attribut de l'entité décrite par la base de données.

Source : 

https://www.oracle.com/fr/database/definition-base-de-donnees.html

https://www.youtube.com/watch?v=Ecv0PEOvLq0

### Citez les différences entre ces éléments 
La Base de Données est le/les fichier(s) qui va contenir toutes les informations. Ce fichier est organisé de manière claire et est mis à jour régulièrement.

Le SGBD lui c'est le logiciel qui va permettre de manipuler les Bases de Données et qui va définir la structure dans laquelle les données seront stockées.<br>
Sans SGBD, la BDD reste un outil théorique « sur papier ». Le SGBD permet concrètement de mettre en place le travail de modélisation et de se servir de la base de données imaginée.

Le système d'information(SI) lui comprend TOUTES les ressources permettant à une organisation d'obtenir une information sur son fonctionnement(performances...). C'est un peu comme le résultat/produit final de l'addition de chaque éléments.<br>
Le SGBD est par exemple un sous-ensemble du SI.

## Modèle Conceptuel de Données (MCD)

### Qu’est ce qu’un MCD et pourquoi est-ce que cela existe ?
Le modèle conceptuel des données (MCD) a pour but d'écrire de façon formelle les données qui seront utilisées par le système d'information. Il s'agit donc d'une représentation graphique des données, permettant facilement et simplement de comprendre comment les différents éléments(entités) sont liés entre eux..<br>

Le MCD existe pour donner une représentation claire des données du Système d'Information à concevoir;

### Comment représenter une entité ?
Une entité est la représentation d'un élément matériel ou immatériel ayant un rôle dans le système que l'on désire décrire.

On appelle classe d'entité un ensemble composé d'entités de même type, c'est-à-dire dont la définition est la même. Le classement des entités au sein d'une classe s'appelle classification (ou abstraction). Une entité est une instanciation de la classe. Chaque entité est composée de propriétés, données élémentaires permettant de la décrire.

Prenons par exemple une Ford Fiesta, une Renault Laguna et une Peugeot 306. Il s'agit de 3 entités faisant partie d'une classe d'entité que l'on pourrait appeler voiture. La Ford Fiesta est donc une instanciation de la classe voiture. Chaque entité peut posséder les propriétés couleur, année et modèle.

Les classes d'entités sont représentées par un rectangle. Ce rectangle est séparé en deux champs :

- le champ du haut contient le libellé. Ce libellé est généralement une abréviation pour une raison de simplification de l'écriture. Il s'agit par contre de vérifier qu'à chaque classe d'entité correspond un et un seul libellé, et réciproquement
- le champ du bas contient la liste des propriétés de la classe d'entité

### Comment représenter une liaison entre des entités ?
Une relation (appelée aussi parfois association/liaison) représente les liens sémantiques qui peuvent exister entre plusieurs entités. Une classe de relation contient donc toutes les relations de même type (qui relient donc des entités appartenant à des mêmes classes d'entité). Une classe de relation peut lier plus de deux classes d'entité. Voici les dénominations des classes de relation selon le nombre d'intervenants :

- une classe de relation récursive (ou réflexive) relie la même classe d'entité
- une classe de relation binaire relie deux classes d'entité
- une classe de relation ternaire relie trois classes d'entité
- une classe de relation n-aire relie n classes d'entité

Les classes de relations sont représentées par des rectangles arrondies (ellipses) dont l'intitulé décrit le type de relation qui relie les classes d'entité (généralement un verbe).

### Où mettre les données qui composent nos entités ?
Les classes d'entités sont représentées par un rectangle. Ce rectangle est séparé en deux champs :

- le champ du haut contient le libellé. Ce libellé est généralement une abréviation pour une raison de simplification de l'écriture. Il s'agit par contre de vérifier qu'à chaque classe d'entité correspond un et un seul libellé, et réciproquement
- le champ du bas contient la liste des propriétés de la classe d'entité

### Quels sont les différents types de cardinalité possibles ? Où les placer dans notre schéma ?
Les cardinalités permettent de caractériser le lien qui existe entre une entité et la relation à laquelle elle est reliée. La cardinalité d'une relation est composée d'un couple comportant une borne maximale et une borne minimale, intervalle dans lequel la cardinalité d'une entité peut prendre sa valeur :

- la borne minimale (généralement 0 ou 1) décrit le nombre minimum de fois qu'une entité peut participer à une relation
- la borne maximale (généralement 1 ou n) décrit le nombre maximum de fois qu'une entité peut participer à une relation

Une cardinalité 1.N signifie que chaque entité appartenant à une classe d'entité participe au moins une fois à la relation.<br>
Une cardinalité 0.N signifie que chaque entité appartenant à une classe d'entité ne participe pas forcément à la relation.

Les cardinalités les plus répandues sont les suivantes : (0,N) ; (1,N) ; (0,1) ; (1,1). On peut toutefois tomber sur des règles de gestion imposant des cardinalités avec des valeurs particulières, mais cela reste assez exceptionnel.

On les place sur le <b>trait</b> qui relie le rectangle des entités à celui des relations/liaisons

### Citer quelques bonnes pratiques de normalisation.
- Normalisation des entités : si 2 entités ont les mêmes informations, pas la peine d'avoir 2 entités séparés, il est préférable de les fusionner pour en faire une entité + générique
- Normalisation des noms : 2 attributs/associations ne peuvent pas avoir ne peuvent pas avoir le même nom
- Normalisation des attributs : 
- Normalisation des attributs des associations : est-ce que chaque champs dans une association dépendent de chaque entités auxquels cette association est liée
- Normalisation des associations : 

### A quoi servent les clés primaires ?
Elles sont présentes lorsque l'on passe de la méthode MCD à la méthode MLD.

Avec MCD, on a des <b>identifiants</b> dans les entités. Avec MLD, ces précédents identifiants vont deveinr des <b>clé primaires</b> dans les tables.

En passant du MCD au MLD, les identifiants deviennent des clés primaires.

Une clé primaire partage les mêmes caractéristiques qu’un identifiant : il doit être unique, il est obligatoire et permet d’accélérer les opérations sur la table (via les indexes).

Sources : 

https://web.maths.unsw.edu.au/~lafaye/CCM/merise/mcd.htm#:~:text=Le%20mod%C3%A8le%20conceptuel%20des%20donn%C3%A9es,l'aide%20d'entit%C3%A9s.

https://www.base-de-donnees.com/mcd/

https://www.univ-constantine2.dz/CoursOnLine/Benelhadj-Mohamed/co/Grain_3_1.html

https://www.youtube.com/watch?v=OxJo051TMr8

https://www.youtube.com/watch?v=Pgx0RMKg7bo

https://www.base-de-donnees.com/cle-primaire/


## Modèle Logique de Données (MLD)

### Comment passer d'un MCD au MLD ? Que deviennent les associations ?

Les **ENTITES** deviennent des **TABLES**

Les associations vont dépendre de la cardinalité, pour cela on va regarder les 2 valeurs maximums de chaque cardinalité :
- Si on est sur une relation (1, n) alors il faudra créer une clé étrangère (qui portera comme nom "nom de l'autre table"_id) dans la table qui avait comme cardinalité max "1" et relier cette clé à l'ID de l'autre table.
- Si on est sur une relation (n, m) c'est à dire que les 2 cardinalités maximums sont égales à "n", alors il faudra créer une table de liaison ayant pour nom "nom de la table 1"_"nom de la table 2" à placer dans l'ordre alphabétique. Cette table de liaison est un élément intermédiaire, elle va contenir les attributs/propriétés qui étaient déjà présents dans l'association/liaison dans le MCD. Elle va aussi contenir "nom de la table X"_id que l'on va relier aux tables correspondantes.  

Sources : 

https://www-igm.univ-mlv.fr/~chochois/RessourcesCommunes/BDD/Modelisation/coursMLD.pdf

