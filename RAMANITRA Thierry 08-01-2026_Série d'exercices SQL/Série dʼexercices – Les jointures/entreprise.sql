/* création de la base de données 
 Étape 1 : Création de la base de données (en requête ou via
 lʼinterface de PHPMyAdmin */
 
CREATE DATABASE entreprise;
USE entreprise;

/*Étape 2 : Création des tables */
Tables departements CREATE TABLE departments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_departement VARCHAR(100)
);

Tables employes CREATE TABLE employes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(150),
    id_departement INT,
    date_embauche DATE,
    FOREIGN KEY (id_departement) REFERENCES departments(id)
);

/* Étape 3 : Insertion de données  */

INSERT INTO departements (nom) VALUES
    ('Informatique'),
    ('Marketing'),
    ('Ressources humaines'),
    ('Finance'),;


INSERT INTO employes (nom, prenom, email, id_departement, date_embauche)
VALUES (
        'Durand',
        'Sophie',
        'sophie.durand@email.com',
        1,
        '2022-05-10'
    ),
    (
        'Morel',
        'Julien',
        'julien.morel@email.com',
        1,
        '2023-03-15'
    ),
    (
        'Roche',
        'Claire',
        'claire.roche@email.com',
        2,
        '2021-08-20'
    ),
    (
        'Petit',
        'Karim',
        'karim.petit@email.com',
        3,
        '2020-11-01'
    ),
    (
        'Lopez',
        'Anna',
        'anna.lopez@email.com',
        4,
        '2024-01-10'
    ),
    (
        'Nguyen',
        'Thomas',
        'thomas.nguyen@email.com',
        2,
        '2022-12-05'
    );


/*
 Exercices – Requêtes avec jointures
 Exercice 1 – Jointure simple : employés et départements
 Objectif : Utiliser une jointure INNER JOIN .
 Énoncé :
 Affichez le prénom, le nom et le nom du département de chaque employé
 */


SELECT e.prenom,
    e.nom,
    d.nom
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id;


/*
 Exercice 2 – Trier les résultats
 Objectif : Ajouter un tri à une jointure.
 Énoncé :
 Affichez les mêmes informations que lʼexercice précédent, triées par nom de
 département (ordre alphabétique).
 */


SELECT e.prenom,
    e.nom,
    d.nom
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
ORDER BY d.nom;


/* Exercice 3 – Filtrer sur un champ de la table liée
 Objectif : Appliquer un filtre sur une table jointe.
 Énoncé :
 Affichez les employés qui travaillent dans le département "Informatique".
 */


SELECT e.prenom,
    e.nom,
    d.nom
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
WHERE d.nom = 'Informatique';


/*  Exercice 4 – Employés embauchés après une certaine date
 Objectif : Utiliser un filtre sur une date dans une requête avec jointure.
 Énoncé :
 Affichez les employés (nom, prénom, email, nom du département) embauchés
 après le 1er janvier 2022. */


SELECT e.prenom,
    e.nom,
    e.email,
    d.nom
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
WHERE e.date_embauche > '2022-01-01';


/* Exercice 5 – Compter les employés par département
 Objectif : Utiliser COUNT() avec GROUP BY et une jointure.
 Énoncé :
 Affichez le nom des départements avec le nombre dʼemployés dans chacun
 dʼeux.  */


SELECT d.nom,
    COUNT(*) AS nb_employes
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
GROUP BY d.nom;


/* Exercice 6 – Afficher uniquement les départements ayant au
 moins 2 employés
 Objectif : Utiliser HAVING après un GROUP BY .
 Énoncé :
 Affichez uniquement les départements ayant au moins 2 employés.
 */


SELECT d.nom,
    COUNT(*) AS nb_employes
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
GROUP BY d.nom
HAVING nb_employes >= 2;


/*  Exercice 7 – Jointure externe : LEFT JOIN
 Objectif : Comprendre LEFT JOIN et les employés sans département
 (hypothétique).
 Énoncé :
 Modifiez un employé pour quʼil nʼait pas de département (mettre id_departement à
 NULL ), puis affichez tous les employés avec leur département (sʼil existe).
  Exemple de modification avant la requête :
 UPDATE employes SET id_departement = NULL WHERE nom = 'Lopez';
 */

 
UPDATE employes
SET id_departement = NULL
WHERE nom = 'Lopez';
SELECT e.prenom,
    e.nom,
    d.nom
FROM employes e
    LEFT JOIN departements d ON e.id_departement = d.id;
