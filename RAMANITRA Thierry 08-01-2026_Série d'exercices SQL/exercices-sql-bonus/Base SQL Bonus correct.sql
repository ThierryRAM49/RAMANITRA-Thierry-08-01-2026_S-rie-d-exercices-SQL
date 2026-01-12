-- BONUS 1 : ORDER BY et LIMIT (Top 2 plus chers)
SELECT nom, prix FROM produits ORDER BY prix DESC LIMIT 2;

-- BONUS 2 : Recherche partielle (LIKE)
-- Le % signifie "n'importe quelle chaîne de caractères avant"
SELECT * FROM utilisateurs WHERE email LIKE '%@email.com';

-- BONUS 3 : Compter le total
SELECT COUNT(*) AS total_utilisateurs FROM utilisateurs;

-- BONUS 4 : Conditions combinées (AND)
SELECT * FROM produits 
WHERE prix > 30 AND date_ajout >= '2025-06-21';

-- BONUS 5 : Le plus récent
-- Méthode simple : Trier par date descendante et prendre le premier
SELECT * FROM utilisateurs ORDER BY date_inscription DESC LIMIT 1;

-- BONUS 6 : Ajouter une colonne (ALTER) puis UPDATE
ALTER TABLE utilisateurs ADD ville VARCHAR(100);
-- Mise à jour fictive pour l'exemple
UPDATE utilisateurs SET ville = 'Paris' WHERE id > 0; 

-- BONUS 7 : DISTINCT (Éviter les doublons)
SELECT DISTINCT ville FROM utilisateurs;

-- BONUS 8 : BETWEEN (Fourchette de prix)
-- Équivalent à : prix >= 30 AND prix <= 100
SELECT * FROM produits WHERE prix BETWEEN 30 AND 100;
