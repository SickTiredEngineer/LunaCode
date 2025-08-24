package com.itwillbs.luna_code.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.MemberLoginService;
import com.itwillbs.luna_code.service.usermain.AttendanceService;
import com.itwillbs.luna_code.vo.MemberLoginVO;

@Controller
public class MemberLoginController {

    @Autowired
    private MemberLoginService memberLoginService;
    
    @Autowired
    private AttendanceService attendanceService;

    
    @GetMapping("/MemberLogin")
    public String login() {
    	return "member/login_modal";
    }
    
    @GetMapping("/MemberLoginTemp")
    public String loginTemp(Model model) {
//    	model.addAttribute(error);
    	return "member/login_temp";
    }
    
    
    @GetMapping("/UpdateAttendance")
    public String updateAttendance(Authentication auth) {
    	
    	CustomUserDetails user = (CustomUserDetails)auth.getPrincipal();
    	attendanceService.performAttendanceCheck(user.getUserId());
    	
    	return "usermain/usermain";
    }
    
    
//    @GetMapping("/MemberLogin")
//    public String login(HttpServletRequest request) {
//        SavedRequest saved = new HttpSessionRequestCache().getRequest(request, null);
//        String target = (saved != null) ? saved.getRedirectUrl() : "GoHome";
//        // flag를 붙여서 헤더 스크립트가 모달을 열게 한다
//        if (target.contains("?")) {
//            target += "&loginRequired=1";
//        } else {
//            target += "?loginRequired=1";
//        }
//        return "redirect:" + target;
//    }
//    
    
    @PostMapping("/MemberLoginForm")
    public String login(@RequestParam("user_id") String user_id,
                        @RequestParam("password") String password,
                        HttpSession session,
                        Model model) {

        MemberLoginVO member = memberLoginService.login(user_id, password);

        if (member != null) {
        	session.setAttribute("sId", member.getUser_id());
        	
            session.setAttribute("loginUser", member);
            
         // 로그인 성공 후, 자동 출석 체크 서비스 호출
 			try {
 				attendanceService.performAttendanceCheck(member.getUser_id());
 			} catch (Exception e) {
 				System.out.println("자동 출석 체크 중 오류 발생: " + e.getMessage());
 				e.printStackTrace();
 			}
            
            return "redirect:/GoHome";
        } else {
            model.addAttribute("error", "아이디 혹은 비밀번호가 잘못 되었습니다.");
            return "member/login_modal"; 
        }
    }
    
//    @GetMapping("/MemberLogout")
//    public String logout(HttpSession session) {
//        session.invalidate();
//        return "redirect:/GoHome";  
//    }
    
    @GetMapping("FindAccount")
	public String findAccount() {
		return "member/find_account";
	}
    
    @PostMapping("/ResultAccount")
    public String findAccount(@RequestParam("name") String name,
                              @RequestParam("email") String email,
                              Model model) {
        MemberLoginVO findmember = memberLoginService.findUserId(name, email);
        if (findmember != null) {
            model.addAttribute("userId", findmember.getUser_id());
        }
        return "member/result_account";
    }

    @PostMapping("/PassFindAccount")
    public String findPassAccount(@RequestParam("id") String id,
                              @RequestParam("email") String email,
                              Model model) {
        MemberLoginVO findpassmember = memberLoginService.findUserPass(id, email);
        if (findpassmember != null) {
            model.addAttribute("userPass", findpassmember.getPassword());
        }
        return "member/pass_find_account";
    }






    
    
    
    
}
