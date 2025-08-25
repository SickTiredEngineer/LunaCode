use c2d2505t1p1;
show tables;

drop table comment;

create table comment(
	comment_idx int primary key auto_increment,
    post_idx int,
    author_idx int,
    content text,
    create_date datetime default now(),
    update_date datetime,
    parent_idx int default null
    -- like_count int default 0
);

alter table comment rename column author_id to author_idx;
alter table comment rename column parend_idx to parent_idx;
alter table comment drop column like_count;

alter table comment add column is_update boolean default null;

-- 데이터 설명충
desc comment;

-- 전체 데이터 조회
select * from comment;

-- 데이터 초기화용
delete from comment;