create table s_member(
	m_id varchar2(30 char) primary key,
	m_pw varchar2(30 char) not null,
	m_name varchar2(10 char) not null,
	m_address varchar2(200 char) not null,
	m_grade varchar2(10 char),
	m_money number(10),
	m_point number(6)
)

insert into s_member values('asdf','asdf1234!','테스트','봉은사로119','등급', 100000, 100);

select * from s_member;

drop table s_member cascade constraint purge;


