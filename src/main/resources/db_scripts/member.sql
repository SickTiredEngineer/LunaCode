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
    certificate varchar(300),
    terms_agree boolean default false
);

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
	certificate,
	terms_agree
)
values
("admin", "KOO", "KOOS", 1234, 'koo123123123@naver.com', '01012345678', 'Profile Image Path', 'My Bio', 'url', 1, 1, now(), 1, null, true),
("parkInst", "Park", "peacher", 1234, 'parkpark@naver.com', '0101332237', 'Profile Image Path', 'My Bio', 'url', 1, 1, now(), 2, null, true),
("anNormal", "an", "ansNormal", 1234, 'aaaannn112233@naver.com', '01099990000', 'Profile Image Path', 'My Bio', 'url', 1, 1, now(), 3, null, true);




