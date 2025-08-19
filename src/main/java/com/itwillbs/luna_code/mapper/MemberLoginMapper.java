package com.itwillbs.luna_code.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.MemberLoginVO;

@Mapper
public interface MemberLoginMapper {

	/* 로그인 */
	public MemberLoginVO selectMemberVO(String username, String password);

	
}


