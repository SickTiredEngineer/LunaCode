use c2d2505t1p1;
show tables;

drop table playlist;

create table playlist(
	playlist_idx int primary key auto_increment,
	user_idx int, 
	playlist_name varchar(100),
	create_date datetime default now(),
	update_date datetime default null,
	
    foreign key(user_idx) references member(idx)
);

-- 데이터 설명충
desc playlist;

-- 전체 데이터 조회
select * from playlist;

-- 데이터 초기화용
delete from playlist;

insert into playlist(
	user_idx,
	playlist_name,
	create_date
)values
(1, 'my playlist', now()),
(3, 'YOUR playlist', now());
