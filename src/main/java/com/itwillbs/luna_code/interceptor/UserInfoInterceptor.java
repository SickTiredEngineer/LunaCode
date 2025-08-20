package com.itwillbs.luna_code.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.luna_code.service.UserService; // ★★★ User 정보를 조회할 서비스
import com.itwillbs.luna_code.vo.UserVO;

public class UserInfoInterceptor implements HandlerInterceptor {

	@Autowired
	private UserService userService;

	// 컨트롤러 실행 전에 동작 (주로 로그인 여부 체크에 사용)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return true; // true를 반환해야 다음 단계로 진행됩니다.
	}

	// 컨트롤러 실행, 렌더링되기 전에 동작
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		// AJAX 요청 등 modelAndView 객체가 없는 경우는 제외
		if (modelAndView != null) {
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("sId");

			if (userId != null) {
				UserVO user = userService.getUserProfile(userId);

				modelAndView.addObject("user", user);
			}
		}
	}

	// 렌더링까지 완료된 후에 동작
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
