package com.test.hike.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.Collections;

@Getter
@Setter
public class CustomUserDTO extends User {

    private UserInfoDTO userInfo;

    public CustomUserDTO() {
        super("default", "default", Collections.emptyList());
    }

    public CustomUserDTO(String username, String password, Collection<? extends GrantedAuthority> token){
        super(username, password, token);
    }

    public CustomUserDTO(UserInfoDTO dto) {
        super(
                String.valueOf(dto.getUserId()),
                dto.getPassword(),
                Collections.singletonList(getGrantedAuthority(dto))
        );

        this.userInfo = dto;
    }

    private static GrantedAuthority getGrantedAuthority(UserInfoDTO dto) {
        if (dto.getUserToken() != null && dto.getUserToken().getAccess_token() != null) {
            return new SimpleGrantedAuthority(dto.getUserToken().getAccess_token());
        } else {
            return new SimpleGrantedAuthority("ROLE_DEFAULT");
        }
    }
}
