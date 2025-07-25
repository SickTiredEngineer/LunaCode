use c2d2505t1p1;
show tables;


/* 강의 공지(class_notice) */
drop table class_notice;

create table class_notice(
   notice_idx int primary key auto_increment,
   class_idx int,
   title varchar(300),
   content text,
   create_date datetime default now(),
   update_date datetime default null,
   
   foreign key (class_idx) references class(class_idx)
);

-- 데이터 설명충
desc class_notice;

-- 전체 데이터 조회
select * from class_notice;

-- 데이터 초기화용
delete from class_notice;

-- Example Data
insert into class_notice
(
   class_idx ,
   title ,
   content ,
   create_date 
)  values
(1, '공지 제목1', '공지 내용', default),
(1, '공지 제목2', '공지 내용', default),
(1, '공지 제목3', '공지 내용', default);