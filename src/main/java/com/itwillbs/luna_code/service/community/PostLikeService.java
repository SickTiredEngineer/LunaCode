package com.itwillbs.luna_code.service.community;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.community.PostLikeMapper;

@Service
public class PostLikeService {
	
	@Autowired
	PostLikeMapper mapper;
	
	/* 좋아요 전체 불러오기 */
	public Map<String, Object> selectLikeCount(int post_idx, Integer  user_idx){
		return mapper.selectLikeCount(post_idx, user_idx);
	}
	
	/* 좋아요 삽입 */
	public int insertNewLike(int user_idx, int post_idx) {
		return mapper.insertNewLike(user_idx, post_idx);
	}
	
	/* 좋아요 취소 */
	public int deleteLike(int user_idx, int post_idx) {
		return mapper.deleteLike(user_idx, post_idx);
	}
	

}
