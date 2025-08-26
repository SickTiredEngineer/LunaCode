use c2d2505t1p1;
show tables;

drop table customer_query;

create table customer_query(
	query_idx int primary key auto_increment,
    user_idx int,
    query_category varchar(100) not null default '기타',
	attachment varchar(300),
	answer_status boolean default false,
	query_subject varchar(100),
	query_content text,
	query_date timestamp default current_timestamp,
    is_update boolean default false,
    update_date timestamp default null,
    
    foreign key(user_idx) references member(idx)
);

alter table customer_query add column is_update boolean default false, 
add column update_date timestamp default null;

alter table customer_query modify column query_date timestamp default current_timestamp;
alter table customer_query modify columm query_category varchar(100) not null default '기타';

-- 설명충
desc customer_query;

-- 전체 데이터 출력
select * from customer_query;

-- 데이터 초기화용
-- delete from customer_query;


insert into customer_query(
	user_idx,
	query_category,
	query_subject,
	query_content
)values(30, '기타', '문의 사항 Tes1', '질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문'),
(30, '환불', '문의 사항 Tes2', '질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문'),
(30, '에러', '문의 사항 Tes3', '질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문'),
(30, '계정', '문의 사항 Tes4', '질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문');


insert into customer_query(
	user_idx,
	query_category,
    answer_status,
	query_subject,
	query_content
)values(30, '기타', true, '문의 사항 ', '질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문');