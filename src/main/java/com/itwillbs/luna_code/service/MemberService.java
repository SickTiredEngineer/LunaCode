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
	
	public Map<String, String> checkIdDuplication(String id) {
		return memberMapper.checkIdDuplication(id);
	}

	public Map<String, String> checkNickNameDuplication(String nickname){
		return memberMapper.checkNickNameDuplication(nickname);
	}
	
}
