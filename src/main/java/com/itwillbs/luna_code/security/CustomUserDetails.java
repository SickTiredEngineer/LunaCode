package com.itwillbs.luna_code.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import java.util.Collection;

public class CustomUserDetails extends User {
	private int idx;
	private final String user_id;
    private final String nickname;
    private final String profileImg; // DB 컬럼명에 맞춰서

    public CustomUserDetails(
    		int idx,
    		String user_id,
            String username,
            String password,
            Collection<? extends GrantedAuthority> authorities,
            String nickname,
            String profileImg
    ) {
        super(username, password, authorities);
        this.idx = idx;
        this.user_id = user_id;
        this.nickname = nickname;
        this.profileImg = profileImg;
    }
    
    public int getIdx() { return idx; }
    public String getNickname() { return nickname; }
    public String getProfileImg() { return profileImg; }
    public String getUserId() { return user_id; }
}
