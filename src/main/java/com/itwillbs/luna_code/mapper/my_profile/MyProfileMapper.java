package com.itwillbs.luna_code.mapper.my_profile;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.UserVO;

@Mapper
public interface MyProfileMapper {
	
	public UserVO selectUserProfile(String userId);
	
}
