-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 01. Apr 2017 um 00:06
-- Server-Version: 10.1.21-MariaDB
-- PHP-Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `hotel`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bookers`
--

CREATE TABLE `bookers` (
  `id` int(11) NOT NULL,
  `FK_contact_information` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `bookers`
--

INSERT INTO `bookers` (`id`, `FK_contact_information`) VALUES
(1, 2),
(2, 5),
(3, 7),
(4, 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `booking_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `FK_bookers` int(11) NOT NULL,
  `FK_rooms` int(11) NOT NULL,
  `FK_seasons` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `booking`
--

INSERT INTO `booking` (`id`, `booking_date`, `from`, `to`, `price`, `FK_bookers`, `FK_rooms`, `FK_seasons`) VALUES
(1, '2017-03-31 20:54:19', '2017-03-30', '2017-04-07', '600', 1, 1, 2),
(2, '2017-03-31 20:10:30', '2017-06-18', '2017-06-25', '700', 2, 3, 2),
(3, '2017-03-31 20:12:57', '2017-07-28', '2017-07-31', '500', 3, 3, 1),
(4, '2017-03-31 20:15:50', '2017-08-06', '2017-08-16', '1000', 4, 2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact_information`
--

CREATE TABLE `contact_information` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `FK_postal_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `contact_information`
--

INSERT INTO `contact_information` (`id`, `first_name`, `last_name`, `date_of_birth`, `telephone`, `FK_postal_code`) VALUES
(1, 'Michael', 'Bauer', '1985-03-14', '06642254816', 1010),
(2, 'Erika', 'Hütterer', '1978-12-14', '0664887462548', 80637),
(3, 'Erich', 'Hütterer', '1978-01-11', '06642258546', 80637),
(4, 'Paul', 'Hütterer', '2000-05-04', '0664228546', 80637),
(5, 'Miguel', 'Esteban', '1990-07-31', '06642248472', 8001),
(6, 'Maria', 'Esteban', '1991-11-08', '06642248472', 8001),
(7, 'Hans', 'Eder', '1950-03-17', '06648754566', 80637),
(8, 'Mareike', 'Eder', '1955-09-22', '06648754566', 80637),
(9, 'Otto', 'Fröhlich', '1969-02-24', '06642258644', 80336),
(10, 'Jessica', 'Fröhlich', '1969-12-24', '06642258644', 80336);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `facility` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `facilities`
--

INSERT INTO `facilities` (`id`, `facility`) VALUES
(1, 'TV'),
(2, 'King Size Bed'),
(3, 'Sea View'),
(4, 'Bathroom'),
(5, 'WIFI'),
(6, 'Coffee in the room'),
(7, 'Bath tub'),
(8, 'Minibar');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `guests`
--

CREATE TABLE `guests` (
  `id` int(11) NOT NULL,
  `FK_contact_information` int(11) NOT NULL,
  `FK_bookings` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `guests`
--

INSERT INTO `guests` (`id`, `FK_contact_information`, `FK_bookings`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 2),
(5, 6, 2),
(6, 7, 3),
(7, 8, 3),
(8, 9, 4),
(9, 10, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `postal_code`
--

CREATE TABLE `postal_code` (
  `postal_code` int(11) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `postal_code`
--

INSERT INTO `postal_code` (`postal_code`, `city`, `country`) VALUES
(1010, 'Vienna', 'Austria'),
(1220, 'Vienna', 'Austria'),
(8001, 'Barcelona', 'Spain'),
(8041, 'Graz-Libenau', 'Austria'),
(80336, 'Sendling', 'Germany'),
(80637, 'Moosach', 'Germany');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `open_from` time NOT NULL,
  `open_to` time NOT NULL,
  `FK_restaurant_manager` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `open_from`, `open_to`, `FK_restaurant_manager`) VALUES
(1, 'Pizzeria Al Fredo', '07:30:00', '22:30:00', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `restaurant_managers`
--

CREATE TABLE `restaurant_managers` (
  `id` int(11) NOT NULL,
  `FK_contact_information` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `restaurant_managers`
--

INSERT INTO `restaurant_managers` (`id`, `FK_contact_information`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `restaurant_visits`
--

CREATE TABLE `restaurant_visits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FK_restaurants` int(11) NOT NULL,
  `FK_guests` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `restaurant_visits`
--

INSERT INTO `restaurant_visits` (`id`, `date`, `FK_restaurants`, `FK_guests`) VALUES
(1, '2017-03-31 20:29:00', 1, 2),
(2, '2017-03-31 20:29:00', 1, 3),
(3, '2017-03-31 20:31:24', 1, 1),
(4, '2017-03-31 20:31:13', 1, 6),
(5, '2017-03-31 20:31:13', 1, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room` varchar(30) NOT NULL,
  `FK_room_types` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `rooms`
--

INSERT INTO `rooms` (`id`, `room`, `FK_room_types`) VALUES
(1, 'standard room', 1),
(2, 'lover\'s paradise', 2),
(3, 'honey moon suite', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rooms_facilities`
--

CREATE TABLE `rooms_facilities` (
  `id` int(11) NOT NULL,
  `FK_facilities` int(11) NOT NULL,
  `FK_rooms` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `rooms_facilities`
--

INSERT INTO `rooms_facilities` (`id`, `FK_facilities`, `FK_rooms`) VALUES
(1, 1, 1),
(2, 4, 1),
(3, 5, 1),
(4, 5, 1),
(5, 1, 2),
(6, 4, 2),
(7, 5, 2),
(8, 6, 2),
(9, 7, 2),
(10, 8, 2),
(11, 1, 3),
(12, 2, 3),
(13, 3, 3),
(14, 4, 3),
(15, 5, 3),
(16, 6, 3),
(17, 7, 3),
(18, 8, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `room_service`
--

CREATE TABLE `room_service` (
  `id` int(11) NOT NULL,
  `open_from` time NOT NULL,
  `open_to` time NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `FK_restaurants` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `room_service`
--

INSERT INTO `room_service` (`id`, `open_from`, `open_to`, `telephone`, `FK_restaurants`) VALUES
(2, '07:30:00', '20:00:00', '546731', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `room_service_calls`
--

CREATE TABLE `room_service_calls` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FK_room_service` int(11) NOT NULL,
  `FK_guests` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `room_service_calls`
--

INSERT INTO `room_service_calls` (`id`, `date`, `FK_room_service`, `FK_guests`) VALUES
(1, '2017-03-31 20:30:19', 2, 9),
(2, '2017-03-31 20:30:19', 2, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `room_types`
--

CREATE TABLE `room_types` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `room_types`
--

INSERT INTO `room_types` (`id`, `type`) VALUES
(1, 'small'),
(2, 'medium'),
(3, 'large');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seasons`
--

CREATE TABLE `seasons` (
  `id` int(11) NOT NULL,
  `season` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `seasons`
--

INSERT INTO `seasons` (`id`, `season`) VALUES
(1, 'high season'),
(2, 'low season');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bookers`
--
ALTER TABLE `bookers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_contact_information`),
  ADD KEY `FK_contact_information` (`FK_contact_information`);

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_bookers`,`FK_rooms`,`FK_seasons`),
  ADD KEY `FK_bookers` (`FK_bookers`),
  ADD KEY `FK_rooms` (`FK_rooms`),
  ADD KEY `FK_seasons` (`FK_seasons`);

--
-- Indizes für die Tabelle `contact_information`
--
ALTER TABLE `contact_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_postal_code`),
  ADD KEY `FK_postal_code` (`FK_postal_code`);

--
-- Indizes für die Tabelle `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_contact_information`,`FK_bookings`),
  ADD KEY `FK_contact_information` (`FK_contact_information`),
  ADD KEY `FK_bookings` (`FK_bookings`);

--
-- Indizes für die Tabelle `postal_code`
--
ALTER TABLE `postal_code`
  ADD PRIMARY KEY (`postal_code`),
  ADD KEY `postal_code` (`postal_code`);

--
-- Indizes für die Tabelle `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_restaurant_manager`),
  ADD KEY `FK_restaurant_manager` (`FK_restaurant_manager`);

--
-- Indizes für die Tabelle `restaurant_managers`
--
ALTER TABLE `restaurant_managers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_contact_information`),
  ADD KEY `FK_contact_information` (`FK_contact_information`);

--
-- Indizes für die Tabelle `restaurant_visits`
--
ALTER TABLE `restaurant_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_restaurants`,`FK_guests`),
  ADD KEY `FK_guests` (`FK_guests`),
  ADD KEY `FK_restaurants` (`FK_restaurants`);

--
-- Indizes für die Tabelle `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_room_types`),
  ADD KEY `FK_room_types` (`FK_room_types`);

--
-- Indizes für die Tabelle `rooms_facilities`
--
ALTER TABLE `rooms_facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_facilities`,`FK_rooms`),
  ADD KEY `FK_facilities` (`FK_facilities`),
  ADD KEY `FK_rooms` (`FK_rooms`);

--
-- Indizes für die Tabelle `room_service`
--
ALTER TABLE `room_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_restaurants`),
  ADD KEY `FK_restaurants` (`FK_restaurants`);

--
-- Indizes für die Tabelle `room_service_calls`
--
ALTER TABLE `room_service_calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_guests`),
  ADD KEY `FK_guests` (`FK_guests`),
  ADD KEY `FK_room_service` (`FK_room_service`);

--
-- Indizes für die Tabelle `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `bookers`
--
ALTER TABLE `bookers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `contact_information`
--
ALTER TABLE `contact_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `guests`
--
ALTER TABLE `guests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT für Tabelle `postal_code`
--
ALTER TABLE `postal_code`
  MODIFY `postal_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80638;
--
-- AUTO_INCREMENT für Tabelle `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `restaurant_managers`
--
ALTER TABLE `restaurant_managers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `restaurant_visits`
--
ALTER TABLE `restaurant_visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `rooms_facilities`
--
ALTER TABLE `rooms_facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT für Tabelle `room_service`
--
ALTER TABLE `room_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `room_service_calls`
--
ALTER TABLE `room_service_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `seasons`
--
ALTER TABLE `seasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bookers`
--
ALTER TABLE `bookers`
  ADD CONSTRAINT `bookers_ibfk_1` FOREIGN KEY (`FK_contact_information`) REFERENCES `contact_information` (`id`);

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`FK_bookers`) REFERENCES `bookers` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`FK_rooms`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`FK_seasons`) REFERENCES `seasons` (`id`);

--
-- Constraints der Tabelle `contact_information`
--
ALTER TABLE `contact_information`
  ADD CONSTRAINT `contact_information_ibfk_1` FOREIGN KEY (`FK_postal_code`) REFERENCES `postal_code` (`postal_code`);

--
-- Constraints der Tabelle `guests`
--
ALTER TABLE `guests`
  ADD CONSTRAINT `guests_ibfk_1` FOREIGN KEY (`FK_contact_information`) REFERENCES `contact_information` (`id`),
  ADD CONSTRAINT `guests_ibfk_2` FOREIGN KEY (`FK_bookings`) REFERENCES `booking` (`id`);

--
-- Constraints der Tabelle `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`FK_restaurant_manager`) REFERENCES `restaurant_managers` (`id`);

--
-- Constraints der Tabelle `restaurant_managers`
--
ALTER TABLE `restaurant_managers`
  ADD CONSTRAINT `restaurant_managers_ibfk_1` FOREIGN KEY (`FK_contact_information`) REFERENCES `contact_information` (`id`);

--
-- Constraints der Tabelle `restaurant_visits`
--
ALTER TABLE `restaurant_visits`
  ADD CONSTRAINT `restaurant_visits_ibfk_1` FOREIGN KEY (`FK_guests`) REFERENCES `guests` (`id`),
  ADD CONSTRAINT `restaurant_visits_ibfk_2` FOREIGN KEY (`FK_restaurants`) REFERENCES `restaurants` (`id`);

--
-- Constraints der Tabelle `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`FK_room_types`) REFERENCES `room_types` (`id`);

--
-- Constraints der Tabelle `rooms_facilities`
--
ALTER TABLE `rooms_facilities`
  ADD CONSTRAINT `rooms_facilities_ibfk_1` FOREIGN KEY (`FK_facilities`) REFERENCES `facilities` (`id`),
  ADD CONSTRAINT `rooms_facilities_ibfk_2` FOREIGN KEY (`FK_rooms`) REFERENCES `rooms` (`id`);

--
-- Constraints der Tabelle `room_service`
--
ALTER TABLE `room_service`
  ADD CONSTRAINT `room_service_ibfk_1` FOREIGN KEY (`FK_restaurants`) REFERENCES `restaurants` (`id`);

--
-- Constraints der Tabelle `room_service_calls`
--
ALTER TABLE `room_service_calls`
  ADD CONSTRAINT `room_service_calls_ibfk_1` FOREIGN KEY (`FK_guests`) REFERENCES `guests` (`id`),
  ADD CONSTRAINT `room_service_calls_ibfk_2` FOREIGN KEY (`FK_room_service`) REFERENCES `room_service` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
