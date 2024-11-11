package com.test.hike.mapper;

import java.util.List;

import com.test.hike.dto.BoardTaggingDTO;
import com.test.hike.dto.CommentsDTO;
import com.test.hike.dto.CommunityBoardDTO;

public interface CommunityMapper {
	
	//글 목록 보기
	List<CommunityBoardDTO> boardList(String boardType);
	
	//글 상세 보기
	CommunityBoardDTO boardView(int cm_board_id);
	List<CommentsDTO> commentsList(int cm_board_id);

	int boardAdd(CommunityBoardDTO boardDTO);

	int boardEdit(CommunityBoardDTO boardDTO);

	int boardDel(Integer cm_board_id);

	int boardLikes(int cm_board_id);

	List<BoardTaggingDTO> boardTags(Integer cm_board_id);

	String tags(int board_tag_id);
}
