package com.itwillbs.luna_code.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ClassEpisodeVo {

	private int session_idx;
	private String episode_name;
    private List<ClassEpisodeVo> episodes = new ArrayList<>();	
}
