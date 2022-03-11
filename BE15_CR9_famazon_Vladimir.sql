-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: localhost
-- Čas generovania: Pi 11.Mar 2022, 17:18
-- Verzia serveru: 10.4.21-MariaDB
-- Verzia PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `BE15_CR9_famazon_Vladimir`
--
CREATE DATABASE IF NOT EXISTS `BE15_CR9_famazon_Vladimir` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `BE15_CR9_famazon_Vladimir`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `Account`
--

CREATE TABLE `Account` (
  `account_id` int(11) NOT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `Account`
--

INSERT INTO `Account` (`account_id`, `fk_invoice_id`, `fk_customer_id`) VALUES
(1, 2, 5),
(2, 0, 2),
(3, 0, 2),
(4, 0, 7),
(5, 0, 7),
(6, 0, 3),
(7, 0, 1),
(8, 0, 4),
(9, 0, 3),
(10, 0, 7);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `Customer`
--

CREATE TABLE `Customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `fk_zip_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `Customer`
--

INSERT INTO `Customer` (`customer_id`, `name`, `user_name`, `email`, `street`, `fk_zip_id`) VALUES
(1, 'Vladimir Anton', 'lalo1993', 'helloemail.com', 'Maximova', 2),
(2, 'Alexandra Anton', 'alexa1997', 'helloemail.com', 'Maxovna', 2),
(3, 'Jovana  Caiola', 'jovana1990', 'helloemail.com', 'Milanad', 4),
(4, 'Marciellino Aurelius', 'cieli12', 'helloemail.com', 'Romede ', 4),
(5, 'Genaro Pasta', 'geno3', 'helloemail.com', 'Tourine', 4),
(6, 'Jardo Novotny', 'novo32', 'helloemail.com', 'Hlavni', 3),
(7, 'Juraj Janosik', 'jurajrepa3', 'helloemail.com', 'Volgogradska', 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `Invoice`
--

CREATE TABLE `Invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_account_id` int(11) DEFAULT NULL,
  `fk_order_id` int(11) DEFAULT NULL,
  `fk_payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `Invoice`
--

INSERT INTO `Invoice` (`invoice_id`, `fk_account_id`, `fk_order_id`, `fk_payment_id`) VALUES
(1, 1, 2, 1),
(2, 1, 7, 1),
(3, 2, 2, 1),
(4, 5, 9, 1),
(5, 7, 10, 1),
(6, 8, 11, 1),
(7, 10, 9, 1),
(8, 10, 11, 1),
(9, 7, 7, 1),
(10, 8, 8, 1),
(11, 4, 10, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `Order_ID`
--

CREATE TABLE `Order_ID` (
  `order_no` int(11) NOT NULL,
  `fk_product_list_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `Order_ID`
--

INSERT INTO `Order_ID` (`order_no`, `fk_product_list_id`, `order_date`) VALUES
(1, 1, '2022-03-01'),
(2, 2, '2022-03-02'),
(3, 3, '2022-03-04'),
(4, 4, '2022-03-05'),
(5, 6, '2022-03-06'),
(6, 7, '2022-03-07'),
(7, 8, '2022-03-08'),
(8, 9, '2022-03-09'),
(9, 10, '2022-03-10'),
(10, 1, '2022-02-28'),
(11, 13, '2022-02-27');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `payment`
--

INSERT INTO `payment` (`payment_id`, `account_id`, `invoice_id`) VALUES
(3, 1, 1),
(4, 1, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `Producer`
--

CREATE TABLE `Producer` (
  `producer_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `fk_zip_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `Producer`
--

INSERT INTO `Producer` (`producer_id`, `name`, `fk_zip_id`) VALUES
(1, 'Nike', 5),
(2, 'BMW', 5),
(3, 'Fiat', 4),
(4, 'Kia', 1),
(5, 'Skoda', 3),
(6, 'Porsche', 2);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `Product`
--

CREATE TABLE `Product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `fk_producer_id` int(11) DEFAULT NULL,
  `fk_warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `Product`
--

INSERT INTO `Product` (`product_id`, `name`, `price`, `fk_producer_id`, `fk_warehouse_id`) VALUES
(1, 'Wheel', 300, 2, 1),
(2, 'Seat', 200, 3, 8),
(3, 'Seat belt', 2, 5, 6),
(4, 'Engine', 10000, 6, 5),
(5, 'Battery', 40, 4, 2),
(6, 'Alternator', 180, 5, 2),
(7, 'Rear Axle', 290, 2, 6),
(8, 'Oil', 99, 6, 4),
(9, 'Sneakers', 200, 1, 10),
(10, 'Hoodie', 250, 1, 11);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `Product_list`
--

CREATE TABLE `Product_list` (
  `product_list_id` int(11) NOT NULL,
  `fk_producer_id` int(11) DEFAULT NULL,
  `fk_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `Product_list`
--

INSERT INTO `Product_list` (`product_list_id`, `fk_producer_id`, `fk_product_id`) VALUES
(1, 2, 6),
(2, 1, 9),
(3, 1, 10),
(4, 3, 5),
(5, 4, 4),
(6, 6, 8),
(7, 5, 6),
(8, 6, 3),
(9, 5, 1),
(10, 3, 5),
(11, 5, 4),
(12, 4, 2),
(13, 2, 3);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `shipment`
--

CREATE TABLE `shipment` (
  `shipment_id` int(11) NOT NULL,
  `ship_date` date NOT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `shipment`
--

INSERT INTO `shipment` (`shipment_id`, `ship_date`, `fk_invoice_id`) VALUES
(1, '2022-03-08', 2),
(2, '2022-03-09', 1),
(3, '2022-03-12', 3),
(4, '2022-03-13', 3),
(5, '2022-03-14', 4),
(6, '2022-03-15', 5),
(7, '2022-03-16', 6),
(8, '2022-03-17', 7),
(9, '2022-03-18', 8),
(10, '2022-03-19', 9),
(11, '2022-03-20', 10),
(12, '2022-03-21', 11);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `Transport`
--

CREATE TABLE `Transport` (
  `transport_id` int(11) NOT NULL,
  `transport_company` varchar(50) DEFAULT NULL,
  `way_of_transport` varchar(100) DEFAULT NULL,
  `fk_shipment_id` int(11) DEFAULT NULL,
  `fk_warehouse_id` int(11) DEFAULT NULL,
  `fk_zip_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `Transport`
--

INSERT INTO `Transport` (`transport_id`, `transport_company`, `way_of_transport`, `fk_shipment_id`, `fk_warehouse_id`, `fk_zip_id`) VALUES
(1, 'DHL', 'TRUCK', 2, 8, 3),
(2, 'UPS', 'TRAIN', 11, 6, 5),
(3, 'GPS', 'Flight', 6, 3, 5),
(4, 'UPS', NULL, 3, 7, 2),
(5, 'DHL', 'TRUCK', 2, 10, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `Warehouse`
--

CREATE TABLE `Warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `fk_zip_id` int(11) DEFAULT NULL,
  `fk_product_id` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `Warehouse`
--

INSERT INTO `Warehouse` (`warehouse_id`, `fk_zip_id`, `fk_product_id`, `name`) VALUES
(1, 2, 6, 'CAR_PARTS'),
(2, 5, 4, 'CAR_PARTS'),
(3, 4, 7, 'CAR_PARTS'),
(4, 1, 3, 'CAR_PARTS'),
(5, 5, 1, 'CAR_PARTS'),
(6, 4, 8, 'CAR_PARTS'),
(7, 3, 4, 'CAR_PARTS'),
(8, 5, 4, 'CAR_PARTS'),
(9, 1, 6, 'CAR_PARTS'),
(10, 4, 9, 'CLOTHES'),
(11, 5, 10, 'CLOTHES');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `ZIP`
--

CREATE TABLE `ZIP` (
  `zip_id` int(11) NOT NULL,
  `country` varchar(30) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `ZIP`
--

INSERT INTO `ZIP` (`zip_id`, `country`, `zip_code`) VALUES
(1, 'Slovakia', 3600),
(2, 'Austria', 1100),
(3, 'Czech', 422),
(4, 'Italy', 2300),
(5, 'Germany', 1122);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexy pre tabuľku `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_zip_id` (`fk_zip_id`);

--
-- Indexy pre tabuľku `Invoice`
--
ALTER TABLE `Invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_order_id` (`fk_order_id`),
  ADD KEY `invoice_ibfk_1` (`fk_account_id`),
  ADD KEY `fk_payment_id` (`fk_payment_id`);

--
-- Indexy pre tabuľku `Order_ID`
--
ALTER TABLE `Order_ID`
  ADD PRIMARY KEY (`order_no`),
  ADD KEY `fk_product_list_id` (`fk_product_list_id`);

--
-- Indexy pre tabuľku `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`,`account_id`,`invoice_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexy pre tabuľku `Producer`
--
ALTER TABLE `Producer`
  ADD PRIMARY KEY (`producer_id`),
  ADD KEY `fk_zip_id` (`fk_zip_id`);

--
-- Indexy pre tabuľku `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_producer_id` (`fk_producer_id`),
  ADD KEY `fk_warehouse_id` (`fk_warehouse_id`);

--
-- Indexy pre tabuľku `Product_list`
--
ALTER TABLE `Product_list`
  ADD PRIMARY KEY (`product_list_id`),
  ADD KEY `fk_producer_id` (`fk_producer_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexy pre tabuľku `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`shipment_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indexy pre tabuľku `Transport`
--
ALTER TABLE `Transport`
  ADD PRIMARY KEY (`transport_id`),
  ADD KEY `fk_shipment_id` (`fk_shipment_id`),
  ADD KEY `fk_warehouse_id` (`fk_warehouse_id`),
  ADD KEY `fk_zip_id` (`fk_zip_id`);

--
-- Indexy pre tabuľku `Warehouse`
--
ALTER TABLE `Warehouse`
  ADD PRIMARY KEY (`warehouse_id`),
  ADD KEY `fk_zip_id` (`fk_zip_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexy pre tabuľku `ZIP`
--
ALTER TABLE `ZIP`
  ADD PRIMARY KEY (`zip_id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `Account`
--
ALTER TABLE `Account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `Customer`
--
ALTER TABLE `Customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pre tabuľku `Invoice`
--
ALTER TABLE `Invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pre tabuľku `Order_ID`
--
ALTER TABLE `Order_ID`
  MODIFY `order_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pre tabuľku `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `Producer`
--
ALTER TABLE `Producer`
  MODIFY `producer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pre tabuľku `Product`
--
ALTER TABLE `Product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `Product_list`
--
ALTER TABLE `Product_list`
  MODIFY `product_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pre tabuľku `shipment`
--
ALTER TABLE `shipment`
  MODIFY `shipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pre tabuľku `Transport`
--
ALTER TABLE `Transport`
  MODIFY `transport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `Warehouse`
--
ALTER TABLE `Warehouse`
  MODIFY `warehouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pre tabuľku `ZIP`
--
ALTER TABLE `ZIP`
  MODIFY `zip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `Customer` (`customer_id`);

--
-- Obmedzenie pre tabuľku `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_zip_id`) REFERENCES `ZIP` (`zip_id`);

--
-- Obmedzenie pre tabuľku `Invoice`
--
ALTER TABLE `Invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_account_id`) REFERENCES `Account` (`account_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_order_id`) REFERENCES `Order_ID` (`order_no`);

--
-- Obmedzenie pre tabuľku `Order_ID`
--
ALTER TABLE `Order_ID`
  ADD CONSTRAINT `order_id_ibfk_1` FOREIGN KEY (`fk_product_list_id`) REFERENCES `Product_list` (`product_list_id`);

--
-- Obmedzenie pre tabuľku `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `Account` (`account_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `Invoice` (`invoice_id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `Producer`
--
ALTER TABLE `Producer`
  ADD CONSTRAINT `producer_ibfk_1` FOREIGN KEY (`fk_zip_id`) REFERENCES `ZIP` (`zip_id`);

--
-- Obmedzenie pre tabuľku `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk_producer_id`) REFERENCES `Producer` (`producer_id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`fk_warehouse_id`) REFERENCES `Warehouse` (`warehouse_id`);

--
-- Obmedzenie pre tabuľku `Product_list`
--
ALTER TABLE `Product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`fk_producer_id`) REFERENCES `Producer` (`producer_id`),
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `Product` (`product_id`);

--
-- Obmedzenie pre tabuľku `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `Invoice` (`invoice_id`);

--
-- Obmedzenie pre tabuľku `Transport`
--
ALTER TABLE `Transport`
  ADD CONSTRAINT `transport_ibfk_1` FOREIGN KEY (`fk_shipment_id`) REFERENCES `shipment` (`shipment_id`),
  ADD CONSTRAINT `transport_ibfk_2` FOREIGN KEY (`fk_warehouse_id`) REFERENCES `Warehouse` (`warehouse_id`),
  ADD CONSTRAINT `transport_ibfk_3` FOREIGN KEY (`fk_zip_id`) REFERENCES `ZIP` (`zip_id`);

--
-- Obmedzenie pre tabuľku `Warehouse`
--
ALTER TABLE `Warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`fk_zip_id`) REFERENCES `ZIP` (`zip_id`),
  ADD CONSTRAINT `warehouse_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `Product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
