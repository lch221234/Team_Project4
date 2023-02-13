==========================================================================================================================
-- 회원정보 테이블
create table s_member(
	m_id varchar2(30 char) primary key,
	m_pw varchar2(30 char) not null,
	m_name varchar2(10 char) not null,
	m_address varchar2(200 char) not null,
	m_grade varchar2(10 char)not null,
	m_sex varchar2(10 char)not null
)

insert into s_member values('asdf', 'asdfasdf', '테스트', '테스트 주소', 'bronze', '남자');
insert into s_member values('qwer', 'qwerqwer', '매니저', '테스트 주소', 'admin', '남자');
insert into s_member values('zxcv', 'zxcvzxcv', '매니저', '테스트 주소', 'bronze', '남자');
select * from s_member;
select * from s_member order by m_name DESC;
drop table s_member cascade constraint purge;
==========================================================================================================================
-- 상품 카테고리
create table product_category(
	category_code number(5) primary key,
	category_name varchar2 (30 char) not null
)

create sequence product_category_seq;
insert into product_category values(product_category_seq.nextval, 'TOP');
insert into product_category values(product_category_seq.nextval, 'BOTTOM');
insert into product_category values(product_category_seq.nextval, 'SHOES');
insert into product_category values(product_category_seq.nextval, 'CAP');
insert into product_category values(product_category_seq.nextval, 'ACCESSORY');
drop sequence product_category_seq;
select * from product_category order by category_code;
select * from product_category where category_code=1;
drop table product_category cascade constraint purge;
==========================================================================================================================
-- 상품
create table product(
	product_number number(5) primary key,
	category_code number(5) not null,
	constraint fk_product foreign key(category_code) references product_category(category_code) on delete cascade,
	product_name varchar2(50 char) not null,
	product_price number(9) not null,
	company_number number(5) not null,
	constraint fk_product1 foreign key(company_number) references company_member(company_number) on delete cascade,
	product_stock number(5) not null, -- 재고
	product_img blob not null -- img 추가 blob로 변경
)

create sequence product_seq;
--insert into product values(product_seq.nextval,5,'나이키',132456,1,123);
--insert into product values(product_seq.nextval,1,'우주',123456,23,'space.jpg');
--insert into product values(product_seq.nextval,1,'라떼',12345,321,'latte.png');
--insert into product values(product_seq.nextval,1,'커피',1234431,333,'coffee.png');
drop sequence product_seq;
select * from product order by product_number;
drop table product cascade constraint purge;
==========================================================================================================================
-- 상품 img 
--create table product_imgFile(
--	img_number number(5) primary key,
--	product_number number(5)not null,
--	constraint fk_product_imgFile foreign key(product_number) references product(product_number)on delete cascade,
--	origin_img_name varchar2(300 char) not null, -- 원본 파일이름
--	store_img_name varchar2(300 char) not null -- 서버에 저장될 파일 이름
--)
--
--create sequence product_imgFile_seq;
--insert into product_imgFile values(product_imgFile_seq.nextval, 1, 'xxx.png','xxxx.png');
--drop sequence product_imgFile_seq;
--select * from product_imgFile;
--drop table product_imgFile cascade constraint purge;
==========================================================================================================================
-- 상품 댓글
create table product_review(	
	review_number number(9) primary key,
	product_number number(5) not null,
	constraint fk_product_review foreign key(product_number) references product(product_number) on delete cascade,
	writer_id varchar2(50 char) not null,
	write_time date
)

create sequence product_review_seq;
insert into product_review values (product_review_seq.nextval,1,'asdf',sysdate);
drop sequence product_review_seq;
select * from product_review;
drop table product_review;
==========================================================================================================================
-- 장바구니
create table cart(
	cart_number number(9)primary key,
	product_number number(5) not null,
	constraint fk_cart foreign key(product_number) references product(product_number) on delete cascade,
	user_id varchar2(50 char) not null,
	product_count number(5) not null
)

create sequence cart_seq;
insert into cart values(cart_seq.nextval,1,'asdf',3);
drop sequence cart_seq;
select * from cart;
drop table cart cascade constraint purge;
==========================================================================================================================
-- 주문
create table user_order(
	order_number number(9) primary key,
	user_id varchar2(50 char) not null,
	constraint fk_user_order foreign key(user_id) references s_member(m_id) on delete cascade,
	order_date date,
	order_address varchar2(200 char)not null,
	receiver_name varchar2(30 char)not null,
	receiver_phone varchar2(30 char)not null
)

create sequence user_order_seq;
insert into user_order values(user_order_seq.nextval,'asdf',sysdate,'서울','Cat','010-1234-5678');
drop sequence user_order_seq;
select * from user_order;
drop table user_order cascade constraint purge;
==========================================================================================================================
-- 상세 주문
create table user_order_detail(
	order_detail_number number(9) primary key,
	order_number number(9) not null,
	constraint fk_user_order_detail_1 foreign key (order_number) references user_order(order_number) on delete cascade,
	product_number number(5) not null,
	constraint fk_user_order_detail2 foreign key (product_number) references product(product_number) on delete cascade,
	product_count number(5) not null, -- 수량
	order_detail_status varchar2(20 char) not null, -- 처리상태
	refund_check char(2) not null -- 환불 가능여부 (Y/N)
)

create sequence user_order_detail_seq;
insert into user_order_detail values (user_order_detail_seq.nextval, 1, 1, 10, '배송 중', 'Y');
drop sequence user_order_detail_seq;
select * from user_order_detail;
drop table user_order_detail;
==========================================================================================================================
-- 환불
create table refund(
	refund_number number(9) primary key,
	order_detail_number number(9) not null,
	constraint fk_refund foreign key(order_detail_number) references user_order_detail(order_detail_number) on delete cascade,
	refund_reason varchar2(300 char)not null,
	refund_img varchar2(300 char)not null,
	user_email varchar2(50 char) not null
)

create sequence refund_seq;
insert into refund values(refund_seq.nextval, 1, '단순변심', 'xxx.img', 'asdf@naver,com');
drop sequence refund_seq;
select * from refund;
drop table refund;
==========================================================================================================================
-- 결제방식
create table payment_plan(
	pp_id number(2) primary key,
	pp_plan varchar2(30 char) not null
)

create sequence payment_plan_seq;
insert into payment_plan values(payment_plan_seq.nextval,'무통장 입금');
insert into payment_plan values(payment_plan_seq.nextval,'카드 결제');
drop sequence payment_plan_seq;
select * from payment_plan order by pp_id;
drop table payment_plan;
==========================================================================================================================
-- 무통장 입금
create table pay_bank(
	account_number varchar2(30 char)primary key,
	pp_id number(2) not null,
	constraint fk_pay_bank foreign key (pp_id) references payment_plan(pp_id) on delete cascade,
	bank_name varchar2(20 char)not null, -- 은행 이름
	bank_code number(3) not null, -- 은행 코드
	order_price number(9) not null, -- 주문 금액
	deposit_price number(9) not null, -- 입금 금액 << 기존값 0으로 고정
	deposit_date varchar2(30 char) not null, -- 입금 일시 << 이거 date로 바꿀 예정입니다 건들지 말아주세요
	validity_date varchar2(30 char) not null, -- 입금 유효 기간 << 마찬가지
	payment_status char(2) not null -- 결제상태
)

insert into pay_bank values('1002-123-123456',1,'우리은행',020,10000,5000,'2023-01-20 14:39:02','2023-01-21 14:39:02','N');
select * from pay_bank;
drop table pay_bank;
==========================================================================================================================
-- 카드 결제
create table pay_card(
	card_number varchar2(30 char) not null,
	pp_id number(2) not null,
	constraint fk_pay_card foreign key(pp_id) references payment_plan(pp_id) on delete cascade,
	card_company varchar2(20 char) not null,
	card_company_code number(2) not null,
	order_price number(9) not null, -- 주문 금액
	payment_money number(9) not null, -- 결제 금액 << 기존값 0으로 고정
	payment_date date not null, -- 결제 날짜
	payment_status char(2) not null -- 결제상태
)

insert into pay_card values('1111-2222-3333-4444', 2, '우리', 15, 50000, 50000, sysdate, 'Y');
select * from pay_card;
==========================================================================================================================
-- 업체 테이블 생성
create table company_member(
    company_number number(5) primary key,
    company_name varchar2(50 char)not null,
    country_id varchar2(10 char),
    company_introduce varchar2(300 char)not null
);
select * from company_member order by company_number;
select company_number,
company_name,
country_id,
company_introduce
from company_member
order by company_number;
create sequence company_member_seq
  INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
    NOORDER;
drop sequence company_member_seq;
drop table company_member cascade constraint purge;
--업체 테이블 데이터 삽입
insert into company_member values(company_member_seq.nextval, '무신사', '01','업체 소개 입니다');
insert into company_member values(company_member_seq.nextval, '나이키', '02','업체 소개 입니다');
insert into company_member values(company_member_seq.nextval, '미쏘', '01','업체 소개 입니다',sysdate);
insert into company_member values(company_member_seq.nextval, '유니클로', '02','업체 소개 입니다',sysdate);
insert into company_member values(company_member_seq.nextval, '아디다스', '02','업체 소개 입니다',sysdate);

--삽입 날짜
alter table company_member add regDate date default sysdate;

--수정 날짜
alter table company_member add updateDate date default sysdate;

insert into company_member(companyNumber, companyName, nationId, companyIntro) values(company_member_seq.nextval, '쇼핑몰', '01', '업체소개');

==========================================================================================================================

-- 고객센터 게시글
create table voc(
	v_no number(4) primary key,
	v_owner varchar2(10 char) not null,
	v_txt varchar2(300 char) not null,
	v_when date not null,
	v_color char(7) not null
);

create sequence voc_seq;

select * from voc;

-- 고객센터 댓글
create table voc_reply (
	vr_no number(5) primary key,
	vr_v_no number(4) not null,
	vr_owner varchar2(10 char) not null,
	vr_txt varchar2(200 char) not null,
	vr_when date not null,
	constraint voc_reply1
		foreign key (vr_v_no) references voc(v_no)
		on delete cascade
);

create sequence voc_reply_seq;

-- 고객센터 게시글 목록
create table voc_board(
	b_no number(5) primary key,
	b_title varchar2(150 char) not null,
	b_content varchar2(2000 char) not null,
	b_writer varchar2(50 char) not null,
	b_regdate date not null,
	b_updatedate date not null,
	constraint voc_board1 
		foreign key (b_no) references voc(v_no)
		on delete cascade
);

create sequence voc_board_seq;

insert into voc_board values(voc_board_seq.nextval, '테스트제목', '테스트내용', '작가', sysdate, sysdate);

select * from voc;
drop table voc;
drop sequence voc_board_seq;
