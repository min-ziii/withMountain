package com.test.hike.mapper;

import java.util.List;

import com.test.hike.dto.MountainDTO;
import org.apache.ibatis.annotations.Mapper;

import com.test.hike.dto.HikingRoadDTO;
import com.test.hike.dto.HikingRoadSpotDTO;

@Mapper
public interface MapCustomMapper {
	
	List<HikingRoadSpotDTO> getHikingRoadSpots(); // DB에서 등산로 지점 데이터 전부를 가져오는 method

	List<MountainDTO> getSearchMountainSpots(); // 산 위치

	List<HikingRoadDTO> getHikingRoads();

	com.test.hike.dto.custom.MountainDTO getAllRoadsWithCoordsByMtId(int mtId);
}
