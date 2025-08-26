use c2d2505t1p1;
show tables;

/* 수강 신청 정보 (class_enrollment) */
drop table class_enrollment;

create table class_enrollment (
    enrollment_idx int primary key auto_increment,
    user_idx int not null,
    class_idx int not null,
    is_completed boolean not null default false,
    enroll_date datetime not null default current_timestamp,
    foreign key (user_idx) references member(idx),
    foreign key (class_idx) references class(class_idx),
    unique key (user_idx, class_idx)
);

-- 데이터 설명
desc class_enrollment;

-- 전체 데이터 조회
select * from class_enrollment;

-- 데이터 초기화
delete from class_enrollment;
