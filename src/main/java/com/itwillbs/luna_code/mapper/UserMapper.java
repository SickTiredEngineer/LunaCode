package com.itwillbs.luna_code.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.UserVO;

@Mapper
public interface UserMapper {
	
	public UserVO selectUserProfile(String userId);
	
	// 프로필 설정
	public int updateUserProfile(UserVO user);
	
	// 닉네임 중복설정
	public int countNickname(String nickname);
	
	// 비밀번호 조회
	public String selectPassword(String userId);

	// 새 비밀번호 업데이트
	public int updatePassword(
		@Param("userId") String userId,
		@Param("newPassword") String newPassword
	);
	
	// 계정 정보 삭제
	public int deleteUser(String userId);
}
