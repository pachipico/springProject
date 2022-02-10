package com.springprj.www.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springprj.www.domain.movietv.MovieVO;
import com.springprj.www.service.movie.MovieService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/*")
public class HomeController {
	
	@Inject
	private MovieService msv;
	
	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		model.addAttribute("ses",session.getAttribute("ses"));
		List<MovieVO> ratingRank = msv.getRatingRankList();
		List<MovieVO> likeRank = msv.getLikeRankList(); 
		
		model.addAttribute("ratingRank", ratingRank);
		model.addAttribute("likeRank", likeRank);
		return "home";
	}
}
