package com.itwillbs.luna_code.mapper.admin_page;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import com.itwillbs.luna_code.vo.member_join.MemberJoinVO;

@Mapper
public interface ApMemberMapper {
	
	List<MemberJoinVO> selectMemberList(@Param("start_row") int start_row, @Param("list_limit") int list_limit); 
	
	int countAllMember();
	
	MemberJoinVO selectMemberDetail(@Param("idx") int idx);
	

}
