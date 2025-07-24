use c2d2505t1p1;
show tables;

drop table profile;

create table profile(
	profile_idx int primary key auto_increment,
    user_idx int,
    profile_img varchar(300),
    bio text,
    github_url varchar(300),
    attendance_count int default 0,
    attendance_consecutive int default 0,
    attendance_last datetime
    
    -- foreign key(user_idx) references member(idx)
);

-- 데이터 설명충
desc profile;

-- 전체 데이터 조회
select * from profile;

-- 데이터 초기화용
delete from profile;

insert into profile(
	user_idx,
	profile_img,
	bio,
	github_url,
	attendance_count,
	attendance_consecutive,
	attendance_last
)values(
	1,
	'Image Path',
    'Let me Introduce my Self',
    'Someone\'s github url',
    10,
    3,
    now()
);


