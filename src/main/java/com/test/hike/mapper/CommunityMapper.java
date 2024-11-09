package com.test.hike.mapper;

import java.util.List;

import com.test.hike.dto.CommentsDTO;
import com.test.hike.dto.CommunityBoardDTO;
import com.test.hike.dto.CommentsDTO;

public interface CommunityMapper {
	
	//글 목록 보기
	List<CommunityBoardDTO> boardList();
	
	//글 상세 보기
	CommunityBoardDTO boardView(int cm_board_id);
	List<CommentsDTO> commentsList();
}
