package com.itwillbs.luna_code.vo;

import lombok.Data;

@Data
public class MemberVO {

	private int user_id;
	private String user_name;
	private String nickname;
	private String birth;
	private String password;
	private String email;
	private String phone;
	private String profile_img;
	private String bio;
	private String github_url;
	private int attendance_count;
	private int attendance_consecutive;
	private String attendance_last;
	private int member_type;
	private String certificate_01;
	private String certificate_02;
	private String certificate_03;

}
