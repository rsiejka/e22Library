-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Lip 2022, 14:11
-- Wersja serwera: 10.4.17-MariaDB
-- Wersja PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `library`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `app_user`
--

CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `app_user`
--

INSERT INTO `app_user` (`id`, `enabled`, `password`, `username`) VALUES
(18, b'1', '$2a$10$H6u7LFPo0phLjTi8hqaRR.zS.bvOwyn9SytVb7pNKkPZ8fwMIh5dq', 'admin'),
(19, b'0', '$2a$10$tLQWMW3.MekRsuKaZ86RmuD4PnpS/14h.J1v6h4FoKrIgQ0rOPO7q', 'user1'),
(20, b'0', '$2a$10$tvx.ajlEJ/D4aeP7PyFZKORSZIQ2LLu/ZP1a25SGYuBvdEOH.jvOu', 'user2'),
(21, b'0', '$2a$10$wABqqz440LDmlInMyP3L8uD3iStb6p50RtAgAdv2sjNmAVTvVnQ7e', 'user3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `author`
--

CREATE TABLE `author` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `author`
--

INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES
(6, 'Adam', 'Mickiewicz'),
(7, 'Bolesław', 'Prus'),
(8, 'Aldous', 'Huxley'),
(9, 'Marcin', 'Przybyłek');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `authority`
--

CREATE TABLE `authority` (
  `id` bigint(20) NOT NULL,
  `authority` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `authority`
--

INSERT INTO `authority` (`id`, `authority`, `username`, `user_id`) VALUES
(12, 'ROLE_ADMIN', 'admin1', NULL),
(13, 'ROLE_ADMIN', 'admin', NULL),
(14, 'ROLE_USER', 'user1', NULL),
(15, 'ROLE_USER', 'user2', NULL),
(16, 'ROLE_USER', 'user3', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `authors_books`
--

CREATE TABLE `authors_books` (
  `book_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `authors_books`
--

INSERT INTO `authors_books` (`book_id`, `author_id`) VALUES
(14, 7),
(15, 6),
(16, 8),
(17, 9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `book`
--

CREATE TABLE `book` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `book`
--

INSERT INTO `book` (`id`, `name`, `price`, `publisher`, `category_id`) VALUES
(14, 'Lalka', '21.37', 'Znak', 15),
(15, 'Pan Tadeusz', '15.99', 'Wilga', 13),
(16, 'Nowy wspaniały świat', '21.29', 'Muza', 14),
(17, 'CEO Slayer', '35.99', 'Rebis', 14);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(13, 'Poezja epicka'),
(14, 'fantastyka nauk.'),
(15, 'powieść ');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_order`
--

CREATE TABLE `user_order` (
  `id` int(11) NOT NULL,
  `creation_timestamp` datetime(6) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `user_order`
--

INSERT INTO `user_order` (`id`, `creation_timestamp`, `price`, `status`, `user_id`) VALUES
(20, NULL, '35.99', 'FINISHED', 19),
(21, NULL, '21.37', 'ORDERED', 20);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_order_books`
--

CREATE TABLE `user_order_books` (
  `order_id` int(11) NOT NULL,
  `book_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `user_order_books`
--

INSERT INTO `user_order_books` (`order_id`, `book_id`) VALUES
(20, 17),
(21, 14);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_3k4cplvh82srueuttfkwnylq0` (`username`);

--
-- Indeksy dla tabeli `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcqwbvgnkqj13depvim3sp30e3` (`user_id`);

--
-- Indeksy dla tabeli `authors_books`
--
ALTER TABLE `authors_books`
  ADD PRIMARY KEY (`book_id`,`author_id`),
  ADD KEY `FKo3r5etc5qcjlys9yartx3jgcp` (`author_id`);

--
-- Indeksy dla tabeli `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKam9riv8y6rjwkua1gapdfew4j` (`category_id`);

--
-- Indeksy dla tabeli `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtm1x4dhhfaqha5kv939ju1hqo` (`user_id`);

--
-- Indeksy dla tabeli `user_order_books`
--
ALTER TABLE `user_order_books`
  ADD PRIMARY KEY (`order_id`,`book_id`),
  ADD KEY `FKjmiot96lhku8wklt794wmrf5r` (`book_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `author`
--
ALTER TABLE `author`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `authority`
--
ALTER TABLE `authority`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `book`
--
ALTER TABLE `book`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `user_order`
--
ALTER TABLE `user_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `authority`
--
ALTER TABLE `authority`
  ADD CONSTRAINT `FKcqwbvgnkqj13depvim3sp30e3` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`);

--
-- Ograniczenia dla tabeli `authors_books`
--
ALTER TABLE `authors_books`
  ADD CONSTRAINT `FKbjp7syqc25hpghr8kfj5me7qk` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `FKo3r5etc5qcjlys9yartx3jgcp` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

--
-- Ograniczenia dla tabeli `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FKam9riv8y6rjwkua1gapdfew4j` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Ograniczenia dla tabeli `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `FKtm1x4dhhfaqha5kv939ju1hqo` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`);

--
-- Ograniczenia dla tabeli `user_order_books`
--
ALTER TABLE `user_order_books`
  ADD CONSTRAINT `FKivug55frl27ik6qme50q4n3kh` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`id`),
  ADD CONSTRAINT `FKjmiot96lhku8wklt794wmrf5r` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
