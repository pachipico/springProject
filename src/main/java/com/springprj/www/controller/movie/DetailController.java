package com.springprj.www.controller.movie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/movie/detail/*")
public class DetailController {

//	@GetMapping("/{id}")
//	public String detail(Model model,@PathVariable("id") long id) {
//		model.addAttribute("id", id);
//		return "detail";
//	}
}
