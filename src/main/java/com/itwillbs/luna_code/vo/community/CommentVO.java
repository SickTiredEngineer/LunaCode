package com.itwillbs.luna_code.vo.community;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	
	private int comment_idx;
	private int post_idx;
	private int author_idx;
	private String author_id;
	private String nickname;
	private	String content;
	private Timestamp create_date;
	private Timestamp update_date;
	private int parent_idx;

}
