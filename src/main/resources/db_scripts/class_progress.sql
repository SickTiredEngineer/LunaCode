use c2d2505t1p1;
show tables;

/* 수강 이력 정보 (class_progress) */
drop table class_progress;

create table class_progress (
	progress_idx int primary key auto_increment,
    user_idx int not null,
    episode_idx int not null,
    watched_date datetime not null default current_timestamp,
    foreign key (user_idx) references member(idx),
    foreign key (episode_idx) references class_episode(episode_idx),
    unique key (user_idx, episode_idx)
);

-- 데이터 설명
desc class_progress;

-- 전체 데이터 조회
select * from class_progress;

-- 데이터 초기화
delete from class_progress;