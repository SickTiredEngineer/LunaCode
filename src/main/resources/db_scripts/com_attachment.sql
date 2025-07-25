use c2d2505t1p1;
show tables;

drop table com_attachment;

create table com_attachment(
	attachment_idx int primary key auto_increment, 
	post_idx int,
	attachment_url varchar(300),
	uploade_date datetime default now(),
    
    foreign key(post_idx) references post(post_idx)
);

-- 설명충
desc com_attachment;

-- 전체 데이터 출력
select * from com_attachment;

-- 데이터 초기화용
-- delete from com_attachment;

insert into com_attachment(
	post_idx,
	attachment_url,
	uploade_date
)values
(1, 'File Path', default),
(2, 'File Path', default),
(3, 'File Path', default);