package com.itwillbs.luna_code.service.support_center;

import java.util.List;

import javax.print.attribute.standard.MediaSize.NA;

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
	
	
	
	/* 더미 공지사항 생성 */
	public void dummyNotice() {
	    String[] subjects = {
	        "시스템 점검 안내",
	        "신규 강의 오픈 소식",
	        "추석 연휴 고객센터 휴무 안내",
	        "회원 등급 제도 개편 안내",
	        "보안 업데이트 완료 안내",
	        "이벤트 당첨자 발표",
	        "신규 기능 추가 안내",
	        "서비스 속도 개선 작업 공지",
	        "정기 점검 일정 안내",
	        "앱 버전 업데이트 안내",
	        "설 연휴 배송 지연 안내",
	        "신규 게시판 개설 소식",
	        "포인트 제도 변경 안내",
	        "서버 이전 작업 완료 보고",
	        "여름 휴가 고객센터 운영 안내",
	        "버그 패치 및 안정화 공지",
	        "강사 모집 공고",
	        "커뮤니티 이용 수칙 안내",
	        "개인정보 처리방침 개정 안내",
	        "서비스 오픈 1주년 기념 이벤트"
	    };

	    String[] contents = {
	        "안녕하세요, 시스템 안정화를 위해 정기 점검을 진행합니다. 점검 시간 동안 서비스 이용이 제한될 수 있습니다.",
	        "새로운 강의가 오픈되었습니다! 많은 관심과 참여 부탁드립니다.",
	        "추석 연휴 기간 동안 고객센터 운영이 중단됩니다. 문의사항은 연휴 이후 순차적으로 처리됩니다.",
	        "회원 등급 제도가 개편되어 더욱 다양한 혜택을 제공합니다.",
	        "보안 강화를 위한 업데이트가 완료되었습니다. 안전한 서비스 이용 부탁드립니다.",
	        "이벤트 당첨자를 발표합니다! 자세한 내용은 공지사항을 확인해주세요.",
	        "새로운 기능이 추가되었습니다. 지금 바로 이용해보세요!",
	        "서비스 속도 개선을 위한 최적화 작업이 완료되었습니다.",
	        "정기 점검 일정을 안내드립니다. 이용에 참고 부탁드립니다.",
	        "앱의 새로운 버전이 출시되었습니다. 업데이트 후 이용해주세요.",
	        "설 연휴로 인해 배송이 지연될 수 있습니다. 이용에 양해 부탁드립니다.",
	        "새로운 게시판이 개설되었습니다. 많은 이용 바랍니다.",
	        "포인트 제도가 변경되었습니다. 변경된 내용을 확인해주세요.",
	        "서버 이전 작업이 완료되어 안정적인 서비스 제공이 가능해졌습니다.",
	        "여름 휴가 기간 중 고객센터 운영이 축소됩니다. 참고 부탁드립니다.",
	        "버그 패치와 안정화 작업이 완료되었습니다. 불편을 드려 죄송합니다.",
	        "강사 모집을 시작합니다. 관심 있는 분들의 많은 지원 바랍니다.",
	        "커뮤니티 이용 수칙을 안내드립니다. 건전한 커뮤니티 문화에 동참해주세요.",
	        "개인정보 처리방침이 개정되었습니다. 자세한 내용은 확인 부탁드립니다.",
	        "서비스 오픈 1주년을 맞아 이벤트를 진행합니다! 많은 참여 바랍니다."
	    };

	    for (int i = 0; i < subjects.length; i++) {
	        NoticeVO vo = new NoticeVO();
	        vo.setAdmin_idx(1);
	        vo.setNotice_subject(subjects[i]);
	        vo.setNotice_content(contents[i]);
	        mapper.insertNewNotice(vo);
	    }
	}

	
	
}
