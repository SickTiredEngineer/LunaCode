use c2d2505t1p1;
show tables;


/* 장바구니 (cart) */
drop table cart;

create table cart(
	cart_idx int primary key auto_increment,
	user_idx int,
	class_idx int, 
	pay_date datetime default now(), 
    foreign key(user_idx) references member(idx),
	foreign key(class_idx) references class(class_idx)
);

-- 데이터 설명충
desc cart;

-- 전체 데이터 조회
select * from cart;

-- 데이터 초기화용
delete from cart;

-- Example Data
insert into cart
(
	user_idx,
	class_idx,
	pay_date
)  values
(3, 1, default);