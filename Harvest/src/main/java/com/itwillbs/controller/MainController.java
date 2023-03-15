package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	@RequestMapping(value = "mainpage/main", method = RequestMethod.GET)	
	public String Main() {
		// 기본 이동방식 : 주소변경 없이 이동 
		return "mainpage/mainPage";
	}
}