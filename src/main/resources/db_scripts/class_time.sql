use c2d2505t1p1;
show tables;

drop table class_time;

create table class_time(
	time_idx int primary key auto_increment,
    class_idx int,
    class_time datetime

    -- foreign key(class_idx) references class(class_idx)    
);

-- 설명충
desc class_time;

-- 전체 데이터 출력
select * from class_time;

-- 데이터 초기화용
-- delete from class_time;

insert into class_time(
class_idx,
class_time)
values(
	1,
    now()
);