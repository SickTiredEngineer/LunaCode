package com.itwillbs.luna_code.mapper.community;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PostLikeMapper {
	
	/* 좋아요 전체 불러오기 */
	Map<String, Object> selectLikeCount(@Param("post_idx") int post_idx, @Param("user_idx") Integer  user_idx);
	
	/* 좋아요 삽입 */
	int insertNewLike(@Param("user_idx") int user_idx, @Param("post_idx") int post_idx);
	
	int deleteLike(@Param("user_idx") int user_idx, @Param("post_idx") int post_idx);
}
