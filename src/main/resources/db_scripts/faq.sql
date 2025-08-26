use c2d2505t1p1;
show tables;

drop table faq;

create table faq(
	faq_idx int primary key auto_increment,
	admin_idx int,
	attachment varchar(300),
	faq_subject varchar(100),
	faq_content text,
	faq_date timestamp default current_timestamp,
    category varchar(100) not null,
    
    foreign key(admin_idx) references member(idx)
);

alter table faq modify column faq_date timestamp default current_timestamp;
alter table faq add column category varchar(100) not null;
update faq set category = '기타';


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

insert into faq(
	admin_idx,
	faq_subject,
	faq_content,
	faq_date,
    category
)values
(30,'이거 어떻게 하는거에요?','나도 모르겠어요.',default, "결제"),
(30,'저거 어떻게 하는거에요?','나도 모르겠어요.',default, "환불"),
(30,'요거 어떻게 하는거에요?','나도 모르겠어요.',default, "강의"),
(30,'너는 뭐하는거에요?','나도 모르겠어요.',default, "계정"),
(30,'나는 누구에요?','나도 모르겠어요.',default, "에러")


