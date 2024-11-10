package com.test.hike.dto;

import com.test.hike.enums.TokenCategory;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserTokenDTO {
    private String user_token_id;
    private String user_id;
    private String access_token;
    private String refresh_token;
    private String create_time;
    private String edit_time;
    private TokenCategory category;
}
