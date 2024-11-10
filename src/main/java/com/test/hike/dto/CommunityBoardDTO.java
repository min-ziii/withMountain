package com.test.hike.dto;

import java.util.ArrayList;
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
	private int board_tagging_id;
	private ArrayList<String> name;
	
	//좋아요
	private int board_like_id;
	
	//댓글
	private List<CommentsDTO> comments;
	
}
