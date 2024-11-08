package com.test.hike.controller;

import com.test.hike.dao.ClubDAO;
import com.test.hike.dto.ClubDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/club")
public class ClubController {

	private final ClubDAO dao;

	@GetMapping("")
	public String index(Model model) {

		List<ClubDTO> clubList = dao.clubList();
		model.addAttribute("clubList", clubList);

		return "club.index";
	}

	@GetMapping("/template")
	public String template() {
		return "club.template";
	}

	@GetMapping("/add")
	public String add() {
		return "club.add";
	}

	@GetMapping("/view")
	public String view() {
		return "club.view";
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

	@GetMapping("/member")
	public String member() {
		return "club.club-member";
	}

	@GetMapping("/edit")
	public String edit() {
		return "club.edit";
	}

}