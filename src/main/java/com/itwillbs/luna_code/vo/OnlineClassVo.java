package com.itwillbs.luna_code.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class OnlineClassVo {

	private int member_idx;          
    private int class_idx;
    private String class_title;     
    private String class_time;        
    private String class_type;         
    private Date create_date;       
    private String class_thumbnail; 
    private String class_intro;    
    private String class_content;   
    private int class_price;        
    private String class_category;     
    private String class_level;        
    private int total_lessons;
    private String url;
}
