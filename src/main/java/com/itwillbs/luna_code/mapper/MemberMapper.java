package com.itwillbs.luna_code.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	/* 신규 회원 정보 insert */
	public int insertNewMember(MemberVO vo);
	
	/* 입력 값 중복 검사 */
	public Map<String, String> checkDuplication(@Param("value") String value, @Param("type") String type);


}
