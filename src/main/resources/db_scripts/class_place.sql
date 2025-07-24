use c2d2505t1p1;
show tables;

drop table class_place;

create table class_place(
	time_idx int primary key auto_increment,
    class_idx int,
    class_place varchar(300)
    
    -- foreign key(class_idx) references class(class_idx)
);

-- 설명충
desc class_time;

-- 전체 데이터 출력
select * from class_time;

-- 데이터 초기화용
-- delete from class_time;

insert into class_place(
class_idx,
class_place)
values(
	1,
    '이 세상 어딘가 구석탱이'
);