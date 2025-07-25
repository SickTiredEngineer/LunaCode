use c2d2505t1p1;
show tables;


/* 강의(Class) */
drop table class;

create table class(
	class_idx int primary key auto_increment,
	instructor_idx int,
	class_title varchar(100),
	class_time datetime,
	class_type int,
	create_date datetime,
	class_thumbnail varchar(300),
	class_intro varchar(300),
	class_content text,
	class_price int,
	class_category int,
	class_level int,
	total_lessons int,
    
    foreign key(instructor_idx) references member(idx),
    foreign key(class_type) references common_code(common_idx),
    foreign key(class_category) references common_code(common_idx),
    foreign key(class_level) references common_code(common_idx)
);

-- 데이터 설명충
desc class;

-- 전체 데이터 조회
select * from class;

-- 데이터 초기화용
delete from class;

-- Example Data
insert into class(
	instructor_idx,
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
)
values(2,'컴퓨터 비전 입문', now(), 5, now(),'Somethings File Path',
'Vision Class Intro', 'Contents', 100000, 28,13,12);






