package com.test.hike.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClubDTO {
	private String club_id;
    private String location_id;
    private String name;
    private String is_private;
    private String max_member;
    private String intro;
    private String image;
    private String create_date;
    private String code;
}