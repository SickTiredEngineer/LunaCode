use c2d2505t1p1;
show tables;


/* 강의 퀴즈(class_quize) */
drop table class_quiz_answer;

create table class_quiz_answer(
    answer_idx int primary key auto_increment,
    quize_idx int,
    quize_answer text,
    answer_check int,
    
	foreign key(quize_idx) references class_quize(quize_idx),
    foreign key(answer_check) references common_code(common_idx)
);

-- 데이터 설명충
desc class_quiz_answer;

-- 전체 데이터 조회
select * from class_quiz_answer;

-- Example Data
insert into class_quiz_answer(
	quize_idx,
	quize_answer,
	answer_check
)values
(7, '내가아노?', 57),
(8, '내가아노?', 58),
(9, '내가아노?', 59);



