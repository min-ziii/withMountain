package com.test.hike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/club")
public class ClubController {

	@GetMapping("")
	public String index() {
		return "club.index";
	}
	
	@GetMapping("/view") 
	public String view() {
		return "club.view";
	}
	
	@GetMapping("/template") 
	public String list() {
		return "club.template";
	}
	
	@GetMapping("/add") 
	public String add() {
		return "club.add";
	}

	@GetMapping("/scheduler")
	public String scheduler() {
		return "club.scheduler";
	}

	@GetMapping("/hike")
	public String hike() {
		return "club.hike";
	}

	@GetMapping("/gallery")
	public String gallery() {
		return "club.gallery";
	}
}
