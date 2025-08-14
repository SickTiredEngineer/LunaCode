package com.itwillbs.luna_code.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.MemberMapper;
import com.itwillbs.luna_code.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	
	
	public int insertNewMember(MemberVO vo) {
		return memberMapper.insertNewMember(vo);
	}
	
	/* 입력값 중복 검사 */
	public Map<String, String> checkDuplication(String value, String type){
		return memberMapper.checkDuplication(value, type);
	}

	
}
