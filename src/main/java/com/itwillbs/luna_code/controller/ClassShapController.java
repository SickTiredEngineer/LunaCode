package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ClassShapController {

    @GetMapping("/ClassShop")
    public String classShop() {
        return "class_shop/class_shop";
    }
}
