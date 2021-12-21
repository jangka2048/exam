DROP DATABASE IF EXISTS mega_shop;
CREATE DATABASE mega_shop;
USE mega_shop;

-- 1. 마켓
CREATE TABLE `markets_market`( 
    id INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 연결된 업체번호
    `market_name` VARCHAR(30) NOT NULL, -- 연결된 업체 이름
    `market_phone_number` CHAR(100) NOT NULL, -- 연결된 업체 전화번호
    `market_adress` TEXT(100) NOT NULL, -- 연결된 업체 주소
    `market_account` VARCHAR(30) NOT NULL -- 연결된 업체 대표
);

-- 1-1. 데이터
INSERT INTO `markets_market`
SET id = '1',
`market_name` = '옷가게1',
`market_phone_number` = '01012345678',
`market_adress` = '서울',
`market_account` = '김김김';

INSERT INTO `markets_market`
SET id = '2',
`market_name` = '옷가게2',
`market_phone_number` = '01012345699',
`market_adress` = '대전',
`market_account` = '이이이';

-- 2. 상품
CREATE TABLE `products_product`(
  id INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 주키
  regDate DATETIME NOT NULL, -- 생성날짜 date
  `update_date` DATETIME NOT NULL, -- 수정날짜
  `name` VARCHAR(30) NOT NULL, -- 상품명
  `sale_name` VARCHAR(30) NOT NULL, -- 고객노출 상품명
  `price` INT(100) NOT NULL, -- 원래가격
  `sale_price` INT(100), -- 실제 판매 가격
  `hide_status` BOOLEAN, -- 보임숨김
  `sold_out_status` BOOLEAN, -- 품절 미품절
  `market_id` INT(100) -- 상품 소속 마켓 번호
);

-- 2-1. 데이터
INSERT INTO `products_product`
SET regDate = NOW(),
`update_date` = NOW(),
`name` = '패딩1',
`sale_name` = '무슨무슨 패딩',
`price` = 200000,
`sale_price` = 150000,
`hide_status` = 0,
`sold_out_status` = 1,
`market_id` = 1;

INSERT INTO `products_product`
SET regDate = NOW(),
`update_date` = NOW(),
`name` = '재킷1',
`sale_name` = '무슨무슨 재킷',
`price` = 150000,
`sale_price` = 100000,
`hide_status` = 0,
`sold_out_status` = 0,
`market_id` = 2;

-- 3. 상품옵션
CREATE TABLE `products_product_opt`(
  `opt_id` INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 상품옵션고유번호
  `product_id` INT(100) NOT NULL, -- 상품 번호
  `opt_size` CHAR(10) NOT NULL, -- 상품 사이즈
  `opt_color` CHAR(10) NOT NULL, -- 상품 색
  `opt_rest` INT(100) NOT NULL -- 남은 상품
);

-- 3-1. 데이터 
INSERT INTO `products_product_opt`
SET `opt_id` = 1,
`product_id` = 1,
`opt_size` = 'R',
`opt_color` = 'RED',
`opt_rest` = 3;

INSERT INTO `products_product_opt`
SET `opt_id` = 2,
`product_id` = 2,
`opt_size` = 'S',
`opt_color` = 'BLACK',
`opt_rest` = 2;

-- 4. 유저정보
CREATE TABLE `account_user`(
  `account_id` INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 유저번호
  `user_name` VARCHAR(30) NOT NULL, -- 고객이름
  `user_id` VARCHAR(30) NOT NULL, -- 고객 아이디
  `password` VARCHAR(30) NOT NULL, -- 고객 비밀번호
  `user_age` INT(10) NOT NULL, -- 고객 나이
  `user_phone_number` CHAR(100) NOT NULL -- 고객 번호
  );

-- 4-1. 데이터
INSERT INTO `account_user`
SET `account_id` = 1,
`user_name` = '김김',
`user_id` = 'test_001',
`password` = 'a1234',
`user_age` = 30,
`user_phone_number` = '01001234567';

INSERT INTO `account_user`
SET `account_id` = 2,
`user_name` = '박박',
`user_id` = 'test_002',
`password` = '12345',
`user_age` = 25,
`user_phone_number` = '01098765432';

-- 5. 장바구니정보
CREATE TABLE `cart_cart_item`(
  `product_id` INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 상품 번호
  `product_name` VARCHAR(30) NOT NULL, -- 상품 이름
  `product_color` VARCHAR(30) NOT NULL, -- 상품 색상
  `product_size` VARCHAR(30) NOT NULL, -- 상품 사이즈
  `product_pack_number` INT(100) NOT NULL -- 상품 담은 수량
  );

-- 5-1. 데이터
INSERT INTO `cart_cart_item`
SET `product_id` = 1,
`product_name` = '무슨무슨 패딩',
`product_color` = 'RED',
`product_size` = 'L',
`product_pack_number` = 1;

INSERT INTO `cart_cart_item`
SET `product_id` = 2,
`product_name` = '무슨무슨 재킷',
`product_color` = 'BLACK',
`product_size` = 'S',
`product_pack_number` = 2;