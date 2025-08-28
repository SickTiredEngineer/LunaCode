use c2d2505t1p1;
show tables;

drop table common_code;

create table common_code(
	common_idx int primary key auto_increment,
    group_code varchar(64),
    code varchar(64) unique,
    code_label varchar(64),
    code_desc varchar(300),
    using_status boolean default true,
    creater_idx int,
    create_date timestamp default current_timestamp,
    updater_idx int,
    update_date timestamp default null,
    
    foreign key(group_code) references group_code(group_code),
    foreign key(creater_idx) references member(idx),
    foreign key(updater_idx) references member(idx)
);

 alter table common_code ADD UNIQUE (code);

-- 데이터 설명충
desc common_code;

-- 전체 데이터 출력
select * from common_code;

SHOW INDEX FROM common_code;
ALTER TABLE common_code DROP INDEX code_label;



-- 데이터 초기화용
-- delete from common_code;

INSERT INTO common_code (group_code, code, code_label, code_desc, using_status, creater_idx) VALUES
('MEMBER_TYPE', 'MB01', '관리자', '관리자에 대한 코드입니다.', 1, 30),
('MEMBER_TYPE', 'MB02', '강사', '강사에 대한 코드입니다.', 1, 30),
('MEMBER_TYPE', 'MB03', '일반회원', '일반회원에 대한 코드입니다.', 1, 30),

('CLASS_TYPE', 'CT01', '실시간', '실시간에 대한 코드입니다.', 1, 30),
('CLASS_TYPE', 'CT02', '온라인', '온라인에 대한 코드입니다.', 1, 30),
('CLASS_TYPE', 'CT03', '오프라인', '오프라인에 대한 코드입니다.', 1, 30),

('BOARD_TYPE', 'BD01', '자유 게시판', '자유 게시판에 대한 코드입니다.', 1, 30),
('BOARD_TYPE', 'BD02', '질문 게시판', '질문 게시판에 대한 코드입니다.', 1, 30),
('BOARD_TYPE', 'BD03', '고민 게시판', '고민 게시판에 대한 코드입니다.', 1, 30),

('SUPPORT_CATEGORY', 'SP01', '1:1 문의', '1:1 문의에 대한 코드입니다.', 1, 30),
('SUPPORT_CATEGORY', 'SP02', 'FAQ', 'FAQ에 대한 코드입니다.', 1, 30),
('SUPPORT_CATEGORY', 'SP03', '공지사항', '공지사항에 대한 코드입니다.', 1, 30),

('CLASS_LEVEL', 'CL01', '초급', '초급에 대한 코드입니다.', 1, 30),
('CLASS_LEVEL', 'CL02', '중급', '중급에 대한 코드입니다.', 1, 30),
('CLASS_LEVEL', 'CL03', '고급', '고급에 대한 코드입니다.', 1, 30),

('MAIN_CATEGORY', 'MC01', '홈', '홈에 대한 코드입니다.', 1, 30),
('MAIN_CATEGORY', 'MC02', '내강의', '내강의에 대한 코드입니다.', 1, 30),
('MAIN_CATEGORY', 'MC03', '재생목록', '재생목록에 대한 코드입니다.', 1, 30),
('MAIN_CATEGORY', 'MC04', '커뮤니티 활동', '커뮤니티 활동에 대한 코드입니다.', 1, 30),
('MAIN_CATEGORY', 'MC05', '출석', '출석에 대한 코드입니다.', 1, 30),

('CLASS_CATEGORY', 'CC01', '전체 강의', '전체 강의에 대한 코드입니다.', 1, 30),
('CLASS_CATEGORY', 'CC02', 'IT 자격증', 'IT 자격증에 대한 코드입니다.', 1, 30),
('CLASS_CATEGORY', 'CC03', '기초 코딩', '기초 코딩에 대한 코드입니다.', 1, 30),
('CLASS_CATEGORY', 'CC04', '컴퓨터 활용', '컴퓨터 활용에 대한 코드입니다.', 1, 30),
('CLASS_CATEGORY', 'CC05', '게임 개발', '게임 개발에 대한 코드입니다.', 1, 30),
('CLASS_CATEGORY', 'CC06', '컴퓨터 그래픽', '컴퓨터 그래픽에 대한 코드입니다.', 1, 30),
('CLASS_CATEGORY', 'CC07', 'AI', 'AI에 대한 코드입니다.', 1, 30),
('CLASS_CATEGORY', 'CC08', '컴퓨터 비전', '컴퓨터 비전에 대한 코드입니다.', 1, 30),
('CLASS_CATEGORY', 'CC09', '임베디드', '임베디드에 대한 코드입니다.', 1, 30),
('CLASS_CATEGORY', 'CC10', '풀스텍', '풀스텍에 대한 코드입니다.', 1, 30),

('CLASS_MAX', 'CP01', '9개월', '9개월에 대한 코드입니다.', 1, 30),
('CLASS_MAX', 'CP02', '12개월', '12개월에 대한 코드입니다.', 1, 30),
('CLASS_MAX', 'CP03', '무제한', '무제한에 대한 코드입니다.', 1, 30),

('CLASS_REVIEW', 'CR01', '쉬웠어요', '쉬웠어요에 대한 코드입니다.', 1, 30),
('CLASS_REVIEW', 'CR02', '적당해요', '적당해요에 대한 코드입니다.', 1, 30),
('CLASS_REVIEW', 'CR03', '어려워요', '어려워요에 대한 코드입니다.', 1, 30),
('CLASS_REVIEW', 'CR04', '완벽해요', '완벽해요에 대한 코드입니다.', 1, 30),
('CLASS_REVIEW', 'CR05', '부족해요', '부족해요에 대한 코드입니다.', 1, 30),

('ADMIN_CATEGORY', 'AC01', '강의 관리', '강의 관리에 대한 코드입니다.', 1, 30),
('ADMIN_CATEGORY', 'AC02', '회원 관리', '회원 관리에 대한 코드입니다.', 1, 30),
('ADMIN_CATEGORY', 'AC03', '사용자 결제 관리', '사용자 결제 관리에 대한 코드입니다.', 1, 30),
('ADMIN_CATEGORY', 'AC04', '고객 지원 관리', '고객 지원 관리에 대한 코드입니다.', 1, 30),
('ADMIN_CATEGORY', 'AC05', '공통 코드 관리', '공통 코드 관리에 대한 코드입니다.', 1, 30),
('ADMIN_CATEGORY', 'AC06', '통계', '통계에 대한 코드입니다.', 1, 30),

('MEMBER_STATE', 'MS01', '정상', '정상에 대한 코드입니다.', 1, 30),
('MEMBER_STATE', 'MS02', '탈퇴', '탈퇴에 대한 코드입니다.', 1, 30),
('MEMBER_STATE', 'MS03', '정지', '정지에 대한 코드입니다.', 1, 30),

('QUIZE_RESULT', 'QR01', '정답', '퀴즈 정답 맞추면 쓰는 코드', 1, 30),
('QUIZE_RESULT', 'QR02', '오답', '퀴즈 정답 틀리면 쓰는 코드', 1, 30),
('QUIZE_RESULT', 'QR03', '채점 전', '채점전', 1, 30),

('ATTACHMENT_GROUP', 'AT01', 'Personal Question Attachment', '1:1 문의 질문에 사용되는 첨부파일 입니다.', 1, 30),
('ATTACHMENT_GROUP', 'AT02', 'Personal Answer Attachment', '1:1 문의 대답에 사용되는 첨부파일 입니다.', 1, 30),
('ATTACHMENT_GROUP', 'AT03', 'FAQ Attachement', 'FAQ에 사용되는 첨부파일 입니다.', 1, 30),
('ATTACHMENT_GROUP', 'AT04', 'Notice Attachment', '공지사항에 사용되는 첨부파일 입니다.', 1, 30),
('ATTACHMENT_GROUP', 'AT05', 'Episode Attachment', '강의 Episode에서 사용되는 첨부파일 입니다.', 1, 30),
('ATTACHMENT_GROUP', 'AT06', 'Post Attachment', '게시물에 사용되는 첨부파일 입니다.', 1, 30),
('ATTACHMENT_GROUP', 'AT07', 'Certificate Attachement', '강사 자격 증빙 첨부파일 입니다.', 1, 30);


-- ----------------------------------------
INSERT INTO common_code (group_idx, code, code_label, code_desc, is_using, creater_idx, create_date) VALUES
(12, 'QR01', '정답', '퀴즈 정답 맞추면 쓰는 코드', 1, 1, now()),
(12, 'QR02', '오답', '퀴즈 정답 틀리면 쓰는 코드', 1, 1, now()),
(12, 'QR03', '채점 전', '채점전', 1, 1, now());

INSERT INTO common_code (group_idx, code, code_label, code_desc, is_using, creater_idx, create_date) VALUES
(13, 'AT01', 'Personal Question Attachment', '1:1 문의 질문에 사용되는 첨부파일 입니다.', true, 1, now()),
(13, 'AT02', 'Personal Answer Attachment', '1:1 문의 대답에 사용되는 첨부파일 입니다.', true, 1, now()),
(13, 'AT03', 'FAQ Attachement', 'FAQ에 사용되는 첨부파일 입니다.', true, 1, now()),
(13, 'AT04', 'Notice Attachment', '공지사항에 사용되는 첨부파일 입니다.', true, 1, now()),
(13, 'AT05', 'Episode Attachment', '강의 Episode에서 사용되는 첨부파일 입니다.', true, 1, now()),
(13, 'AT06', 'Post Attachment', '게시물에 사용되는 첨부파일 입니다.', 1, true, now()),
(13, 'AT07', 'Certificate Attachement', '강사 자격 증빙 첨부파일 입니다.', true, 1, now());

select * from common_code;



select 
			cc.common_idx
			,cc.group_code
			,cc.code
			,cc.code_label
			,cc.code_desc
			,cc.using_status
			,cc.creater_idx
			,cc.create_date
			,cc.updater_idx
			,cc.update_date
			,m1.user_id as creater_id 
			,m2.user_id as updater_id
			,cd.group_idx as group_idx
			
		from common_code cc
		left join member m1 on m1.idx = cc.creater_idx
		left join member m2 on m2.idx = cc.updater_idx
		left join group_code cd on cd.group_code = cc.group_code 
		order by cd.create_date desc, cd.group_idx desc
	
