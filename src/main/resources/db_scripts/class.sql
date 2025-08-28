use c2d2505t1p1;
show tables;

/* GROUP CODE */
-- drop table class;

create table class(
	class_idx int primary key auto_increment,
    instructor_idx int,
    class_title varchar(100),
    class_time datetime,
    class_type varchar(10),
    create_date timestamp default current_timestamp,
    class_thumbnail varchar(300),
    class_intro varchar(300),
	class_content text,
	class_price int,
	class_category varchar(50),
	class_level varchar(10),
	total_lessons int,
	url varchar(300),
    accept_status varchar(100)
);

alter table class add column accept_status varchar(100) default 'CS02';
alter table class add column deny_reason varchar(100) default '수업 자료 검토가 필요합니다.';

-- 데이터 설명충
desc class;

-- 전체 데이터 출력
select * from class;

-- 데이터 초기화용
-- delete from class;




