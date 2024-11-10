package com.test.hike.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.hike.dto.LocationDTO;
import com.test.hike.service.LocationService;

@Controller
public class LocationController {
    
    @Autowired
    private LocationService locationService;
    
    // 회원가입 폼에서 사용할 수 있도록 UserController나 해당하는 컨트롤러에서 처리하는 것이 좋음
    @GetMapping("/signup")  // URL 수정
    public String showSignupForm(Model model) {
        model.addAttribute("locations", locationService.getAllLocations());
        return "user/signup";  // 실제 회원가입 폼이 있는 JSP 경로
    }
    
    //회원가입 모달이 열릴 때 지역 데이터를 가져와서 select 박스에 표시
    @GetMapping("/getAllLocations.do")
    @ResponseBody
    public List<LocationDTO> getAllLocations() {
        return locationService.getAllLocations();
    }
    
}
