package com.itwillbs.luna_code.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.MemberLoginMapper;
import com.itwillbs.luna_code.vo.MemberLoginVO;

@Service
public class MemberLoginService {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
    @Autowired
    private MemberLoginMapper memberLoginMapper;

    public MemberLoginVO login(String user_id, String password) {
        MemberLoginVO member = memberLoginMapper.selectMemberVO(user_id, password);
//        member.setPassword(passwordEncoder.encode(password));
        return member;
    }
    
    // 아이디 찾기
    public MemberLoginVO findUserId(String name, String email) {
        String userId = memberLoginMapper.selectUserId(name, email);
        if (userId != null) {
            MemberLoginVO result = new MemberLoginVO();
            result.setUser_id(userId);
            result.setUser_name(name);
            result.setEmail(email);
            return result;
        }
        return null;
    }
    
    //비밀번호 찾기
    public MemberLoginVO findUserPass(String id, String email) {
        String userPass = memberLoginMapper.selectUserPass(id, email);
        if (userPass != null) {
            MemberLoginVO result = new MemberLoginVO();
            result.setPassword(userPass);
            result.setUser_name(id);
            result.setEmail(email);
            return result;
        }
        return null;
    }




}

