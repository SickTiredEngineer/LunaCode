use c2d2505t1p1;
show tables;


/* 강의 퀴즈(class_quize) */
drop table class_quize;

create table class_quize(
    quize_idx int primary key auto_increment,
    session_idx int,
    quize_content text,
    quize_answer text,
    quize_desc text,
    
	foreign key(session_idx) REFERENCES class_session(session_idx)
);

-- 데이터 설명충
desc class_quize;

-- 전체 데이터 조회
select * from class_quize;

-- Example Data
insert into class_quize(
	session_idx,
	quize_content,
	quize_answer,
	quize_desc
)values
(5, '이거는 뭘 뜻하는걸까요?', '몰루', '대충 해설'),
(6, '이거는 뭘 뜻하는걸까요?', '몰루', '대충 해설'),
(7, '이거는 뭘 뜻하는걸까요?', '몰루', '대충 해설');



