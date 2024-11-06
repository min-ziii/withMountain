package com.test.hike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/course")
public class CourseController {

    @GetMapping("")
    public String search() {
        return "course.search";
    }

    @GetMapping("view")
    public String view () {
        return "course.view";
    }
}
