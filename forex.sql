-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Lun 22 Octobre 2018 à 10:12
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `forex`
--

-- --------------------------------------------------------

--
-- Structure de la table `paire`
--

CREATE TABLE `paire` (
  `NOM` varchar(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `paire`
--

INSERT INTO `paire` (`NOM`) VALUES
('AUDCAD'),
('AUDCHF'),
('AUDJPY'),
('AUDNZD'),
('AUDSGD'),
('AUDUSD'),
('CADCHF'),
('CADJPY'),
('CHFJPY'),
('EURAUD'),
('EURCAD'),
('EURCHF'),
('EURGBP'),
('EURHKD'),
('EURJPY'),
('EURNOK'),
('EURNZD'),
('EURPLN'),
('EURTRY'),
('EURUSD'),
('EURZAR'),
('GBPAUD'),
('GBPCAD'),
('GBPCHF'),
('GBPJPY'),
('GBPNOK'),
('GBPNZD'),
('GBPTRY'),
('GBPUSD'),
('NZDCAD'),
('NZDCHF'),
('NZDJPY'),
('NZDUSD'),
('SGJPY'),
('USDCAD'),
('USDCHF'),
('USDCNH'),
('USDCZK'),
('USDHUF'),
('USDJPY'),
('USDNOK'),
('USDPLN'),
('USDRUB'),
('USDSGD'),
('USDTHB'),
('USDTRY'),
('USDZAR'),
('XAUUSD');

-- --------------------------------------------------------

--
-- Structure de la table `trade`
--

CREATE TABLE `trade` (
  `ID` int(11) NOT NULL,
  `Paire` varchar(6) NOT NULL,
  `Trade_type` varchar(4) NOT NULL,
  `resultat` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `trade`
--

INSERT INTO `trade` (`ID`, `Paire`, `Trade_type`, `resultat`) VALUES
(1, 'USDCAD', 'Buy', 1.81),
(2, 'USDTHB', 'Buy', -1.36),
(3, 'EURJPY', 'Sell', -1.15),
(4, 'EURJPY', 'Sell', -1.68),
(5, 'EURJPY', 'Sell', 2.75),
(6, 'EURJPY', 'Sell', 3.37),
(7, 'EURJPY', 'Sell', 4.44),
(8, 'EURJPY', 'Sell', 0.54),
(9, 'AUDUSD', 'Sell', -6.01),
(10, 'EURNZD', 'Sell', -0.84),
(11, 'EURNZD', 'Sell', 1.68),
(12, 'EURUSD', 'Sell', 1.48),
(13, 'XAUUSD', 'Sell', 2.87),
(14, 'AUDSGD', 'Sell', -1.25),
(15, 'XAUUSD', 'Sell', -2.78),
(16, 'AUDCHF', 'Buy', 1.76),
(17, 'AUDCHF', 'Buy', 1.32),
(18, 'NZDJPY', 'Sell', 0.61),
(19, 'NZDJPY', 'Sell', 2.46),
(20, 'NZDJPY', 'Sell', 0.77),
(21, 'EURUSD', 'Sell', -1.31),
(22, 'AUDCHF', 'Buy', -0.79),
(23, 'NZDJPY', 'Sell', -2.31),
(24, 'GBPUSD', 'Buy', -1.31),
(25, 'EURJPY', 'Sell', 2.47),
(26, 'EURJPY', 'Sell', 2.55),
(27, 'EURJPY', 'Sell', 2.62),
(28, 'NZDJPY', 'Sell', 2.32),
(29, 'USDCAD', 'Sell', 1.95),
(30, 'USDCAD', 'Sell', 2.02),
(31, 'USDCHF', 'Buy', 1.06),
(32, 'XAUUSD', 'Sell', 2.61),
(33, 'AUDJPY', 'Sell', -1.16),
(34, 'EURAUD', 'Sell', -2.22),
(35, 'EURAUD', 'Sell', 1.85),
(36, 'EURJPY', 'Sell', 2.7),
(37, 'AUDUSD', 'Sell', 2.61),
(38, 'GBPUSD', 'Sell', -1.31),
(39, 'EURUSD', 'Sell', 2.62),
(40, 'GBPUSD', 'Sell', -1.31),
(41, 'GBPUSD', 'Sell', 2.54),
(42, 'AUDCAD', 'Sell', -1.01),
(43, 'EURGBP', 'Sell', 3.31),
(44, 'XAUUSD', 'Sell', -1.32),
(45, 'NZDUSD', 'Sell', -1.31),
(46, 'XAUUSD', 'Sell', -1.31),
(47, 'EURGBP', 'Sell', 2.51),
(48, 'USDCHF', 'Sell', -1.32),
(49, 'NZDCHF', 'Buy', -2.63),
(50, 'USDJPY', 'Sell', 0.08),
(51, 'USDCHF', 'Sell', -1.32),
(52, 'AUDUSD', 'Buy', -1.31),
(53, 'EURCHF', 'Sell', -1.32),
(54, 'CADCHF', 'Sell', -1.31),
(55, 'EURNZD', 'Sell', 1.69),
(56, 'NZDJPY', 'Buy', -1.16),
(57, 'AUDCHF', 'Buy', -1.31),
(58, 'CADJPY', 'Buy', -1.16),
(59, 'GBPAUD', 'Buy', 3.09),
(60, 'GBPNZD', 'Buy', 1.69),
(61, 'GBPCAD', 'Buy', 2.02),
(62, 'GBPCHF', 'Buy', 2.63),
(63, 'CHFJPY', 'Sell', -1.08),
(64, 'EURCHF', 'Buy', 2.63),
(65, 'GBPCAD', 'Buy', 2.35),
(66, 'GBPCHF', 'Buy', 2.62),
(67, 'CHFJPY', 'Sell', 5.84),
(68, 'AUDJPY', 'Sell', 2.31),
(69, 'CADJPY', 'Sell', 2.31),
(70, 'EURCAD', 'Buy', 2),
(71, 'AUDCHF', 'Sell', 2.62),
(72, 'USDJPY', 'Sell', -1.15),
(73, 'NZDJPY', 'Sell', -1.16),
(74, 'EURCAD', 'Sell', -0.2),
(75, 'GBPAUD', 'Buy', 17.65),
(76, 'AUDJPY', 'Sell', 24.27),
(77, 'EURCAD', 'Buy', 19.14),
(78, 'CADCHF', 'Sell', 14.2),
(79, 'GBPCAD', 'Buy', 6.65),
(80, 'CHFJPY', 'Sell', 6.09),
(81, 'EURGBP', 'Sell', -16.66),
(82, 'CHFJPY', 'Sell', -11.08),
(83, 'CADCHF', 'Buy', -13.73),
(84, 'EURCHF', 'Buy', 24.91),
(85, 'GBPAUD', 'Sell', -9.89),
(86, 'GBPNZD', 'Sell', -1.07),
(87, 'NZDUSD', 'Sell', 0.09),
(88, 'USDCHF', 'Buy', -13.07),
(89, 'AUDCHF', 'Sell', 19.1),
(90, 'CHFJPY', 'Sell', -10.45),
(91, 'AUDNZD', 'Sell', -8.16),
(92, 'USDSGD', 'Sell', 2.13),
(93, 'AUDCAD', 'Buy', 1.59),
(94, 'NZDUSD', 'Buy', 0.08),
(95, 'XAUUSD', 'Sell', -12.92),
(96, 'NZDCAD', 'Buy', -13.16),
(97, 'GBPNZD', 'Buy', -9.5),
(98, 'EURNOK', 'Sell', -1.48),
(99, 'CHFJPY', 'Buy', -12.22),
(100, 'USDZAR', 'Sell', 11.28),
(101, 'AUDCHF', 'Sell', -12.89),
(102, 'EURNOK', 'Sell', 13.09),
(103, 'AUDCAD', 'Sell', -9.52),
(104, 'EURPLN', 'Sell', -3.47),
(105, 'EURZAR', 'Sell', -12.45),
(106, 'CHFJPY', 'Sell', 0.54),
(107, 'CADJPY', 'Sell', 3.7),
(108, 'EURPLN', 'Sell', -19.41),
(109, 'CADJPY', 'Sell', 9.04),
(110, 'GBPCHF', 'Sell', -13.88),
(111, 'GBPUSD', 'Sell', -13.05),
(112, 'EURPLN', 'Sell', -3.54);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `paire`
--
ALTER TABLE `paire`
  ADD PRIMARY KEY (`NOM`);

--
-- Index pour la table `trade`
--
ALTER TABLE `trade`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `trade`
--
ALTER TABLE `trade`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
