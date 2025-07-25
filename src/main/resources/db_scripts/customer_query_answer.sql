use c2d2505t1p1;
show tables;

drop table customer_query_answer;

create table customer_query_answer(
	answer_idx int primary key auto_increment,
    query_idx int,
    admin_idx int,
    attachment varchar(300),
    answer_subject varchar(100),
	answer_content text,
	answer_date datetime default now(),
    
    foreign key(query_idx) references customer_query(query_idx),
    foreign key(admin_idx) references member(idx)
);

-- 설명충
desc customer_query_answer;

-- 전체 데이터 출력
select * from customer_query_answer;

-- 데이터 초기화용
-- delete from customer_query_answer;

insert into customer_query_answer(
	query_idx,
	admin_idx,
	attachment,
	answer_subject,
	answer_content,
	answer_date
)values
(1,1,'Attachment Path','사는 방법 알려드릴게요.','응 없어 ㅋ',default);