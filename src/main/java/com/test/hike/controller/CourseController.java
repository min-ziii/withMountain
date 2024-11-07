package com.test.hike.controller;

import com.test.hike.dao.MapCustomDAO;
import com.test.hike.dto.MountainDTO;
import com.test.hike.mapper.MapCustomMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/course")
public class CourseController {
    private final MapCustomDAO dao;

    @GetMapping("")
    public String search(Model model) {

        List<MountainDTO> mountains = dao.getSearchMountainSpots();

        model.addAttribute("mountains", mountains);

        return "course.search";
    }

    @GetMapping("view")
    public String view () {
        return "course.view";
    }
}
