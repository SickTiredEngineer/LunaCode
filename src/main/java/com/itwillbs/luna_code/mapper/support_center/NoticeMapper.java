package com.itwillbs.luna_code.mapper.support_center;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.support_center.NoticeVO;

@Mapper
public interface NoticeMapper {
	
	List<NoticeVO> selectNotice(@Param("start_row") int start_row, @Param("list_limit") int list_limit);
	
	int countAllNotice();
	
	NoticeVO selectNoticeDetail(@Param("notice_idx") int notice_idx);
	
	int insertNewNotice(NoticeVO noticeVo);

	int increaseViewCount(int notice_idx);
	
	int modifyNotice(NoticeVO noticeVo);
	
	int deleteNotice(@Param("notice_idx") int notice_idx);
	
}
