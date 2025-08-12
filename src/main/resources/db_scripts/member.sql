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
    attendance_count int,
    attendance_consecutive int,
    attendance_last datetime,
    member_type int,
    certificate_01 varchar(300),
	certificate_02 varchar(300),
	certificate_03 varchar(300),
)
;





-- 데이터 설명충
desc member;

-- 전체 데이터 조회
select * from member;

-- 데이터 초기화용
delete from member;

-- example data
insert into member(
	user_id,
	user_name,
	nickname,
	password,
	email,
	phone,
	profile_img,
	bio,
	github_url,
	attendance_count,
	attendance_consecutive,
	attendance_last,
	member_type,
	certificate
)
values
("admin", "KOO", "KOOS", 1234, 'koo123123123@naver.com', '01012345678', null, 'My Bio', 'url', 1, 1, now(), 1, null, true),
("parkInst", "Park", "peacher", 1234, 'parkpark@naver.com', '0101332237', null, 'My Bio', 'url', 1, 1, now(), 2, null, true),
("anNormal", "an", "ansNormal", 1234, 'aaaannn112233@naver.com', '01099990000', null, 'My Bio', 'url', 1, 1, now(), 3, null, true);


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






