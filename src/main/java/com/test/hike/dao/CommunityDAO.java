package com.test.hike.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test.hike.dto.CommunityBoardDTO;
import com.test.hike.mapper.CommunityMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CommunityDAO {
	
	private final CommunityMapper mapper;
	
	public List<CommunityBoardDTO> boardList() {
		
		return mapper.boardList();
	}

	public CommunityBoardDTO boardView(int cm_board_id) {
		return mapper.boardView(cm_board_id);
	}
	
	

	
}
