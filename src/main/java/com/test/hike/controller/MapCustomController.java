package com.test.hike.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.hike.dao.MapCustomDAO;
import com.test.hike.dto.HikingRoadSpotDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor // 의존 주입
public class MapCustomController {
	
	private final MapCustomDAO dao;
	
	// 일단 RestController 대신 Controller로 선언하고
	// JSON 데이터 가져오기만 할 method는 매개변수에 @ResponseBody를 쓰나?
	
	// 앞으로 연계할 것
	// 산선택dto를 그대로 가지고 올건지 두 개만 가지고 올건지는... 도일s가 데이터를 어떻게 만드냐에 따라 다르겠지...?
	// 일단은 커스텀페이지 단독만 구현하자...
	
	
	// 등산로 커스텀 페이지인 map.jsp를 출력하는 method.
	// - 산 선택 페이지에서 산코드(MNTN_CODE)를 매개변수로 가지고 커스텀 등산로 페이지로 진입.
	// - 커스텀 등산로 페이지 속 지도API에 image Marker로 표기하기 위해 DB에서 SPOT x,y 데이터를 가져온다.
	@GetMapping("/map")
	public String map(Model model) {
		
		List<HikingRoadSpotDTO> list = dao.getHikingRoadSpots(); // DTO를 List에 담아서 여러개 가져오기 위함
		
		model.addAttribute("list", list);
		
		return "map";
	}
	
}
