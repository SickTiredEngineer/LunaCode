package com.itwillbs.luna_code.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.MemberLoginVO;

@Mapper
public interface MemberLoginMapper {
    MemberLoginVO selectMemberVO(@Param("user_id") String user_id, @Param("password") String password);

}


