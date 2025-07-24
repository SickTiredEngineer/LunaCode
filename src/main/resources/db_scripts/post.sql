use c2d2505t1p1;
show tables;

drop table post;

create table post(
	post_idx int primary key auto_increment,
    board_idx int,
    title varchar(50),
    content text,
	author_id int,
    created_date datetime default NOW(),
    update_date datetime,
    is_update boolean default false,
    attachment varchar(500),
    like_count int not null default 0,
    view_count int not null default 0
);

-- 데이터 설명충
desc post;

-- 전체 데이터 조회
select * from post;

-- 데이터 초기화용
delete from post;