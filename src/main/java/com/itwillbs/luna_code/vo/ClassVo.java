package com.itwillbs.luna_code.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ClassVo {

	private int member_idx;          
    private int class_idx;          
    private int instructor_idx;     
    private String class_title;     
    private String class_time;        
    private Integer class_type;         
    private Date create_date;       
    private String class_thumbnail; 
    private String class_intro;    
    private String class_content;   
    private int class_price;        
    private Integer class_category;     
    private Integer class_level;        
    private int total_lessons;     
	
	
	
}
