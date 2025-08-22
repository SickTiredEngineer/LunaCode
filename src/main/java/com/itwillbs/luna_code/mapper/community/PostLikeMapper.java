package com.itwillbs.luna_code.mapper.community;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PostLikeMapper {

	Map<String, Object> selectLikeCount(@Param("post_idx") int post_idx, @Param("user_idx") int user_idx);
	
	int insertNewLike(@Param("user_idx") int user_idx, @Param("post_idx") int post_idx);
	
	
	
	
}
