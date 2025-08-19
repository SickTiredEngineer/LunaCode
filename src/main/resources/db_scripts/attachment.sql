use c2d2505t1p1;
show tables;

/* -------------------------------------------- */
/* 첨부파일 테이블 */
drop table attachment;

create table attachment(
	attachment_idx int primary key auto_increment,
    attachment_type varchar(64),
    owner_idx int, -- > 게시물, 회원, faq , notice 등의 idx
    attachment_path varchar(300),
    
    foreign key(attachment_type) references common_code(code)
);
-- 데이터 설명충
desc attachment;

-- 전체 데이터 조회
select * from attachment;

-- 데이터 초기화용
delete from attachment;


-- 첨부파일 하나로 일단 통일하자
drop table class_attachment;
drop table com_attachment;
drop table episode_attachment;






