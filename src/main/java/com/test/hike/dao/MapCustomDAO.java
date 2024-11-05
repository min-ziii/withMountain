package com.test.hike.dao;

import org.springframework.stereotype.Repository;

import com.test.hike.dto.MapCustomDTO;
import com.test.hike.mapper.MapCustomMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor // 필수 인자를 갖는 생성자 자동 생성
public class MapCustomDAO {
	
	private final MapCustomMapper mapper;
	
	/*
	// 데이터 insert를 위한 add() 정의
	public int add(MapAPISpotDTO dto) {
		
		return mapper.add(dto); // MapAPIMapper.xml에서 insert 구문 작성
	}
	*/
}
