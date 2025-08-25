package com.itwillbs.luna_code.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import java.util.Collection;
import java.util.Set;

public class CustomUserDetails extends User {
	private int idx;
	private final String user_id;
    private final String nickname;
    private final String profileImg; // DB 컬럼명에 맞춰서
    
//    private final boolean isAdmin = false;
//    private final boolean isInstructor = false;
//    private final boolean isMember = false;
//    
    private transient Set<String> roleSet;

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
    
    
    private Set<String> roles() {
        if (roleSet == null) {
            roleSet = AuthorityUtils.authorityListToSet(getAuthorities());
        }
        return roleSet;
    }
    
    
    public boolean hasRole(String role) {              // "ROLE_ADMIN" 형태로
        return roles().contains(role);
    }

    public boolean hasAnyRole(String... roles) {
        for (String r : roles) if (hasRole(r)) return true;
        return false;
    }
    
    
    public int getIdx() { return idx; }
    public String getNickname() { return nickname; }
    public String getProfileImg() { return profileImg; }
    public String getUserId() { return user_id; }
    
    public boolean isAdmin() { return hasRole("ROLE_ADMIN"); }
    public boolean isInstructor() { return hasRole("ROLE_INSTRUCTOR"); }
    public boolean isUser() { return hasRole("ROLE_USER"); }
    
}
