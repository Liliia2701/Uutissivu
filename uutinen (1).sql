-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27.11.2025 klo 07:42
-- Palvelimen versio: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uutinen`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `kategoria`
--

CREATE TABLE `kategoria` (
  `id` int(11) NOT NULL,
  `nimi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `kategoria`
--

INSERT INTO `kategoria` (`id`, `nimi`) VALUES
(1, 'Urheilu'),
(2, 'Talous'),
(3, 'Kotimaa');

-- --------------------------------------------------------

--
-- Rakenne taululle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `admin`) VALUES
(1, 'admin', '$2y$10$tYPtudo70te4moZa1rPHuefSBKwsg3gjA5KDUAU92rhsokMrjkHsG', '1');

-- --------------------------------------------------------

--
-- Rakenne taululle `uutinen`
--

CREATE TABLE `uutinen` (
  `id` int(11) NOT NULL,
  `otsikko` varchar(255) NOT NULL,
  `teksti` varchar(5000) NOT NULL,
  `kuva` varchar(255) NOT NULL,
  `kategoria` int(11) NOT NULL COMMENT 'liitetty kategoria tauluun',
  `toimittaja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `uutinen`
--

INSERT INTO `uutinen` (`id`, `otsikko`, `teksti`, `kuva`, `kategoria`, `toimittaja`) VALUES
(14, 'Cristiano Ronaldo selvisi törky­tempustaan vähällä ', 'Cristiano Ronaldo saa pelata ensi kesänä Portugalin ensimmäisessä MM-kisaottelussa', '39.avif', 1, 1),
(15, 'Liverpoolin yliajaja tunnusti syyllisyytensä', 'Britanniassa Liverpoolissa väkijoukkoon ajanut mies on myöntänyt syyllisyytensä. 53-vuotiasta brittimiestä syytetään 31 eri rikoksesta, mm. vammantuottamuksesta ja vaarallisesta ajamisesta.', '7tP9xAgerD.avif', 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uutinen`
--
ALTER TABLE `uutinen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategoria` (`kategoria`),
  ADD KEY `toimittaja` (`toimittaja`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `uutinen`
--
ALTER TABLE `uutinen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `uutinen`
--
ALTER TABLE `uutinen`
  ADD CONSTRAINT `uutinen_ibfk_2` FOREIGN KEY (`toimittaja`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `uutinen_ibfk_3` FOREIGN KEY (`kategoria`) REFERENCES `kategoria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
