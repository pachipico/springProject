package com.springprj.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/*")
public class HomeController {
	
	@GetMapping("/home")
	public String home() {
		log.info("서버 가동 성공");
		System.out.println("asfs");
		log.debug("asfas");
		return "home";
	}
}
