package com.itwillbs.luna_code.service.member_join;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.member_join.MemberJoinMapper;
import com.itwillbs.luna_code.vo.member_join.MemberJoinVO;

@Service
public class MemberJoinService {
	
	@Autowired
	MemberJoinMapper memberMapper;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public int insertNewMember(MemberJoinVO vo) {
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		return memberMapper.insertNewMember(vo);
	}
	
	/* 입력값 중복 검사 */
	public Map<String, String> checkDuplication(String value, String type){
		return memberMapper.checkDuplication(value, type);
	}

	
}
