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
    
    @GetMapping("/add")
    public String add() {
    	return "community.add";
    }
    
    @GetMapping("/edit")
    public String edit() {
    	return "community.edit";
    }
    
    @GetMapping("/view")
    public String view() {
    	return "community.view";
    }
    
    @GetMapping("/del")
    public String del() {
    	return "community.del";
    }
    
    
    
}




