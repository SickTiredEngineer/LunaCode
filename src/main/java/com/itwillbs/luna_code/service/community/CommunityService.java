package com.itwillbs.luna_code.service.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.community.CommunityMapper;
import com.itwillbs.luna_code.vo.community.PostVO;

@Service
public class CommunityService {
	
	@Autowired
	CommunityMapper mapper;
	
	/* 전체 게시물 리스트 가져오는 쿼리 */
	public List<PostVO> postList(int start_row, int list_limit, String q){
		return mapper.postList(start_row, list_limit, q);
	}
	
	/* 페이징을 위한 게시글 갯수 불러오기 */
	public int countAllPost(String q) {
		return mapper.countAllPost(q);
	}
	
	/* 게시물 클릭 시, 해당 게시물의 상세 내용을 가져오는 쿼리 */
	public PostVO getPostDetail(int post_idx) {
		
		int viewResult = mapper.increaseViewCount(post_idx);
		if(viewResult == 0) throw new IllegalArgumentException("post not found: " + post_idx);
		
		return mapper.getPostDetail(post_idx);
	}
	
	public int insertNewPost(PostVO postVo) {
		return mapper.insertNewPost(postVo);
	}
	
	public int deletePost(int post_idx, int idx) {
		return mapper.deletePost(post_idx, idx);
	}
	
	public int modifyPost(PostVO vo, int idx) {
		return mapper.modifyPost(vo, idx);
	}
	
	
	/* 게시글 더미 데이터 생성 */
	public void dummyPost() {
		
		String[] titleSamples = {
		        "오늘은 날씨가 좋네요",
		        "스프링 공부하는 중!",
		        "점심 뭐 먹을까?",
		        "Java는 참 재밌어",
		        "버그 때문에 멘붕옴...",
		        "여행 가고 싶다",
		        "운동 시작했습니다",
		        "새로운 프로젝트 구상중",
		        "추천 영화 있나요?",
		        "하루하루 성장하는 중!"
	    };
		
		for(int i = 3; i < 50; i++) {
			String title = titleSamples[i % titleSamples.length];
			PostVO vo = new PostVO();
			vo.setBoard_code("BD01");
			vo.setTitle(title);
			vo.setContent("안녕!" + titleSamples[i % titleSamples.length]);
			vo.setAuthor_idx(i);
			
			mapper.insertNewPost(vo);
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
