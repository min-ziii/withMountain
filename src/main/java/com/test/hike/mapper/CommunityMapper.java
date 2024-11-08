package com.test.hike.mapper;

import java.util.List;

import com.test.hike.dto.CommunityBoardDTO;
import com.test.hike.dto.CommunityCommentsDTO;

public interface CommunityMapper {
	
	List<CommunityBoardDTO> boardList();
	List<CommunityCommentsDTO> commentsList();

}
