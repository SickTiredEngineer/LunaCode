package com.itwillbs.luna_code.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.MemberLoginMapper;
import com.itwillbs.luna_code.vo.MemberLoginVO;

@Service
public class MemberLoginService {

    @Autowired
    private MemberLoginMapper memberLoginMapper;

    public MemberLoginVO login(String username, String password) {
        MemberLoginVO member = memberLoginMapper.selectMemberVO(username, password);
        return member;
    }

}

