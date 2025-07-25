use c2d2505t1p1;
show tables;

drop table class_episode;

create table class_episode(
	episode_idx int primary key auto_increment,
	session_idx int,
	episode_name varchar(100),
	episode_index int,
    episode_video_path int default null,
    
    foreign key(session_idx) references class_session(session_idx),
    foreign key(episode_video_path) references video_library(video_idx)
);

-- 데이터 설명충
desc class_episode;

-- 전체 데이터 조회
select * from class_episode;

-- 데이터 초기화용
delete from class_episode;

insert into class_episode(
	session_idx,
	episode_name,
	episode_index
)values
(5,'First Episode',1),
(5,'Second Episode',2),
(5,'Third Episode',3);




