package com.itwillbs.luna_code.vo.usermain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NewReviewVO {
	
    private String content;
    private Timestamp created_at;
    private String class_title;
    private String user_name;
}
