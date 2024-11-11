package com.test.hike.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.test.hike.dto.BoardTagDTO;
import com.test.hike.dto.BoardTaggingDTO;
import com.test.hike.dto.CommentsDTO;
import com.test.hike.dto.CommunityBoardDTO;
import com.test.hike.mapper.CommunityMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CommunityDAO {
	
	private final CommunityMapper mapper;
	
	public List<CommunityBoardDTO> boardList(String boardType) {
		
		return mapper.boardList(boardType);
	}

	public CommunityBoardDTO boardView(int cm_board_id) {
		
		return mapper.boardView(cm_board_id);
	}

	public int boardAdd(CommunityBoardDTO boardDTO) {
		
		return mapper.boardAdd(boardDTO);
		
	}

	public int boardEdit(CommunityBoardDTO boardDTO) {
		
		return mapper.boardEdit(boardDTO);
		
	}

	public int boardDel(Integer cm_board_id) {
		
		return mapper.boardDel(cm_board_id);
		
	}

	public List<CommentsDTO> commentsList(Integer cm_board_id) {
		
		return mapper.commentsList(cm_board_id);
	}

	public int boardLikes(int cm_board_id) {

		return mapper.boardLikes(cm_board_id);
	}

	public List<String> boardTags(Integer cm_board_id) {
	    // BoardTaggingDTO를 통해 해당 게시글에 연결된 태그 ID를 조회
	    List<BoardTaggingDTO> taggings = mapper.boardTags(cm_board_id);

	    // 각 태그 ID에 해당하는 BoardTagDTO 정보를 조회
	    List<String> tags = new ArrayList<>();
	    for (BoardTaggingDTO tagging : taggings) {
	        // BoardTagDTO에 해당하는 정보를 조회
	        String tag = mapper.tags(tagging.getBoard_tag_id());
	        tags.add(tag);
	    }
	    
	    return tags; // 해당 게시글에 연결된 모든 태그 정보를 반환
	};

	
}
