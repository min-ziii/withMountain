package com.test.hike.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.Collections;
import java.util.stream.Collectors;

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
                String.valueOf(dto.getUserid()),
                dto.getPassword(),
                Collections.singletonList(new SimpleGrantedAuthority(dto.getUserToken().getAccess_token())
                ));

        this.userInfo = dto;
    }
}
