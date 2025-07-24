use c2d2505t1p1;
show tables;

drop table comment;

create table comment(
	comment_idx int primary key auto_increment,
    post_idx int,
    author_id int,
    content text,
    create_date datetime default now(),
    update_date datetime,
    parend_id int,
    like_count int default 0
);

-- 데이터 설명충
desc comment;

-- 전체 데이터 조회
select * from comment;

-- 데이터 초기화용
delete from comment;