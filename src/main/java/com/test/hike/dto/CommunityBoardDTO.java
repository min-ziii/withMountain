package com.test.hike.dto;

import java.util.List;

import lombok.Data;

@Data
public class CommunityBoardDTO {
	
	//커뮤니티 게시물
	//내용
	private int cm_board_id;
	private int user_id;
	private String create_time;
	private String title;
	private String content;
	private String type;
	private String image;
	
	//해시태그
	private List<String> hashtags;
	
	//좋아요
	private int likeCount;
	
	//댓글
	private List<CommentsDTO> comments;
	
}
