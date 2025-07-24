use c2d2505t1p1;
show tables;

drop table class_session;

create table class_session(
	session_idx int primary key auto_increment,
	class_idx int,
	session_name varchar(100),
	session_index int default 0
    
    -- foreign key(class_idx) references class(class_idx)
);

-- 데이터 설명충
desc class_session;

-- 전체 데이터 조회
select * from class_session;

-- 데이터 초기화용
delete from class_session;

insert into class_session(
	class_idx,
	session_name,
	session_index
)values(
	1,
    'First Session',
    1
);
