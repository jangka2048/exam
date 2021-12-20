DROP DATABASE IF EXISTS mega_shop;
CRETA DATABASE mega_shop;
USE mega_shop;

# 정답을 적어주세요.


DROP DATABASE IF EXISTS mega_shop;
CREATE DATABASE mega_shop;
USE mega_shop;
CREATE TABLE `products_product`(
  id INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  regDate DATETIME,
  `name` VARCHAR(100) NOT NULL,
  `price` INT(100) NOT NULL,
  `sale_price` INT(100),
  `hide_status` BOOLEAN,
  `sold_out_status` BOOLEAN,
  `sum_price` INT(200),
  `market_id` INT(100)
  
);

INSERT INTO `products_product`
SET regDate = NOW(),
`name` = '사과 잠옷',
`price` = 50,
`sale_price` = 10,
`hide_status` = 0,
`sold_out_status` = 0,
`sum_price` = `price` - `sale_price`,
`market_id` = 1;

INSERT INTO `products_product`
SET regDate = NOW(),
`name` = '배 잠옷',
`price` = 30,
`sale_price` = 0,
`hide_status` = 0,
`sold_out_status` = 0,
`sum_price` = `price` - `sale_price`,
`market_id` = 2;

INSERT INTO `products_product`
SET regDate = NOW(),
`name` = '바나나 잠옷',
`price` = 90,
`sale_price` = 30,
`hide_status` = 0,
`sold_out_status` = 0,
`sum_price` = `price` - `sale_price`,
`market_id` = 3;

SELECT *
FROM products_product;


CREATE TABLE `products_product_opt`(
  `color` VARCHAR(50) NOT NULL,
  `size` INT(100) NOT NULL

);

INSERT INTO `products_product_opt`
SET `color` = 'red',
`size`= '95';

INSERT INTO `products_product_opt`
SET `color` = 'blue',
`size`= '100';

INSERT INTO `products_product_opt`
SET `color` = 'green',
`size`= '105';

SELECT *
FROM `products_product_opt`;

CREATE TABLE `accounts_user`(
  `user_id` INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `user_name` VARCHAR(30) NOT NULL,
  `email` VARCHAR(100)

);

INSERT INTO `accounts_user`
SET `user_name` = '철수',
`email` = 'abc@def.com';

INSERT INTO `accounts_user`
SET `user_name` = '영희',
`email` = 'abccc@defds.com';

INSERT INTO `accounts_user`
SET `user_name` = '한솔',
`email` = 'absrrc@ddvdef.com';
SELECT *
FROM `accounts_user`


CREATE TABLE `markets_market`(
  `market_id` INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `market_name` VARCHAR(100)

);

INSERT INTO `markets_market`
SET `market_id` = 10,
`market_name` = '가나다'

SELECT *
FROM markets_market;




CREATE TABLE `cart_cart_item` (
  `market_id` INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `market_name` VARCHAR(100),
  `name` VARCHAR(100),
  `color` VARCHAR(50) NOT NULL,
  `size` INT(100) NOT NULL,
  `price` INT(100),
  `sale_price` INT(100),
  `all_price` INT(100)
  

);

INSERT INTO `cart_cart_item`
SET `market_name` = '감놔라 배놔라',
`name` = '감귤옷',
`color` = 'blue',
`size` = 90,
`price` = 9000,
`sale_price` = 1000,
`all_price` = `price` - `sale_price`;

INSERT INTO `cart_cart_item`
SET `market_name` = '배놔라 감놔라',
`name` = '배옷',
`color` = 'red',
`size` = 90,
`price` = 12000,
`sale_price` = 5000,

`all_price` = `price` - `sale_price`;

INSERT INTO `cart_cart_item`
SET `market_name` = '감놔라 배놔라',
`name` = '감귤옷',
`color` = 'blue',
`size` = 90,
`price` = 9000,
`sale_price` = 1000,
`all_price` = `price` - `sale_price` ;

SELECT *
FROM products_product;
SELECT *
FROM products_product_opt;
SELECT *
FROM accounts_user;
SELECT *
FROM markets_market;
SELECT *
FROM `cart_cart_item`;