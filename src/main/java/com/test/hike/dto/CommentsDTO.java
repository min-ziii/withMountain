package com.test.hike.dto;

import lombok.Data;

@Data
public class CommentsDTO {
	private int commentId;
	private int cmBoardId;
	private int userId;
	private String createTime;
	private String content;
}
