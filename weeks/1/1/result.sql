DROP DATABASE IF EXISTS mega_shop;
CREATE DATABASE mega_shop;
USE mega_shop;

/*
- 상품은 다음과 같은 정보로 구성된다.
  - id : 주키
  - reg_date : 생성날짜
  - update_date : 수정날짜
  - name : 상품명
  - sale_name : 상품명(실제 고객에게 노출되는 이름)
  - price : 원래가격
  - sale_price : 실제판매가격(이 가격이 price 보다 낮다면, discount가 진행중이라는 뜻)
  - hide_status : 0=보임, 1=숨김(1이면 쇼핑몰에 노출되지 않는다.)
  - sold_out_status : 0=미품절, 1=품절(1이면 품절이라는 뜻)
  - market_id : 이 상품이 소속되어 있는 마켓의 번호
  
- 필수적으로 필요한 테이블은 다음과 같다.
 - markets_marekt : 마켓
 - products_product_opt : 상품옵션
 - accounts_user : 회원정보
 - cart_cart_item : 장바구니아이템
*/

# 정답을 적어주세요.
# -------------------
# 마켓 테이블 생성
CREATE TABLE markets_market (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	reg_date DATETIME NOT NULL,
	shop_name CHAR(100) NOT NULL UNIQUE,
	update_date DATETIME NOT NULL
);

INSERT INTO markets_market
SET reg_date = NOW(), shop_name = 'shop1', update_date = NOW();
INSERT INTO markets_market
SET reg_date = NOW(), shop_name = 'shop2', update_date = NOW();

SELECT * FROM markets_market;

# 상품 테이블 생성
CREATE TABLE product (
	id INT(10) UNSIGNED NOT NULL,
	product_id INT(10) UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
	`name` CHAR(100) NOT NULL,
	price INT(10) UNSIGNED NOT NULL
);

INSERT INTO product
SET id = 1, `name` = '코트', price = 259000;
INSERT INTO product
SET id = 1, `name` = '코트', price = 199000;
INSERT INTO product
SET id = 2, `name` = '가디건', price = 45000;

SELECT * FROM product;

# 상품옵션 테이블 생성 ( + color, size )
CREATE TABLE product_opt(
	product_id INT(10) UNSIGNED NOT NULL,
	sale_name CHAR(100) NOT NULL,
	sale_price INT(10) UNSIGNED NOT NULL,
	color CHAR(100) NOT NULL,
	size CHAR(10) NOT NULL,
	hide_status INT(1) UNSIGNED NOT NULL,
	sold_out_status INT(1) UNSIGNED NOT NULL
);

INSERT INTO product_opt
SET product_id = 1, sale_name = '벨트 울 코트', sale_price = 259000, color = 'BK', size = 'Free', hide_status = 0, sold_out_status = 0;
INSERT INTO product_opt
SET product_id = 2, sale_name = '오버사이즈 롱 코트', sale_price = 10000, color = 'GR', size = 'L', hide_status = 1, sold_out_status = 1;
INSERT INTO product_opt
SET product_id = 2, sale_name = '오버사이즈 롱 코트', sale_price = 10000, color = 'BG', size = 'M', hide_status = 0, sold_out_status = 0;
INSERT INTO product_opt
SET product_id = 3, sale_name = '리브드 니트 가디건', sale_price = 25000, color = 'PK', size = 'Free', hide_status = 0, sold_out_status = 1;

SELECT * FROM product_opt;

# 회원정보 테이블 생성
CREATE TABLE accounts_user (
	user_id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	user_name CHAR(100) NOT NULL,
	user_password CHAR(100) NOT NULL
);

INSERT INTO accounts_user 
SET user_name = 'user1', user_password = '0000';
INSERT INTO accounts_user 
SET user_name = 'user2', user_password = '1111';

SELECT * FROM accounts_user;

# 장바구니아이템 테이블 생성
CREATE TABLE cart_cart_item (
	user_id INT(10) NOT NULL,
	market_name CHAR(100) NOT NULL,
	item_name CHAR(100) NOT NULL,
	item_price INT(10) UNSIGNED NOT NULL
);

INSERT INTO cart_cart_item 
SET user_id = 1, market_name = 'shop1', item_name = '벨트 울 코트', item_price = 259000;
INSERT INTO cart_cart_item
SET user_id = 1,market_name = 'shop2', item_name = '리브드 니트 가디건', item_price = 25000;
INSERT INTO cart_cart_item
SET user_id = 2,market_name = 'shop2', item_name = '리브드 니트 가디건', item_price = 25000;

SELECT * FROM cart_cart_item;

# 외래키 추가


# 유저1 장바구니 보기
SELECT * FROM cart_cart_item WHERE user_id = 1;
