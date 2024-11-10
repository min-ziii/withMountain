package com.test.hike.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.test.hike.dao.MapCustomDAO;
import com.test.hike.dto.HikingRoadSpotDTO;
import com.test.hike.dto.MountainDTO;
import com.test.hike.mapper.MapCustomMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor // 의존 주입
@RequestMapping("/course")
public class CourseController {
    private final MapCustomDAO dao;
    private final MapCustomMapper mapper;
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
        List<HikingRoadSpotDTO> spotList = dao.getHikingRoadSpots(); // DTO를 List에 담아서 여러개 가져오기 위함

        // Jackson 라이브러리를 사용해서 spotList를 JSON형 데이터로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String spotListJson = objectMapper.writeValueAsString(spotList);
            model.addAttribute("spotListJson", spotListJson);
        } catch (Exception e) {
            e.printStackTrace();
        }


        return "course.view";
    }
}
