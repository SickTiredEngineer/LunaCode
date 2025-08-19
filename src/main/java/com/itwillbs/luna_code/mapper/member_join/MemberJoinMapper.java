package com.itwillbs.luna_code.mapper.member_join;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.member_join.MemberJoinVO;

@Mapper
public interface MemberJoinMapper {
	
	/* 신규 회원 정보 insert */
	public int insertNewMember(MemberJoinVO vo);
	
	/* 입력 값 중복 검사 */
	public Map<String, String> checkDuplication(@Param("value") String value, @Param("type") String type);


}
