use c2d2505t1p1;
show tables;

/* 공지사항 테이블 */
drop table notice;

create table notice(
    notice_idx int primary key auto_increment,
	admin_idx int,
	attachment varchar(300),
	notice_subject varchar(100),
	notice_content text,
	notice_date datetime default now()
    
    -- foreign key(admin_idx) references member(idx)
);

-- 설명충
desc notice;

-- 전체 데이터 출력
select * from notice;

-- 데이터 초기화용
-- delete from notice;

insert into notice(
	admin_idx,
	attachment,
	notice_subject,
	notice_content,
	notice_date
)values(
	1,
    'Something file path',
    '여러분께 알립니다.',
    '뻥입니다.',
    default
);
