use c2d2505t1p1;
show tables;

/* 공통 코드 활용 시, 해당 테이블이 필요 없을 수 있음 */
drop table board;

create table board(
	board_idx int primary key auto_increment,
    board_name varchar(50),
    board_desc varchar(300)
);

-- 데이터 설명충
desc board;

-- 전체 데이터 조회
select * from board;

-- 데이터 초기화용
delete from board;