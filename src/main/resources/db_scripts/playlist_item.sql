use c2d2505t1p1;
show tables;

drop table playlist_item;

create table playlist_item(
	item_idx int primary key auto_increment,
	video_idx int,
	play_order int,
    
    foreign key(video_idx) references video_library(video_idx)
);

-- 데이터 설명충
desc playlist_item;

-- 전체 데이터 조회
select * from playlist_item;

-- 데이터 초기화용
delete from playlist_item;

insert into playlist_item(
	video_idx,
    playlist_idx,
	play_order
)
values(1, 1, 1);

--  playlist_item 테이블에 playlist_idx 컬럼을 추가하고 외래 키로 설정
alter table playlist_item
add column playlist_idx int not null after item_idx,
add foreign key(playlist_idx) references playlist(playlist_idx) on delete cascade;
