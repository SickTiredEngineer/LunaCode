use c2d2505t1p1;
show tables;


/* 강의 공지(class_answers) */
drop table class_answers;

create table class_answers(
   answers_idx int primary key auto_increment,
   qna_idx int,
   answer text,
   answer_date datetime default now(),
   
   foreign key(qna_idx) references class_questions(qna_idx)
);

-- 데이터 설명충
desc class_answers;

-- 전체 데이터 조회
select * from class_answers;

-- 데이터 초기화용
delete from class_answers;

-- Example Data
insert into class_answers
(
	qna_idx,
	answer,
	answer_date
)  values
(1, '답변', default);