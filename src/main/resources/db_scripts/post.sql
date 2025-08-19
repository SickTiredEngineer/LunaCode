use c2d2505t1p1;
show tables;

drop table post;

create table post(
	post_idx int primary key auto_increment,
    board_idx int,
    title varchar(50),
    content text,
	author_id int,
    created_date datetime default NOW(),
    update_date datetime default null,
    is_update boolean default false,
    view_count int not null default 0,
    
    foreign key(board_idx) references common_code(common_idx),
    foreign key(author_id) references member(idx)
);

-- 데이터 설명충
desc post;

-- 전체 데이터 조회
select * from post;

-- 데이터 초기화용
delete from post;

-- 이거 그냥 like_record 에서 count로 가져오자
alter table post drop column like_count;

insert into post(
	board_idx,
	title,
	content,
	author_id,
	created_date,
    like_count,
	view_count
)values
(7, '게시글 1', '게시글 내용1', 1, default, 10, 0),
(8, '게시글 2', '게시글 내용2', 2, default, 0, 0),
(9, '게시글 3', '게시글 내용3', 3, default, 0, 0)
