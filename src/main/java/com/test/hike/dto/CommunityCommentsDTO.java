package com.test.hike.dto;

import lombok.Data;

@Data
public class CommunityCommentsDTO {
	
	//커뮤니티 댓글
	private int commentId;     
    private int cmBoardId;     
    private int userId;       
    private String createTime; 
    private String content; 
	
}
