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
	user_password CHAR(100) NOT NULL,
	user_cart INT(10) UNSIGNED
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

# Question 테이블 생성
CREATE TABLE question (
	q_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	user_id INT(10) NOT NULL,
	q_title TEXT NOT NULL,
	q_body TEXT NOT NULL,
	q_answer INT(1) NOT NULL -- 1은 답변완료
);

INSERT INTO question
SET user_id = 1, q_title = '배송문의', q_body = '언제 출고되나요 ?', q_answer = 0;
INSERT INTO question
SET user_id = 2, q_title = '환불 및 교환', q_body = '컬러가 맘에 안드는데 교환이나 환불 가능할까요 ?', q_answer = 1;
INSERT INTO question
SET user_id = 1, q_title = '재입고 문의', q_body = '리브드 니트 가디건 언제 재입고 되나요 ?', q_answer = 1;

SELECT * FROM question;

# answer 테이블 생성
CREATE TABLE answer (
	a_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	q_id INT(10) UNSIGNED NOT NULL,
	user_id INT(10) NOT NULL,
	a_body TEXT NOT NULL
);

INSERT INTO answer
SET q_id = 2, user_id = 2, a_body = '단순 변심으로 인한 환불 및 교환은 어렵습니다';
INSERT INTO answer
SET q_id = 3, user_id = 1, a_body = '재입고 알람 요청 하시면 당일날 알림으로 알려드립니다';

SELECT * FROM answer;
