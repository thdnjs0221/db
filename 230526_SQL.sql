
--SET TERMOUT OFF
SET ECHO OFF


DROP TABLE cart;
DROP TABLE member;
DROP TABLE buyprod;
DROP TABLE prod;
DROP TABLE buyer;
DROP TABLE lprod;

SELECT*FROM CART;
SELECT*FROM member;
SELECT*FROM buyprod;
SELECT*FROM prod;
SELECT*FROM buyer;
SELECT*FROM lprod;



-- 객체이름 30자 이내, 무조건 알파벳시작, 알파벳, 숫자, _,$ 
-- 객체이름은 무조건 대문자로 저장됨. 
CREATE TABLE lprod
(
  lprod_id  NUMBER(7)   NOT NULL,
  lprod_gu  CHAR(4)     NOT NULL,
  lprod_nm  VARCHAR2(40) NOT NULL,
  CONSTRAINT pk_lprod PRIMARY KEY (lprod_gu)
);


INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(1,'P101','컴퓨터제품');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(2,'P102','전자제품');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(3,'P201','여성캐주얼');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(4,'P202','남성캐주얼');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(5,'P301','피혁잡화');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(6,'P302','화장품');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(7,'P401','음반/CD');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(8,'P402','도서');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(9,'P403','문구류');



-- DROP TABLE buyer
 
CREATE TABLE buyer
(  buyer_id           CHAR(6)       NOT NULL,   --거래처코드 
   buyer_name         VARCHAR2(50)  NOT NULL,   --거래처명
   buyer_lgu          CHAR(4)       NOT NULL,   --취급상품대분류
   buyer_bank         VARCHAR2(40),            --은행
   buyer_bankno       VARCHAR2(40),             --계좌번호
   buyer_bankname     VARCHAR2(15),             --예금주
   buyer_zip          CHAR(7),                  --우편번호
   buyer_add1         VARCHAR2(100),             --주소1
   buyer_add2         VARCHAR2(80),             --주소2
   buyer_comtel       VARCHAR2(14)  NOT NULL,   --전화번호 
   buyer_fax          VARCHAR2(20)  NOT NULL    --fax번호 
);

 ALTER TABLE buyer add ( buyer_mail VARCHAR2(40) NOT NULL,
                         buyer_charger VARCHAR2(10),
                              buyer_telext VARCHAR2(2));


 ALTER TABLE buyer
   modify( buyer_name VARCHAR2(40));
 
 ALTER TABLE buyer
   add ( CONSTRAINT pk_buyer PRIMARY KEY(buyer_id),
           CONSTRAINT fr_buyer_lgu  foreign key(buyer_lgu) 
                               references lprod(lprod_gu) ); 

 
--INSERT INTO buyer (buyer_id, buyer_name, buyer_lgu, buyer_bank, 
--                   buyer_bankno, buyer_bankname, buyer_zip,
--                   buyer_add1, buyer_add2, buyer_comtel, buyer_fax,
--                   buyer_mail, buyer_charger)


INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P10101','삼성컴퓨터','P101','주택은행','123-456-7890','이건상','135-972','서울 강남구 도곡2동현대비젼21','1125호','02-522-7890','02-522-7891','samcom@samsung.co.kr','송동구');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)  
  VALUES ('P10102','삼보컴퓨터','P101','제일은행','732-702-195670','김현우','142-726','서울 강북구 미아6동 행전빌딩','2712호','02-632-5690','02-632-5699','sambo@sambo.co.kr','김서구');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P10103','현주컴퓨터','P101','국민은행','112-650-397811','심현주','404-260','인천 서구 마전동','157-899번지','032-233-7832','032-233-7833','hyunju@hyunju.com','강남구') ;
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P10201','대우전자','P102','농협','222-333-567890','강대우','702-864','대구 북구 태전동','232번지','053-780-2356','053-780-2357','daewoo@daewoo.co.kr','성대우') ;
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P10202','삼성전자','P102','외환은행','989-323-567898','박삼성','614-728','부산 부산진구 부전1동 동아빌딩','1708호','051-567-5312','051-567-5313','samsung@samsung.com','김인우');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger) 
  VALUES ('P20101','대현','P201','국민은행','688-323-567898','신대현','306-785','대전 대덕구 오정동 운암빌딩','508호','042-332-5123','042-332-5125','daehyun@daehyun.com','진대영');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger) 
  VALUES ('P20102','마르죠','P201','주택은행','123-777-7890','이마루','135-972','서울 강남구 도곡2동 현대비젼21','1211호','02-533-7890','02-533-5699','mar@marjo.co.kr','조현상')  ;
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P20201','LG패션','P202','제일은행','732-702-556677','김애지','142-726','서울 강북구 미아6동 행전빌딩','5011호','02-332-5690','02-332-5699','lgfashion.co.kr','남지수');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger) 
  VALUES ('P20202','캠브리지','P202','국민은행','112-888-397811','안불이주','404-260','인천 서구 마전동','535-899번지','032-255-7832','032-255-7833','cambrige@cambrige.com','신일수');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger) 
  VALUES ('P30101','가파치','P301','농협','211-333-511890','김선아','702-864','대구 북구 태전동','555-66호','053-535-2356','053-535-2357','gapachi@gapachi.co.kr','이수나')  ;
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
   VALUES ('P30201','한국화장품','P302','외환은행','333-355-568898','박한국','614-728','부산 부산진구 부전1동 동아빌딩','309호','051-212-5312','051-212-5313','hangook@hangook.com','김사우');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P30202','피리어스','P302','국민은행','677-888-569998','신상우','306-785','대전대덕구 오정동 운암빌딩','612호','042-222-5123','042-222-5125','pieoris@pieoris.com','이진영');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P30203','참존','P302','주택은행','555-777-567778','오참존','306-785','대전대덕구 오정동 운암빌딩','1007호','042-622-5123','042-622-5125','chamjon@chamjon.com','성애란');


CREATE TABLE  prod
(  prod_id             VARCHAR2(10)     NOT NULL,     -- 상품코드
   prod_name           VARCHAR2(40)     NOT NULL,     -- 상품명
   prod_lgu            CHAR(4 )         NOT NULL,     -- 상품분류
   prod_buyer          CHAR(6)          NOT NULL,     -- 공급업체(코드)
   prod_cost           NUMBER(10)       NOT NULL,     -- 매입가
   prod_price          NUMBER(10)       NOT NULL,     -- 소비자가
   prod_sale           NUMBER(10)       NOT NULL,     -- 판매가
   prod_outline        VARCHAR2(100)     NOT NULL,     -- 상품개략설명
   prod_detail         CLOB,                          -- 상품상세설명
   prod_img            VARCHAR2(40)     NOT NULL,     -- 이미지(소)
   prod_totalstock     NUMBER(10)       NOT NULL,     -- 재고수량
   prod_insdate        DATE,                          -- 신규일자(등록일)
   prod_properstock    NUMBER(10)       NOT NULL,     -- 안전재고수량
   prod_size           VARCHAR2(20),                  -- 크기
   prod_color          VARCHAR2(20),                  -- 색상
   prod_delivery       VARCHAR2(255),                 -- 배달특기사항
   prod_unit           VARCHAR2(6),                   -- 단위(수량)
   prod_qtyin          NUMBER(10),                    -- 총입고수량
   prod_qtysale        NUMBER(10),                    -- 총판매수량
   prod_mileage        NUMBER(10),                    -- 개당 마일리지 점수
   CONSTRAINT pk_prod_id PRIMARY KEY (prod_id),
   CONSTRAINT fr_prod_lgu FOREIGN KEY (prod_lgu) REFERENCES lprod(lprod_gu),
   CONSTRAINT fr_prod_buyer FOREIGN KEY (prod_buyer) REFERENCES buyer(buyer_id)  
);

Insert into PROD values ('P101000001','모니터 삼성전자15인치칼라','P101','P10101',210000,290000,230000,'평면모니터의 기적',null,'P101000001.gif',0,to_date('2020/01/10','YYYY/MM/DD'),33,'15인치',null,'파손 주의','EA',0,0,null);
Insert into PROD values ('P101000002','모니터 삼성전자17인치칼라','P101','P10101',310000,390000,330000,'평면모니터의 기적',null,'P101000002.gif',0,to_date('2020/01/10','YYYY/MM/DD'),23,'17인치',null,'파손 주의','EA',0,0,null);
Insert into PROD values ('P101000003','모니터 삼성전자19인치칼라','P101','P10101',410000,490000,430000,'평면모니터의 기적',null,'P101000003.gif',0,to_date('2020/01/10','YYYY/MM/DD'),15,'19인치',null,'파손 주의','EA',0,0,null);
Insert into PROD values ('P101000004','삼보컴퓨터 P-III 600Mhz','P101','P10102',1150000,1780000,1330000,'쉬운 인터넷을.....',null,'P101000004.gif',0,to_date('2020/02/08','YYYY/MM/DD'),22,null,null,'파손 주의','EA',0,0,null);
Insert into PROD values ('P101000005','삼보컴퓨터 P-III 700Mhz','P101','P10102',2150000,2780000,2330000,'쉬운 인터넷을.....',null,'P101000005.gif',0,to_date('2020/02/08','YYYY/MM/DD'),31,null,null,'파손 주의','EA',0,0,null);
Insert into PROD values ('P101000006','삼보컴퓨터 P-III 800Mhz','P101','P10102',3150000,3780000,3330000,'쉬운 인터넷을.....',null,'P101000006.gif',0,to_date('2020/02/08','YYYY/MM/DD'),17,null,null,'파손 주의','EA',0,0,null);
Insert into PROD values ('P102000001','대우 칼라 TV 25인치','P102','P10201',690000,820000,720000,'집안에 영화관을.....',null,'P102000001.gif',0,to_date('2020/02/22','YYYY/MM/DD'),53,'25인치','흑색','파손 주의','EA',0,0,null);
Insert into PROD values ('P102000002','대우 칼라 TV 29인치','P102','P10201',890000,1020000,920000,'집안에 영화관을.....',null,'P102000002.gif',0,to_date('2020/02/22','YYYY/MM/DD'),21,'29인치','흑색','파손 주의','EA',0,0,null);
Insert into PROD values ('P102000003','삼성 칼라 TV 21인치','P102','P10202',590000,720000,620000,'집안에 영화관을.....',null,'P102000003.gif',0,to_date('2020/01/22','YYYY/MM/DD'),11,'21인치','은색','파손 주의','EA',0,0,null);
Insert into PROD values ('P102000004','삼성 칼라 TV 29인치','P102','P10202',990000,1120000,1020000,'집안에 영화관을.....',null,'P102000004.gif',0,to_date('2020/01/22','YYYY/MM/DD'),19,'29인치','은색','파손 주의','EA',0,0,null);
Insert into PROD values ('P102000005','삼성 칼라 TV 53인치','P102','P10202',1990000,2120000,2020000,'집안에 영화관을.....',null,'P102000005.gif',0,to_date('2020/01/22','YYYY/MM/DD'),8,'53인치','은색','파손 주의','EA',0,0,null);
Insert into PROD values ('P102000006','삼성 캠코더','P102','P10202',660000,880000,770000,'가족과 영화촬영을.....',null,'P102000006.gif',0,to_date('2020/02/23','YYYY/MM/DD'),17,null,null,'파손 주의','EA',0,0,null);
Insert into PROD values ('P102000007','대우 VTR 6헤드','P102','P10201',550000,760000,610000,'선명한 화질',null,'P102000007.gif',0,to_date('2020/01/23','YYYY/MM/DD'),36,null,null,'파손 주의','EA',0,0,null);
Insert into PROD values ('P201000001','여성 봄 셔츠 1','P201','P20101',21000,42000,27000,'파릇한 봄을 위한',null,'P201000001.gif',0,to_date('2020/01/09','YYYY/MM/DD'),9,'s','청색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000002','여성 봄 셔츠 2','P201','P20101',22000,43000,28000,'파릇한 봄을 위한',null,'P201000002.gif',0,to_date('2020/01/09','YYYY/MM/DD'),9,'M','흰색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000003','여성 봄 셔츠 3','P201','P20101',23000,44000,29000,'파릇한 봄을 위한',null,'P201000003.gif',0,to_date('2020/01/09','YYYY/MM/DD'),9,'L','감색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000004','여성 여름 셔츠 1','P201','P20101',12000,21000,25000,'시원한 여름을 위한',null,'P201000004.gif',0,to_date('2020/01/11','YYYY/MM/DD'),9,'s','청색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000005','여성 여름 셔츠 2','P201','P20101',13000,22000,26000,'시원한 여름을 위한',null,'P201000005.gif',0,to_date('2020/01/11','YYYY/MM/DD'),9,'M','흰색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000006','여성 여름 셔츠 3','P201','P20101',14000,23000,27000,'시원한 여름을 위한',null,'P201000006.gif',0,to_date('2020/01/11','YYYY/MM/DD'),9,'L','감색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000007','여성 겨울 라운드 셔츠 1','P201','P20101',31000,45000,33000,'따뜻한 겨울을 위한',null,'P201000007.gif',0,to_date('2020/01/25','YYYY/MM/DD'),9,'s','청색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000008','여성 겨울 라운드 셔츠 2','P201','P20101',32000,46000,34000,'따뜻한 겨울을 위한',null,'P201000008.gif',0,to_date('2020/01/25','YYYY/MM/DD'),9,'M','흰색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000009','여성 겨울 라운드 셔츠 3','P201','P20101',33000,47000,35000,'따뜻한 겨울을 위한',null,'P201000009.gif',0,to_date('2020/01/25','YYYY/MM/DD'),9,'L','감색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000010','여성 청바지 1','P201','P20102',55000,66000,57000,'편리한 활동파를 위한',null,'P201000010.gif',0,to_date('2020/01/31','YYYY/MM/DD'),38,'30',null,'세탁 주의','EA',0,0,null);
INSERT INTO prod values ('P201000011','여성 청바지 2','P201','P20102',56000,67000,58000,'편리한 활동파를 위한',null,'P201000011.gif',0,to_date('2020/01/31','YYYY/MM/DD'),35,'32','','세탁 주의','EA',0,0,null) ;
Insert into PROD values ('P201000012','여성 청바지 3','P201','P20102',57000,68000,59000,'편리한 활동파를 위한',null,'P201000012.gif',0,to_date('2020/01/31','YYYY/MM/DD'),33,'34',null,'세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000013','여성 봄 자켓 1','P201','P20101',110000,210000,170000,'편리한 활동파의 봄을 위한',null,'P201000013.gif',0,to_date('2020/02/18','YYYY/MM/DD'),16,'66','청색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000014','여성 봄 자켓 2','P201','P20101',120000,220000,180000,'편리한 활동파의 봄을 위한',null,'P201000014.gif',0,to_date('2020/02/18','YYYY/MM/DD'),18,'77','흰색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000015','여성 봄 자켓 3','P201','P20101',130000,230000,190000,'편리한 활동파의 봄을 위한',null,'P201000015.gif',0,to_date('2020/02/18','YYYY/MM/DD'),17,'88','감색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000016','여성 여름 자켓 1','P201','P20102',100000,160000,130000,'편리한 활동파의 여름을 위한',null,'P201000016.gif',0,to_date('2020/02/21','YYYY/MM/DD'),12,'66','청색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000017','여성 여름 자켓 2','P201','P20102',110000,170000,140000,'편리한 활동파의 여름을 위한',null,'P201000017.gif',0,to_date('2020/02/21','YYYY/MM/DD'),21,'77','흰색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000018','여성 여름 자켓 3','P201','P20102',120000,180000,150000,'편리한 활동파의 여름을 위한',null,'P201000018.gif',0,to_date('2020/02/21','YYYY/MM/DD'),11,'77','감색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000019','여성 겨울 자켓 1','P201','P20102',210000,270000,240000,'편리한 활동파의 따뜻한 겨울을 위한',null,'P201000019.gif',0,to_date('2020/02/29','YYYY/MM/DD'),22,'66','청색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000020','여성 겨울 자켓 2','P201','P20102',220000,280000,250000,'편리한 활동파의 따뜻한 겨울을 위한',null,'P201000020.gif',0,to_date('2020/02/29','YYYY/MM/DD'),29,'77','흰색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P201000021','여성 겨울 자켓 3','P201','P20102',230000,290000,260000,'편리한 활동파의 따뜻한 겨울을 위한',null,'P201000021.gif',0,to_date('2020/02/29','YYYY/MM/DD'),19,'88','감색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000001','남성 봄 셔츠 1','P202','P20201',10000,19000,15000,'파릇한 봄을 위한',null,'P202000001.gif',0,to_date('2020/01/05','YYYY/MM/DD'),9,'M','청색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000002','남성 봄 셔츠 2','P202','P20201',13000,22000,18000,'파릇한 봄을 위한',null,'P202000002.gif',0,to_date('2020/01/05','YYYY/MM/DD'),9,'L','흰색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000003','남성 봄 셔츠 3','P202','P20201',15000,24000,20000,'파릇한 봄을 위한',null,'P202000003.gif',0,to_date('2020/01/05','YYYY/MM/DD'),9,'XL','감색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000004','남성 여름 셔츠 1','P202','P20201',18000,28000,23000,'시원한 여름을 위한',null,'P202000004.gif',0,to_date('2020/02/05','YYYY/MM/DD'),9,'M','청색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000005','남성 여름 셔츠 2','P202','P20201',23000,33000,28000,'시원한 여름을 위한',null,'P202000005.gif',0,to_date('2020/02/05','YYYY/MM/DD'),9,'L','흰색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000006','남성 여름 셔츠 3','P202','P20201',28000,38000,33000,'시원한 여름을 위한',null,'P202000006.gif',0,to_date('2020/02/05','YYYY/MM/DD'),9,'XL','감색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000007','남성 겨울 라운드 셔츠 1','P202','P20201',25000,42000,31000,'따뜻한 겨울을 위한',null,'P202000007.gif',0,to_date('2020/01/13','YYYY/MM/DD'),9,'M','청색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000008','남성 겨울 라운드 셔츠 2','P202','P20201',27000,43000,33000,'따뜻한 겨울을 위한',null,'P202000008.gif',0,to_date('2020/01/13','YYYY/MM/DD'),9,'L','흰색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000009','남성 겨울 라운드 셔츠 3','P202','P20201',28500,44000,35000,'따뜻한 겨울을 위한',null,'P202000009.gif',0,to_date('2020/01/13','YYYY/MM/DD'),9,'XL','감색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000010','남성 청바지 1','P202','P20202',55000,66000,58000,'편리한 활동파를 위한',null,'P202000010.gif',0,to_date('2020/01/16','YYYY/MM/DD'),38,'30',null,'세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000011','남성 청바지 2','P202','P20202',55000,66000,58000,'편리한 활동파를 위한',null,'P202000011.gif',0,to_date('2020/01/16','YYYY/MM/DD'),35,'32',null,'세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000012','남성 청바지 3','P202','P20202',55000,66000,58000,'편리한 활동파를 위한',null,'P202000012.gif',0,to_date('2020/01/16','YYYY/MM/DD'),33,'34',null,'세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000013','남성 봄 자켓 1','P202','P20201',110000,230000,150000,'편리한 활동파의 봄을 위한',null,'P202000013.gif',0,to_date('2020/02/17','YYYY/MM/DD'),16,'M','청색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000014','남성 봄 자켓 2','P202','P20201',120000,230000,160000,'편리한 활동파의 봄을 위한',null,'P202000014.gif',0,to_date('2020/02/17','YYYY/MM/DD'),18,'L','흰색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000015','남성 봄 자켓 3','P202','P20201',130000,230000,170000,'편리한 활동파의 봄을 위한',null,'P202000015.gif',0,to_date('2020/02/17','YYYY/MM/DD'),17,'XL','감색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000016','남성 여름 자켓 1','P202','P20202',99000,160000,130000,'편리한 활동파의 여름을 위한',null,'P202000016.gif',0,to_date('2020/02/06','YYYY/MM/DD'),12,'M','청색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000017','남성 여름 자켓 2','P202','P20202',109000,170000,150000,'편리한 활동파의 여름을 위한',null,'P202000017.gif',0,to_date('2020/02/06','YYYY/MM/DD'),21,'L','흰색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000018','남성 여름 자켓 3','P202','P20202',159000,190000,170000,'편리한 활동파의 여름을 위한',null,'P202000018.gif',0,to_date('2020/02/06','YYYY/MM/DD'),11,'XL','감색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000019','남성 겨울 자켓 1','P202','P20202',210000,370000,280000,'편리한 활동파의 따뜻한 겨울을 위한',null,'P202000019.gif',0,to_date('2020/02/20','YYYY/MM/DD'),22,'M','청색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000020','남성 겨울 자켓 2','P202','P20202',220000,370000,290000,'편리한 활동파의 따뜻한 겨울을 위한',null,'P202000020.gif',0,to_date('2020/02/20','YYYY/MM/DD'),29,'L','흰색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P202000021','남성 겨울 자켓 3','P202','P20202',230000,370000,300000,'편리한 활동파의 따뜻한 겨울을 위한',null,'P202000021.gif',0,to_date('2020/02/20','YYYY/MM/DD'),19,'XL','감색','세탁 주의','EA',0,0,null);
Insert into PROD values ('P301000001','악어 가죽 혁대','P301','P30101',21000,41000,33000,'멋진 혁대를 선물로.....',null,'P301000001.gif',0,to_date('2020/01/15','YYYY/MM/DD'),32,null,null,null,'EA',0,0,null);
Insert into PROD values ('P301000002','물소 가죽 장지갑','P301','P30101',17000,37000,29000,'멋진 지갑을 선물로.....',null,'P301000002.gif',0,to_date('2020/01/15','YYYY/MM/DD'),52,null,null,null,'EA',0,0,null);
Insert into PROD values ('P301000003','여성용 손지갑','P301','P30101',22000,33000,26000,'멋진 지갑을 선물로.....',null,'P301000003.gif',0,to_date('2020/02/15','YYYY/MM/DD'),22,null,null,null,'EA',0,0,null);
Insert into PROD values ('P301000004','여성용 캐쥬얼 벨트','P301','P30101',27000,37000,29000,'멋진 벨트를 선물로.....',null,'P301000004.gif',0,to_date('2020/02/15','YYYY/MM/DD'),21,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000001','향수 NO 5','P302','P30201',89000,110000,93000,'향기를 동반한.....',null,'P302000001.gif',0,to_date('2020/01/24','YYYY/MM/DD'),11,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000002','샤넬 NO 7','P302','P30201',99000,120000,103000,'향기를 동반한.....',null,'P302000002.gif',0,to_date('2020/01/24','YYYY/MM/DD'),17,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000003','남성용 스킨','P302','P30201',19000,32000,21000,'세안후 바르는.....',null,'P302000003.gif',0,to_date('2020/01/24','YYYY/MM/DD'),21,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000004','남성용 로숀','P302','P30201',21000,33000,23000,'세안후 바르는.....',null,'P302000004.gif',0,to_date('2020/02/12','YYYY/MM/DD'),19,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000005','여성용 스킨','P302','P30201',18000,31000,20000,'세안후 바르는.....',null,'P302000005.gif',0,to_date('2020/02/12','YYYY/MM/DD'),21,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000006','여성용 로숀','P302','P30201',20000,32000,22000,'세안후 바르는.....',null,'P302000006.gif',0,to_date('2020/02/12','YYYY/MM/DD'),19,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000011','남성 향수','P302','P30202',59000,70000,63000,'좋은 향기를 동반한.....',null,'P302000011.gif',0,to_date('2020/01/13','YYYY/MM/DD'),21,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000012','여성 향수','P302','P30202',89000,110000,93000,'좋은향기를 동반한.....',null,'P302000012.gif',0,to_date('2020/01/13','YYYY/MM/DD'),27,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000013','립스틱','P302','P30202',17000,27000,23000,'세안후 바르는 좋은.....',null,'P302000013.gif',0,to_date('2020/01/13','YYYY/MM/DD'),11,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000014','면도크림','P302','P30202',25000,32000,26000,'세안후 바르는 좋은.....',null,'P302000014.gif',0,to_date('2020/01/14','YYYY/MM/DD'),29,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000015','화운데이션','P302','P30202',22000,32000,23000,'세안후 바르는 좋은.....',null,'P302000015.gif',0,to_date('2020/01/14','YYYY/MM/DD'),15,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000016','머드팩','P302','P30202',120000,220000,172000,'세안후 바르는 좋은.....',null,'P302000016.gif',0,to_date('2020/01/14','YYYY/MM/DD'),32,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000021','참존 기초화장품','P302','P30203',23500,37500,26000,'피부를 산뜻하게.....',null,'P302000021.gif',0,to_date('2020/01/28','YYYY/MM/DD'),25,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000022','참존 여성 향수','P302','P30203',78500,98500,83000,'좋은향기와 피부를 산뜻하게.....',null,'P302000022.gif',0,to_date('2020/01/28','YYYY/MM/DD'),53,null,null,null,'EA',0,0,null);
Insert into PROD values ('P302000023','참존 립스틱','P302','P30203',21500,26500,22500,'좋은 피부를 산뜻하게.....',null,'P302000023.gif',0,to_date('2020/01/28','YYYY/MM/DD'),17,null,null,null,'EA',0,0,null);

CREATE TABLE  buyprod
(  buy_date  DATE           NOT NULL,             -- 입고일자
   buy_prod  VARCHAR2(10)   NOT NULL,             -- 상품코드
   buy_qty   NUMBER(10)     NOT NULL,             -- 매입수량
   buy_cost  NUMBER(10)     NOT NULL,             -- 매입단가
   CONSTRAINT pk_buyprod PRIMARY KEY (buy_date,buy_prod), 
   CONSTRAINT fr_buy_prod FOREIGN KEY (buy_prod) REFERENCES prod(prod_id)
);

Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/08','YYYY/MM/DD'),'P202000001',18,10000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/08','YYYY/MM/DD'),'P202000002',19,13000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/08','YYYY/MM/DD'),'P202000003',11,15000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/12','YYYY/MM/DD'),'P201000001',21,21000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/12','YYYY/MM/DD'),'P201000002',13,22000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/12','YYYY/MM/DD'),'P201000003',15,23000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/13','YYYY/MM/DD'),'P101000001',22,210000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/13','YYYY/MM/DD'),'P101000002',23,310000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/13','YYYY/MM/DD'),'P101000003',21,410000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/14','YYYY/MM/DD'),'P201000004',15,12000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/14','YYYY/MM/DD'),'P201000005',32,13000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/14','YYYY/MM/DD'),'P201000006',11,14000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/16','YYYY/MM/DD'),'P202000007',22,25000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/16','YYYY/MM/DD'),'P202000008',33,27000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/16','YYYY/MM/DD'),'P202000009',14,28500);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/16','YYYY/MM/DD'),'P302000011',125,59000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/16','YYYY/MM/DD'),'P302000012',16,89000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/16','YYYY/MM/DD'),'P302000013',13,17000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/17','YYYY/MM/DD'),'P302000014',21,25000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/17','YYYY/MM/DD'),'P302000015',33,22000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/17','YYYY/MM/DD'),'P302000016',17,120000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/18','YYYY/MM/DD'),'P301000001',15,21000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/18','YYYY/MM/DD'),'P301000002',19,17000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/19','YYYY/MM/DD'),'P202000010',21,55000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/19','YYYY/MM/DD'),'P202000011',91,55000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/19','YYYY/MM/DD'),'P202000012',15,55000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/25','YYYY/MM/DD'),'P102000003',11,590000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/25','YYYY/MM/DD'),'P102000004',13,990000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/25','YYYY/MM/DD'),'P102000005',22,1990000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/26','YYYY/MM/DD'),'P102000007',52,550000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/27','YYYY/MM/DD'),'P302000001',253,89000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/27','YYYY/MM/DD'),'P302000002',31,99000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/27','YYYY/MM/DD'),'P302000003',197,19000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/28','YYYY/MM/DD'),'P201000007',19,31000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/28','YYYY/MM/DD'),'P201000008',22,32000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/28','YYYY/MM/DD'),'P201000009',26,33000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/31','YYYY/MM/DD'),'P302000021',23,23500);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/31','YYYY/MM/DD'),'P302000022',17,78500);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/01/31','YYYY/MM/DD'),'P302000023',15,21500);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/03','YYYY/MM/DD'),'P201000010',23,55000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/03','YYYY/MM/DD'),'P201000011',21,56000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/03','YYYY/MM/DD'),'P201000012',55,57000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/08','YYYY/MM/DD'),'P202000004',12,18000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/08','YYYY/MM/DD'),'P202000005',19,23000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/08','YYYY/MM/DD'),'P202000006',28,28000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/09','YYYY/MM/DD'),'P202000016',22,99000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/09','YYYY/MM/DD'),'P202000017',41,109000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/09','YYYY/MM/DD'),'P202000018',21,159000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/11','YYYY/MM/DD'),'P101000004',11,1150000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/11','YYYY/MM/DD'),'P101000005',10,2150000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/11','YYYY/MM/DD'),'P101000006',9,3150000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/15','YYYY/MM/DD'),'P302000004',33,21000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/15','YYYY/MM/DD'),'P302000005',191,18000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/15','YYYY/MM/DD'),'P302000006',39,20000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/18','YYYY/MM/DD'),'P301000003',46,22000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/18','YYYY/MM/DD'),'P301000004',41,27000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/20','YYYY/MM/DD'),'P202000013',16,110000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/20','YYYY/MM/DD'),'P202000014',18,120000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/20','YYYY/MM/DD'),'P202000015',13,130000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/21','YYYY/MM/DD'),'P201000013',16,110000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/21','YYYY/MM/DD'),'P201000014',28,120000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/21','YYYY/MM/DD'),'P201000015',25,130000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/23','YYYY/MM/DD'),'P202000019',22,210000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/23','YYYY/MM/DD'),'P202000020',19,220000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/23','YYYY/MM/DD'),'P202000021',13,230000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/25','YYYY/MM/DD'),'P102000001',15,690000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/25','YYYY/MM/DD'),'P102000002',12,890000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/02/26','YYYY/MM/DD'),'P102000006',13,660000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/03/02','YYYY/MM/DD'),'P201000016',725,100000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/03/02','YYYY/MM/DD'),'P201000017',341,110000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/03/02','YYYY/MM/DD'),'P201000018',111,120000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/03/03','YYYY/MM/DD'),'P201000019',16,210000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/03/03','YYYY/MM/DD'),'P201000020',39,220000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/03/03','YYYY/MM/DD'),'P201000021',32,230000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/16','YYYY/MM/DD'),'P202000001',12,10000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/16','YYYY/MM/DD'),'P202000002',13,13000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/16','YYYY/MM/DD'),'P202000003',5,15000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/20','YYYY/MM/DD'),'P201000001',15,21000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/20','YYYY/MM/DD'),'P201000002',7,22000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/20','YYYY/MM/DD'),'P201000003',9,23000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/21','YYYY/MM/DD'),'P101000001',16,210000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/21','YYYY/MM/DD'),'P101000002',17,310000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/21','YYYY/MM/DD'),'P101000003',15,410000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/22','YYYY/MM/DD'),'P201000004',9,12000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/22','YYYY/MM/DD'),'P201000005',26,13000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/22','YYYY/MM/DD'),'P201000006',5,14000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/24','YYYY/MM/DD'),'P202000007',16,25000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/24','YYYY/MM/DD'),'P202000008',27,27000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/24','YYYY/MM/DD'),'P202000009',8,28500);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/24','YYYY/MM/DD'),'P302000011',19,59000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/24','YYYY/MM/DD'),'P302000012',10,89000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/24','YYYY/MM/DD'),'P302000013',7,17000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/25','YYYY/MM/DD'),'P302000014',15,25000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/25','YYYY/MM/DD'),'P302000015',27,22000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/25','YYYY/MM/DD'),'P302000016',11,120000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/26','YYYY/MM/DD'),'P301000001',9,21000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/26','YYYY/MM/DD'),'P301000002',13,17000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/27','YYYY/MM/DD'),'P202000010',15,55000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/27','YYYY/MM/DD'),'P202000011',25,55000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/04/27','YYYY/MM/DD'),'P202000012',9,55000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/03','YYYY/MM/DD'),'P102000003',5,590000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/03','YYYY/MM/DD'),'P102000004',7,990000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/03','YYYY/MM/DD'),'P102000005',16,1990000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/04','YYYY/MM/DD'),'P102000007',46,550000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/05','YYYY/MM/DD'),'P302000001',17,89000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/05','YYYY/MM/DD'),'P302000002',25,99000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/05','YYYY/MM/DD'),'P302000003',11,19000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/06','YYYY/MM/DD'),'P201000007',13,31000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/06','YYYY/MM/DD'),'P201000008',16,32000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/06','YYYY/MM/DD'),'P201000009',20,33000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/09','YYYY/MM/DD'),'P302000021',17,23500);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/09','YYYY/MM/DD'),'P302000022',11,78500);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/09','YYYY/MM/DD'),'P302000023',9,21500);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/12','YYYY/MM/DD'),'P201000010',17,55000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/12','YYYY/MM/DD'),'P201000011',15,56000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/12','YYYY/MM/DD'),'P201000012',49,57000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/17','YYYY/MM/DD'),'P202000004',6,18000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/17','YYYY/MM/DD'),'P202000005',13,23000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/17','YYYY/MM/DD'),'P202000006',22,28000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/18','YYYY/MM/DD'),'P202000016',16,99000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/18','YYYY/MM/DD'),'P202000017',35,109000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/18','YYYY/MM/DD'),'P202000018',15,159000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/20','YYYY/MM/DD'),'P101000004',5,1150000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/20','YYYY/MM/DD'),'P101000005',4,2150000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/20','YYYY/MM/DD'),'P101000006',3,3150000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/24','YYYY/MM/DD'),'P302000004',27,21000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/24','YYYY/MM/DD'),'P302000005',25,18000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/24','YYYY/MM/DD'),'P302000006',33,20000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/27','YYYY/MM/DD'),'P301000003',40,22000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/27','YYYY/MM/DD'),'P301000004',35,27000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/29','YYYY/MM/DD'),'P202000013',10,110000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/29','YYYY/MM/DD'),'P202000014',12,120000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/29','YYYY/MM/DD'),'P202000015',7,130000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/30','YYYY/MM/DD'),'P201000013',10,110000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/30','YYYY/MM/DD'),'P201000014',22,120000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/05/30','YYYY/MM/DD'),'P201000015',19,130000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/06/01','YYYY/MM/DD'),'P202000019',16,210000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/06/01','YYYY/MM/DD'),'P202000020',13,220000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/06/01','YYYY/MM/DD'),'P202000021',7,230000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/06/03','YYYY/MM/DD'),'P102000001',9,690000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/06/03','YYYY/MM/DD'),'P102000002',6,890000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/06/04','YYYY/MM/DD'),'P102000006',7,660000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/06/09','YYYY/MM/DD'),'P201000016',19,100000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/06/09','YYYY/MM/DD'),'P201000017',35,110000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/06/09','YYYY/MM/DD'),'P201000018',25,120000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/06/10','YYYY/MM/DD'),'P201000019',10,210000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/06/10','YYYY/MM/DD'),'P201000020',33,220000);
Insert into BUYPROD (BUY_DATE,BUY_PROD,BUY_QTY,BUY_COST) values (to_date('2020/06/10','YYYY/MM/DD'),'P201000021',26,230000);

CREATE TABLE  member
(  mem_id                VARCHAR2(15)   NOT NULL,   -- 회원ID  
   mem_pass              VARCHAR2(15)   NOT NULL,   -- 비밀번호
   mem_name              VARCHAR2(20)   NOT NULL,   -- 성명
   mem_regno1            CHAR(6)        NOT NULL,   -- 주민등록번호앞6자리
   mem_regno2            CHAR(7)        NOT NULL,   -- 주민등록번호뒤7자리
   mem_bir               DATE,                      -- 생일
   mem_zip               CHAR(7)        NOT NULL,   -- 우편번호
   mem_add1              VARCHAR2(100)  NOT NULL,   -- 주소1
   mem_add2              VARCHAR2(80)   NOT NULL,   -- 주소2
   mem_hometel           VARCHAR2(14)   NOT NULL,   -- 집전화번호                                
   mem_comtel            VARCHAR2(14)   NOT NULL,   -- 회사전화번호                              
   mem_hp                VARCHAR2(15),              -- 이동전화
   mem_mail              VARCHAR2(40)   NOT NULL,   -- E-mail주소
   mem_job               VARCHAR2(40),              -- 직업
   mem_like              VARCHAR2(40),              -- 취미
   mem_memorial          VARCHAR2(40),              -- 기념일명
   mem_memorialday       DATE,                      -- 기념일날짜
   mem_mileage           NUMBER(10),                -- 마일리지              
   mem_delete            VARCHAR2(1),               -- 삭제여부
   CONSTRAINT pk_mem_id PRIMARY KEY (mem_id) 
);

Insert into MEMBER values ('a001','asdfasdf','김은대','000315','3406420',to_date('2000/03/15','YYYY/MM/DD'),'135-972','대전시 동구 용운동','222-2번지','042-621-4615','042-621-4615','010-6217-4615','pyoedab@lycos.co.kr','주부','수영','결혼기념일',null,1000,null);
Insert into MEMBER values ('b001','1004','이쁜이','981204','2900000',to_date('1998/12/04','YYYY/MM/DD'),'700-030','서울시 천사동 예쁜마을','1004-29','02-888-9999','02-888-9999','010-8886-9999','engelcd@pretty.net','회사원','수영','아버님생신',null,2300,null);
Insert into MEMBER values ('c001','7777','신용환','980324','1400716',to_date('1998/03/24','YYYY/MM/DD'),'407-817','대전광역시 중구 대흥동','477-9','042-123-5678','042-123-5678','010-1236-5678','kyh01e@hanmail.net','교사','독서','아내생일',null,3500,null);
Insert into MEMBER values ('d001','123joy','성윤미','700609','2000000',to_date('1970/06/09','YYYY/MM/DD'),'501-705','대전시 중구 하늘동 ','땅 3번지','042-222-8877','042-222-8877','010-2228-8877','dbs81f@hanmail.net','공무원','볼링','결혼기념일',null,1700,null);
Insert into MEMBER values ('e001','00000000','이혜나','990701','2406017',to_date('1999/07/01','YYYY/MM/DD'),'617-800','대전시 대덕구 읍내동','혜강아파트','042-432-8901','042-432-8901','010-4329-8901','bosiang@hanmail.net','농업','당구','아버님생신',null,6500,null);
Insert into MEMBER values ('f001','12345678','신영남','000228','3459919',to_date('2000/02/28','YYYY/MM/DD'),'140-706','대전광역시 대흥동','65-33 303호','042-253-2121','042-253-2121','010-2538-2121','SUPER-KHG@HANMAIL.NET','주부','볼링','아내생일',null,2700,null);
Insert into MEMBER values ('g001','1456','송경희','020111','4403414',to_date('2002/01/11','YYYY/MM/DD'),'339-841','충남금산군 제원면','심내리123-1','0412-356-3578','0412-356-3578','010-3565-3578','lim052@hanmail.net','주부','스키','결혼기념일',null,800,null);
Insert into MEMBER values ('h001','9999','라준호','980928','1455822',to_date('1998/09/28','YYYY/MM/DD'),'339-841','충남 논산시 양촌면','산직3구 345','042-522-1679','042-522-1679','010-5229-1679','wingl7@hanmail.net','회사원','독서','아내생일',null,1500,null);
Insert into MEMBER values ('i001','1111','최지현','990220','2384719',to_date('1999/02/20','YYYY/MM/DD'),'306-702','대전시 동구 가양1동','768-12','042-614-6914','042-614-6914','010-6145-6914','pan@orgio.net','공무원','등산','남편생일',null,900,null);
Insert into MEMBER values ('j001','6262','김윤희','991219','2448920',to_date('1999/12/19','YYYY/MM/DD'),'306-702','대전시 서구 삼천동','한신아파트305동309호','042-332-8976','042-332-8976','010-3321-8976','maxsys@hanmail.net','농업','개그','결혼기념일',null,1100,null);
Insert into MEMBER values ('k001','7227','오철희','860323','1449311',to_date('1986/03/23','YYYY/MM/DD'),'306-702','대전시 대덕구 대화동','34-567','042-157-8765','042-157-8765','010-1572-8765','equus@orgio.net','자영업','서예','아내생일',null,3700,null);
Insert into MEMBER values ('l001','12345678','구길동','030214','3234566',to_date('2003/02/14','YYYY/MM/DD'),'339-841','충남금산군 금산읍',' 하리35-322','0412-322-8865','0412-322-8865','010-3223-8865','email815@hanmail.co.kr','자영업','바둑','결혼기념일',null,5300,null);
Insert into MEMBER values ('m001','pass','박지은','990515','2555555',to_date('1999/05/15','YYYY/MM/DD'),'306-702','대전광역시 서구 갈마동','인성아파트 234동 907호','042-252-0675','042-252-0675','010-2521-0675','happy@hanmail.net','은행원','등산','아버님생신',null,1300,null);
Insert into MEMBER values ('n001','1111','탁원재','990523','1011014',to_date('1999/05/23','YYYY/MM/DD'),'306-702','대전시 동구 자양동','32-23','042-632-2176','042-632-2176','010-6322-2176','ping75@unitel.co.kr','축산업','낚시','결혼기념일',null,2700,null);
Insert into MEMBER values ('o001','0909','배인정','021130','4447619',to_date('2002/11/30','YYYY/MM/DD'),'306-702','대전시 서구 갈마동','경성아파트502동1101호','042-622-5971','042-622-5971','010-6221-5971','tar-song@hanmail.net','회사원','등산','어머님생신',null,2600,null);
Insert into MEMBER values ('p001','sahra3','오성순','971005','2458323',to_date('1997/10/05','YYYY/MM/DD'),'306-702','대전유성구송강동','한솔아파트 703동 407호','042-810-7658','042-810-7658','010-8103-7658','sahra235@intz.com','공무원','독서','남편생일',null,2200,null);
Insert into MEMBER values ('q001','0000','육평회','961220','1402722',to_date('1996/12/20','YYYY/MM/DD'),'306-702','대구광역시 대덕구 중리동','678-43','042-823-2359','042-823-2359','010-8232-2359','kph@hanmail.net','자영업','만화','결혼기념일',null,1500,null);
Insert into MEMBER values ('r001','park1005','정은실','010320','4382532',to_date('2001/03/20','YYYY/MM/DD'),'306-702','대전시 동구 용전동','321-25','042-533-8768','042-533-8768','010-5335-8768','econie@hanmail.net','학생','장기','어머님생신',null,700,null);
Insert into MEMBER values ('s001','0819','안은정','011019','4459927',to_date('2001/10/19','YYYY/MM/DD'),'306-702','대구광역시 서구 탄방동','산호아파트 107동 802호','042-222-8155','042-222-8155','010-2228-8155','songej@hanmail.net','공무원','바둑','결혼기념일',null,3200,null);
Insert into MEMBER values ('t001','0506','성원태','000706','3454731',to_date('2000/07/06','YYYY/MM/DD'),'306-702','대전광역시 중구 유천동','한사랑아파트 302동 504호','042-272-8657','042-272-8657','010-2725-8657','bob6@hanmail.net','학생','카레이싱','결혼기념일',null,2200,null);
Insert into MEMBER values ('u001','1000','김성욱','971210','1460111',to_date('1997/12/10','YYYY/MM/DD'),'306-702','대전시 동구 용전동','76-54','042-273-9056','042-273-9056','010-2734-9056','pss576@orgio.net','주부','영화감상','결혼기념일',null,2700,null);
Insert into MEMBER values ('v001','00001111','이진영','760331','2402712',to_date('1976/03/31','YYYY/MM/DD'),'306-702','대전시 동구 용전동','566-39번지','042-240-8766','042-240-8766','010-2406-8766','gagsong@orgio.net','자영업','낚시','남편생일',null,4300,null);
Insert into MEMBER values ('w001','12341234','김형모','880213','1111111',to_date('1988/02/13','YYYY/MM/DD'),'306-702','대전시 대덕구 연축동','23-43','02-345-9877','02-345-9877','010-3452-9877','songone@hanmail.net','학생','등산','결혼기념일',null,2700,null);
Insert into MEMBER values ('x001','0000','진현경','010519','4110222',to_date('2001/05/19','YYYY/MM/DD'),'306-702','대전광역시 동구 오정동','43-26','042-223-8767','042-223-8767','010-2238-8767','happysong@hanmail.net','주부','독서','결혼기념일',null,8700,null);

CREATE TABLE  cart
(
   cart_member      VARCHAR2(15)    NOT NULL,       -- 회원ID
   cart_no          CHAR(13)        NOT NULL,       -- 주문번호
   cart_prod        VARCHAR2(10)    NOT NULL,       -- 상품코드
   cart_qty         NUMBER(8)       NOT NULL,       -- 수량
   CONSTRAINT pk_cart PRIMARY KEY (cart_no,cart_prod),
   CONSTRAINT fr_cart_member FOREIGN KEY (cart_member) REFERENCES member(mem_id),
   CONSTRAINT fr_cart_prod   FOREIGN KEY (cart_prod)   REFERENCES prod(prod_id)
);

COMMENT ON TABLE  CART             IS '장바구니 정보 테이블';
COMMENT ON COLUMN CART.CART_MEMBER IS '회원ID';
COMMENT ON COLUMN CART.CART_NO     IS '주문번호';
COMMENT ON COLUMN CART.CART_PROD   IS '상품코드';
COMMENT ON COLUMN CART.CART_QTY    IS '수량';

--DESC CART;

Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020040100001','P101000001',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020040100001','P201000018',16);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020040100001','P302000003',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('t001','2020040100002','P302000004',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('t001','2020040100002','P101000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020040100003','P201000019',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020040100003','P302000005',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020040100003','P201000020',21);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020040100003','P101000003',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020040500001','P302000006',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020040500001','P101000004',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020040500001','P201000021',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('q001','2020040500002','P302000011',11);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('q001','2020040500002','P202000001',12);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('q001','2020040500002','P101000005',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020040600001','P101000006',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020040600001','P202000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('o001','2020040600002','P302000013',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('o001','2020040600002','P202000003',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('o001','2020040600002','P102000001',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020040800001','P302000014',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020040800001','P102000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020040800001','P202000004',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020040800002','P302000015',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020040800002','P202000005',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020040800002','P102000003',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('l001','2020041000001','P302000016',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('l001','2020041000001','P102000004',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('l001','2020041000001','P202000006',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041000002','P202000007',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041000002','P102000005',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041000002','P302000021',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041200001','P302000022',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041200001','P202000008',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041200001','P102000006',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041200001','P202000009',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020041200002','P102000007',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020041200002','P302000023',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020041200002','P202000010',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041500001','P201000001',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041500001','P302000001',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041500002','P202000011',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041500002','P201000002',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041500002','P302000002',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041600001','P302000003',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041600001','P201000003',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041600001','P202000012',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020041600002','P302000004',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020041600002','P201000004',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020041600002','P202000013',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020041800001','P302000005',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020041800001','P201000005',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020041800001','P202000014',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020041800002','P302000006',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020041800002','P201000006',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020041800002','P202000015',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042000001','P302000011',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042000001','P201000007',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042000001','P202000016',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042000001','P202000017',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042000001','P201000008',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042000002','P202000018',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042000002','P201000009',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042000002','P202000019',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042000002','P201000010',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042000002','P202000020',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('x001','2020042400001','P201000011',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('x001','2020042400001','P202000021',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('x001','2020042400001','P201000012',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020042400002','P301000001',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020042400002','P201000013',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020042400002','P301000002',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020042400002','P201000014',13);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042800001','P301000003',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042800001','P201000015',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042800002','P302000001',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042800002','P201000016',15);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042800002','P302000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042800002','P201000017',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020050100001','P201000013',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020050100001','P301000002',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020050100002','P301000003',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020050100002','P201000014',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020050100002','P201000015',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020050300001','P302000001',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020050300001','P302000002',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020050300002','P201000016',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020050300002','P201000017',21);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020050500001','P302000003',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020050500001','P201000018',11);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020050500001','P302000004',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020050500002','P201000019',12);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020050700001','P302000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020050700001','P101000001',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020050700001','P101000002',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020050700002','P201000020',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020050700002','P302000006',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020050700002','P302000011',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020051000001','P201000021',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020051000001','P101000003',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020051000001','P101000004',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020051000002','P202000001',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020051000002','P302000012',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020051000002','P302000013',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020051000002','P101000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020051000002','P202000002',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020051200001','P101000006',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020051200001','P202000003',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020051200001','P302000014',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020051200001','P302000015',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020051200001','P102000001',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020051300001','P202000004',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020051300001','P102000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020051300001','P202000005',11);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020051300001','P302000016',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020051300001','P302000021',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('i001','2020051500001','P102000003',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('i001','2020051500001','P202000006',12);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020051600001','P102000004',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020051600001','P202000007',17);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020051600001','P302000022',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('k001','2020051600002','P302000023',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('k001','2020051600002','P102000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('k001','2020051600002','P202000008',21);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('k001','2020051600002','P102000006',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('k001','2020051600002','P202000009',13);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('l001','2020051800001','P302000001',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('l001','2020051800001','P302000002',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020051800002','P102000007',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020051800002','P202000010',23);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020051800002','P201000001',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020051800002','P202000011',25);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020051800002','P302000003',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020051800002','P302000004',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('o001','2020052100001','P201000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('o001','2020052100001','P202000012',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('o001','2020052100001','P201000003',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020052100002','P202000013',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020052100002','P302000005',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020052100002','P302000006',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020052100002','P201000004',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020052100002','P202000014',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020052400001','P201000005',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020052400001','P202000015',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020052400001','P302000011',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('s001','2020052500001','P302000012',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('s001','2020052500001','P201000006',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('s001','2020052500001','P202000016',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('t001','2020052500002','P201000007',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('t001','2020052500002','P202000017',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('t001','2020052500002','P201000008',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('t001','2020052500002','P202000018',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('v001','2020052800001','P201000009',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('v001','2020052800001','P202000019',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020052900001','P201000010',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020052900001','P202000020',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020052900001','P201000011',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('x001','2020052900002','P202000021',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('x001','2020052900002','P201000012',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('x001','2020052900002','P301000001',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020060500001','P302000013',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020060500001','P302000014',11);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020060500001','P302000015',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020060600001','P302000016',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020060600001','P302000021',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020060600001','P302000022',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020061200001','P302000023',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020061200001','P302000001',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020061300001','P302000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020061300001','P302000003',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020061300002','P302000004',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020061300002','P302000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020062100001','P302000006',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020062100001','P302000011',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020062100002','P302000012',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020062500001','P302000013',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020062500001','P302000014',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020062500001','P302000015',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020070100001','P201000013',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020070100001','P301000002',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020070100002','P301000003',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020070100002','P201000014',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020070100002','P201000015',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020070300001','P302000001',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020070300001','P302000002',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020070300002','P201000016',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020070300002','P201000017',21);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020070800001','P101000001',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020070800001','P101000002',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020070800002','P101000003',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('h001','2020071100001','P101000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020071100002','P101000006',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('i001','2020071900001','P102000001',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('i001','2020071900001','P102000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('i001','2020071900001','P102000003',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('u001','2020071900002','P102000004',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('u001','2020071900002','P102000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020072800001','P102000006',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020072800001','P102000003',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('q001','2020072800002','P102000004',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('q001','2020072800002','P102000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020072800003','P301000003',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020072800003','P201000015',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020072800004','P302000001',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020072800004','P201000016',15);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020072800004','P302000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020072800004','P201000017',2);

commit;
--drop table ziptb;
create table ziptb (
 zipcode varchar2(7) not null,     --우편번호  7  
 sido  varchar2(6) not null,  --  특별시,광역시,도  4
 gugun  varchar2(30),           -- 시,군,구  17  
 dong   varchar2(40),            --읍,면,동  26  
 ri     varchar2(30),       --  리명  18
 bldg  varchar2(60),        -- 건물명  40 
 bunji varchar2(30),        -- 번지,아파트동,호수  17 
 seq  number(5) not null,        -- 데이터 순서  5
constraint pk_ziptb primary key (seq) 
);


----------------------------------------------------------------------------------------------

DROP TABLE EMP;
DROP TABLE DEPT;
-------------------------


SELECT*FROM EMP;
SELECT*FROM DEPT;





CREATE TABLE EMP
(EMPNO            CHAR(4) NOT NULL ENABLE, 
	ENAME      VARCHAR2(20) NOT NULL ENABLE, 
	JOB        VARCHAR2(30) NOT NULL ENABLE, 
	MGR        VARCHAR2(4), 
	HIREDATE   DATE NOT NULL ENABLE, 
	SAL        NUMBER(10,0) NOT NULL ENABLE, 
	COMM       NUMBER, 
	DEPTNO     CHAR(2) NOT NULL ENABLE,
CONSTRAINT XPK_EMP PRIMARY KEY (EMPNO) );

CREATE TABLE DEPT
(DEPTNO     CHAR(2) NOT NULL ENABLE,
 DNAME      VARCHAR2(20) NOT NULL ENABLE, 
 LOC        VARCHAR2(30) NOT NULL ENABLE,
CONSTRAINT XPK_DEPT PRIMARY KEY (DEPTNO) );

-- 사원관리
SELECT * FROM EMP;

INSERT INTO EMP(EMPNO,  ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7369', '장길동', '프로그래머', '7902', '2013/12/17', 600, 200 , '50');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7499', '고영우', '시장조사', '7698', '2021/02/20', 550, 300 , '20');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7521', '구기현', '영업사원', '7698', '2020/02/22', 250, 400 , '30');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7566', '김동혁', '관리자', '7839', '2012/04/02', 375,NULL, '40');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7654', '김민욱', '영업사원', '7698', '2018/09/28', 350, 700 , '30');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7698', '김민정', '관리자', '7839', '2014/05/01', 450,NULL, '40');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7782', '김지완', '관리자', '7839', '2022/02/20', 470, 600, '40');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7788', '박승우', '분석가', '7839', '2021/03/22', 300,NULL , '50');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7839', '박윤수', '대표이사', NULL, '2010/01/05', 900, 100, '40');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7844', '박정수', '영업사원', '7698', '2016/09/28',340,NULL, '30');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7876', '배문기', '회계업무', '7788', '2014/05/01', 420,NULL, '10');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7900', '변정민', '시장분석', '7698', '2012/04/02', 750,NULL, '20');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7902', '신국현', '분석가', '7566', '2019/09/28', 300,NULL, '50');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7934', '신현근', '프로그래머', '7782', '2018/01/23', 290,400, '50');
INSERT INTO EMP(EMPNO,	 ENAME,	JOB, MGR, HIREDATE, SAL,	COMM,	DEPTNO)
VALUES('7999', '오대환', '회계업무', '7782',SYSDATE, 210,NULL, '10');

SELECT * FROM EMP ORDER BY EMPNO ASC;

-- 부서관리
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('10', '회계부', '서울');
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('20', '조사부', '세종');
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('30', '영업부', '서울');
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('40', '관리부', '대전');
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('50', '개발부', '대전');









<필드 추가 및 데이터 입력하기>

ALTER TABLE EMP ADD (REMARK varchar2(4000));   -- 필드삽입   ALTER테이블수정 REMARK필드 삽입
■ 4000바이트 이상일 때는 CLOB(문자 최대4G 바이트), NCLOB(유니코드) 사용

◆ ABBA DANCING QUEEN 링크
https://blog.naver.com/cipigs2/222622845133

◆ DANCING QUEEN 가사
You can dance, you can jive, having the time of your life
See that girl, watch that scene, dig in the Dancing Queen
Friday night and the lights are low
Looking out for the place to go
Where they play the right music, getting in the swing
You come in to look for a King
Anybody could be that guy
Night is young and the music''s high
With a bit of rock music, everything is fine
You''re in the mood for a dance
And when you get the chance...
You are the Dancing Queen, young and sweet, only seventeen
Dancing Queen, feel the beat from the tambourine
You can dance, you can jive, having the time of your life
See that girl, watch that scene, dig in the Dancing Queen
You''re a teaser, you turn ''em on
Leave them burning and then you''re gone
Looking out for another, anyone will do
You''re in the mood for a dance
And when you get the chance...
You are the Dancing Queen, young and sweet, only seventeen
Dancing Queen, feel the beat from the tambourine
You can dance, you can jive, having the time of your life
See that girl, watch that scene, dig in the Dancing Queen

◆ SQL문장으로 데이터 입력시 작은따옴표(‘)(싱글쿼터) 입력시에는 앞에 작은따옴표를 한번 더 붙여준다.(’‘)

UPDATE EMP SET REMARK = 'Ooh        
You can dance
You can jive
Having the time of your life
Ooh, see that girl
Watch that scene
Digging the dancing queen
Friday night and the lights are low
Looking out for a place to go
Where they play the right music
Getting in the swing
You come to look for a king
Anybody could be that guy
Night is young and the music''s high
With a bit of rock music
Everything is fine
You''re in the mood for a dance
And when you get the chance
You are the dancing queen
Young and sweet
Only seventeen
Dancing queen
Feel the beat from the tambourine, oh yeah
You can dance
You can jive
Having the time of your life
Ooh, see that girl
Watch that scene
Digging the dancing queen
You''re a teaser, you turn ''em on
Leave ''em burning and then you''re gone
Looking out for another
Anyone will do
You''re in the mood for a dance
And when you get the chance
You are the dancing queen
Young and sweet
Only seventeen
Dancing queen
Feel the beat from the tambourine, oh yeah
You can dance
You can jive
Having the time of your life
Ooh, see that girl
Watch that scene
Digging the dancing queen
Digging the dancing queen
';

SELECT*FROM EMP;

SELECT EMPNO, ENAME, LENGTH(REMARK) FROM EMP;

--1. 덧셈연산자를 이용하여 모든 사원에 대해서 연봉에 대해 300만원의 급여 인상을 계산한 후 사원의 
--사원의 사번, 이름, 급여, 인상된 연봉을 출력하시오 연봉+300

SELECT ENAME 사원명,SAL 급여,(SAL*12+3000000)인상된급여   --PPT 174장
FROM EMP;

--2. 사원번호 7999 사람의 업무(JOB)를 '프로그래머'로 수정하시오

UPDATE EMP
SET JOB='프로그래머'            --수정하고자하는 값 DML
WHERE EMPNO='7999';    

--3.EMP 테이블 JOB속성의 데이터타입을 VARCHAR2(20)으로 수정하시오
ALTER TABLE EMP                 --테이블 구조 수정 DDL
MODIFY (JOB VARCHAR2(20));

--4. EMP 테이블에 사원번호로 DEPT테이블과 외래키를 생성하시오
ALTER TABLE EMP        --테이블 변경 
ADD (CONSTRAINT XFK_EMP FOREIGN KEY(DEPTNO) --없던 키 만들어준다, DEPTNO를 FK로 줘라 
REFERENCES DEPT(DEPTNO)); --DEPT(DEPTNO)서로 연결해서 FK를 만들어라

SELECT*FROM DEPT;

DELETE DEPT
WHERE DEPTNO='10'; --오류남

--5.사원의 이름, 급여, 연간 총 수입을 총 수입이 많은 것부터 작은 순으로 출력하시오,
--연간 총수입은 월급에 12를 곱한 후 100만원의 상여금을 더해서 계산하시오

SELECT ENAME 이름, SAL 급여, (SAL*12+1000000) 연간총수입
FROM EMP
ORDER BY SAL DESC;             --ASC OR 안쓰면 오름차순 

--6.급여가 500만원이 넘는 사원의 이름과 급여를 조회하는데 급여가 많은 것부터 작은순으로 출력하시오
SELECT ENAME 이름, SAL 급여
FROM EMP
WHERE SAL >=500
ORDER BY SAL DESC;

--7. 사원번호가 7788인 사원의 이름과 부서번호, 부서명을 출력하시오
SELECT A.ENAME 이름, A.DEPTNO 부서번호,B.DNAME 부서명
FROM EMP A ,DEPT B
WHERE A.EMPNO='7788'AND A.DEPTNO=B.DEPTNO;

--8. 급여가 400에서 500사이에 포함되지 않는 사원의 이름과 급여를 출력하시오
SELECT ENAME 이름, SAL 급여
FROM EMP
WHERE SAL >400 OR SAL<500;
--WHERE NOT SAL BETWEEN 400 AND 500;

--9. 2020년 2월 20일부터 2022년 12월 31일 사이에 입사한 사원의 이름, 담당업무, 입사일을 출력하시오
SELECT ENAME 이름,JOB 담당업무, HIREDATE 입사일
FROM EMP
WHERE HIREDATE BETWEEN '2020/02/20' AND '2022/12/31';

--10. 부서번호가 20및 30에 속한 사원의 이름과 부서번호를 출력, 이름을 기준(내림차순)으로 출력하시오
SELECT ENAME 사원명,DEPTNO 부서번호
FROM EMP
WHERE DEPTNO IN(20,30)
--WHERE DEPNO ='20' OR DEPTNO='30'
--WHERE DEPNO BETWEEN 20 AND 30
ORDER BY ENAME DESC;

--11.사원의 급여가 300에서 600사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력, 이름순(오름차순)으로 출력하시오
SELECT ENAME 사원명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE SAL BETWEEN 300 AND 600 AND DEPTNO IN(20,30)
--WHERE (SAL BETWEEN 300 AND 600) AND (DEPTNO='20' OR DEPTNO '30')
ORDER BY ENAME ASC;

--12. 2021년도에 입사한 사원의 이름과 입사일을 출력하시오
--(LIKE 연산자와 와일드카드 사용)

SELECT ENAME 사원명, HIREDATE 입사일
FROM EMP
WHERE HIREDATE LIKE'%21%';
--WHERE HIREDATE LIKE'2021%'




--13.관리자가 없는 사원의 이름과 담당 업무를 출력하시오

SELECT ENAME 사원명, JOB 담당업무
FROM EMP
WHERE MGR IS NULL;

--14.커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션(보너스)을 출력하되  커미션 기준으로 내림차순으로 정렬하여 표시하시오
SELECT ENAME 사원명, SAL 급여, COMM 커미션
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY COMM DESC;

--15.이름의 세번째 문자가 "우"인 사원의 이름을 표시하시오  188P
SELECT ENAME 사원명 
FROM EMP
WHERE ENAME LIKE '__우';



--16.이름에 "민"와 "김"을 모두 포함하고 있는 사원의 이름을 표시하시오
SELECT ENAME 사원명
FROM EMP
WHERE (ENAME LIKE '%민%') AND (ENAME LIKE '%김%');




--17. 담당업무가 프로그래머, 또는 영업사원이면서 급여가 350,450 또는 750이 아닌 사원이 이름, 담당업무, 급여를 출력하시오
SELECT ENAME 사원명, JOB 담당업무, SAL 급여
FROM EMP
WHERE JOB IN ('프로그래머','영업사원') AND NOT SAL IN (350,450,750);






--18. 입력된 REMARK 속성에 저장된 영문자를 모두 소문자/대문자/첫자대문자로 조회하시오

SELECT LOWER(SUBSTR(REMARK,1,20))소문자,
INITCAP(SUBSTR(REMARK,1,20))첫자대문자,
UPPER(SUBSTR(REMARK,1,20))대문자
FROM EMP;

--19. 커미션이 500 이상인 사원의 이름과 급여 및 커미션을 출력하시오

SELECT ENAME 사원명, SAL 급여, COMM 커미션
FROM EMP
WHERE COMM>=500;

--20.SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오
SELECT SYSDATE FROM DUAL;  --현재 날짜

SELECT ENAME 사원명, SUBSTR(HIREDATE,1,4) 입사년,SUBSTR(HIREDATE,6,2)입사달
FROM EMP;


--21. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력해라

SELECT ENAME 사원명, HIREDATE 고용일자
FROM EMP
WHERE SUBSTR(HIREDATE,6,2)='04';

--22.  MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오

SELECT *
FROM EMP
WHERE MOD(EMPNO,2)=0;
--WHERE MOD(TO_NUMBER(EMPNO),2)=0;  --EMPNO를 숫자형식으로 바꿔라

--23. 입사일을 년도는 2자리(YY), 월은 숫자(MON), 일자는(DD)약어로 나타내라

--SELECT TO_CHAR(HIREDATE,'YY-MM-DD') 입사일
SELECT SUBSTR(HIREDATE,3,2)YY,SUBSTR(HIREDATE,6,2)MM,SUBSTR(HIREDATE,9,2)DD
FROM EMP;

--24. 올해 며칠이 지났는지 출력하시오. 현재 날짜에서 올해 1월1일을 뺀 결과를 출력하고 TO_DATE함수를 사용하여 데이터 형을 일치 시키시오

SELECT TO_DATE(SYSDATE) - TO_DATE('2023/01/01','YYYY/MM/DD' )
FROM DUAL

SELECT*FROM ALL_TABLES;

SELECT*FROM DUAL;      --DUMMY 아무 의미 없는 값


--SELECT*FROM NLS_SESSION_PARAMETERS
--WHERE PARAMETER='NLS_DATE_FORMAT'; 도구-데이터베이스-NLS






SELECT ADD_MONTHS(SYSDATE, 6) 육개월후,  -- 현재시간 + 6개월 뒤 
LAST_DAY(SYSDATE) 금월마지막일,           -- 해당월 마지막 일자 계산 
NEXT_DAY(SYSDATE, '일요일') 담주일요일,     -- 다음 주 일요일 계산 
ROUND(MONTHS_BETWEEN(SYSDATE, SYSDATE-100)) 삼개월,    -- 개월 수 반환
ROUND(MONTHS_BETWEEN(SYSDATE, '2023-02-25')) 이개월    -- 개월 수 반환
FROM DUAL;
 

SELECT ROUND((TO_DATE('16:30','HH24:MI')-TO_DATE('15:10','HH24:MI'))*24,1)시간으로차이계산
FROM DUAL;

SELECT ROUND((TO_DATE('16:30','HH24:MI')-TO_DATE('15:10','HH24:MI'))*24*60,1)분으로시간차이계산
FROM DUAL;

SELECT ROUND((TO_DATE('16:30','HH24:MI')-TO_DATE('15:10','HH24:MI'))*24*60*60,1)초로시간차이계산
FROM DUAL;


--결과 : 연도
SELECT TO_CHAR(SYSDATE,'YEAR')FROM DUAL;
--결과: 화요일
SELECT TO_CHAR(SYSDATE,'DAY')FROM DUAL;
--결과: 화
SELECT TO_CHAR(SYSDATE,'DY')FROM DUAL;
--결과 : 3 (1:일, 2:월, 3:화, 4:수, 5:목, 6:금, 7:토)
SELECT TO_CHAR(SYSDATE,'D')FROM DUAL;
--오늘날짜 20230523 기준 절삭시
SELECT TRUNC(SYSDATE,'Y') FROM DUAL;
SELECT TRUNC(SYSDATE,'MM') FROM DUAL;
SELECT TRUNC(SYSDATE,'DD') FROM DUAL;

SELECT TO_CHAR(SYSDATE,'AM','NLS_DATE_LANGUAGE=AMERICAN')AS AMERICAN,TO_CHAR(SYSDATE,'AM','NLS_DATE_LANGUAGE=KOREAN')AS KOREAN FROM DUAL;


SELECT TO_CHAR(TO_DATE('20230523145411','YYYYMMDDHH24MISS'),'YYMMDD HH:MI:SS AM')오전오후
FROM DUAL;

SELECT TO_CHAR(SYSDATE,'AD YYYY,CC||"세 기"')
FROM DUAL;


--25. 사원들의 사번,이름,상관사번을 출력하되 상관이 없는 사원에 대해서는 NULL값 대신 0으로 출력하시오
--NVL(NULL값인 컬럼, 대체하고 싶은 값)
SELECT EMPNO 사번, ENAME 이름, NVL(MGR,0) 상관사번
FROM EMP;

SELECT EMPNO 사번, ENAME 이름, NVL2(MGR,MGR,'대박') 상관사번
FROM EMP;


--26.DECODE  함수로 직급에 따라 급여를 인상하도록 하시오. 직급이'분석가'인 사원은 200, 
--'영업사원'인 사원은 180,'관리자'인 사원은 150,'회계업무'인 사원은 130을 인상하시오

SELECT ENAME 이름, JOB 직무,SAL 급여,DECODE(JOB,'분석가',SAL+200,'프로그래머',SAL+150,'영업사원',SAL+130,'관리자',SAL+110)인상된금액
FROM EMP;

SELECT DECODE(9,10,'A',9,'B',8,'C','D')
FROM DUAL;

SELECT DECODE('승수','강쥐','A','동물','B','사람','C','D')
FROM DUAL;

--27. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오 . 평균에 대해서는 정수로 반올림 하시오
SELECT MAX(SAL)최고액, MIN(SAL)최저액, ROUND(AVG(SAL),0)평균, SUM(SAL)총액
FROM EMP;

--28. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균 액을 출력하시오. 평균에 대해서는 정수로 반올림하시오
SELECT JOB 담당업무,MAX(SAL)최고액, MIN(SAL)최저액, ROUND(AVG(SAL),0)평균, SUM(SAL)총액
FROM EMP
GROUP BY JOB;

-- 상품 입고테이블의 상품별 입고 수량의 합계값
SELECT PROD_BUYER 거래처, MAX(PROD_COST) 최고매입가, MIN(PROD_COST) 최저매입가
FROM PROD
GROUP BY PROD_BUYER;

--29. COUNT(*)함수를 이용하여 담당업무가 동일한 사원 수를 출력하시오
SELECT JOB 담당업무, COUNT(*)인원수
FROM EMP
GROUP BY JOB
ORDER BY COUNT(*)DESC;

--30. 급여 최고액, 급여 최저액의 차액을 출력하시오 
--최고액 최저액 차액으로 표시

SELECT MAX(SAL)최고액 ,MIN(SAL)최저액,MAX(SAL)-MIN(SAL)차액
FROM EMP;

--31. 부서코드 10,20,30인 사원들에 대해 부서 번호별 급여 총액을 각각 출력하시오
--별칭은 각 부서번호, 부서명, 총액으로 지정하시오
--(HINT.  IN,GROUP BY)

SELECT D.DNAME 부서명, E.DEPTNO 부서번호, SUM(E.SAL) 총액
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO IN(10,20,30)
GROUP BY E.DEPTNO, D.DNAME;


--32.EQUI 조인을 사용하여 김민욱 사원의 SELECT E.ENAME 이름, E.DEPTNO 부서번호, D.DNAME 부서명
--부서번호와 부서 이름을 출력하시오
SELECT E.ENAME 이름, E.DEPTNO 부서번호, D.DNAME 부서명
FROM EMP E,DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.ENAME='김민욱';

--33. INNER JOIN과 ON연산자를 사용하여 사원 이름과 함께 그 사원이 소속된 부서이름과 지역 명을 출력하시오

SELECT E.ENAME 이름, E.DEPTNO 부서번호, D.LOC 지역명
FROM EMP E 
INNER JOIN DEPT D ON(E.DEPTNO=D.DEPTNO);

--34. 34. INNER JOIN과 USING 연산자를 사용하여 10번 부서에 속하는 모든 담당 업무의 
--고유 목록(한 번씩만 표시)을 부서의 지역명을 포함하여 출력 하시오.


--SELECT E.ENAME 이름, D.DNAME 부서번호, D.LOC 지역명
--FROM EMP E, DEPT D
--WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO='40';

SELECT EMP.ENAME 이름, DEPT.DNAME 부서번호, DEPT.LOC 지역명
FROM EMP 
INNER JOIN DEPT USING(DEPTNO)
WHERE DEPTNO ='40';


--35. NATURAL JOIN을 사용하여 커미션을 받는 모든 사원의 이름, 부서이름, 지역 명을 출력하시오.

SELECT EMP.ENAME 이름, DEPT.DNAME 부서이름, DEPT.LOC 지역명
FROM EMP
NATURAL JOIN DEPT 
WHERE COMM IS NOT NULL;

SELECT E.ENAME 이름, D.DNAME 부서번호, D.LOC 지역명
FROM EMP E
NATURAL JOIN DEPT D 
WHERE COMM IS NOT NULL; 

--36. EQUI 조인과 WildCARD를 사용하여 이름에 ‘민’자가 포함된 모든 사원의 이름과 부서명을 출력하시오.

SELECT E.ENAME 이름, D.DNAME 부서명
FROM EMP E,DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.ENAME LIKE '%민%'; 

--37. NATUAL JOIN을 이용하여 대전에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
SELECT EMP.ENAME 이름, DEPT.DNAME 부서명, EMP.JOB 업무, DEPTNO 부서번호
FROM EMP 
NATURAL JOIN DEPT 
WHERE LOC ='대전';

--38. SELF JOIN을 사용하여 사원의 이름 및 사원번호를 관리자 번호와 함께 출력하시오. SELF JOIN은 자기 자신의 테이블을 쪼개는것
SELECT E1.ENAME 사원명, E1.EMPNO 사원번호, E2.MGR 관리자번호
FROM EMP E1, EMP E2       --사원번호를 관리자 번호가 똑같다
WHERE E1.EMPNO=E2.MGR;

--39. SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 
--사원을 출력하시오(고영우)
SELECT E1.DEPTNO, E1.ENAME
FROM EMP E, EMP E1
WHERE E.DEPTNO=E1.DEPTNO AND E.ENAME='고영우';

--40. 사원번호가 7499인 사원과 담당업무가 같은 사원을 표시(사원 이름과 담당업무)하시오
SELECT E1.DEPTNO, E1.JOB, E1.ENAME
FROM EMP E, EMP E1
WHERE E.EMPNO='7934' AND E.JOB=E1.JOB;   --<>'7394'; 자기자신 제외

--41. 상품테이블에서 상품코드, 상품명, 분류명, 거래처명을 조회하시오

SELECT P.PROD_ID 상품코드, P.PROD_NAME 상품명, L.LPROD_NM 분류명, B.BUYER_NAME 거래처명
FROM PROD P, BUYER B, LPROD L
WHERE P.PROD_LGU=L.LPROD_GU AND P.PROD_BUYER=B.BUYER_ID;  --PK번호 

--42. 학사관리시스템에 아래 학점 관리 테이블을 생성하시오
SELECT FROM TAB;

CREATE TABLE HAKJUM
GRADE CHAR(2) NOT NULL,
MIN_POINT NUMBER(3) NOT NULL,
MAX_POINT NUMBER(3) NOT NULL,
CONSTRAINT PK_GRADE PRIMARY KEY (HAKJUM));

INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
VALUES('A+',96,100);
INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
VALUES('A0',90,95);
INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
VALUES('B+',85,89);
INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
VALUES('B0',80,84);
INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
VALUES('C+',75,79);
INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
VALUES('C0',70,74);
INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
VALUES('D+',65,69);
INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
VALUES('D0',60,64);
INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
VALUES('F',0,59);

--43. 학사관리시스템에서 수강학생들의 성적을 학점으로 나타내시오
--학번 학생명 과목코드 과목명 점수 학점

SELECT S.STD_NO 학번, S.STD_NAME 학생명, B.SUB_CD 과목코드, B.SUB_NAME 과목명, C.CLS_SCORE 점수, H.GRADE 학점
FROM CLASS C, STUDENT S, SUBJECT B, HAKJUM H
WHERE C.STD_NO=S.STD_NO AND C.SUB_CD=B.SUB_CD AND (C.CLS_SCORE BETWEEN H.MIN_POINT AND H.MAX_POINT)--C.CLS_SCORE BETWEEN 가 어디에 있는지
--ORDER BY S.STD_NAME ASC;
ORDER BY C.CLS_SCORE DESC;


SELECT *FROM STUDENT;
SELECT *FROM SUBJECT;
SELECT *FROM CLASS;
SELECT *FROM HAKJUM;

--44. 학사관리시스템에서 과목별 평균성적을 구해라.
과목코드, 평균성적

SELECT A.SUB_CD 과목코드, ROUND(AVG(A.CLS_SCORE),1) 평균성적
FROM CLASS A
GROUP BY A.SUB_CD
ORDER BY A.SUB_CD DESC;

--45. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시하시오. 사원이름과 담당 업무 급여
SELECT E1.ENAME 사원이름, E1.JOB 담당업무, E1.SAL 급여
FROM EMP E, EMP E1
WHERE E.EMPNO='7499' AND E.SAL<=E1.SAL;

--46. 최소급여를 받는 사원의 이름, 담당업무 및 급여를 표시하시오
SELECT ENAME 이름, JOB 담당업무, SAL 급여 
FROM EMP
WHERE SAL=(SELECT MIN(SAL) FROM EMP);   --서브쿼리

--47. 평균급여가 가장 적은 직급의 직급 이름과 직급의 평균을 구하시오
--1단계
SELECT JOB 담당업무, AVG(SAL)
FROM EMP 
GROUP BY JOB 
ORDER BY  AVG(SAL)ASC;


--정답:
SELECT JOB 담당업무, ASD 급여평균
FROM (SELECT JOB, AVG(SAL)ASD   --ASD 저장
FROM EMP 
GROUP BY JOB   --직무기준으로 결과를 그룹화, 각 직무의 평균 급여가 계산된다
ORDER BY  AVG(SAL)ASC)
WHERE ROWNUM=1;  --결과중 첫번째 항만 선택. 가장 작은 평균급여를 가진 직무 1개만 반환

--48. 각 부서의 최소 급여를 받는 사원의 이름,급여,부서번호를 표시하시오
SELECT E.ENAME 이름, E.SAL 최소급여, E.DEPTNO 부서번호
FROM EMP E,
(SELECT DEPTNO, MIN(SAL)AS SALL  -- SALL에 지정
FROM EMP                
GROUP BY DEPTNO)E1
WHERE E.SAL=E1.SALL
ORDER BY E1.DEPTNO;

--49. 평균 영업사원 급여보다 급여가 적으면서 업무가 영업사원이 아닌 사원들을 표시(사원번호, 이름, 담당 업무, 급여)하시오

SELECT EMPNO 사원번호, ENAME 이름, JOB 담당업무, SAL 급여 
FROM EMP E
WHERE SAL<(SELECT AVG(SAL) FROM EMP WHERE JOB='영업사원')AND JOB<>'영업사원' ;
--정답
SELECT E.EMPNO 사원번호, E.ENAME 이름, E.JOB 담당업무, E.SAL 급여 
FROM EMP E,
(SELECT AVG(SAL) SALL FROM EMP
WHERE JOB='영업사원')E1
WHERE E.SAL<E1.SALL AND E.JOB!='영업사원';

--50. 부하직원이 없는 사원의 이름을 표시하시오 (사원 번호가 매니저로 저장되어 있진 않은 사람을 조회해야함)

SELECT ENAME 사원명, EMPNO 사원번호, MGR 관리자번호
FROM EMP     
WHERE ENAME NOT IN(SELECT A.ENAME FROM EMP A, EMP B
WHERE A.EMPNO=B.MGR);

SELECT DISTINCT(ENAME)사원명
FROM EMP
WHERE ENAME NOT IN (SELECT E.ENAME 사원이름
FROM EMP E, EMP E1
WHERE E.EMPNO=E1.MGR);


--51.부하직원이 있는 사원의 이름을 표시하시오(사원 번호가 매니저로 저장되어 있는 사람을 조회해야함)
SELECT DISTINCT(ENAME)사원명
FROM EMP
WHERE ENAME IN (SELECT E.ENAME 사원이름
FROM EMP E, EMP E1
WHERE E.EMPNO=E1.MGR);


--52.김동혁과 동일한 부서에 속한 사원의 부서코드, 이름 , 입사일을 표시하는 질의를 작성하시오
--(단 김동혁은 제외)
SELECT DEPTNO, ENAME, HIREDATE
FROM EMP E EMP E1
WHERE E.DEPTNO=E1.DEPTNO AND E.ENAME='김동혁'
AND NOT E.ENAME='김동혁';

--53. 급여가 평균 급여보다 많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대해서 오름차순으로 정렬하시오 
SELECT EMPNO 사원번호, ENAME 이름, SAL 급여
FROM EMP
WHERE SAL>(SELECT AVG(SAL) FROM EMP)
ORDER BY SAL ASC;

--54. 이름에 "국"이 포함된 사원과 같은 부서에서 일하는 사원의 사원번호와 이름을 표시하시오

SELECT E1.ENAME 이름, E1.EMPNO 사원번호, E1.DEPTNO 부서코드
FROM EMP E, EMP E1
WHERE E.DEPTNO=E1.DEPTNO AND
E.ENAME LIKE'%국%';


--55. 부서위치가 서울인 사원의 이름과 부서번호 및 담당업무를 표시하시오
SELECT EMP.ENAME 이름, EMP.DEPTNO 부서번호, EMP.JOB 담당업무
FROM EMP, DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO AND
LOC='서울';

--56. 김지완에게 보고하는 사원의 이름과 급여를 표시하시오

SELECT E1.ENAME 사원명, E1.SAL 급여
FROM EMP E, EMP E1
WHERE E.EMPNO=E1.MGR AND E.ENAME='김지완';

--57. 조사부 부서의 사원에 대한 부서번호, 사원이름 및 담당 업무를 표시하시오

SELECT E1.DEPTNO, E1.ENAME, E1.JOB
FROM EMP E1, DEPT D
WHERE E1.DEPTNO=D.DEPTNO AND D.DNAME='조사부';


SELECT *
FROM EMP;
--58. 평균 월급보다 많은 급여를 받고 이름에 "우"가 포함된 사원과 같은 부서에서 근무하는
--사원의 사원번호, 이름, 급여를 표시하시오
--1단계 우가 포함된 사원 20,50
SELECT EMPNO,ENAME,SAL
FROM EMP E
WHERE ENAME LIKE '%우%';
--2단계
SELECT E.EMPNO, E.ENAME, E.DEPTNO
FROM EMP E
WHERE E.SAL>(SELECT AVG(SAL)FROM EMP);
--정답(선생님)
SELECT E1.EMPNO, E1.ENAME, E1.SAL
FROM EMP E, EMP E1
WHERE (E.DEPTNO = E1.DEPTNO AND E.ENAME LIKE '%우%')
AND (E1.SAL>(SELECT AVG(SAL)FROM EMP));


--정답
SELECT E.EMPNO, E.ENAME, E.SAL
FROM EMP E
WHERE E.SAL > (SELECT AVG(SAL) FROM EMP)
AND E.DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%우%');


--59. 평균 급여가 가장 적은 업무를 찾으시오

SELECT JOB 담당업무, ASD 급여평균
FROM (SELECT JOB, AVG(SAL)ASD   --ASD 저장
FROM EMP 
GROUP BY JOB   --직무기준으로 결과를 그룹화, 각 직무의 평균 급여가 계산된다
ORDER BY  AVG(SAL)ASC)
WHERE ROWNUM=1;  --결과중 첫번째 항만 선택. 가장 작은 평균급여를 가진 직무 1개만 반환

--59. 평균 급여가 가장 큰 업무를 찾으시오
SELECT JOB, ASD
FROM(SELECT JOB, AVG(SAL)ASD
FROM EMP
GROUP BY JOB
ORDER BY AVG(SAL)DESC)
WHERE ROWNUM=1;

--60.담당업무가 관리자인 사원이 소속된 부서와 동일한 부서의 사원을 표시하시오
--FROM절 안에 SELECT 308P 
SELECT E.ENAME 사원명, E.JOB 담당업무
FROM EMP E, 
(SELECT DISTINCT DEPTNO FROM EMP WHERE JOB='관리자')E1
WHERE E.DEPTNO=E1.DEPTNO;

--191P
SELECT CHR(65)"CHR",ASCII('ABC')"ASCII"FROM DUAL;
SELECT ASCII(CHR(65))RESULT FROM DUAL;
SELECT CHR(75)"CHR", ASCII('K')"ASCII"FROM DUAL;
--회원테이블의 회원 ID COLUMN의 ASCII값을 검색하시오
SELECT ASCII(MEM_ID) AS 회원ASCII,
CHR(ASCII(MEM_ID))AS 회원CHR
FROM MEMBER;

--193P 시험!!!!
SELECT LPAD('JAVA',10,'*')"LPAD", 
RPAD('FLEX',12,'^')"RPAD"
FROM DUAL;

--420P 시험 해석하시오 


SET SERVEROUTPUT ON 
DECLARE 
  V_ID  NUMBER := 1; 별 개수를 나타내는 변수
  V_ID2 NUMBER := 10; 현재 줄의 공백 개수를 나타내는 변수 
BEGIN
  DBMS_OUTPUT.PUT_LINE('');  -- 하나 찍고 시작
  WHILE V_ID < 20 LOOP      --V_ID가 20보다 작을 때까지 반복하며
    DBMS_OUTPUT.PUT(RPAD('X' , v_ID2, 'A')); -- X하나찍고 오른쪽에 A 9개 찍어라 라인 안넘어감 
    DBMS_OUTPUT.PUT_LINE(RPAD('*',V_ID , '*'));    --* 한개 찍고 나머지*찍어라
    V_ID  := V_ID  + 2;  -- ->3
    V_ID2 := V_ID2 - 1;  -- ->9
  END LOOP;  
END;
--194,195

SELECT TRANSLATE('2009-02-28', '0123456789-',  'ABCDEFGHIJK') RESULT
FROM DUAL; 

SELECT BUYER_NAME, REPLACE(BUYER_NAME, '삼', '육') "삼->육 "
FROM BUYER;
   
--198
SELECT INSTR('hello heidi','he') AS RESULT1,
INSTR('hello heidi', 'he',3) AS RESULT2  HEI제외하고 3번째 세어라
FROM DUAL;


SELECT LENGTH('SQL 프로젝트') "LENGTH", 공백포함 세기
   LENGTHB('SQL 프로젝트') "LENGTHB"    한글 3BYTE 영어1BYTE
   FROM DUAL;
   
SELECT ABS(-365)FROM DUAL;

SELECT SIGN(12), SIGN(0), SIGN(-55)
FROM DUAL;

SELECT POWER(3,2), POWER(2,10)
FROM DUAL;

SELECT SQRT(2), SQRT(9) 
FROM DUAL;
--200

SELECT GREATEST('강아지', 256, '송아지')  "큰값",
        LEAST('강아지', 256, '송아지')  "작은값"       --강아지, 송아지는 ASCII값
    FROM DUAL;

--201
SELECT ROUND(345.123, -1) 결과1, 
TRUNC(345.123, -1) 결과2    
FROM DUAL;

--203
SELECT MOD(10,3.7), REMAINDER(10,3.7) FROM DUAL;

--204   205P
SELECT WIDTH_BUCKET(88,0,100,10) FROM DUAL;


--205 214P
SELECT MEM_NAME 회원이름,  MEM_BIR 회원생일 , 
MEM_NAME ||  '님은 ' || TO_CHAR(MEM_BIR,'YYYY"년" MM"월 출생이고 태어난 요일은 " DAY')
FROM MEMBER;

--206
SELECT PROD_LGU, PROD_BUYER, COUNT(*), SUM(PROD_COST)
FROM PROD
GROUP BY PROD_LGU, ROLLUP(PROD_BUYER);
--207 254P
SELECT MEM_ID AS"회원ID", MEM_NAME AS "회원명" 
FROM MEMBER
WHERE REGEXP_LIKE(MEM_NAME,'^김(성|형)');
김으로 시작하는 문자열(^)
성 또는 형 (성|형)
--208
SELECT PROD_ID  AS "상품ID"
     , PROD_NAME  AS "상품명"
FROM   PROD
WHERE  REGEXP_LIKE(PROD_NAME, '^삼성.*\d\d');
--209

SELECT MEM_NAME                             AS "회원이름"
     , MEM_MAIL                             AS "이메일"
     , REGEXP_SUBSTR(MEM_MAIL, '[^@]+')     AS "이메일아이디"
     , REGEXP_SUBSTR(MEM_MAIL, '[^@]+',1,2) AS "이메일서버"
FROM   MEMBER;


SELECT REGEXP_SUBSTR('C-01-02','[^-]+',1,1)
FROM DUAL;

SELECT REGEXP_INSTR('JAVA FIex Oracle','[ae]') RESULT
FROM DUAL;

SELECT REGEXP_INSTR('JAVA Flex Oracle','[ae]', 1, 1, 0, 'i') RESULT,
       REGEXP_INSTR('JAVA Flex Oracle','[ae]', 3, 2, 1, 'i') RESULT
 FROM DUAL;    

SELECT REGEXP_REPLACE('JAVA Flex Oracle','[^ ]+','C++')
FROM DUAL;

SELECT mem_id 회원ID,
        mem_regno1 ||'-'||mem_regno2"주민등록번호",
        mem_name AS 성명,
        TO_CHAR(mem_bir, 'YYYY-MM-DD')생일
        FROM member
        ORDER BY mem_regno1, mem_regno2;

 SELECT *FROM LPROD CROSS JOIN PROD;
 
 SELECT  BUYER_ID AS"거래처코드"
 ,        BUYER_NAME AS "거래처명"
 ,      SUM(BUY_QTY*BUY_COST) AS "매입금액"
 FROM BUYPROD, PROD, BUYER
 WHERE BUY_DATE BETWEEN  '2020-01-01' AND '2020-01-31'
 AND BUY_PROD =PROD_ID
 AND PROD_BUYER = BUYER_ID
 GROUP BY BUYER_ID, BUYER_NAME
 ORDER BY BUYER_ID, BUYER_NAME;
 -----------------------------------
CREATE TABLE A
(NO NUMBER(3) NOT NULL,
NAME VARCHAR2(20) NOT NULL,
CONSTRAINT PK_A PRIMARY KEY(NO));


CREATE TABLE B
(NO NUMBER(3) NOT NULL,
NAME VARCHAR2(3) NOT NULL,
CONSTRAINT PK_B PRIMARY KEY(NO));

INSERT INTO A VALUES(1,'김철수');
INSERT INTO A VALUES(2,'박미미');
INSERT INTO A VALUES(3,'정다비');
INSERT INTO A VALUES(4,'멘토스');
INSERT INTO A VALUES(5,'박버거');

INSERT INTO B VALUES(1,60);
INSERT INTO B VALUES(2,71);
INSERT INTO B VALUES(5,99);
INSERT INTO B VALUES(7,100);

SELECT * FROM A;
SELECT * FROM B;

SELECT * FROM A,B;
SELECT*FROM A INNER JOIN B ON A.NO=B.NO;
SELECT*FROM A,B WHERE A.NO=B.NO;
--1) LEFT OUTER JOIN
--Left Outer Join 왼쪽 테이블 기준으로 JOIN 하겠다는 것왼쪽 테이블 A의 모든 데이터와 A와 B 테이블의 중복데이터들이 검색됨
SELECT*FROM A LEFT OUTER JOIN B ON (A.NO=B.NO);
SELECT*FROM A,B WHERE A.NO=B.NO(+);

--2) RIGHT OUTER JOIN
--RIGHT OUTER JOIN은 오른쪽 테이블 기준으로 JOIN 하겠다는 것

SELECT*FROM A RIGHT OUTER JOIN B ON (A.NO=B.NO);
SELECT*FROM A,B WHERE A.NO(+)=B.NO;

--3) FULL OUTER JOIN
--FULL OUTER JOIN은 왼쪽 테이블과 오른쪽 테이블의 합집합을 얻는다.
--만약 A에는 데이터가 있지만 B에 데이터가 없으면 B부분은 null이 되고 반대의 경우에는 A부분이 null이 된다.

SELECT*FROM A FULL OUTER JOIN B ON (A.NO=B.NO);

SELECT*FROM A,B WHERE A.NO=B.NO(+)
UNION
SELECT*FROM A,B WHERE A.NO(+)=B.NO;
--285P
--1.일반조인
SELECT PROD.PROD_ID AS "상품코드", PROD.PROD_NAME  AS "상품명", SUM(BUYPROD.BUY_QTY)  AS "입고수량"
FROM PROD, BUYPROD
WHERE PROD.PROD_ID=BUYPROD.BUY_PROD
AND BUY_DATE BETWEEN '2020-01-01' AND '2020-01-31'
GROUP BY PROD.PROD_ID, PROD.PROD_NAME;

--2. OUTER JOIN 에러
SELECT PROD.PROD_ID AS "상품코드", PROD.PROD_NAME  AS "상품명", SUM(BUYPROD.BUY_QTY)  AS "입고수량"
FROM PROD
LEFT OUTER JOIN BUYPROD ON(PROD.PROD_ID=BUYPROD.BUY_PROD)
GROUP BY PROD.PROD_ID, PROD.PROD_NAME
HAVING BUYPROD.BUY_DATE BETWEEN '2020-01-01' AND '2020-01-31'
ORDER BY PROD.PROD_ID, PROD.PROD_NAME;

--3.ANSI OUTER JOIN
SELECT      PROD.PROD_ID AS "상품코드",  PROD.PROD_NAME AS "상품명", SUM(BUYPROD.BUY_QTY) AS "입고수량"
FROM        PROD LEFT OUTER JOIN BUYPROD 
ON          ( PROD.PROD_ID = BUYPROD.BUY_PROD
AND         BUYPROD.BUY_DATE BETWEEN '2020-01-01' AND '2020-01-31' )
GROUP BY    PROD.PROD_ID , PROD.PROD_NAME
ORDER BY    PROD.PROD_ID, PROD.PROD_NAME;
     
--4. OUTER JOIN 사용확인 (NULL값 제거)

SELECT      PROD.PROD_ID 상품코드,  PROD.PROD_NAME 상품명, SUM( NVL(BUYPROD.buy_qty, 0) ) 입고수량
FROM        PROD LEFT OUTER JOIN BUYPROD 
ON          (PROD.PROD_ID = BUYPROD.BUY_PROD
AND         BUYPROD.BUY_DATE BETWEEN '2020-01-01' AND '2020-01-31' )
GROUP BY    PROD.PROD_ID, PROD.PROD_NAME
ORDER BY    PROD.PROD_ID, PROD.PROD_NAME;

SELECT 10+20 QTY, NULL+10 NQTY FROM DUAL;

--5. 299P  2020년도 판매된 상품중에 5회이상 판매회수가 있는 상품 조회(상품코드, 상품명, 판매횟수)
SELECT PROD.PROD_ID 상품코드, PROD.PROD_NAME  상품명, COUNT(*)판매횟수
FROM PROD, CART
WHERE PROD.PROD_ID=CART.CART_PROD
AND SUBSTR(CART.CART_NO,1,4)='2020'
GROUP BY PROD.PROD_ID, PROD.PROD_NAME
HAVING COUNT(*)>=5;

--301P 2020년도 판매일자,판매총액(5,000,000초과의 경우만), 판매수량 (50초과의 경우만), 판매횟수르 조회하시오
--단, 판매회수가 8개이상인 판매일자만 조회
--HAVING 시험!!

SELECT SUBSTR(CART.CART_NO,1,8) AS "판매일", SUM(CART.CART_QTY*PROD.PROD_SALE) AS "판매금액", SUM(CART.CART_QTY) AS "판매수량", COUNT(*) AS "판매횟수"
FROM PROD INNER JOIN CART
ON (PROD.PROD_ID=CART.CART_PROD)
WHERE CART.CART_NO LIKE '2020%'
GROUP BY SUBSTR(CART.CART_NO,1,8)
HAVING SUM(CART.CART_QTY*PROD.PROD_SALE)>5000000
AND SUM(CART.CART_QTY)>50
AND COUNT(*)>=8
ORDER BY SUBSTR(CART.CART_NO,1,8);

--302P INLINE VIEW 시험!!

--304P

SELECT ENAME, JOB
FROM EMP
WHERE JOB=(SELECT JOB FROM EMP WHERE EMPNO=7369);

SELECT ENAME, JOB,DEPTNO
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE EMPNO=7369);

--305P 
--IN 연산자의 사용 예제

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--ANY 연산자의 사용 예제

SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO!= 20
AND SAL>ANY (SELECT SAL FROM EMP WHERE JOB='영업사원');

--EXISTS 연산자의 사용 예제
SELECT EMPNO, ENAME, SAL
FROM EMP E
WHERE EXISTS (SELECT EMPNO FROM EMP WHERE E.EMPNO=MGR);

--Pairwise(쌍비교) Subquery   307P
SELECT EMPNO,SAL,DEPTNO
FROM EMP
WHERE (SAL,DEPTNO)IN(SELECT SAL, DEPTNO FROM EMP WHERE DEPTNO=30 AND COMM IS NOT NULL);

--INLINE VIEW란 FROM절상에 오는 서브쿼리로 VIEW처럼  작용 합니다.
--예제)급여가 20부서의 평균 급여보다 크고 사원을 관리하는 사원으로서 20부서에 속하지 않은 사원의 정보를 보여주는 SQL문 입니다. 
SELECT B.EMPNO, B.ENAME, B.JOB, B.SAL ,B.DEPTNO
FROM (SELECT EMPNO FROM EMP WHERE SAL>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO=20))A, EMP B
WHERE A.EMPNO=B.EMPNO
AND B.MGR IS NOT NULL
AND B.DEPTNO!=30;
-----------------------------------------------------------------
CREATE TABLE REMAIN
(
REMAIN_YEAR CHAR(04) NOT NULL,   --해당년도
REMAIN_PROD VARCHAR2(10) NOT NULL, --상품코드
REAMAIN_J_00 NUMBER(5),--전년재고
REMAIN_I NUMBER(5),--입고
REMAIN_0 NUMBER(5),--출고
REMAIN_J_99 NUMBER(5),--현재고
REMAIN_DATE DATE,--처리일자

CONSTRAINT PK_REMAIN PRIMARY KEY(REMAIN_YEAR, REMAIN_PROD),
CONSTRAINT FR_REMAIN_PROD FOREIGN KEY(REMAIN_PROD)
REFERENCES PROD(PROD_ID));



INSERT INTO REMAIN
VALUES('2003', 'P101000001',20,10,12,18,'2004-01-01');

--
INSERT INTO remain(remain_year,remain_prod,remain_j_00,remain_i,remain_o,remain_j_99,remain_date)
VALUES ('2003','P101000002',11,7,6,12,'2004-01-02');

INSERT INTO REMAIN (REMAIN_YEAR, REMAIN_PROD, REMAIN_I)
VALUES('2003', 'P102000007', 10);

INSERT INTO REMAIN(REMAIN_YEAR, REMAIN_PROD, remain_j_00,REMAIN_I, REMAIN_J_99, REMAIN_DATE)
VALUES('2003', 'P102000001', 31, 21, 41, '2003-12-31');

INSERT INTO REMAIN(REMAIN_YEAR,REMAIN_PROD,remain_j_00,REMAIN_I,remain_o,REMAIN_J_99,REMAIN_DATE)
VALUES('2003', 'P102000002', 31, 21, NULL, 41, '2003-12-31');

INSERT INTO REMAIN(REMAIN_YEAR,REMAIN_PROD,remain_j_00,REMAIN_I,remain_o,REMAIN_J_99,REMAIN_DATE)
VALUES('2003', 'P102000003', 31, 21, 11, 41, SYSDATE);
--
 모든 상품에 대한 재고 수불 파일 생성 ( 2003년도 재고 수불 마감)
- 해당년도 : 2004년     
- 상품코드 : 전 상품
- 기초(전년)재고 : 상품코드의 우측 2자리를 숫자로 Conversion하여 
                             처리 ( 원칙은 전년도말 재고가 되어야 함 )
- 입고 : 10으로 일괄 처리
- 출고 : 7으로 일괄 처리
- 현재고 : 전년재고 + 입고 - 출고

INSERT INTO remain (remain_year, remain_prod, remain_j_00,remain_i, remain_o, remain_j_99, remain_date)
SELECT '2004', PROD_ID, TO_NUMBER(SUBSTR(PROD_ID,-2)),10,7,TO_NUMBER(SUBSTR(PROD_ID,-2))+10-7,SYSDATE 
FROM PROD;



SELECT *FROM REMAIN;
SELECT *FROM PROD;

SELECT REMAIN_YEAR 연도, REMAIN_PROD 상품번호, REMAIN_J_00 전년재고, REMAIN_I 입고, REMAIN_O 출고,
REMAIN_J_00+REMAIN_I-REMAIN_O 현재고,
REMAIN_J_99 현재고2
FROM REMAIN;
-----345p
SELECT MEM_ID AS "회원ID", MEM_JOB AS "직업", MEM_LIKE AS "휴대폰" 
FROM MEMBER
WHERE MEM_ID='a001';

UPDATE MEMBER
SET MEM_JOB='군인', MEM_LIKE='독서'
WHERE MEM_ID= 'a001';

SELECT MEM_MILEAGE, MEM_MILEAGE*1.1
FROM MEMBER;

UPDATE MEMBER
SET MEM_MILEAGE=MEM_MILEAGE*1.1;

--355P
1. 상품테이블의 총판매수량 조회

SELECT PROD_ID AS "상품코드",SUM(NVL(PROD_QTYSALE,0)) AS "총판매수량"
FROM PROD
GROUP BY PROD_ID;

2. 장바구니 테이블에서 2020년도 상품별 판매수량 합산하여 조회  
SELECT PROD_ID AS "상품코드",SUM(NVL(CART_QTY,0)) AS "매출수량"
FROM PROD LEFT OUTER JOIN CART
ON (PROD_ID=CART_PROD
AND CART_NO LIKE '2020%')
GROUP BY PROD_ID;

3. 2020년도 상품별 판매수량  합산하여  갱신 하시오 ?
UPDATE PROD
SET PROD_QTYSALE=(SELECT NVL(SUM(CART_QTY),0)
FROM CART
WHERE CART_PROD=PROD_ID AND CART_NO LIKE '2020%');

4. 수행 결과 확인(검증)
SELECT SUM(NVL(PROD_QTYIN, 0))
     , SUM(NVL(PROD_QTYSALE, 0)) 
FROM   PROD;

SELECT SUM(BUY_QTY) 
FROM   BUYPROD 
WHERE  BUY_DATE BETWEEN '2020-01-01' AND '2020-12-31'; 

SELECT SUM(CART_QTY) 
FROM   CART 
WHERE  CART_NO LIKE '2020%';

 상품 모두의 2020년도 입고수량, 판매수량을 합산하여  재고수불 
    (remain)테이블의  입고, 출고, 현재고 Column을 수정하시오 ? 

  1. 2020년도 입고수량 및 판매수량을 서브쿼리로 조회
SELECT  PROD_ID, (SELECT SUM(NVL(BUY_QTY,0)) 
FROM   BUYPROD 
WHERE  PROD_ID = BUY_PROD  
AND    TO_CHAR(BUY_DATE,'yyyy') = '2020'  ) AS "INT_AMT", (SELECT SUM(NVL(CART_QTY,0))  
FROM   CART
WHERE  PROD_ID = CART_PROD 
AND    CART_NO LIKE '2020%' ) AS "OUT_AMT" 
FROM    PROD;

2. 1) 번에의 쿼리를  Inline View 로 적용하여 재고수불 테이블 수정
       ( 다중행, 다중열 서브쿼리는 자주 사용하지는 않지만 Update 할 때 유용하게 사용할 수 있음.)
UPDATE  REMAIN   
SET   (REMAIN_I, REMAIN_O, REMAIN_J_99) = 
    (SELECT  IN_AMT, OUT_AMT, REMAIN_J_00 + IN_AMT - OUT_AMT 
     FROM ( SELECT  PROD_ID 
                 , (SELECT SUM(NVL(BUY_QTY,0)) 
                    FROM   BUYPROD 
                    WHERE  PROD_ID = BUY_PROD  
                    AND    TO_CHAR(BUY_DATE,'yyyy') = '2020'  ) AS "IN_AMT"
                 , (SELECT SUM(NVL(CART_QTY,0)) 
                    FROM   CART
                    WHERE  PROD_ID = CART_PROD 
                    AND    CART_NO LIKE '2020%' ) AS "OUT_AMT" 
            FROM PROD ) A
    WHERE REMAIN_PROD = A.PROD_ID)
WHERE REMAIN_YEAR = '2020';
--------------------------------------------------------------------------------
--363P
 재고 수불 테이블을 복사하여 remain2 테이블을 생성하시오
CREATE   TABLE REMAIN2 
AS 
SELECT * FROM  REMAIN; 

SELECT * FROM REMAIN2;

 상품분류테이블의 내용을 모두 삭제
  1) 전체 RECORD 삭제
    - DELETE FROM REMAIN2;
      (ROLLBACK 가능, 느림)
    
    - TRUNCATE TABLE REMAIN2;
    ( 자동 COMMIT (복구 불가), 빠름 )
    
    DROP TABLE REMAIN2;
    
    ROLLBACK;


SELECT REMAIN_YEAR
     , REMAIN_PROD
     , REMAIN_O
FROM   REMAIN
WHERE  REMAIN_YEAR      = '2003'
AND   (NVL(REMAIN_O, 0) = 6 
OR     NVL(REMAIN_O, 0) = 11);

SELECT * 
FROM   REMAIN
WHERE  REMAIN_J_99 IS NULL


DELETE 
FROM   REMAIN
WHERE  REMAIN_YEAR      = '2003'
AND   (NVL(REMAIN_O, 0) = 6 
OR     NVL(REMAIN_O, 0) = 11);

DELETE 
FROM   REMAIN
WHERE  REMAIN_J_99 IS NULL

1. 조회
( Alias는 연도, 상품, 입고량, 출고량 ,합계수량)
SELECT REMAIN_YEAR  AS "연도"
, REMAIN_PROD AS "상품"
, REMAIN_I  AS "입고량"
, REMAIN_O  AS "출고량"
, REMAIN_I + REMAIN_O AS "합계수량"
FROM   REMAIN
WHERE  REMAIN_YEAR = '2003'
AND   (NVL(REMAIN_I,0) + NVL(REMAIN_O,0)) >= 20;

2.삭제
DELETE
FROM REMAIN
WHERE REMAIN_YEAR='2003'
AND (NVL(REMAIN_I,0)+NVL(REMAIN_O,0))>=20;

--379p SEQUENCE 



SELECT NVL(MAX(lprod_id),0)FROM lprod;

INSERT INTO LPROD(LPROD_ID, LPROD_GU, LPROD_NM)
VALUES ((SELECT NVL(MAX(LPROD_ID),0)+1 FROM LPROD),'P103','USB제품');

CREATE SEQUENCE LPROD_SEQ
INCREMENT BY 1
START WITH 15;

INSERT INTO LPROD (LPROD_ID, LPROD_GU, LPROD_NM)
VALUES(LPROD_SEQ.NEXTVAL,'P203','아동복');

SELECT LPROD_SEQ.NEXTVAL FROM DUAL;
SELECT LPROD_SEQ.CURRVAL FROM DUAL;

DROP SEQUENCE LPROD_SEQ;

CREATE SEQUENCE  CART_SEQ
INCREMENT BY 1
MINVALUE 10000
MAXVALUE 99999
CYCLE;

SELECT CART_SEQ.NEXTVAL FROM DUAL;

--386

CREATE SYNONYM MEM
FOR MEMEBER;

CREATE SYNONYM MYDUAL
FOR SYS.DUAL;

SELECT 'Hello WORLD' FROM MYDUAL;

SELECT * FROM MEMBER;

CREATE INDEX IDX_MEMBER_BIR
ON MEMBER(MEM_BIR);

SELECT MEM_ID, MEM_NAME, MEM_JOB, MEM_BIR
FROM MEMBER
WHERE TO_CHAR(MEM_BIR,'YYYY')='1999';

ALTER INDEX MEM_ID REBUILD
SELECT * FROM ALL_OBJECTS
DESC ALL_OBJECTS

SELECT TABLE_NAME, COMMENTS
FROM DICTIONARY
WHERE TABLE_NAME LIKE 'ALL_%';

SELECT OBJECT_NAME, OBJECT_TYPE, CREATED
FROM ALL_OBJECTS
WHERE OWNER='pc14'
ORDER BY OBJECT_TYPE ASC;

DESC USER_TABLES;

SELECT TABLE_NAME, ROWNUM
FROM USER_TABLES;

SELECT*FROM ALL_CONSTRAINTS
WHERE TABLE_NAME='PROD'

--------402P PL SQL------------------------------------------------------------------------------------------------------

SET SERVEROUTPUT ON




DECLARE 
v_i NUMBER(9,2) := 9000.887 ;   --NUMBER 타입 선언, 전체 9자리 중 소수점 이하 2자리까지를 표현할 수 있는 
v_name VARCHAR2(20);
c_pi  CONSTANT NUMBER(8,6) := 3.141592;  -- CONSTANT 상수 선언할 때 사용
v_flag BOOLEAN NOT NULL := true; --초기값 TRUE 
v_date VARCHAR2(10) := TO_CHAR(SYSDATE, 'YYYY-MM-DD');
-- VARCHAR2 데이터 타입 변수를 선언하고, 초기값으로 현재 날짜를 'YYYY-MM-DD' 형식으로 변환하여 할당합니다.
--TO_CHAR 함수는 날짜 값을 문자열로 변환하는 데 사용됩니다. 
BEGIN
v_name := '홍길동';
DBMS_OUTPUT.ENABLE;  -- DBMS_OUTPUT  이용하여 출력 
DBMS_OUTPUT.PUT_LINE( 'v_i : ' || v_i );  --'v_i : '와 v_i 변수의 값을 출력합니다. ||는 문자열 연결 연산자입니다.
DBMS_OUTPUT.PUT_LINE( 'v_name : ' || v_name);    
DBMS_OUTPUT.PUT_LINE( 'c_pi : ' || c_pi );
DBMS_OUTPUT.PUT_LINE( 'v_date : ' || v_date);
END;

--413
DECLARE
v_num NUMBER:=37;

BEGIN
DBMS_OUTPUT.ENABLE;

IF MOD(v_num,2)=0 THEN
DBMS_OUTPUT.PUT_LINE(v_num || '는 짝수');
ELSE
DBMS_OUTPUT.PUT_LINE(v_num || '는 홀수');
END IF;
END;


DECLARE
v_num NUMBER:=67;
BEGIN
DBMS_OUTPUT.ENABLE;
IF v_num>90 THEN
DBMS_OUTPUT.PUT_LINE('수');
ELSIF v_num>80 THEN
DBMS_OUTPUT.PUT_LINE('우');
ELSIF v_num>70 THEN
DBMS_OUTPUT.PUT_LINE('미');
ELSE
DBMS_OUTPUT.PUT_LINE('분발합시다');
END IF;
END;


DECLARE
v_num NUMBER:=0;
BEGIN
DBMS_OUTPUT.ENABLE;  해당되는 사이즈 지정 가능 DISABLE
DBMS_OUTPUT.PUT_LINE('Before ENABLE');


DECLARE
v_avg_sale PROD.PROD_SALE%TYPE; --NUMBER(10,0)   TYPE몽땅 v_avg_sale넣어줌
v_sale NUMBER:=500000;
BEGIN
DBMS_OUTPUT.ENABLE;

SELECT AVG(prod_sale) INTO v_avg_sale FROM prod;

IF v_sale < v_avg_sale THEN
DBMS_OUTPUT.PUT_LINE('평균 단가가 500000초과입니다.');
ELSE
DBMS_OUTPUT.PUT_LINE('평균 단가가 500000이하입니다.');
END IF;
END;



DECLARE
V_MEM_ID      VARCHAR2(10) := 'e001';
V_MEM_MILEAGE MEMBER.MEM_MILEAGE%TYPE;  
V_MEM_NAME    MEMBER.MEM_NAME%TYPE;
V_MILE        NUMBER  := 5000;
BEGIN
DBMS_OUTPUT.ENABLE;
    
SELECT MEM_MILEAGE,   MEM_NAME
INTO   V_MEM_MILEAGE, V_MEM_NAME
FROM   MEMBER
WHERE  MEM_ID = V_MEM_ID;
    
IF V_MILE < V_MEM_MILEAGE THEN
DBMS_OUTPUT.PUT_LINE('VIP 회원(' || V_MEM_NAME || ', ' || V_MEM_MILEAGE || ')');
ELSE
DBMS_OUTPUT.PUT_LINE('일반회원(' || V_MEM_NAME || ', ' || V_MEM_MILEAGE || ')');
END IF;
END;
/
--조회
SELECT MEM_ID, MEM_MILEAGE, MEM_NAME
FROM   MEMBER
WHERE  MEM_MILEAGE>5000;


--417P
SET SERVEROUTPUT ON 

DECLARE
    V_NUM   NUMBER := 77;
BEGIN
    V_NUM := TRUNC(V_NUM / 10);
    
    CASE V_NUM    
        WHEN 10 THEN
            DBMS_OUTPUT.PUT_LINE('수' || '(' || V_NUM || ')');
        WHEN 9 THEN
            DBMS_OUTPUT.PUT_LINE('수' || '(' || V_NUM || ')');
        WHEN 8 THEN
            DBMS_OUTPUT.PUT_LINE('우' || '(' || V_NUM || ')');
        WHEN 7 THEN
            DBMS_OUTPUT.PUT_LINE('미' || '(' || V_NUM || ')');
        ELSE
            DBMS_OUTPUT.PUT_LINE('분발합시다');
    END CASE;
END;

--1부터 10까지 더하기

DECLARE
V_SUM NUMBER := 0;
V_VAR NUMBER := 1;
BEGIN
WHILE V_VAR<=10 LOOP
V_SUM := V_SUM + V_VAR;
V_VAR := V_VAR + 1;
END LOOP;
DBMS_OUTPUT.PUT_LINE('1부터 10까지의합=' || V_SUM);
END;
/
--WHILE문을  사용하여 * 로 피라미드 만들기 
DECLARE
    V_ID NUMBER:=1;
BEGIN
    WHILE V_ID<20 LOOP
    DBMS_OUTPUT.PUT_LINE(RPAD('*',V_ID,'*'));
    V_ID:= V_ID+2;
  END LOOP;
END;
--시험 420
SET SERVEROUT ON
DECLARE    --선언해라
V_ID NUMBER :=1;   --초기값을 NUMBER 타입, 초기값은 1
V_ID2 NUMBER :=10; --초기값을 NUMBER 타입, 초기값은 10
BEGIN  --본문을 실행해라
DBMS_OUTPUT.PUT_LINE('');   --버그가 생기는것을 막기 위해 의미없는 것
WHILE V_ID<20 LOOP     --1<20 
DBMS_OUTPUT.PUT(RPAD('A',v_ID2,' '));  -- 오른쪽에서 채우는 방식으로 v_ID2숫자만큼 /A를 쓰고 오른쪽에 10칸 공백
DBMS_OUTPUT.PUT_LINE(RPAD('*',V_ID,'*'));
V_ID:=V_ID +2;
V_ID2:=V_ID2-1;
END LOOP;
END;
--421
DECLARE
    V_I NUMBER := 2;
    V_J NUMBER := 1;
BEGIN
    WHILE V_I < 10 LOOP
        DBMS_OUTPUT.PUT_LINE(V_I || ' 단 ');
        
        V_J := 1;
        
        WHILE V_J < 10 LOOP
            DBMS_OUTPUT.PUT_LINE(V_I || ' X ' || V_J || '=' || V_I * V_J);
            
            V_J := V_J + 1;
        END LOOP;
        
        V_I := V_I + 1;
    END LOOP;
END; 
/

--Oracle Server는 SQL문장을 실행할 때 PL/SQL은 SQL식별자를 가지는 암시적 커서를 생성합니다.  또한 PL/SQL은 자동적으로 이 커서를 관리합니다. 

DECLARE
    V_NM VARCHAR2(20);
BEGIN
    SELECT LPROD_NM INTO V_NM FROM LPROD WHERE LPROD_GU = 'P201'; --LPROD_NM값을 v_nm에 저장
    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('받은 값 = ' || V_NM);
        DBMS_OUTPUT.PUT_LINE('행 수 = '   || SQL%ROWCOUNT);
    END IF;
END;

--상품분류 테이블에 6개의 코드 증가
DECLARE
    V_ADD   NUMBER(5) := 1000;
    V_CODE  CHAR(4)   := '';
    V_ID    NUMBER(5);
BEGIN
    SELECT MAX(LPROD_ID) INTO V_ID FROM LPROD;
    WHILE V_ADD <= 1005 LOOP
        V_ADD := V_ADD + 1;
        V_ID  := V_ID + 1;
        V_CODE := 'TT' || SUBSTR(TO_CHAR(V_ADD), -2);
        INSERT INTO LPROD(LPROD_ID, LPROD_GU, LPROD_NM) VALUES(V_ID, V_CODE, 'LOOP TEST');
        IF SQL%FOUND THEN
            DBMS_OUTPUT.PUT_LINE('신규코드' || V_CODE || '가 추가되었음');
        END IF;
    END LOOP;
END;
/

select*from lprod;

--WHILE문을 사용하여  상기 INSERT된 데이터를 삭제하시오 ? (삭제가 되었는지 확인 메시지 출력)
DECLARE
V_ADD NUMBER(5) := 1007;  --1007 초기값
V_CODE CHAR(4) := '';  --공백 
V_ID NUMBER(5);

BEGIN
  SELECT MAX(LPROD_ID) INTO V_ID FROM LPROD;  --MAX(LPROD_ID)를 읽어서 INTO V_ID 저장  /V_ID값은 
  
  WHILE V_ADD>=1002 LOOP    --V_ADD 변수가 1002이상인 동안 반복하는 반복문
    DELETE FROM LPROD WHERE LPROD_ID=V_ID;  --V_ID : 16, 15, 14, 13, 12, 11 /LPROD_ID=V_ID일치하는 행을 lprod 테이블에서 삭제한다


V_ADD  := V_ADD - 1;   --1006, 1005, 1004, 1003, 1002, 1001까지 1씩 감소(6회 반복)
    V_ID   := V_ID  - 1;   --LPROD_ID 최대값 즉, 16, 15, 14, 13, 12, 11
    V_CODE := 'TT'||SUBSTR(TO_CHAR(V_ADD),-2);  --화면에 결과를 출력하기 위함--변수의 값을 문자열로 변환하고 뒤에서 2자리를 추출하여 'TT'와 결합한 후, V_CODE 변수에 저장합니다

  IF SQL%FOUND THEN
    --TT06, TT05, ...
    DBMS_OUTPUT.PUT_LINE('기존코드' || V_CODE || '가 삭제되었습니다');
  END IF;
END LOOP;
END;

--425
DECLARE
v_sum INT:=0;
v_VAR INT:=1;
BEGIN
<<mylabel>> --라벨위치 표시 
v_sum:=v_sum + v_var;
v_var:= v_var+1;
IF v_var<=10 THEN
GOTO mylabel; --라벨위치로 돌아가서 다시 실행
END IF;
DBMS_OUTPUT.PUT_LINE(v_sum);
DBMS_OUTPUT.PUT_LINE(v_var);
END;

--426  1부터 10까지 더하기
DECLARE
V_SUM NUMBER:=0;
V_VAR NUMBER:=1;
BEGIN
LOOP
V_SUM:=V_SUM+V_VAR;
V_VAR:=V_VAR+1;
IF V_VAR>10 THEN
EXIT;
END IF;
END LOOP;
DBMS_OUTPUT.PUT_LINE('1부터 10까지의 합='||V_SUM);
END;

DECLARE
  v_sum NUMBER := 0;
  v_var   NUMBER := 1;
BEGIN
  LOOP
    v_sum := v_sum + v_var;
    v_var   := v_var + 1;
    EXIT  WHEN  v_var > 10 ;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('1 부터 10 까지의 합 = ' || v_sum);
END;

--428
BEGIN 
FOR I IN 1..10 LOOP
DBMS_OUTPUT.PUT_LINE('I='||I);
END LOOP;
END;

--430

DECLARE
TYPE STARCRAFT IS VARRAY(20) OF VARCHAR2(10);--TYPE선언
V_STAR STARCRAFT;
BEGIN
v_star := starcraft('Terran','Protos');
V_STAR.EXTEND;   --S
V_STAR(3):='ZERG';
DBMS_OUTPUT.PUT_LINE('스타크래프트 종족:'||V_STAR.COUNT);
FOR I IN V_STAR.FIRST..V_STAR.LAST LOOP
DBMS_OUTPUT.PUT_LINE(I||'번째 종족:'||V_STAR(I));
END LOOP;
END;

--SET SERVEROUTPUT ON 

--432
DECLARE
TYPE lprod_nm_table IS TABLE OF VARCHAR2(40)
    INDEX BY PLS_INTEGER;
    
t_lpord_nm lprod_nm_table;
BEGIN
FOR l_list IN (SELECT LPROD_ID, LPROD_NM FROM LPROD) LOOP
T_LPROD_NM(L_LIST.LPROD_ID ):=L_LIST.LPROD_NM;
DBMS_OUTPUT.PUT_LINE(L_LIST.LPROD_ID||'='||L_LIST.LPROD_NM);
END LOOP;

DBMS_OUTPUT.PUT_LINE('갯수='||T_LPROD_NM.COUNT);
FOR I IN T_LPROD_NM.FIRST..T_LPROD_NM.LAST LOOP
IF T_LPROD_NM.EXISTS(I) THEN
DBMS_OUTPUT.PUT_LINE(I||''||T_LPROD_NM(I));
END IF;
END LOOP;
END;

DECLARE
  TYPE lprod_nm_table IS TABLE OF VARCHAR2(40)
      INDEX BY PLS_INTEGER;
  t_lprod_nm lprod_nm_table;
  
BEGIN  
  FOR  l_list IN (SELECT lprod_id, lprod_nm FROM lprod) LOOP
      t_lprod_nm(l_list.lprod_id) := l_list.lprod_nm;
      DBMS_OUTPUT.PUT_LINE (l_list.lprod_id || ' = ' || l_list.lprod_nm  );
  END LOOP;

  DBMS_OUTPUT.PUT_LINE ('갯수 = ' || t_lprod_nm.COUNT); 
  FOR i IN t_lprod_nm.FIRST..t_lprod_nm.LAST LOOP
	IF t_lprod_nm.EXISTS(i) THEN
  	   DBMS_OUTPUT.PUT_LINE ( i || ' ' || t_lprod_nm(i));
	END IF;
   END LOOP;
END;

--436
DECLARE
v_name varchar2(20);
BEGIN
SELECT lprod_nm INTO v_name FROM lprod WHERE lprod_gu='P201';
DBMS_OUTPUT.PUT_LINE('분류명=' ||v_name);

EXCEPTION 
WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('해당 정보가 없습니다');
 WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('한개 이상의 값이 나왔습니다');
WHEN  OTHERS  THEN
    DBMS_OUTPUT.PUT_LINE('기타 에러:' ||SQLERRM );
END;

--437
DECLARE
exp_reference EXCEPTION;   --예외선언
PRAGMA EXCEPTION_INIT(exp_reference,-2292);
BEGIN
DELETE FROM lprod WHERE lprod_gu='P101';
DBMS_OUTPUT.PUT_LINE('분류삭제');
EXCEPTION --해당예외처리
WHEN exp_reference THEN --예외가 발생했을때 처리할 코드 정의
DBMS_OUTPUT.PUT_LINE('삭제불가:'||SQLERRM); --SQLERRM: 현재 예외에 대한 오류메세지를 반환하는 함수 
WHEN OTHERS THEN --이외의 예외가 발생했을 때 처리할 코드 정의
DBMS_OUTPUT.PUT_LINE(SQLCODE||''||SQLERRM);
END;
/
--438
ACCEPT p_lgu PROMPT '등록하려는 분류코드 입력 :'
DECLARE 
   exp_lprod_gu EXCEPTION;
   v_lgu VARCHAR2(10) := UPPER('&p_lgu');
BEGIN
   IF v_lgu IN ('P101','P102','P201','P202') THEN
        RAISE exp_lprod_gu;
   END IF;
   DBMS_OUTPUT.PUT_LINE (v_lgu || '는 등록 가능');
EXCEPTION 
     WHEN exp_lprod_gu THEN
           DBMS_OUTPUT.PUT_LINE ( v_lgu ||  '는 이미 등록된 코드 입니다.');
END;
/
--443 2020년도 및 상품별 총 입고수량을 출력하는 커서
DECLARE
v_prod VARCHAR2(30);
v_qty NUMBER(10,0);
CURSOR UpRemain_cur IS  -- UpRemain_cur 선언해라 
SELECT buy_prod, SUM(buy_qty) FROM buyprod-- 읽어야할 쿼리
WHERE EXTRACT (YEAR FROM buy_date)=2020
GROUP BY buy_prod ORDER BY buy_prod ASC;

BEGIN
OPEN UpRemain_cur;
FETCH UpRemain_cur INTO v_prod, v_qty;
WHILE (UpRemain_cur%FOUND)  LOOP
DBMS_OUTPUT.PUT_LINE(UpRemain_cur%ROWCOUNT ||'번째 상품='
                                           ||v_prod||'입고수량='
                                           ||v_qty|| '입니다');
FETCH UpRemain_cur INTO v_prod, v_qty;
END LOOP;
CLOSE UpRemain_cur;
END;
/

DECLARE
v_name VARCHAR2(30);
v_mileage NUMBER(10);

CURSOR member_cur (v_job VARCHAR2) IS
SELECT mem_name, mem_mileage FROM member
WHERE mem_job = v_job
ORDER BY mem_name ASC;
BEGIN
OPEN member_cur('공무원');
LOOP
FETCH member_cur INTO v_name, v_mileage;
EXIT WHEN member_cur%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(member_cur%ROWCOUNT||'번째'
                                        ||v_name||','||v_mileage);
END LOOP;
CLOSE member_cur;
END;
/
--446
DECLARE
v_name VARCHAR2(30);
v_mileage NUMBER(10);
CURSOR member-cur IS
SELECT mem_name, mem_mileage
FROM member
WHERE mem_job='&p_job'
ORDER BY mem_name ASC;
BEGIN
FOR mem_rec IN mem_cur LOOP
DBMS_OUTPUT.PUT_LINE(member_cur%ROWCOUNT ||'번째'
                    ||mem_rec.mem_name||','||mem_rec.mem_mileage);
                    END LOOP;
                    END;
                    /
--447
SET SERVEROUTPUT ON 

BEGIN 
FOR mem_rec IN (SELECT mem_id,mem_name,mem_mileage
FROM member 
ORDER BY mem_name ASC)LOOP
DBMS_OUTPUT.PUT_LINE(mem_rec.mem_id ||','
                        || mem_rec.mem_name ||','
                        || mem_rec.mem_mileage);
                        END LOOP;
                        END;
                        /
                        
--450
CREATE OR REPLACE PROCEDURE usp_prod_totalstock_update 
    ( v_prod_id IN prod.prod_id%TYPE, 
      v_qty     IN prod.prod_totalstock%TYPE )               
IS        
BEGIN
   UPDATE prod 
          SET prod_totalstock = prod_totalstock + v_qty
    WHERE prod_id = v_prod_id;
   DBMS_OUTPUT.PUT_LINE('정상적으로 업데이트 되었습니다.');
   COMMIT;

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('예외 발생:' || SQLERRM);
      ROLLBACK;
END;
--

SELECT prod_id, prod_totalstock 
       FROM prod 
     WHERE prod_id = 'P102000006';

 EXECUTE usp_prod_totalstock_update('P102000006', 500);

select * from prod;
--
CREATE OR REPLACE PROCEDURE usp_MemberID
(P_mem_id IN member.mem_id%TYPE,
p_mem_name OUT member.mem_name%TYPE,
p_mem_like OUT member.mem_like%TYPE)
IS
BEGIN
SELECT mem_name, mem_like
INTO p_mem_name, p_mem_like
FROM member
WHERE mem_id=p_mem_id;
END;
-실행456
VAR send_member VARCHAR2
VAR send_amt NUMBER
EXEC usp_MemberCartTop('2020', :send_amt, :send_member);
PRINT send_member 
PRINT send_amt;


--
CREATE OR REPLACE PROCEDURE usp_MemberCartTop
(p_year   IN VARCHAR2,
p_amt  OUT NUMBER,
p_mem_name OUT member.mem_name%TYPE)
IS
v_year VARCHAR2(5);
BEGIN
v_year:=(p_year || '%');
SELECT mem_name, mem_amt INTO p_mem_name,p_amt
FROM(
SELECT mem_name, SUM(prod_price*cart_qty) mem_amt
FROM member, cart, prod
AND cart_member= mem_id
AND cart_prod=prod_id
GROUP BY mem_name
ORDER BY SUM(prod_price*cart_qty) DESC
)
WHERE ROWNUM<=1;
END;
/

--458
SELECT cart_no, cart_prod, cart_member,
(SELECT mem_name FROM member WHERE mem_id=cart_member)name
FROM cart
WHERE cart_no='2020040100001';

--460
CREATE OR REPLACE FUNCTION fn_memNAME
(p_mem_id IN VARCHAR2)
RETURN VARCHAR2
IS
 r_name VARCHAR2(30);
 BEGIN
 SELECT mem_name INTO r_name FROM member
 WHERE mem_id = p_mem_id;
 RETURN r_name;
 
 EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('예외발생:' || SQLERRM);
 RETURN null;
 END;
 
-fn_memName 실행 테스트 
 VAR m_name VARCHAR2
 EXECUTE :m_name := fn_memName('a001') ;
 PRINT m_name
 
 -실제 함수처럼 SQL구문에서 실행 
 SELECT cart_no, cart_prod, cart_member, fn_memName(cart_member)
 FROM cart
  WHERE  cart_no = '2020040100001'

--462
CREATE OR REPLACE  FUNCTION  fn_prodAvgQty
      ( p_year       IN NUMBER DEFAULT (EXTRACT(YEAR FROM SYSDATE)),
        p_prod_id IN VARCHAR2) 
 RETURN NUMBER
 IS
    r_qty NUMBER(10);
    v_year VARCHAR2(5) := TO_CHAR(p_year) || '%';
 BEGIN
    SELECT NVL(AVG(cart_qty),0) INTO r_qty  FROM cart 
      WHERE cart_prod = p_prod_id AND cart_no like v_year;
    RETURN r_qty; 
EXCEPTION 
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('예외 발생:' || SQLERRM);
      RETURN 0;    
 END;
/
--463



--464 fn_prodAvgQty 실행 테스트
 VAR qty NUMBER
 EXEC :qty := fn_prodAvgQty( 2004, 'P201000020'); 
 PRINT qty
 EXEC :qty := fn_prodAvgQty(2020, 'P101000002');  
 PRINT qty
-- 실제 함수처럼 SQL구문에서 실행 
 SELECT prod_id, prod_name, 
                 fn_prodAvgQty(2004,prod_id) "2004년 평균 판매횟수",
                 fn_prodAvgQty(2020,prod_id) "2020년 평균 판매횟수"
 FROM prod
 
 
 
 --494  트리거
 
 CREATE or REPLACE TRIGGER tg_cart_qty_change
      AFTER  insert or update or delete    ON  cart
      FOR EACH ROW
   DECLARE 
       v_qty NUMBER;
       v_prod VARCHAR2(20);
 BEGIN
    IF INSERTING THEN
         v_qty := NVL(:NEW.cart_qty,0);
         v_prod := :NEW.cart_prod;
    ELSIF UPDATING THEN
         v_qty :=  NVL(:NEW.cart_qty,0) - NVL(:OLD.cart_qty,0);
         v_prod := :NEW.cart_prod;
    ELSIF DELETING THEN
         v_qty :=  -(NVL(:OLD.cart_qty,0));
         v_prod := :OLD.cart_prod;
    END IF;   


UPDATE remain SET remain_o = remain_o + v_qty,  
                       remain_j_99 = remain_j_99 - v_qty
WHERE remain_prod = v_prod;
    
DBMS_OUTPUT.PUT_LINE('수량 :' || v_qty);

EXCEPTION 
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('예외 발생:' || SQLERRM);     
END;
/


SELECT *FROM REMAIN
WHERE remain_year='2003' AND remain_prod='P101000001';


--테이블 확인
SELECT *FROM CART;
SELECT *FROM REMAIN;


delete from cart;





INSERT INTO REMAIN(REMAIN_YEAR, REMAIN_PROD, remain_j_00, REMAIN_I, REMAIN_O, REMAIN_J_99, REMAIN_DATE)
VALUES('2022', 'P102000001', 30, 20, 5, 45, '2023-01-01');

INSERT INTO REMAIN(REMAIN_YEAR, REMAIN_PROD, remain_j_00, REMAIN_I, REMAIN_O, REMAIN_J_99, REMAIN_DATE)
VALUES('2022', 'P102000002', 10, 10, 5, 15, '2023-01-01');

SET SERVEROUTPUT ON 

--상품판매 확인
INSERT INTO CART VALUES ('a001','202306090001','P102000001',4);


--수정
SELECT *FROM CART;
update cart set cart_qty=2
where cart_no='202306090001';

--삭제
delete from cart where cart_no='202306090001';


----------------------------------------------------


--498 위 작성된 트리거를 해당 회원의 마일리지도 변경되는 트리거로 변경하시오
--단, 마일리지는 (수량*상품판매가)의 1%로한다  496페이지

CREATE or REPLACE TRIGGER tg_mem_mileage_change
--이름의 트리거생성 혹은 갱신 
      AFTER  insert or update or delete ON cart
      --cart테이블에서 삽입 수정 삭제가 이루어진 후에 트리거 발생하도록함
      FOR EACH ROW
      --각행이 변경될때마다 트리거를 발생시키는 방법 , 없을때는 단 한번만 트리거 
DECLARE 
--선언
       v_qty NUMBER(9);
       --정수 숫자타입 변수 선언
       v_prod VARCHAR2(10);
       --가변 문자 타입 20바이트 크기로 변수 선언
       v_member VARCHAR2(15);
       v_prod_sale prod.prod_sale%type;
       v_sum NUMBER := 10;
 BEGIN
 --pl sql구조로 시작 부문- 실행부문 시작 
    IF INSERTING THEN
        v_qty := NVL(:NEW.cart_qty,0); 
        v_prod := :NEW.cart_prod;        
        v_member := :NEW.cart_member;
    ELSIF UPDATING THEN
         v_qty :=  NVL(:NEW.cart_qty,0) - NVL(:OLD.cart_qty,0);
         v_prod := :NEW.cart_prod;
         v_member := :NEW.cart_member;
    ELSIF DELETING THEN
         v_qty :=  -(NVL(:OLD.cart_qty,0));
         v_prod := :OLD.cart_prod;
         v_member := :OLD.cart_member;
    END IF;
    SELECT prod_sale INTO v_prod_sale from prod  WHERE prod_id = v_prod;
    v_sum := (v_prod_sale * v_qty) * 0.01;

    UPDATE member SET mem_mileage = mem_mileage + v_sum
           WHERE mem_id = v_member;
    DBMS_OUTPUT.PUT_LINE('변경마일리지 ==> ' || v_sum);
EXCEPTION 
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('예외 발생:' || SQLERRM);     
END;
/



INSERT INTO CART VALUES ('a001','202306090005','P102000001',10);

SELECT* FROM MEMBER;



