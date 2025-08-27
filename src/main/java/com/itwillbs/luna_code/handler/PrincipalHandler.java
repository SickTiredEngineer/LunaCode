package com.itwillbs.luna_code.handler;

import java.util.List;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.itwillbs.luna_code.mapper.MemberLoginMapper;
import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.vo.MemberLoginVO;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class PrincipalHandler {
	
	/* ID 로 회원정보 가져와야 해서 메퍼 선언 */
	private final MemberLoginMapper mapper;
	
	public void refreshByUserId(String userId) {
		
		MemberLoginVO memberVo = mapper.selectMemberVOById(userId);
		if(memberVo == null) return;
		
		/* 권한 메핑 */
        String role = null;
        
        switch(memberVo.getMember_type()) {
        	case "MB01":
        		role = "ROLE_ADMIN";
        		break;
        	case "MB02":
        		role = "ROLE_INSTRUCTOR";
        		break;
        	case "MB03":
        		role = "ROLE_USER";
        		break;
        }
        
        Authentication oldAuth = SecurityContextHolder.getContext().getAuthentication();
		 	
        CustomUserDetails newPrincipal = new CustomUserDetails(
        		memberVo.getIdx(), 
        		memberVo.getUser_id(), 
        		memberVo.getUser_name(), 
        		memberVo.getPassword(), 
        		List.of(new SimpleGrantedAuthority(role)),
        		memberVo.getNickname(),
        		memberVo.getProfile_img()
       );

        Authentication newAuth = new UsernamePasswordAuthenticationToken(newPrincipal, oldAuth.getCredentials(), newPrincipal.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(newAuth);
	}
	
	
	public void reAuthenticate(String userId, String rawPassword, AuthenticationManager am) {
		Authentication reAuth = am.authenticate(new UsernamePasswordAuthenticationToken(userId, rawPassword));
		SecurityContextHolder.getContext().setAuthentication(reAuth);
		
	}
}
