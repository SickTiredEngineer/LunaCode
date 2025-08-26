package com.itwillbs.luna_code.service.admin_page;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.admin_page.ApMemberMapper;
import com.itwillbs.luna_code.vo.member_join.MemberJoinVO;

@Service
public class ApMemberService {
	
	@Autowired
	ApMemberMapper mapper;
	
	public List<MemberJoinVO> selectMemberList(int start_row, int list_limit){
		return mapper.selectMemberList(start_row, list_limit);
	}
	
	public int countAllMember() {
		return mapper.countAllMember();
	}

	public MemberJoinVO selectMemberDetail(int idx) {
		return mapper.selectMemberDetail(idx);
	}
	

}
