package com.test.hike.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.hike.dao.MapAPIDAO;
import com.test.hike.dto.MapAPISpotDTO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor // 의존 주입
public class MapAPISpotController {
	
	private final MapAPIDAO dao;
	
	// 등산로 SPOT 데이터를 DB에 insert하기 위한 method.
	// POSTMAN 같은 클라이언트에 ../mapapi/mountainSpot POST로 주소를 설정하고 데이터를 넣는건지?
	// 아니면 MapAPIMapper.xml에 SQL 구문으로?
	// json 파일을 읽어서 특정 key와 그 key의 value를 추출해야 하니까 xml쪽 방법이 맞을 듯?
	@PostMapping("/mountainSpot") 
	public int insertSpot(MapAPISpotDTO dto) {
		
		int result = dao.add(dto); // 성공하면 200메시지, 1 반환
		
		return result;
	}
}
