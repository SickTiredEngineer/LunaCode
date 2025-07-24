use c2d2505t1p1;
show tables;


/* 강의(Class) */
drop table class;

create table class(
	class_idx int primary key auto_increment,
    class_title varchar(100) unique,
    class_time int default 0,
    class_type varchar(30),
    create_date datetime default now(),
    class_thumbnail varchar(300),
    class_intro varchar(300),
    class_content text,
    class_price int,
    class_category int,
    class_level varchar(30),
    total_lessons int
);

-- 데이터 설명충
desc class;

-- 전체 데이터 조회
select * from class;

-- 데이터 초기화용
delete from class;

-- Example Data
insert into class(
	class_title,
    class_time,
    class_type,
    create_date,
    class_thumbnail,
    class_intro,
    class_content,
    class_price,
    class_category,
    class_level,
    total_lessons
)values(
	'컴퓨터 비전 입문',
     10,
     2,
     default,
     'Somethings File Path',
     'Vision Class Intro',
     'Contents',
     100000,
     8,
     10,
     12
),(
	'인공지능 심화반',
     5,
     4,
     default,
     'Somethings File Path',
     'AI Class Intro',
     'Contents',
     50000,
     7,
     12,
     15
);





