package com.itwillbs.luna_code.security;


import org.springframework.security.core.userdetails.*;

import com.itwillbs.luna_code.mapper.MemberLoginMapper;
import com.itwillbs.luna_code.vo.MemberLoginVO;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.List;

public class CustomUserDetailsService implements UserDetailsService {

    private MemberLoginMapper memberMapper;         // root-context에서 스캔된 매퍼가 주입됨

    public void setMemberMapper(MemberLoginMapper memberMapper) { this.memberMapper = memberMapper; }

    @Override
    public UserDetails loadUserByUsername(@Param("user_id") String user_name) throws UsernameNotFoundException {
        /* 사용자 VO 찾아옴 */
        MemberLoginVO memberVo = memberMapper.selectMemberVOById(user_name);
        if (memberVo == null) throw new UsernameNotFoundException(user_name);

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
        
        
        return new CustomUserDetails(
        		memberVo.getUser_name(), 
        		memberVo.getPassword(), 
        		List.of(new SimpleGrantedAuthority(role)), 
        		memberVo.getNickname(), 
        		memberVo.getProfile_img()
        );
        

//        return CustomUserDetails.withUsername(memberVo.getUser_id())
//        		/* "{noop}" 붙이면 비밀번호 암호화 검사 안하긴함 일단 */
//                .password(memberVo.getPassword())    
//                .authorities(List.of(new SimpleGrantedAuthority(role)))
////                .disabled(!memberVo.isActive())       // 활성/비활성 필드명에 맞게
//                .build();
    }
}
