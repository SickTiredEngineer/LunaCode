package com.itwillbs.luna_code.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.MemberVO;

@Mapper
public interface MemberMapper {

	public int insertNewMember(MemberVO vo);
	
	 public Map<String, String> checkIdDuplication(String id);
	 public Map<String, String> checkNickNameDuplication(String nickname);
	
	
}
