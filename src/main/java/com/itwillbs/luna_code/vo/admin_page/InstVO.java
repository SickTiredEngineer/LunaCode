package com.itwillbs.luna_code.vo.admin_page;



import lombok.Data;

@Data
public class InstVO {
	private String idx;
	private String user_id;
	private String user_name;
	private String nickname;
	private String birth;
	private String password;
	private String email1;
	private String email2;
	private String email;
	private String phone;
	private String profile_img;
	private String bio;
	private String github_url;
	private int attendance_count;
	private int attendance_consecutive;
	private String attendance_last;
	private String member_type;
	
	private String certificate_01;
	private String certificate_02;
	private String certificate_03;
	
	private String accept_status;
	private String deny_reason;
}
