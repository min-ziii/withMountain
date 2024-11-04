package com.test.hike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	// map.jsp 출력 페이지
	@GetMapping("/map")
	public String map() {
		
		return "map";
	}
	
}
