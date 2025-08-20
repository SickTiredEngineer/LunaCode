package com.itwillbs.luna_code.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.luna_code.service.MemberLoginService;
import com.itwillbs.luna_code.vo.MemberLoginVO;

@Controller
public class MemberLoginController {

    @Autowired
    private MemberLoginService memberLoginService;

    @GetMapping("/MemberLogin")
    public String login() {
    	return "member/login_modal";
    }
    
    @PostMapping("/MemberLoginForm")
    public String login(@RequestParam("user_id") String user_id,
                        @RequestParam("password") String password,
                        HttpSession session,
                        Model model) {

        MemberLoginVO member = memberLoginService.login(user_id, password);

        if (member != null) {
        	session.setAttribute("sId", member.getUser_id());
        	
            session.setAttribute("loginUser", member);
            return "redirect:/GoHome";
        } else {
            model.addAttribute("error", "아이디 혹은 비밀번호가 잘못 되었습니다.");
            return "member/login_modal"; 
        }
    }
    
    @GetMapping("/MemberLogout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";  
    }
    
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
