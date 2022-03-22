drop database if exists ss;
CREATE SCHEMA `ss` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
use ss;

DROP TABLE IF EXISTS BK_COMMENT;
DROP TABLE IF EXISTS BK_QNA;
DROP TABLE IF EXISTS BK_CART;
DROP TABLE IF EXISTS BK_PRODUCT_COMMENT;
DROP TABLE IF EXISTS BK_ORDER;
DROP TABLE IF EXISTS BK_BOOK;
DROP TABLE IF EXISTS BK_CATEGORY;
DROP TABLE IF EXISTS BK_USER;

CREATE TABLE `BK_USER` (
    `USER_ID` VARCHAR(100) COMMENT '사용자ID',
    `USER_PASSWORD` VARCHAR(100) COMMENT '비밀번호',
    `USER_NAME` VARCHAR(30) COMMENT '이름',
    `USER_CELLPHONE1` VARCHAR(50) COMMENT '전화번호1',
    `USER_CELLPHONE2` VARCHAR(50) COMMENT '전화번호2',
    `USER_CELLPHONE3` VARCHAR(50) COMMENT '전화번호3',
    `USER_ADDR1` VARCHAR(300) COMMENT '주소지',
    `USER_BIRTH` DATE COMMENT '생년월일',
    `USER_SEX` VARCHAR(10) COMMENT '성별',
    `USER_MILEAGE` INT DEFAULT 0 COMMENT '마일리지',
    `USER_EMAIL` VARCHAR(200) COMMENT '이메일',
    `USER_ZIP` VARCHAR(50) COMMENT '우편번호',
    `USER_ADDR2` VARCHAR(300) COMMENT '상세주소'
);
CREATE UNIQUE INDEX `BK_USER_PK` ON `BK_USER` (`USER_ID`);
ALTER TABLE `BK_USER` ADD CONSTRAINT `BK_USER_PK` PRIMARY KEY (`USER_ID`);


CREATE TABLE `BK_CATEGORY` (
    `CATEGORY_ID` INT COMMENT '카테고리ID' PRIMARY KEY AUTO_INCREMENT,
    `CATEGORY_KIND1` VARCHAR(100) COMMENT '대분류',
    `CATEGORY_KIND2` VARCHAR(100) COMMENT '중분류'
);
CREATE UNIQUE INDEX `BK_CATEGORY_PK` ON `BK_CATEGORY` (`CATEGORY_ID`);
-- ALTER TABLE `BK_CATEGORY` ADD CONSTRAINT `BK_CATEGORY_PK` PRIMARY KEY (`CATEGORY_ID`);

CREATE TABLE `BK_BOOK` (
    `BOOK_ID` VARCHAR(200) COMMENT '도서ID' NOT NULL,
    `BOOK_CATEGORY_ID` INT COMMENT '카테고리ID' NOT NULL,
    `BOOK_NAME` VARCHAR(200) COMMENT '도서명' NOT NULL,
    `BOOK_WRITER` VARCHAR(100) COMMENT '저자' NOT NULL,
    `BOOK_STOCK` INT COMMENT '제고' NOT NULL,
    `BOOK_PRICE` INT COMMENT '가격' NOT NULL,
    `BOOK_PUBLISHER` VARCHAR(100) COMMENT '출판사' NOT NULL,
    `BOOK_CONTENTS` VARCHAR(800) COMMENT '책소개' NOT NULL,
    `BOOK_DETAIL_IMAGE` VARCHAR(300) COMMENT '상세이미지' NOT NULL,
    `BOOK_LIST_IMAGE` VARCHAR(300) COMMENT '목록이미지' NOT NULL,
    `BOOK_HITS` INT COMMENT '조회수' NOT NULL,
    `BOOK_DATE` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '출판일' NOT NULL,
    `BOOK_TRANSLATOR` VARCHAR(100) COMMENT '역자' NOT NULL,
    `BOOK_SELLCOUNT` INT COMMENT '판매수'
);
CREATE UNIQUE INDEX `BK_BOOK_PK` ON `BK_BOOK` (`BOOK_ID`);  
ALTER TABLE `BK_BOOK` ADD CONSTRAINT `BK_BOOK_PK` PRIMARY KEY (`BOOK_ID`);
ALTER TABLE `BK_BOOK` ADD CONSTRAINT `BK_BOOK_FK1` FOREIGN KEY (`BOOK_CATEGORY_ID`)
	  REFERENCES `BK_CATEGORY` (`CATEGORY_ID`) ON DELETE CASCADE;

CREATE TABLE `bk_order` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '주문ID',
  `ORDER_BOOK_ID` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '도서ID',
  `ORDER_USER_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '사용자ID',
  `ORDER_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '주문날짜',
  `ORDER_ADDR1` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '배송지',
  `ORDER_CELLPHONE1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '배송지전화번호1',
  `ORDER_CELLPHONE2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '배송지전화번호2',
  `ORDER_CELLPHONE3` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '배송지전화번호3',
  `ORDER_CONSIGNEE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수신인',
  `ORDER_MEMO` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '메모',
  `ORDER_PRICE` int(11) DEFAULT NULL COMMENT '결제금액',
  `ORDER_PAYMENTKIND` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '결제방법',
  `ORDER_STOCK` int(11) DEFAULT NULL COMMENT '수량',
  `ORDER_DISCOUNT` int(11) DEFAULT NULL COMMENT '할인금액',
  `ORDER_DELIVERYCHARGE` int(11) DEFAULT NULL COMMENT '배송비',
  `ORDER_ADDR2` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDER_EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDER_TOTAL_PRICE` int(11) DEFAULT NULL,
  `ORDER_ZIP` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  UNIQUE KEY `BK_ORDER_PK` (`ORDER_ID`),
  KEY `BK_ORDER_FK1` (`ORDER_BOOK_ID`),
  KEY `BK_ORDER_FK2` (`ORDER_USER_ID`),
  CONSTRAINT `BK_ORDER_FK1` FOREIGN KEY (`ORDER_BOOK_ID`) REFERENCES `bk_book` (`BOOK_ID`) ON DELETE CASCADE,
  CONSTRAINT `BK_ORDER_FK2` FOREIGN KEY (`ORDER_USER_ID`) REFERENCES `bk_user` (`USER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#CREATE UNIQUE INDEX `BK_ORDER_PK` ON `BK_ORDER` (`ORDER_ID`);
#ALTER TABLE `BK_ORDER` ADD CONSTRAINT `BK_ORDER_PK` PRIMARY KEY (`ORDER_ID`);

#ALTER TABLE `BK_ORDER` ADD CONSTRAINT `BK_ORDER_FK1` FOREIGN KEY (`ORDER_BOOK_ID`)
#	  REFERENCES `BK_BOOK` (`BOOK_ID`) ON DELETE CASCADE;
#ALTER TABLE `BK_ORDER` ADD CONSTRAINT `BK_ORDER_FK2` FOREIGN KEY (`ORDER_USER_ID`)
#	  REFERENCES `BK_USER` (`USER_ID`) ON DELETE CASCADE;

CREATE TABLE `BK_PRODUCT_COMMENT` (
    `P_COMMENT_ID` INT COMMENT '상품평ID' PRIMARY KEY AUTO_INCREMENT,
    `P_COMMENT_BOOK_ID` VARCHAR(200) COMMENT '도서ID',
    `P_COMMENT_USER_ID` VARCHAR(100) COMMENT '사용자ID',
    `P_COMMENT_LATTER_PART` VARCHAR(500) COMMENT '상품후기',
    `P_COMMENT_POINT` INT COMMENT '별점',
    `P_COMMENT_RECOMMEND` INT COMMENT '추천',
    `P_COMMENT_NONRECOMMEND` INT COMMENT '비추천',
    `P_COMMENT_REGISTRATION_DATE` DATE COMMENT '상품평 생성일'
);
CREATE UNIQUE INDEX `BK_PRODUCT_COMMENT_PK` ON `BK_PRODUCT_COMMENT` (`P_COMMENT_ID`);
-- ALTER TABLE `BK_PRODUCT_COMMENT` ADD CONSTRAINT `BK_PRODUCT_COMMENT_PK` PRIMARY KEY (`P_COMMENT_ID`);
ALTER TABLE `BK_PRODUCT_COMMENT` ADD CONSTRAINT `BK_PRODUCT_COMMENT_FK1` FOREIGN KEY (`P_COMMENT_BOOK_ID`)
	  REFERENCES `BK_BOOK` (`BOOK_ID`) ON DELETE CASCADE;
ALTER TABLE `BK_PRODUCT_COMMENT` ADD CONSTRAINT `BK_PRODUCT_COMMENT_FK2` FOREIGN KEY (`P_COMMENT_USER_ID`)
	  REFERENCES `BK_USER` (`USER_ID`) ON DELETE CASCADE;
      
      
CREATE TABLE `BK_CART` (
    `CART_USER_ID` VARCHAR(100) COMMENT '사용자ID',
    `CART_BOOK_ID` VARCHAR(200) COMMENT '도서ID',
    `CART_STOCK` INT COMMENT '수량',
    `CART_CREATE_DATE` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '생성일'
);
CREATE UNIQUE INDEX `BK_CART_PK` ON `BK_CART` (`CART_USER_ID`, `CART_BOOK_ID`) ;
ALTER TABLE `BK_CART` ADD CONSTRAINT `BK_CART_PK` PRIMARY KEY (`CART_USER_ID`, `CART_BOOK_ID`);
ALTER TABLE `BK_CART` ADD CONSTRAINT `BK_CART_FK1` FOREIGN KEY (`CART_USER_ID`)
	  REFERENCES `BK_USER` (`USER_ID`) ON DELETE CASCADE;
ALTER TABLE `BK_CART` ADD CONSTRAINT `BK_CART_FK2` FOREIGN KEY (`CART_BOOK_ID`)
	  REFERENCES `BK_BOOK` (`BOOK_ID`) ON DELETE CASCADE;


CREATE TABLE `BK_QNA` (
    `QNA_ID` INT auto_increment primary key COMMENT 'QnAID',
    `QNA_USER_ID` VARCHAR(100) COMMENT '사용자ID',
    `QNA_BOOK_ID` VARCHAR(200) COMMENT '도서ID',
    `QNA_TITLE` VARCHAR(200) COMMENT '제목',
    `QNA_CONTENTS` VARCHAR(800) COMMENT '내용',
    `QNA_REGISTRATION_DATE` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '등록일'
);
CREATE UNIQUE INDEX `BK_QNA_PK` ON `BK_QNA` (`QNA_ID`);
#ALTER TABLE `BK_QNA` ADD CONSTRAINT `BK_QNA_PK` PRIMARY KEY (`QNA_ID`);
 
ALTER TABLE `BK_QNA` ADD CONSTRAINT `BK_QNA_FK1` FOREIGN KEY (`QNA_USER_ID`)
	  REFERENCES `BK_USER` (`USER_ID`) ON DELETE CASCADE;
ALTER TABLE `BK_QNA` ADD CONSTRAINT `BK_QNA_FK2` FOREIGN KEY (`QNA_BOOK_ID`)
	  REFERENCES `BK_BOOK` (`BOOK_ID`) ON DELETE CASCADE;

CREATE TABLE `BK_COMMENT` (
    `COMMENT_ID` int COMMENT '댓글ID',
    `COMMENT_QNA_ID` int COMMENT 'QnAID',
    `COMMENT_USER_ID` VARCHAR(100) COMMENT '사용자ID',
    `COMMENT_CONTENTS` VARCHAR(300) COMMENT '내용',
    `COMMENT_REGISTRATION_DATE` DATETIME COMMENT '등록일'
);
CREATE UNIQUE INDEX `BK_COMMENT_PK` ON `BK_COMMENT` (`COMMENT_ID`);
ALTER TABLE `BK_COMMENT` ADD CONSTRAINT `BK_COMMENT_PK` PRIMARY KEY (`COMMENT_ID`);
ALTER TABLE `BK_COMMENT` ADD CONSTRAINT `BK_COMMENT_FK1` FOREIGN KEY (`COMMENT_QNA_ID`)
	  REFERENCES `BK_QNA` (`QNA_ID`) ON DELETE CASCADE;
ALTER TABLE `BK_COMMENT` ADD CONSTRAINT `BK_COMMENT_FK2` FOREIGN KEY (`COMMENT_USER_ID`)
	  REFERENCES `BK_USER` (`USER_ID`) ON DELETE CASCADE;
      
CREATE TABLE `bk_order_goods` (
  `ORDER_ID` int(11) DEFAULT NULL,
  `ORDER_GOODS_SEQ` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_GOODS_ID` int(11) DEFAULT NULL,
  `ORDER_GOODS_STOCK` int(11) DEFAULT NULL,
  `ORDER_GOODS_PRICE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ORDER_GOODS_SEQ`),
  KEY `BK_ORDER_GOODS_FK1_idx` (`ORDER_ID`),
  KEY `BK_ORDER_GOODS_FK2_idx` (`ORDER_GOODS_ID`),
  CONSTRAINT `BK_ORDER_GOODS_FK1` FOREIGN KEY (`ORDER_ID`) REFERENCES `bk_order` (`ORDER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
