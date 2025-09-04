package com.itwillbs.luna_code.service.member_join;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.member_join.MemberJoinMapper;
import com.itwillbs.luna_code.vo.member_join.MemberJoinVO;

@Service
public class MemberJoinService {
	
	@Autowired
	MemberJoinMapper memberMapper;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public int insertNewMember(MemberJoinVO vo) {
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		return memberMapper.insertNewMember(vo);
	}
	
	/* 입력값 중복 검사 */
	public Map<String, String> checkDuplication(String value, String type){
		return memberMapper.checkDuplication(value, type);
	}

	
	/* 회원 더미 생성 */
	public void createDummyNormalMembers() {
		
		
		for(int i = 0; i < 200; i++) {
			
			String firstName = "";
			String pass = "Asdfqwer!234";
			
			String last4 = String.format("%04d", i); // i를 4자리 0패딩
		    String phone = "0101234" + last4;        // 결과: 01012340000 ~ 01012340199
			
			switch (i%10) {
				case 0:
					firstName = "김";
					break;
				
				case 1:
					firstName = "박";
					break;
					
				case 2:
					firstName = "이";
					break;
				
				case 3:
					firstName = "장";
					break;
					
				case 4:
					firstName = "조";
					break;
					
				case 5:
					firstName = "최";
					break;
					
				case 6:
					firstName = "구";
					break;	
					
				case 7:
					firstName = "엄";
					break;
					
				case 8:
					firstName = "송";
					break;
				
				case 9:
					firstName = "조";
					break;	
							
				default:
					break;
			}
			
			
			MemberJoinVO vo = new MemberJoinVO();
			
			vo.setUser_id("normal"+i);
			vo.setUser_name(firstName + "일반");
			vo.setNickname("Normal" + i);
			vo.setPassword(passwordEncoder.encode(pass));
			vo.setEmail("normal"+i+"@"+"normal.com");
			vo.setPhone(phone);
			vo.setBirth("2025-09-01");
			vo.setMember_type("MB03");
			
			memberMapper.insertNewMember(vo);
		}

		
	}
	
	/* 회원 더미 생성 */
	public void createDummyInst() {
		
		
		for(int i = 0; i < 25; i++) {
			
			String firstName = "";
			String pass = "Asdfqwer!234";
			
			String last4 = String.format("%04d", i); // i를 4자리 0패딩
		    String phone = "0105678" + last4;        // 결과: 01012340000 ~ 01012340199
			
			switch (i%10) {
				case 0:
					firstName = "김";
					break;
				
				case 1:
					firstName = "박";
					break;
					
				case 2:
					firstName = "이";
					break;
				
				case 3:
					firstName = "장";
					break;
					
				case 4:
					firstName = "조";
					break;
					
				case 5:
					firstName = "최";
					break;
					
				case 6:
					firstName = "구";
					break;	
					
				case 7:
					firstName = "엄";
					break;
					
				case 8:
					firstName = "송";
					break;
				
				case 9:
					firstName = "조";
					break;	
							
				default:
					break;
			}
			
			
			MemberJoinVO vo = new MemberJoinVO();
			
			String status = "";
			
			switch(i%2) {
				case 0:
					status = "IS01";
					break;
				default:
					status = "IS02";
					break;
			}
			
			
			vo.setUser_id("inst"+i);
			vo.setUser_name(firstName + "강사");
			vo.setNickname("inst" + i);
			vo.setPassword(passwordEncoder.encode(pass));
			vo.setEmail("inst"+i+"@"+"normal.com");
			vo.setPhone(phone);
			vo.setBirth("2025-09-01");
			vo.setMember_type("MB02");
			vo.setAccept_status(status);
			vo.setCerPath1("2025/09/04/de34f3e7-d901-4d8e-9fe2-ea63898b49f1_유스케이스.png");
			memberMapper.insertNewMember(vo);
		}

	}
	
	
}
