package com.itwillbs.luna_code.vo.community;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PostVO {
	private int post_idx;
	private String board_code;
	private String title;
	private String content;
	private int author_idx;
	private String author;
	private String author_id;
	private Timestamp created_date;
	private Timestamp update_date;
	private boolean is_update;
	private int view_count;
	private int cnt_comment;
}
