use c2d2505t1p1;
show tables;

/* -------------------------------------------- */
/* member (회원) 테이블 */
drop table member;

create table member(
	idx int primary key auto_increment,
    user_id varchar(30) unique,
    user_name varchar(30),
    nickname varchar(30) unique, 
    password varchar(100),
    email varchar(100) unique,
    phone char(11) unique,
    profile_img varchar(300),
    bio text,
    github_url varchar(300),
    attendance_count int default 1,
    attendance_consecutive int default 1,
    attendance_last datetime default now(),
    member_type int,
    certificate_01 varchar(300),
	certificate_02 varchar(300),
	certificate_03 varchar(300)
);

-- 데이터 설명충
desc member;

-- 전체 데이터 조회
select * from member;

-- 데이터 초기화용
delete from member;

-- member insert sql scripts
insert into member(
	user_id,
	user_name,
	nickname,
	password,
	email,
	phone,
	profile_img,
	bio,
    birth,
	github_url,
	attendance_count,
	attendance_consecutive,
	attendance_last,
	member_type,
	certificate_01,
    certificate_02,
    certificate_03
)values('meme', 'KOO', 'KOOKOO', 'asdfqwer12', 'kookoo@gmail.com', '01055225352', '', '', '1999-01-01', '', 1, 1, now(), 'MB03', null, null, null);

update member set profile_img = null;
alter table member add birth date;

alter table member rename column certificate to certificate_01; 

alter table member add certificate_02 varchar(300);
alter table member add certificate_03 varchar(300);


-- 아이디 중복 검사 쿼리문 예시 
with tmp_cnt as(
	select count(*) as cnt from member where user_id = "admin"	
)select case when cnt =  1 then '중복된 아이디입니다.' else '사용 가능한 아이디입니다.' end as text,
case when cnt = 1 then '#FF0000' else ' #839FD1' end as color,
case when cnt = 1 then true else false end as dupResult from tmp_cnt;

-- 닉네임 중복 검사 쿼리문 예시
with tmp_cnt as(
	select count(*) as cnt from member where nickname = "KOOS"	
)select case when cnt =  1 then '중복된 닉네임입니다.' else '사용 가능한 닉네임입니다.' end as text,
case when cnt = 1 then '#FF0000' else ' #839FD1' end as color,
case when cnt = 1 then true else false end as dupResult from tmp_cnt;

-- common_code reference type int -> varchar
alter table member modify column member_type varchar(30);
-- update common code
update member set member_type = 'MB01';




