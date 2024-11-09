package com.test.hike.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.hike.service.LocationService;

@Controller
public class LocationController {
    
    @Autowired
    private LocationService locationService;
    
    @GetMapping("/locations")
    public String locations(Model model) {
        // jsp 페이지 로드 시 locations 데이터를 바로 넘겨줍니다
        model.addAttribute("locations", locationService.getAllLocations());
        return "common/header";  // 또는 해당하는 뷰 이름
    }
}
