package com.test.hike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MountainController {

    @GetMapping("mountain")
    public String index() {
        return "mountain";
    }
}
