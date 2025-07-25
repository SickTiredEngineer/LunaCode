use c2d2505t1p1;
show tables;

/* GROUP CODE */
drop table group_code;

create table group_code(
	group_idx int primary key auto_increment,
    group_code varchar(30) unique,
    -- group_name varchar(30) unique,
    group_desc varchar(300),
    is_using boolean default true,
    create_date datetime default now(),
    creater_idx int,
    update_date datetime,
    updater_idx int,
    
    foreign key(creater_idx) references member(idx),
	foreign key(updater_idx) references member(idx)
);

-- alter table group_code add foreign key(creater_idx) references member(idx);
-- alter table group_code add foreign key(updater_idx) references member(idx);

-- 데이터 설명충
desc group_code;

-- 전체 데이터 출력
select * from group_code;

-- 데이터 초기화용
delete from group_code;

-- insert example group
insert into group_code(
	group_code, group_desc, is_using, create_date, creater_idx
) values
("MEMBER_TYPE", "멤버 타입을 모아두는 그룹입니다.", true, now(), null),
("CLASS_TYPE", "강의 방식을 모아두는 그룹입니다.", true, now(), null),
("BOARD_TYPE", "게시판 타입을 모아두는 그룹입니다.", true, now(), null),
("CLASS_CATEGORY", "강의 카테고리를 모아두는 그룹입니다.", true, now(), null),
("SUPPORT_CATEGORY", "문의 카테고리를 모아두는 그룹입니다.", true, now(), null),
("CLASS_LEVEL", "강의 난이도를 모아두는 그룹입니다.", true, now(), null),
("MAIN_CATEGORY", "메인 화면에서 보여주는 카테고리들을 모아두는 그룹입니다.", true, now(), null),
("CLASS_LIMIT", "강의 제한 인원을 모아두는 그룹입니다.", true, now(), null),
("CLASS_REVIEW", "강의 후기 표현을 모아두는 그룹입니다.", true, now(), null),
("ADMIN_CATEGORY", "관리자 페이지 카테고리를 모아두는 그룹입니다.", true, now(), null),
("MEMBER_STATE", "회원 계정 상태를 모아두는 그룹입니다.", true, now(), null);

insert into group_code(
	group_code, group_desc, is_using, create_date, creater_idx
) values
("QUIZE_RESULT", "퀴즈 정답 결과 상태를 저장하는 그룹입니다.", true, now(), null);




