package com.itwillbs.luna_code.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.usermain.AttendanceService;

/* 로그인 성공 시 하는 동작인데, 그냥 로그인 성공하면 사용자 메인 홈으로 보내는 역할임 */
/* security-config 에 내용 있음 */
@Component("LoginSuccessHandler")
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	
	@Autowired
	AttendanceService service;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();
		service.performAttendanceCheck(user.getUserId());
		
//		String target = request.getContextPath() + "/usermain/usermain";
		String target = "/UserMain";
		getRedirectStrategy().sendRedirect(request, response, target);
		
		
//		super.onAuthenticationSuccess(request, response, authentication);
	}

}
