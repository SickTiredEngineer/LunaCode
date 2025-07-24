use c2d2505t1p1;
show tables;

drop table playlist_item;

create table playlist_item(
	item_idx int primary key auto_increment,
	episode_idx int,
	playlist_order int
    
    -- foreign key(episode_idx) references class_episode(episode_idx)
);

-- 데이터 설명충
desc playlist_item;

-- 전체 데이터 조회
select * from playlist_item;

-- 데이터 초기화용
delete from playlist_item;

insert into playlist_item(
	episode_idx,
	playlist_order
)values(
	1,
    1
);