use c2d2505t1p1;
show tables;

create table like_record(
	like_idx int primary key auto_increment,
    user_idx int,
    post_idx int
);

desc like_record;

-- 전체 데이터 조회
select * from attachment;

-- 데이터 초기화용
delete from attachment;
