-- EXERCICE 1 : Création de la base
CREATE DATABASE formation_web;
USE formation_web;

-- EXERCICE 2 : Création de la table utilisateurs
-- Note : On utilise INT AUTO_INCREMENT pour l'id pour qu'il se gère tout seul (comme si on cochait AI dans phpmyadmin)
CREATE TABLE utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(150),
    date_inscription DATE
);

-- EXERCICE 3 : Insertion des données
-- Le format de date standard SQL est toujours 'YYYY-MM-DD'
INSERT INTO utilisateurs (nom, prenom, email, date_inscription) VALUES
('Dupont', 'Jean', 'jean.dupont@email.com', '2025-06-01'),
('Martin', 'Alice', 'alice.martin@email.com', '2025-06-10'),
('Benali', 'Mohamed', 'mohamed.benali@email.com', '2025-06-15');

-- EXERCICE 4 : Lecture des données (SELECT)
-- 1. Tout afficher
SELECT * FROM utilisateurs;

-- 2. Colonnes spécifiques
SELECT prenom, email FROM utilisateurs;

-- 3. Filtrer par date (Postérieur à...)
SELECT * FROM utilisateurs WHERE date_inscription > '2025-06-05';

-- 4. Recherche exacte
SELECT * FROM utilisateurs WHERE prenom = 'Alice';

-- EXERCICE 5 : Modification (UPDATE)
-- Attention : Toujours mettre un WHERE pour ne pas modifier toute la table ! (Sinon on se retrouve au chomage si pas de backup)
UPDATE utilisateurs
SET email = 'j.dupont@email.com'
WHERE nom = 'Dupont' AND prenom = 'Jean';

-- EXERCICE 6 : Suppression (DELETE)
DELETE FROM utilisateurs WHERE email = 'alice.martin@email.com';

-- EXERCICE 7 : Création table produits
CREATE TABLE produits (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    description TEXT,
    prix DECIMAL(10, 2), -- 10 chiffres au total, dont 2 après la virgule
    date_ajout DATE
);

-- EXERCICE 8 : Insertion produits
INSERT INTO produits (nom, description, prix, date_ajout) VALUES
('Clavier mécanique', 'Clavier avec rétroéclairage LED', 59.99, '2025-06-20'),
('Souris optique', 'Souris sans fil', 29.50, '2025-06-21'),
('Écran 24 pouces', 'Écran Full HD', 149.00, '2025-06-22');

-- EXERCICE 9 : Requêtes sur produits
-- 3. Prix supérieur à 50
SELECT * FROM produits WHERE prix > 50;

-- 4. Tri décroissant (DESC)
SELECT * FROM produits ORDER BY prix DESC;
