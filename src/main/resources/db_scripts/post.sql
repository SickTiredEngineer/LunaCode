use c2d2505t1p1;
show tables;

drop table post;

alter table post 
modify created_date timestamp default now(),
modify update_date timestamp default null;


alter table post rename column board_idx to board_code;

alter table post modify board_code varchar(64); 
update post set board_code = 'BD01';

create table post(
	post_idx int primary key auto_increment,
    board_code varchar(64),
    title varchar(50),
    content text,
	author_idx int,
    created_date datetime default NOW(),
    update_date datetime default null,
    is_update boolean default false,
    view_count int not null default 0,
    
    foreign key(board_code) references common_code(code),
    foreign key(author_idx) references member(idx)
);

-- 데이터 설명충
desc post;

-- 전체 데이터 조회
select * from post;

-- 데이터 초기화용
delete from post;

alter table post rename column author_id to author_idx;

-- 이거 그냥 like_record 에서 count로 가져오자
alter table post drop column like_count;

insert into post(
	board_code,
	title,
	content,
	author_idx,
	created_date,
	view_count
)values
('BD01', '게시글 1', '게시글 내용1', 1, default, 5550),
('BD01', '게시글 2', '게시글 내용2', 2, default, 21),
('BD01', '게시글 3', '게시글 내용3', 3, default, 300);
