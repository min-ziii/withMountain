package com.test.hike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
    @GetMapping("")
    public String photo() {
        return "community.photo";
    }
    @GetMapping("/free")
    public String free() {
    	return "community.free";
    }
    @GetMapping("/qna")
    public String qna() {
    	return "community.qna";
    }
}




