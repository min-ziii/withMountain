package com.test.hike.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.hike.dao.MapCustomDAO;
import com.test.hike.dto.HikingRoadDTO;
import com.test.hike.dto.HikingRoadSpotDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor // 의존 주입
public class MapCustomController {
	
	private final MapCustomDAO dao;	
	
	@GetMapping("/map")
	public String map(Model model) {
		
		List<HikingRoadSpotDTO> spotList = dao.getHikingRoadSpots(); // DTO를 List에 담아서 여러개 가져오기 위함
		model.addAttribute("spotList", spotList);
		
		List<HikingRoadDTO> roadList = dao.getHikingRoads();
		model.addAttribute("roadList", roadList);
		
		return "map";
	}
	
}
