use c2d2505t1p1;
show tables;

/* -------------------------------------------- */
/* attendance_history (출석 기록) 테이블 */
drop table attendance_history;

create table attendance_history (
    history_idx int not null auto_increment,
    user_id varchar(30) not null,
    attendance_date date not null,
    primary key (history_idx),
    foreign key (user_id) references member(user_id),
    UNIQUE KEY (user_id, attendance_date)
);

-- 데이터 설명충
desc attendance_history;

-- 전체 데이터 조회
select * from attendance_history;


-- 데이터 초기화용
delete from attendance_history;
