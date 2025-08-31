package com.itwillbs.luna_code.service.support_center;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.support_center.NoticeMapper;
import com.itwillbs.luna_code.vo.support_center.NoticeVO;

@Service
public class NoticeService {
	
	@Autowired
	NoticeMapper mapper;
	
	public List<NoticeVO> selectNotice(int start_row, int list_limit, String q) {
		return mapper.selectNotice(start_row, list_limit, q);
	}
	
	public int countAllNotice(String q) {
		return mapper.countAllNotice(q);
	}
	
	public NoticeVO selectNoticeDetail(int notice_idx) {
		return mapper.selectNoticeDetail(notice_idx);
	}
	
	public int insertNewNotice(NoticeVO noticeVo) {
		return mapper.insertNewNotice(noticeVo);
	}
	
	public int increaseViewCount(int notice_idx) {
		return mapper.increaseViewCount(notice_idx);
	}	
	
	public int modifyNotice(NoticeVO noticeVo) {
		return mapper.modifyNotice(noticeVo);
	}
	
	public int deleteNotice(int notice_idx) {
		return mapper.deleteNotice(notice_idx);
	}
	
	
	
}
