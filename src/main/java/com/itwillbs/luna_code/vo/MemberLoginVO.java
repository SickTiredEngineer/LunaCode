package com.itwillbs.luna_code.vo;

import lombok.Data;

@Data
public class MemberLoginVO {

	private String user_id;
	private String password;
	private String nickname;
	private String email;    
	private String user_name;
	private String member_type; 
}
