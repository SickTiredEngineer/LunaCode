use c2d2505t1p1;
show tables;

drop table episode_attachment;

create table episode_attachment(
	attachment_idx int primary key auto_increment, 
	episode_idx int,
	attachment_url varchar(300),
	uploade_date datetime default now(),
    
    foreign key(episode_idx) references class_episode(episode_idx)
);

-- 설명충
desc episode_attachment;

-- 전체 데이터 출력
select * from episode_attachment;

-- 데이터 초기화용
-- delete from episode_attachment;

insert into episode_attachment(
	episode_idx,
	attachment_url,
	uploade_date
)values
(4, 'File Path', default),
(5, 'File Path', default),
(6, 'File Path', default);