package com.itwillbs.luna_code.vo;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserVO {

	private String user_id;
	private String user_name;
	private String nickname;
	private String birth;
	private String password;
	private String email;
	private String profile_img;
	private String member_type; 
	private String bio;
	private String github_url;
	private int attendance_count;
	private int attendance_consecutive;
	private String attendance_last;
	private String deny_reason;

	// 최대 연속 출석일
	private int max_attendance_consecutive;
	// 최근 30일 결석일 수
	private int recent_absences;            
	// 요일별 출석 횟수
	private Map<String, Integer> daily_attendance_stats;
	// 월별 출석 횟수
	private Map<String, Integer> monthly_attendance_stats;
	// 월간 연속 출석
	private int consecutive_monthly_attendance;

}
