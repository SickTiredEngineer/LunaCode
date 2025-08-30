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
	
	
}
