package com.itwillbs.luna_code.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.itwillbs.luna_code.vo.UserVO;

@Mapper
public interface UserMapper {
	
	public UserVO selectUserProfile(String userId);
	
	public int updateUserProfile(UserVO user);

	public int countNickname(String nickname);
	
}
