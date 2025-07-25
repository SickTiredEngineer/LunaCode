use c2d2505t1p1;
show tables;

drop table faq;

create table faq(
	faq_idx int primary key auto_increment,
	admin_idx int,
	attachment varchar(300),
	faq_subject varchar(100),
	faq_content text,
	faq_date datetime default now(),
    
    foreign key(admin_idx) references member(idx)
);

-- 설명충
desc faq;

-- 전체 데이터 출력
select * from faq;

-- 데이터 초기화용
-- delete from faq;

insert into faq(
	admin_idx,
	attachment,
	faq_subject,
	faq_content,
	faq_date
)values
(1,'Something file path','여러분께 알립니다.','뻥입니다.',default);
