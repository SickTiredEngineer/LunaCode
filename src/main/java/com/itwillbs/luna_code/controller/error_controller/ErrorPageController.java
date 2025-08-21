package com.itwillbs.luna_code.controller.error_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorPageController {
	
  @RequestMapping(value="/AccessDenied", method={RequestMethod.GET, RequestMethod.POST})
  public String accessDenied() {
    return "error_page/access_denied"; // /WEB-INF/views/error/accessDenied.jsp
  }
}