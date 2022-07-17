-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 02 juin 2022 à 16:49
-- Version du serveur : 8.0.28
-- Version de PHP : 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `parthub`
--

-- --------------------------------------------------------

--
-- Structure de la table `alcool`
--

CREATE TABLE `alcool` (
  `id` int NOT NULL,
  `party_id` int NOT NULL,
  `user_id` int NOT NULL,
  `item` text CHARACTER SET utf8 COLLATE utf8_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `alcool`
--

INSERT INTO `alcool` (`id`, `party_id`, `user_id`, `item`) VALUES
(6, 22, 29, 'gin'),
(7, 22, 29, 'vodka'),
(8, 22, 29, 'jus de tomate'),
(10, 22, 29, 'tequila ');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int NOT NULL,
  `party_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `comment`, `date`, `user_id`, `party_id`) VALUES
(28, 'Merci pour l\'invitation, il me tarde d\'y être !', '2022-05-10 21:41:00', 22, 22),
(29, 'Trop hâte de passer cette soirée en ta compagnie Jonathan (uWu)', '2022-05-10 21:43:53', 34, 22),
(30, 'Je vais te mettre un gros \"Die\" Mercedes … ^^', '2022-05-10 21:44:49', 33, 22),
(31, 'Je suis pressé !', '2022-05-11 16:32:22', 33, 22);

-- --------------------------------------------------------

--
-- Structure de la table `food`
--

CREATE TABLE `food` (
  `id` int NOT NULL,
  `party_id` int NOT NULL,
  `user_id` int NOT NULL,
  `item` text CHARACTER SET utf8 COLLATE utf8_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `food`
--

INSERT INTO `food` (`id`, `party_id`, `user_id`, `item`) VALUES
(9, 22, 29, 'aubergine'),
(10, 22, 29, 'saucisson'),
(11, 22, 29, 'hot-dog'),
(13, 22, 30, 'banane'),
(14, 22, 33, 'concombre');

-- --------------------------------------------------------

--
-- Structure de la table `party`
--

CREATE TABLE `party` (
  `id` int NOT NULL,
  `picture` varchar(255) DEFAULT 'default.jpg',
  `title` varchar(80) NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `description` text,
  `playlist_url` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `party`
--

INSERT INTO `party` (`id`, `picture`, `title`, `theme`, `date`, `address`, `city`, `zip`, `description`, `playlist_url`, `user_id`, `creation_date`) VALUES
(22, '627a811e0e9f28.60934740.jpg', 'On va faire du sale', 'Soirée cuir et latex', '2022-05-13 21:00:00', '4 rue de la Coquille', 'Bordeaux', '33000', 'Bonjour les loulous ! \r\nJ\'ai le plaisir de vous convier à ma soirée cuir et latex. \r\nAu programme, une ambiance chaleureuse pour approfondir nos relations.\r\nJe compte sur vous pour vêtir votre plus bel apparat, je m\'occupe du reste ^^. ', 'https://open.spotify.com/playlist/4aEtQXkBwi484uWofN1Bxc?si=3469725f32454ee1', 33, '2022-05-10'),
(28, '627bc841f299d7.18316860.jpg', 'Soirée Wild', 'Latex', '2022-05-24 20:30:00', '121 RUE PIPE SOURIS', 'LE MEE SUR SEINE', '77350', 'Soirée test', '', 33, '2022-05-11');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('man','woman','non-binary') DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(30) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `picture` varchar(255) DEFAULT 'avatar.jpg',
  `inscription_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `telephone`, `birthday`, `gender`, `address`, `zip_code`, `city`, `picture`, `inscription_date`) VALUES
(19, 'Antoine', 'Dumez', 'antoine@wild.com', '$2y$10$DnquHe31QqYbrolGMSd1au8TaNb9Cjw0e6ioeJP9UyjnraKiSNdwe', NULL, NULL, NULL, NULL, NULL, NULL, 'antoine.jpg', NULL),
(20, 'Giuseppe', 'Petraroli', 'giuseppe@wild.com', '$2y$10$85bH1qtSwrvof6Au9ViO1.B3rfbbLvCLn9tU5wh2TBn1udIsJsIyO', NULL, NULL, NULL, NULL, NULL, NULL, 'giuseppe.jpg', NULL),
(21, 'Alex', 'Saint-Martin', 'alex@wild.com', '$2y$10$G.5QeB8awGOVw3I4llw0M.OWYJglsF4ftwUG4knLQuvCm0/.bZk3a', NULL, NULL, NULL, NULL, NULL, NULL, 'alex.jpg', NULL),
(22, 'JMOL', 'Olivier', 'jmol@wild.com', '$2y$10$bAdoxtrFHmp2c/CymxBsVOZr3KCUrVHBHY2wnQCdZ7GJHeWh6ciaK', NULL, NULL, NULL, NULL, NULL, NULL, 'jm.jpg', NULL),
(23, 'Johnny', 'Gobbi', 'johnny@wild.com', '$2y$10$e1Jym7Qr8gLNyBMQUHnYNOamsjhlBTCdAQvCrED7GWbVYTHRpHkBG', NULL, NULL, NULL, NULL, NULL, NULL, 'Jonnhy.jpg', NULL),
(24, 'Léa', 'Raso', 'lea@wild.com', '$2y$10$xBEzdg/F3jHX81zkpDkokeyU1qwz0aMptwCXPj7l5FaoR3iumZfjW', NULL, NULL, NULL, NULL, NULL, NULL, 'lea.jpg', NULL),
(25, 'Nathan', 'Letournel', 'nathan@wild.com', '$2y$10$.OutHAhB0LcO3onDAF97yOEDayLMKfefG516zqT8YC/85UU8m5dzO', NULL, NULL, NULL, NULL, NULL, NULL, 'nathan.jpg', NULL),
(26, 'Olivier', 'Bonabal', 'olivier@wild.com', '$2y$10$3tkxZPCfoQWuc02pKs.lUue4dgqhWQg4S/at/1/UDKQ3AHn3nSe/e', NULL, NULL, NULL, NULL, NULL, NULL, 'olivier.jpg', NULL),
(27, 'Théo', 'Beziat', 'theo@wild.com', '$2y$10$yo6W4gx5s8TXoVPbDwtuYeSfaOg5Skc68B8Juv24bJGkWB2QlaOZK', NULL, NULL, NULL, NULL, NULL, NULL, 'theo.jpg', NULL),
(28, 'Mara', 'Lefavrais', 'mara@wild.com', '$2y$10$WG.02ovT6UDjLc5jcHq8HerWc57dADTwjkZ8KZmHFTWohF42Rk1.u', NULL, NULL, NULL, NULL, NULL, NULL, 'mara.jpg', NULL),
(29, 'Adrien', 'Escarmant', 'adrien@wild.com', '$2y$10$Lr.ibJh/D7CghBnN/tzUyu9OisM2wrtobgciw4vC2QwrqoeYNAHiq', NULL, NULL, NULL, NULL, NULL, NULL, 'adrien.jpg', NULL),
(30, 'Arnaud', 'Bertrand', 'arnaud@wild.com', '$2y$10$UeGIkroYbjYf.8O4RhGOWeH04ZQX/4rWj2ZGuUk3VfkdbyIrcX0f6', NULL, NULL, NULL, NULL, NULL, NULL, 'arnaud.jpg', NULL),
(31, 'Christophe', 'Fondeville', 'chris@wild.com', '$2y$10$IWkv6VeQ7qnJQvOpJPxyF.w.YVY.GnL1OeTdTOXBHhvVZy7NvxpTK', NULL, NULL, NULL, NULL, NULL, NULL, 'christophe.jpg', NULL),
(32, 'Camille', 'Sabatier', 'camille@wild.com', '$2y$10$HHwid8bclu8yXfeB6HO11eGHzQgxwOXCtO3.MDdCMUX65slyJ3zeu', NULL, NULL, NULL, NULL, NULL, NULL, 'camille.jpg', NULL),
(33, 'Jojo', 'Plantey', 'jojo@wild.com', '$2y$10$8ctWpYxjjxh8AkONF46vAuiPZPtgVpMKnQmp7UrHMEPenapPUMTt6', NULL, NULL, NULL, NULL, NULL, NULL, 'jojo.jpg', NULL),
(34, 'Mercedes', 'Kardetour', 'mercedes@wild.com', '$2y$10$LtJD9MONdsGj.qFpiq8jNODydvGgO2rgQVNIZToNRH45BfV96dbQ6', NULL, NULL, NULL, NULL, NULL, NULL, 'mercedes.jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_has_party`
--

CREATE TABLE `user_has_party` (
  `user_id` int NOT NULL,
  `party_id` int NOT NULL,
  `participate` enum('Participe','Peut-être','Ne participe pas') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Ne participe pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `user_has_party`
--

INSERT INTO `user_has_party` (`user_id`, `party_id`, `participate`) VALUES
(29, 22, 'Participe'),
(21, 22, 'Participe'),
(30, 22, 'Participe'),
(32, 22, 'Participe'),
(31, 22, 'Participe'),
(20, 22, 'Participe'),
(22, 22, 'Participe'),
(23, 22, 'Participe'),
(24, 22, 'Participe'),
(28, 22, 'Peut-être'),
(34, 22, 'Participe'),
(25, 22, 'Participe'),
(26, 22, 'Participe'),
(27, 22, 'Participe'),
(19, 22, 'Participe');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `alcool`
--
ALTER TABLE `alcool`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`party_id`),
  ADD KEY `alcool_ibfk_2` (`user_id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`party_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`party_id`),
  ADD KEY `food_ibfk_2` (`user_id`);

--
-- Index pour la table `party`
--
ALTER TABLE `party`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_has_party`
--
ALTER TABLE `user_has_party`
  ADD KEY `event_id` (`party_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `alcool`
--
ALTER TABLE `alcool`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `food`
--
ALTER TABLE `food`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `party`
--
ALTER TABLE `party`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `alcool`
--
ALTER TABLE `alcool`
  ADD CONSTRAINT `alcool_ibfk_1` FOREIGN KEY (`party_id`) REFERENCES `party` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alcool_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`party_id`) REFERENCES `party` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`party_id`) REFERENCES `party` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `party`
--
ALTER TABLE `party`
  ADD CONSTRAINT `party_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `user_has_party`
--
ALTER TABLE `user_has_party`
  ADD CONSTRAINT `user_has_party_ibfk_1` FOREIGN KEY (`party_id`) REFERENCES `party` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_has_party_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
