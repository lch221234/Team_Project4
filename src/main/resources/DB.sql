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

select * from s_member;

drop table s_member cascade constraint purge;


