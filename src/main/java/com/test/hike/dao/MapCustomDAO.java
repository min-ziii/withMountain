package com.test.hike.dao;

import java.util.List;

import com.test.hike.dto.MountainDTO;
import org.springframework.stereotype.Repository;

import com.test.hike.dto.HikingRoadDTO;
import com.test.hike.dto.HikingRoadSpotDTO;
import com.test.hike.mapper.MapCustomMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor // 필수 인자를 갖는 생성자 자동 생성
public class MapCustomDAO {
	private final MapCustomMapper mapper;

	public List<HikingRoadSpotDTO> getHikingRoadSpots() {
		return mapper.getHikingRoadSpots();
	}

	public List<MountainDTO> getSearchMountainSpots() {
		return mapper.getSearchMountainSpots();
	}

	public List<HikingRoadDTO> getHikingRoads() {
		return mapper.getHikingRoads();
	}

	public com.test.hike.dto.custom.MountainDTO getAllRoadsWithCoordsByMtId(int mtId) {
		return mapper.getAllRoadsWithCoordsByMtId(mtId);
	}
}
