package com.test.hike.dto;

import lombok.Data;

@Data
public class MessageDTO {
	private int messageId;
 	private int chatMemberId;
	private String content;
	private String sendTime;
	private String type;
	
}
