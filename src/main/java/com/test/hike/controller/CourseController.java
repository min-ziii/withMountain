package com.test.hike.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.test.hike.dao.MapCustomDAO;
import com.test.hike.dto.MountainDTO;
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
    private final ObjectMapper objectMapper;

    @GetMapping("")
    public String search(Model model) {

        List<MountainDTO> mountains = dao.getSearchMountainSpots();

        model.addAttribute("mountains", mountains);

        return "course.search";
    }

    @GetMapping("view")
    public String view(Model model, String mtId) {
        // For Test
        // com.test.hike.dto.custom.MountainDTO result = dao.getAllRoadsWithCoordsByMtId(Integer.parseInt(mtId));
        //
        // try {
        //     String jsonResult = objectMapper.writeValueAsString(result);
        //     model.addAttribute("data", jsonResult);
        // } catch (Exception e) {
        //     e.printStackTrace();
        // }

        return "course.view";
    }
}
