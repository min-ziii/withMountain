package com.test.hike.dto;

import lombok.Data;

@Data
public class MemberDTO {
	private int memberId;
	private int clubId;
	private int userId;
	private String type;
	private String regdate;
	private String outDate;
	private String outStatus;
	
}
