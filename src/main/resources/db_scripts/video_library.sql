use c2d2505t1p1;
show tables;

drop table video_library;

create table video_library(
	video_idx int primary key auto_increment,
	uploader_idx int,
	video_name varchar(100),
	video_path varchar(300)
    
    -- foreign key(uploader_idx) references member(idx)-- 
);

-- 데이터 설명충
desc video_library;

-- 전체 데이터 조회
select * from video_library;

-- 데이터 초기화용
delete from video_library;

insert into video_library(
	uploader_idx,
	video_name,
	video_path
)values(
	1,
    'Something Name',
    'Video/Videos/Molu'
);