use c2d2505t1p1;
show tables;

create table like_record(
	like_idx int primary key auto_increment,
    user_idx int,
    post_idx int,
    CONSTRAINT uk_like UNIQUE (user_idx, post_idx)
);

desc like_record;

ALTER TABLE like_record
  ADD CONSTRAINT uk_like UNIQUE (user_idx, post_idx);

select * from like_record;


with tmp_like as(
	select count(*) as count,
	exists(select * from like_record where (user_idx = 1 and post_idx = 1)) as result
	from like_record where post_idx = 1
)select count, 
	case when result = 1 then 'true' else 'false' end  as dup_res,
    case when result = 1 then '#839FD1' else '#F2F4F8' end as bg_color
    from tmp_like;
    

select count(*) as count, 
exists(select * from like_record where (user_idx = 1 and post_idx = 1)) as result
from like_record where post_idx =  1;		
			
		
-- from like_record where post_idx = #{post_idx}






insert into like_record(user_idx, post_idx) values(1, 1);
insert into like_record(user_idx, post_idx) values(1, 2);
insert into like_record(user_idx, post_idx) values(1, 3);
insert into like_record(user_idx, post_idx) values(1, 4);

insert into like_record(user_idx, post_idx) values(2, 1);
insert into like_record(user_idx, post_idx) values(2, 2);
insert into like_record(user_idx, post_idx) values(2, 3);

insert into like_record(user_idx, post_idx) values(27, 1);
insert into like_record(user_idx, post_idx) values(27, 2);


-- 데이터 초기화용
delete from attachment;
