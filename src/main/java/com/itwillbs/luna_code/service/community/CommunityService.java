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
	
	public List<PostVO> postList(){
		return mapper.postList();
	}
	
}
