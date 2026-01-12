-- phpMyAdmin SQL Dump
-- version 5.2.3deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 08, 2026 at 01:53 PM
-- Server version: 11.8.5-MariaDB-3 from Debian
-- PHP Version: 8.4.16

START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `formation_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `email` text NOT NULL,
  `date_inscription` date NOT NULL,
  `ville` varchar(50) DEFAULT NULL
) ;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `email`, `date_inscription`, `ville`) VALUES
(1, 'Dupont', 'Jean', 'j.dupont@email.com', '2025-06-01', 'Paris'),
(3, 'Benali', 'Mohamed', 'mohamed.benali@email.com', '2025-06-15', 'Lyon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
