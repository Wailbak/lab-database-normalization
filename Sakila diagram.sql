-- Prompt for creating Sakila's diagram using dbdiagram.io

CREATE TABLE `actor` (
  `actor_id` integer PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `last_update` timestamp
);

CREATE TABLE `film` (
  `film_id` integer PRIMARY KEY,
  `title` varchar(255),
  `description` text,
  `release_year` year,
  `language_id` integer,
  `original_language_id` integer,
  `rental_duration` integer,
  `rental_rate` decimal,
  `length` integer,
  `replacement_cost` decimal,
  `rating` varchar(255),
  `special_features` varchar(255),
  `last_update` timestamp
);

CREATE TABLE `customer` (
  `customer_id` integer PRIMARY KEY,
  `store_id` integer,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `address_id` integer,
  `active` boolean,
  `create_date` datetime,
  `last_update` timestamp
);

CREATE TABLE `film_actor` (
  `actor_id` integer,
  `film_id` integer,
  `last_update` timestamp
);

CREATE TABLE `inventory` (
  `inventory_id` integer PRIMARY KEY,
  `film_id` integer,
  `store_id` integer,
  `last_update` timestamp
);

CREATE TABLE `rental` (
  `rental_id` integer PRIMARY KEY,
  `rental_date` datetime,
  `inventory_id` integer,
  `customer_id` integer,
  `return_date` datetime,
  `staff_id` integer,
  `last_update` timestamp
);

CREATE TABLE `address` (
  `address_id` integer PRIMARY KEY,
  `address` varchar(255),
  `address2` varchar(255),
  `district` varchar(255),
  `city_id` integer,
  `postal_code` varchar(255),
  `phone` varchar(255),
  `last_update` timestamp
);

CREATE TABLE `category` (
  `category_id` integer PRIMARY KEY,
  `name` varchar(255),
  `last_update` timestamp
);

CREATE TABLE `city` (
  `city_id` integer PRIMARY KEY,
  `city` varchar(255),
  `country_id` integer,
  `last_update` timestamp
);

CREATE TABLE `country` (
  `country_id` integer PRIMARY KEY,
  `country` varchar(255),
  `last_update` timestamp
);

CREATE TABLE `film_category` (
  `film_id` integer,
  `category_id` integer,
  `last_update` timestamp
);

CREATE TABLE `language` (
  `language_id` integer PRIMARY KEY,
  `name` varchar(255),
  `last_update` timestamp
);

CREATE TABLE `payment` (
  `payment_id` integer PRIMARY KEY,
  `customer_id` integer,
  `staff_id` integer,
  `rental_id` integer,
  `amount` decimal,
  `payment_date` datetime,
  `last_update` timestamp
);

CREATE TABLE `staff` (
  `staff_id` integer PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `address_id` integer,
  `email` varchar(255),
  `store_id` integer,
  `active` boolean,
  `username` varchar(255),
  `password` varchar(255),
  `last_update` timestamp,
  `picture` blob
);

CREATE TABLE `store` (
  `store_id` integer PRIMARY KEY,
  `manager_staff_id` integer,
  `address_id` integer,
  `last_update` timestamp
);

ALTER TABLE `address` ADD FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

ALTER TABLE `city` ADD FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

ALTER TABLE `customer` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

ALTER TABLE `film_category` ADD FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

ALTER TABLE `film_category` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`rental_id`) REFERENCES `rental` (`rental_id`);

ALTER TABLE `staff` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

ALTER TABLE `staff` ADD FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

ALTER TABLE `store` ADD FOREIGN KEY (`manager_staff_id`) REFERENCES `staff` (`staff_id`);

ALTER TABLE `store` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

ALTER TABLE `film_actor` ADD FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`);

ALTER TABLE `film_actor` ADD FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

ALTER TABLE `inventory` ADD FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

ALTER TABLE `rental` ADD FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`);

ALTER TABLE `rental` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);
