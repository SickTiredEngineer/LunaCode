package com.itwillbs.luna_code.vo.usermain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NewStudentVO {
	
	private String user_name;
	private String class_title;
    private Timestamp enroll_date;
    
}
