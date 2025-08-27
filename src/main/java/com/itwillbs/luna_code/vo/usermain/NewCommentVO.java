package com.itwillbs.luna_code.vo.usermain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NewCommentVO {
	
	private String comment_content;
    private String class_title;
    private Timestamp create_date;
	
}
