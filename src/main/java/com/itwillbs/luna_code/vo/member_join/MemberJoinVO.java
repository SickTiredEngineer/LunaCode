package com.itwillbs.luna_code.vo.member_join;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/* 회원가입 프로세싱에서 정보 담을 때 사용하는 VO */
@Data
public class MemberJoinVO {

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
	
	private MultipartFile certificate_01;
	private MultipartFile certificate_02;
	private MultipartFile certificate_03;
	
	private String cerPath1;
	private String cerPath2;
	private String cerPath3;
}
