package com.test.hike.dto;

import lombok.Data;

@Data
public class CommentsDTO {
	private int comment_id;
	private int cm_board_id;
	private int user_id;
	private String create_time;
	private String content;
}
