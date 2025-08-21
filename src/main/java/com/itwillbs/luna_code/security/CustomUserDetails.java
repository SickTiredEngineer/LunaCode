package com.itwillbs.luna_code.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import java.util.Collection;

public class CustomUserDetails extends User {
    private final String nickname;
    private final String profileImg; // DB 컬럼명에 맞춰서

    public CustomUserDetails(
            String username,
            String password,
            Collection<? extends GrantedAuthority> authorities,
            String nickname,
            String profileImg
    ) {
        super(username, password, authorities);
        this.nickname = nickname;
        this.profileImg = profileImg;
    }

    public String getNickname() { return nickname; }
    public String getProfileImg() { return profileImg; }
}
