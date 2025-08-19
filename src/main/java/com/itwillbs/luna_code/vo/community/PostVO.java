package com.itwillbs.luna_code.vo.community;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PostVO {
	private int post_idx;
	private int board_idx;
	private String title;
	private String content;
	private int author_idx;
	private String author;
	private Timestamp created_date;
	private Timestamp update_date;
	private boolean is_update;
	private int view_count;
}
