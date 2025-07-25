use c2d2505t1p1;
show tables;

drop table class_question;

create table class_question(
	qna_idx int primary key auto_increment,
	class_idx int,
	student_idx int,
    subject varchar(300),
	content text,
	question_date datetime default now(),
    
    foreign key(class_idx) references class(class_idx),
    foreign key(student_idx) references member(idx)
);

-- 데이터 설명충
desc class_question;

-- 전체 데이터 조회
select * from class_question;

-- 데이터 초기화용
delete from class_question;

insert into class_question(
	class_idx,
	student_idx,
	subject,
    content,
	question_date
)values
(1, 3, '질문1', '질문내용', now()),
(1, 3, '질문2', '질문내용', now()),
(1, 3, '질문3', '질문내용', now());

