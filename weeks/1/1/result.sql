DROP DATABASE IF EXISTS mega_shop;
CREATE DATABASE mega_shop;
USE mega_shop;


CREATE TABLE `markets_market` (
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    reg_date DATETIME NOT NULL,
    `name` VARCHAR(100) NOT NULL
);


INSERT INTO `markets_market`
SET reg_date = NOW(),
`name` = '크림마켓';

INSERT INTO `markets_market`
SET reg_date = NOW(),
`name` = '당근마켓';

INSERT INTO `markets_market`
SET reg_date = NOW(),
`name` = '야호마켓';

SELECT *
FROM `markets_market`;

CREATE TABLE `products_product` (
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    reg_date DATETIME NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `sale_name` VARCHAR(100) NOT NULL,
    `price` INT(10) NOT NULL,
    `sale_price` INT(10) NOT NULL,
    `hide_status` INT(1) NOT NULL,
    `sold_out_status` INT(1) NOT NULL,
    `market_id` INT(10) NOT NULL
);



INSERT INTO `products_product`
SET reg_date = NOW(),
`name`= '체크 목도리',
`market_id` = 1,
`sale_name` = '목도리',
`price` = 39000,
`sale_price` = 29000,
`hide_status` = 1,
`sold_out_status` = 1;

INSERT INTO `products_product`
SET reg_date = NOW(),
`name`= '검정 코트',
`market_id` = 2,
`sale_name` = '기본 코트',
`price` = 40000,
`sale_price` = 30000,
`hide_status` = 0,
`sold_out_status` = 0;


INSERT INTO `products_product`
SET reg_date = NOW(),
`name`= '워커',
`market_id` = 3,
`sale_name` = '기본 워커',
`price` = 29000,
`sale_price` = 19000,
`hide_status` = 0,
`sold_out_status` = 0;



CREATE TABLE `products_product_opt`(
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    `size` VARCHAR(100) NOT NULL,
    `color` VARCHAR(100) NOT NULL,
    `market_id` INT(10) NOT NULL,
    `product_id` INT(10) NOT NULL
);


INSERT INTO `products_product_opt`
SET `size` = 'm',
`color` = 'red',
`market_id` = 1,
`product_id` = 1;


INSERT INTO `products_product_opt`
SET `size` = 'm',
`color` = 'black',
`market_id` = 2,
`product_id` = 2;


INSERT INTO `products_product_opt`
SET `size` = 's',
`color` = 'black',
`market_id` = 3,
`product_id` = 3;


CREATE TABLE `account_user` (
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    reg_date DATETIME NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `login_id` VARCHAR(100) NOT NULL,
    `login_pw` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `phone_no` INT(10) NOT NULL
);


INSERT INTO `account_user`
SET reg_date = NOW(),
`name` = '김연아',
`login_id` = 'kimyeona01',
`login_pw` = 'kya01',
`email` = 'kimyeona@naver.com',
`phone_no` = 01012345678; 


INSERT INTO `account_user`
SET reg_date = NOW(),
`name` = '구경이',
`login_id` = 'kk22',
`login_pw` = 'kk22',
`email` = 'kk22@naver.com',
`phone_no` = 01099992222; 


INSERT INTO `account_user`
SET reg_date = NOW(),
`name` = '서현',
`login_id` = 'shht1220',
`login_pw` = 'shht0000',
`email` = 'shyeon@naver.com',
`phone_no` = 01077779999; 

SELECT *
FROM `account_user`;

CREATE TABLE `cart_item` (
    `product_id` VARCHAR(100) NOT NULL,
    `product_color` VARCHAR(100) NOT NULL,
    `product_size` VARCHAR(100) NOT NULL,
    `market_id` INT(10) NOT NULL
);

INSERT INTO `cart_item`
SET `product_id` = 3,
`product_color` = 'black',
`product_size` = 'm',
`market_id` = 3;


INSERT INTO `cart_item`
SET `product_id` = 1,
`product_color` = 'beige',
`product_size` = 'free',
`market_id` = 3;


INSERT INTO `cart_item`
SET `product_id` = 2,
`product_color` = 'black',
`product_size` = 'm',
`market_id` = 3;


CREATE TABLE `qna`(
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    reg_date DATETIME NOT NULL,
    `update_date` DATETIME NOT NULL,
    `product_id` INT(10) NOT NULL,
    `member_id` INT(10) NOT NULL,
    `question` VARCHAR(100) NOT NULL,
    `answer_id` INT(10) NOT NULL,
    `answer` VARCHAR(100) NOT NULL
);

INSERT INTO `qna`
SET reg_date = NOW(),
`update_date` = NOW(),
`product_id` = 1,
`member_id` = 2,
`question` = '다른 색상은 없나요?',
`answer_id` = 1,
`answer` = '네 없어요';


INSERT INTO `qna`
SET reg_date = NOW(),
`update_date` = NOW(),
`product_id` = 2,
`member_id` = 3,
`question` = '품절된 옵션 제품은 언제 들어오나요?',
`answer_id` = 2,
`answer` = '계획 없습니다';


INSERT INTO `qna`
SET reg_date = NOW(),
`update_date` = NOW(),
`product_id` = 3,
`member_id` = 1,
`question` = 'm 사이즈 재입고 계획 없나요?',
`answer_id` = 1,
`answer` = '내년 1월 계획 중에 있습니다';

USE mega_shop;

SHOW TABLES;

SELECT *
FROM qna;

DESC products_product;


