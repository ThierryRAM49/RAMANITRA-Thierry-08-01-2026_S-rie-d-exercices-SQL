/* Série dʼexercices – Les
 jointures (suite) */


/* Exercice 8 – Utiliser des alias pour plus de lisibilité
 Objectif : Renommer les tables et colonnes dans une requête avec jointure.
 Énoncé :
 Affichez les colonnes suivantes pour tous les employés, en utilisant des alias :
 prénom de lʼemployé
 nom de lʼemployé
 nom du département (alias : departement )
 date dʼembauche  */


SELECT e.prenom,
    e.nom,
    d.nom AS departement,
    e.date_embauche
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id;


/*  Exercice 9 – Trier les employés selon leur date dʼembauche
 Objectif : Utiliser ORDER BY pour organiser les résultats.
 Énoncé :
 Affichez les noms, prénoms, départements et dates dʼembauche des employés,
 triés du plus ancien au plus récent.
 */


SELECT e.prenom,
    e.nom,
    d.nom AS departement,
    e.date_embauche
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
ORDER BY e.date_embauche;


/* Exercice 10 – Départements sans employés
 Objectif : Utiliser une jointure externe ( LEFT JOIN ) avec une condition sur les
 valeurs manquantes.
 Énoncé :
 Affichez la liste des départements qui nʼont aucun employé.
 */


SELECT d.nom AS departement
FROM employes e
    LEFT JOIN departements d ON e.id_departement = d.id
WHERE e.id_departement IS NULL;


/*   Exercice 11 – Employés seuls dans leur département
 Objectif : Utiliser une sous-requête dans la clause WHERE .
 Énoncé :
 Affichez les employés qui sont les seuls employés dans leur département.
 */


SELECT e.prenom,
    e.nom,
    d.nom AS departement
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
WHERE e.id_departement IN (
        SELECT id_departement
        FROM employes
        GROUP BY id_departement
        HAVING COUNT(*) = 1
    )


    /* Exercice 12 – Les deux départements avec le plus dʼemployés
     Objectif : Combiner JOIN , GROUP BY , ORDER BY et LIMIT .
     Énoncé :
     Affichez les 2 départements qui comptent le plus grand nombre dʼemployés,
     ainsi que le nombre dʼemployés par département.
     */
SELECT d.nom AS departement,
    COUNT(*) AS nb_employes
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
GROUP BY d.nom
ORDER BY nb_employes DESC
LIMIT 2
    /*  Exercice 13 – Afficher le nombre de collègues par employé
     Objectif : Utiliser une sous-requête dans la liste SELECT .
     Énoncé :
     Pour chaque employé, affichez :
     son nom et prénom
     le nombre total dʼemployés dans le même département
     */
SELECT e.prenom,
    e.nom,
    (
        SELECT COUNT(*)
        FROM employes e2
        WHERE e2.id_departement = e.id_departement
    ) AS nb_collegues
FROM employes e
ORDER BY nb_collegues DESC


    /*  Exercice 14 – Répartition des embauches par année
     Objectif : Regrouper les données selon une expression issue dʼune fonction
     (YEAR()).
     Énoncé :
     Affichez le nombre dʼemployés embauchés par année, en vous appuyant sur
     la colonne date_embauche .
     */


SELECT YEAR(date_embauche) AS annee,
    COUNT(*) AS nb_employes
FROM employes
GROUP BY annee


    /*  Exercice 15 – Employés embauchés après un autre employé du
     même département
     Objectif : Utiliser une sous-requête corrélée avec une comparaison de dates.
     Énoncé :
     Affichez les employés qui ont été embauchés après au moins un autre
     employé appartenant au même département.
     */

     
SELECT e.prenom,
    e.nom,
    d.nom AS departement,
    e.date_embauche
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
WHERE e.date_embauche > (
        SELECT MAX(date_embauche)
        FROM employes e2
        WHERE e2.id_departement = e.id_departement
            AND e2.date_embauche < e.date_embauche
    )