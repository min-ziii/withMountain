package com.test.hike.dto;

import lombok.Data;

@Data
public class ClubDTO {
	private String clubId;
    private String name;
    private String isPrivate;
    private String maxMember;
    private String intro;
    private String image;
    private String createDate;
    private String code;
}