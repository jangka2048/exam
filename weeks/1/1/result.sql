DROP DATABASE IF EXISTS mega_shop;
CRETA DATABASE mega_shop;
USE mega_shop;

# 정답을 적어주세요.

DROP DATABASE IF EXISTS mega_shop;
CREATE DATABASE mega_shop;
USE mega_shop;
DROP TABLE markets_marekt;

CREATE TABLE markets_market(
id INT(10) NOT NULL,
market_id INT(10) NOT NULL,
create_Date DATETIME NOT NULL,
`name` VARCHAR(30) NOT NULL
)
SHOW TABLES;
DESC markets_market;

ALTER TABLE markets_market ADD PRIMARY KEY(id, market_id, `name`);
ALTER TABLE markets_market MODIFY COLUMN id INT(10) NOT NULL AUTO_INCREMENT;

CREATE TABLE products_product(
id INT(10) NOT NULL,
market_id INT(10) NOT NULL,
reg_date DATETIME NOT NULL,
update_date DATETIME NOT NULL,
`name` VARCHAR(100) NOT NULL,
sale_name VARCHAR(30) NOT NULL,
price INT(10) NOT NULL,
sale_price INT(10) ,
hide_status BOOLEAN NOT NULL,
sold_out_status BOOLEAN NOT NULL
)
DESC products_product;

ALTER TABLE products_product ADD PRIMARY KEY(id, `name`);
ALTER TABLE products_product MODIFY COLUMN id INT(10) NOT NULL AUTO_INCREMENT;

CREATE TABLE products_product_opt(
color VARCHAR(20) NOT NULL,
size INT(10) NOT NULL
)

DESC products_product_opt;

CREATE TABLE accounts_user(
id INT(10) NOT NULL,
user_id VARCHAR(20) NOT NULL,
user_pw VARCHAR(30) NOT NULL,
user_pw2 VARCHAR(30) NOT NULL,
`name` VARCHAR(10) NOT NULL
)

DESC accounts_user;
ALTER TABLE accounts_user ADD PRIMARY KEY(id, user_id);
ALTER TABLE accounts_user MODIFY COLUMN id INT(10) NOT NULL AUTO_INCREMENT;

CREATE TABLE cart_cart_item(
id INT(10) NOT NULL,
product_name VARCHAR(30) NOT NULL,
product_opt_color VARCHAR(20) NOT NULL,
product_opt_size INT(10) NOT NULL,
product_number INT(10) NOT NULL
)

DESC cart_cart_item;
ALTER TABLE cart_cart_item ADD PRIMARY KEY(id);
ALTER TABLE cart_cart_item MODIFY COLUMN id INT(10) NOT NULL AUTO_INCREMENT;