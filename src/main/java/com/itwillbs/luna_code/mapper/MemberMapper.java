package com.itwillbs.luna_code.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	 public Map<String, String> checkIdDuplication(String id);
	 public Map<String, String> checkNickNameDuplication(String nickname);
	
	
}
