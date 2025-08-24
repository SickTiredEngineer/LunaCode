package com.itwillbs.luna_code.interceptor;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class UserRoleInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		
		Object me = null;
		
		boolean isAuthenticated = false;
	    boolean isAdmin = false;
	    boolean isInstructor = false;
	    boolean isUser = false;
	    
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		
		if (auth != null && auth.isAuthenticated() && !(auth instanceof AnonymousAuthenticationToken)) {
			
			isAuthenticated  = true;
			me = auth.getPrincipal();
			Set<String> roles = AuthorityUtils.authorityListToSet(auth.getAuthorities());
			isAdmin = roles.contains("ROLE_ADMIN");
			isInstructor = roles.contains("ROLE_INSTRUCTOR");
			isUser = roles.contains("ROLE_USER");
		}
		
		request.setAttribute("me", me);
		request.setAttribute("isAuthenticated", isAuthenticated);
		request.setAttribute("isAdmin", isAdmin);
		request.setAttribute("isInstructor", isInstructor);
		request.setAttribute("isUser", isUser);

		return true;
		
	}

}
