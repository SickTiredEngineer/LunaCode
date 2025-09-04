package com.itwillbs.luna_code.service.support_center;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.support_center.FaqMapper;
import com.itwillbs.luna_code.vo.support_center.FaqVO;

@Service
public class FaqService {
	
	@Autowired
	FaqMapper mapper;
	
	public List<FaqVO> selectFaq(int start_row, int list_limit, String q){
		return mapper.selectFaq(start_row, list_limit, q);
	}
	
	public int countAllFaq(String q) {
		return mapper.countAllFaq(q);
	}
	
	public FaqVO selectFaqDetail(int faq_idx) {
		return mapper.selectFaqDetail(faq_idx);
	}	
	
	public int deleteFaq(int faq_idx) {
		return mapper.deleteFaq(faq_idx);
	}
	
	public int insertNewFaq(FaqVO faqVo) {
		return mapper.insertNewFaq(faqVo);
	}
	
	public int modifyFaq(FaqVO faqVo) {
		return mapper.modifyFaq(faqVo);
	}
	
	
	
	public void dummyFaq() {
		
		 String[][] faqData = {
	        {"결제", "결제가 완료되지 않아요", "결제 후에도 완료 알림이 오지 않는 경우, 카드사 승인 여부를 먼저 확인해주세요."},
	        {"결제", "현금영수증 발급이 가능한가요?", "결제 시 현금영수증 발급을 선택하시면 자동으로 발급됩니다."},
	        {"환불", "강의 환불은 어떻게 하나요?", "강의 시작 7일 이내에는 환불이 가능하며, 마이페이지에서 신청하실 수 있습니다."},
	        {"환불", "이벤트 상품도 환불이 가능한가요?", "이벤트/할인 상품은 일부 환불 규정이 다를 수 있으니 공지를 참고해주세요."},
	        {"강의", "강의 수강 기간은 얼마나 되나요?", "강의 등록 후 90일 동안 수강이 가능합니다."},
	        {"강의", "강의 자료는 어디서 다운로드하나요?", "강의 페이지 내 [자료실]에서 다운로드할 수 있습니다."},
	        {"강의", "강사에게 직접 질문할 수 있나요?", "강의별 Q&A 게시판을 통해 강사님께 직접 질문 가능합니다."},
	        {"계정", "비밀번호를 잊어버렸어요", "로그인 화면에서 [비밀번호 찾기]를 통해 재설정할 수 있습니다."},
	        {"계정", "이메일 주소를 변경하고 싶어요", "마이페이지 > 계정 설정에서 이메일 주소를 변경할 수 있습니다."},
	        {"계정", "회원 탈퇴는 어떻게 하나요?", "마이페이지 > 회원 탈퇴 메뉴에서 진행 가능합니다."},
	        {"에러", "영상이 재생되지 않아요", "브라우저 캐시를 삭제하거나 다른 브라우저를 이용해보세요."},
	        {"에러", "모바일 앱에서 오류가 발생해요", "앱을 최신 버전으로 업데이트 후에도 문제가 지속되면 고객센터로 문의해주세요."},
	        {"에러", "결제 버튼이 눌리지 않아요", "팝업 차단 여부를 확인하거나 PC 환경에서 다시 시도해주세요."},
	        {"기타", "포인트는 어떻게 적립되나요?", "강의 수강, 이벤트 참여 등을 통해 포인트가 적립됩니다."},
	        {"기타", "쿠폰은 어디서 확인할 수 있나요?", "마이페이지 > 쿠폰함에서 확인 가능합니다."},
	        {"기타", "공지사항 알림은 어떻게 받나요?", "알림 설정에서 푸시 알림 또는 이메일 알림을 켤 수 있습니다."},
	        {"기타", "강사 지원은 어떻게 하나요?", "강사 지원 페이지에서 이력서와 강의 계획서를 제출해주세요."},
	        {"기타", "사이트는 무료로 이용 가능한가요?", "일부 무료 강의는 누구나 수강 가능하며, 유료 강의는 결제가 필요합니다."},
	        {"강의", "강의는 모바일에서도 볼 수 있나요?", "네, PC와 모바일 모두에서 수강 가능합니다."},
	        {"결제", "해외 결제도 가능한가요?", "해외 결제는 VISA/MasterCard 로 가능합니다."}
	    };

	    for (String[] data : faqData) {
	        FaqVO vo = new FaqVO();
	        vo.setAdmin_idx(1);
	        vo.setCategory(data[0]);
	        vo.setFaq_subject(data[1]);
	        vo.setFaq_content(data[2]);
	        mapper.insertNewFaq(vo);
	    }
		
	}
	
	
	
	
	
}
