use c2d2505t1p1;
show tables;

drop table customer_query;

create table customer_query(
	query_idx int primary key auto_increment,
    user_idx int,
    query_category int,
	attachment varchar(300),
	answer_status boolean default false,
	query_subject varchar(100),
	query_content text,
	query_date datetime default now(),
    
    foreign key(user_idx) references member(idx)
    
);

-- 설명충
desc customer_query;

-- 전체 데이터 출력
select * from customer_query;

-- 데이터 초기화용
-- delete from customer_query;

insert into customer_query(
	user_idx,
	query_category,
	attachment,
	answer_status,
	query_subject,
	query_content,
	query_date
)values(
	1,
    1,
    'Something files path',
    default,
    '살려주세요우',
    '뻥인데 호호홍',
	default
);


