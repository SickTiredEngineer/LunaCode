package com.itwillbs.luna_code.controller.error_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/* 권한 거부 시 여기로 이동함 */
@Controller
public class ErrorPageController {
	
  @RequestMapping(value="/AccessDenied", method={RequestMethod.GET, RequestMethod.POST})
  public String accessDenied() {
    return "error_page/access_denied";
  }
}