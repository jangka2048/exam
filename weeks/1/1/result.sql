DROP DATABASE IF EXISTS mega_shop;
CREATE DATABASE mega_shop;
USE mega_shop;

CREATE TABLE markets_market(
id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
reg_date DATETIME NOT NULL,
`name` VARCHAR(100) NOT NULL
);

INSERT INTO markets_market
SET reg_date = NOW(),
`name` = "다나와";

INSERT INTO markets_market
SET reg_date = NOW(),
`name` = "지마켓";

INSERT INTO markets_market
SET reg_date = NOW(),
`name` = "11번가";

CREATE TABLE products_product(
id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
market_id INT(10) UNSIGNED NOT NULL,
reg_date DATETIME NOT NULL,
update_date DATETIME NOT NULL,
`name` VARCHAR(100) NOT NULL,
price INT(10) UNSIGNED NOT NULL,
sale_price INT(10) UNSIGNED NOT NULL,
hide_status INT(10) UNSIGNED NOT NULL,
sold_out_status INT(10) UNSIGNED NOT NULL
);

INSERT INTO products_product
SET market_id = 2,
reg_date = NOW(),
update_date = NOW(),
`name` = "구두",
price = 100000,
sale_price = 150000;

INSERT INTO products_product
SET market_id = 3,
reg_date = NOW(),
update_date = NOW(),
`name` = "모자",
price = 30000,
sale_price = 50000;

INSERT INTO products_product
SET market_id = 1,
reg_date = NOW(),
update_date = NOW(),
`name` = "티셔츠",
price = 15000,
sale_price = 20000;

UPDATE products_product
SET update_date = NOW(),
sale_price = 145000
WHERE id = 1;

CREATE TABLE products_product_opt(
id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
product_id INT(10) UNSIGNED NOT NULL,
color VARCHAR(100) NOT NULL,
size VARCHAR(100) NOT NULL,
opt_price INT(10) UNSIGNED NOT NULL
);

INSERT INTO products_product_opt
SET product_id = 1,
color = "red",
size = "270";

INSERT INTO products_product_opt
SET product_id = 2,
color = "black",
size = "56호";

INSERT INTO products_product_opt
SET product_id = 1,
color = "blue",
size = "270",
opt_price = 5000;

INSERT INTO products_product_opt
SET product_id = 2,
color = "white",
size = "56호",
opt_price = 10000;

INSERT INTO products_product_opt
SET product_id = 3,
color = "green",
size = "105",
opt_price = 5000;

CREATE TABLE account_user(
id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
login_id VARCHAR(100) NOT NULL,
login_pw VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
nickname VARCHAR(100) NOT NULL,
`name` VARCHAR(100) NOT NULL,
lastname VARCHAR(100) NOT NULL,
adress VARCHAR(100) NOT NULL
);

INSERT INTO account_user
SET login_id = "user1",
login_pw = "1234",
email = "user1@user1.com",
nickname = "cat99",
`name` = "길동",
lastname = "홍",
adress = "대전시 동구";

INSERT INTO account_user
SET login_id = "user2",
login_pw = "4567",
email = "user2@user2.com",
nickname = "dog33",
`name` = "길순",
lastname = "엄",
adress = "서울시 짱구";

INSERT INTO account_user
SET login_id = "user3",
login_pw = "7890",
email = "user3@user3.com",
nickname = "dogcat77",
`name` = "꺽정",
lastname = "임",
adress = "김해시 맹구";

CREATE TABLE cart_cart_item(
id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
product_id INT(10) UNSIGNED NOT NULL,
product_opt_id INT(10) UNSIGNED NOT NULL,
sale_price INT(10) UNSIGNED NOT NULL
);

INSERT INTO cart_cart_item
SET product_id = 1,
product_opt_id = 3,
sale_price = 150000;


INSERT INTO cart_cart_item
SET product_id = 2,
product_opt_id = 4,
sale_price = 60000;


INSERT INTO cart_cart_item
SET product_id = 3,
product_opt_id = 5,
sale_price = 25000;
