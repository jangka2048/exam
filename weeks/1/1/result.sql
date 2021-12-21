DROP DATABASE IF EXISTS mega_shop;
create DATABASE mega_shop;
USE mega_shop;
# 정답을 적어주세요.

-- 테이블 생성

create table markets_market (
-- 마켓
    -- 마켓 고유 번호
    `market_id` bigint PRIMARY KEY AUTO_INCREMENT,
    -- 마켓 이름
    `market_name` text not null
);
create table products_product (
-- 마켓에 올라가는 상품 목록
    -- 상품 고유번호
    `product_id` BIGINT PRIMARY key AUTO_INCREMENT,
    -- 상품 생성 날짜
    `reg_date` DATETIME not null,
    -- 상품 수정 날짜
    `update_date` DATETIME,
    -- 상품 이름
    `name` text not null,
    -- 노출되는 이름
    `sale_name` text not null,
    -- 상품 실제 가격
    `price` BIGINT not null,
    -- 상품 판매 가격
    `sale_price` BIGINT,
    -- 상품 노출 여부
    `hide_status` boolean not null,
    -- 상품 품절 여부
    `sold_out_status` boolean not null,
    -- 상품 소속 마켓 번호
    `market_id` BIGINT not null
);
create table products_product_opt (
-- 상품 옵션
    -- 옵션 고유 번호
    `opt_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    -- 상품 번호
    `product_id` BIGINT not null,
    -- 상품 색상
    `color` text not null,
    -- 상품 사이즈
    `size` BIGINT not null
);
create table accounts_user (
-- 유저
    -- 유저 고유 번호
    `user_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    -- 유저 이름
    `user_name` text not null
);
create table cart_cart_item (
-- 유저 장바구니
    -- 장바구니 이용한 유저 고유번호
    `user_id` BIGINT not null,
    -- 장바구니에 담긴 상품의 옵션 고유 번호
    `product_opt_id` BIGINT not null,
    -- 장바구니에 담을 수량
    `item_quantity` BIGINT DEFAULT 1
);

create table product_question (
-- 유저 질문
    -- 질문 고유 번호
    `question_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    -- 질문이 올라온 상품 번호
    `product_id` BIGINT not NULL,
    -- 질문 내용
    `body` text not NULL,
    -- 질문 한 유저 번호
    `user_id` BIGINT NOT NULL,
    -- 질문 작성 날짜
    `reg_date` DATETIME 
);

create table product_answer (
-- 질문에 대한 답짜
    -- 답변 고유 번호
    `answer_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    -- 질문 번호
    `question_id` BIGINT NOT NULL,
    -- 답변자
    `answer_writer` TEXT NOT NULL,
    -- 답변 내용
    `body` text not NULL,
    -- 답변 작성 날짜
    `reg_date` DATETIME
);

-- 테스트 데이터 생성

-- market 테스트 데이터
insert into markets_market 
    set market_name = "뽀식이네 옷가게";
insert into markets_market 
    set market_name = "삼식이네 옷가게";
insert into markets_market 
    set market_name = "텀블러 신발가게";

-- 상품 테스트 데이터
insert into products_product
    set reg_date = now(),
    name = "더블코트",
    sale_name = "캐시미어 더블코트",
    price = 299000,
    sale_price = 259000,
    hide_status = 1,
    sold_out_status = 1,
    market_id = 1;

insert into products_product
    set reg_date = now(),
    name = "싱글코트",
    sale_name = "기본중에 기본 싱글코트",
    price = 99000,
    sale_price = 59000,
    hide_status = 0,
    sold_out_status = 0,
    market_id = 2;

insert into products_product
    set reg_date = now(),
    name = "나이키 덩크로우 범고래",
    sale_name = "인싸 신발 나이키 덩크로우",
    price = 4500000,
    sale_price = 4400000,
    hide_status = 0,
    sold_out_status = 1,
    market_id = 3;

-- 상품 옵션 테스트 데이터
insert into products_product_opt
    set product_id = 3,
    color = "검은색, 흰색",
    size = 270;

insert into products_product_opt
    set product_id = 1,
    color = "검은색",
    size = 105;

insert into products_product_opt
    set product_id = 2,
    color = "베이지",
    size = 100;

-- 유저 테스트 데이터
insert into accounts_user
    set user_name = "뽀식이 친구";

insert into accounts_user
    set user_name = "인싸";

insert into accounts_user
    set user_name = "패잘알";

insert into cart_cart_item
    set user_id = 1,
    product_opt_id = 3;

insert into cart_cart_item
    set user_id = 2,
    product_opt_id = 1;

insert into cart_cart_item
    set user_id = 3,
    product_opt_id = 2;

INSERT INTO product_question
    set product_id = 3,
    body = "제가 발이 커서 그러는데 275사이즈는 없나요?",
    user_id = 2,
    reg_date = now();

INSERT INTO product_question
    set product_id = 2,
    body = "제 친구가 가게를 하는데 거기보다 저렴하네요 굳 사이즈 하나 더 작은거 없을까요",
    user_id = 1,
    reg_date = now();

INSERT INTO product_question
    set product_id = 1,
    body = "혹시 언제쯤 입고 될까요?",
    user_id = 3,
    reg_date = now();

INSERT INTO product_answer
    set question_id = 1,
    answer_writer = "텀블러 신발가게 사장",
    body = "네 없어용",
    reg_date = now();

INSERT INTO product_answer
    set question_id = 2,
    answer_writer = "삼식이네 옷가게 사장",
    body = "ㅎㅎ 감사합니다 사이즈 작은건 없어요",
    reg_date = now();

INSERT INTO product_answer
    set question_id = 3,
    answer_writer = "뽀식이네 옷가게 직원",
    body = "내일 모레 입고 됩니다.",
    reg_date = now()