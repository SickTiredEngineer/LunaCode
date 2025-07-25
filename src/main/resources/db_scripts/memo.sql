use c2d2505t1p1;
show tables;

drop table class_memo;

create table class_memo(
	memo_idx int primary key auto_increment,
	session_idx int,
    user_idx int,
	memo text,
    
    foreign key(user_idx) references member(idx),
    foreign key(session_idx) references class_session(session_idx)
);

-- 설명충
desc class_memo;

-- 전체 데이터 출력
select * from class_memo;

-- 데이터 초기화용
-- delete from class_memo;

insert into class_memo(
	session_idx ,
    user_idx,
	memo
)values
(5,1,'Something Memo'),
(6,1,'Something Memo'),
(7,3,'Something Memo'),
(7,3,'Something Memo');