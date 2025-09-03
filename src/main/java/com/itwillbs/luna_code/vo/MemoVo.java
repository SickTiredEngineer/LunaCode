package com.itwillbs.luna_code.vo;

import lombok.Data;

@Data
public class MemoVo {

	private int memo_idx;
	private int session_idx;
	private int user_idx;
	private String memo;
	private String title;
	private int class_idx;
	private int episode_idx;

}
