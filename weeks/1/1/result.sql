DROP DATABASE IF EXISTS mega_shop;
CREATE DATABASE mega_shop;
USE mega_shop;

CREATE TABLE products_product (
    size INT(10) NOT NULL, 
    color VARCHAR(30) NOT NULL,
    product_id INT AUTO_INCREMENT UNIQUE NOT NULL, 
    `comment` TEXT,
    reg_date DATETIME NOT NULL,
    PRIMARY KEY(product_id)
);

DROP TABLE products_product;

INSERT INTO products_product
SET size = 44,
color = 'RED',
product_id = 1,
reg_date = NOW();

INSERT INTO products_product
SET size = 55,
color = 'BLUE',
reg_date = NOW();

INSERT INTO products_product
SET size = 66,
color = 'GREEN',
reg_date = NOW();

SELECT *
FROM products_product;

DROP TABLE markets_market;

CREATE TABLE markets_market (
    market_id INT AUTO_INCREMENT UNIQUE NOT NULL,
    market_name TEXT NOT NULL,
    PRIMARY KEY(market_id)

);

INSERT INTO markets_market
SET market_id = 1,
market_name = 'A';

INSERT INTO markets_market
SET market_name = 'B';

INSERT INTO markets_market
SET market_name = 'C';

SELECT *
FROM markets_market;

CREATE TABLE products_product_opt (
    size INT(10) NOT NULL,
    color VARCHAR(30) NOT NULL,
    product_id INT AUTO_INCREMENT UNIQUE,
    reg_date DATETIME NOT NULL,
    update_date DATETIME,
    product_name VARCHAR(100) NOT NULL,
    sale_name VARCHAR(100) NOT NULL,
    price INT(20) NOT NULL,
    sale_price INT(20),
    hide_status INT(1) NOT NULL,
    sold_out_status INT(1) NOT NULL,
    market_id INT NOT NULL, 
    PRIMARY KEY(product_id)

);

DROP TABLE products_product_opt;

INSERT INTO products_product_opt
SET size = 55,
color = 'RED',
reg_date = NOW(),
update_date = NULL,
product_name = '코트',
sale_name = '코트',
price = 60000,
sale_price = 60000,
hide_status = 0,
sold_out_status = 0,
market_id = 1;

INSERT INTO products_product_opt
SET size = 55,
color = 'BLUE',
reg_date = NOW(),
update_date = NULL,
product_name = '조끼',
sale_name = '조끼',
price = 50000,
sale_price = 50000,
hide_status = 0,
sold_out_status = 0,
market_id = 2;

INSERT INTO products_product_opt
SET size = 44,
color = 'BLACK',
reg_date = NOW(),
update_date = NULL,
product_name = '셔츠',
sale_name = '셔츠',
price = 100000,
sale_price = 100000,
hide_status = 0,
sold_out_status = 0,
market_id = 1;

SELECT *
FROM products_product_opt;

CREATE TABLE account_user (
    account_id INT AUTO_INCREMENT UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY(account_id)
    
);

INSERT INTO account_user
SET account_id = 1,
email = 'ABC@gmail.com';

INSERT INTO account_user
SET email = 'ABC@gmail.com';

INSERT INTO account_user
SET email = 'ABCDEF@gmail.com';

SELECT *
FROM account_user;

CREATE TABLE cart_cart_item (
    product_id INT NOT NULL,
    account_id INT UNIQUE NOT NULL,
    sale_name VARCHAR(100) NOT NULL,
    sale_price INT(20)
    
);

DROP TABLE cart_cart_item;

INSERT INTO cart_cart_item
SET product_id = 3,
account_id = 1,
sale_name = '셔츠',
sale_price = 100000;

SELECT *
FROM cart_cart_item;
