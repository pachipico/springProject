package com.springprj.www.controller.movie;

import java.util.List;

import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springprj.www.domain.LikeVO;
import com.springprj.www.domain.RatingVO;
import com.springprj.www.domain.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/movie/*")
public class ListController {
	
	@GetMapping("/popular")
	public String popularList(Model model) {
		model.addAttribute("sortBy", "popular");
		return "movie/list";
	}

	@GetMapping("/now-playing")
	public String nowPlayingList(Model model) {
		model.addAttribute("sortBy", "now_playing");
		return "movie/list";
	}
	
	@GetMapping("/up-coming")
	public String upComingList(Model model) {
		model.addAttribute("sortBy", "upcoming");
		return "movie/list";
	}
	
	@GetMapping("/rating")
	public String ratingList(Model model) {
		model.addAttribute("sortBy", "top_rated");
		return "movie/list";
	}
	
	@GetMapping("/review/{mid}")
	public ResponseEntity<List<ReviewVO>> getReviews(@PathVariable("mid") long mid){
		
		return null;
	}
	
	@PostMapping("/review/{mid}")
	public ResponseEntity<String> postReview(@PathVariable("mid") long mid, ReviewVO rvvo){
		
		return null;
	}
	
	@PatchMapping("/review/{mid}")
	public ResponseEntity<String> updateReview(@PathVariable("mid") long mid,ReviewVO rvvo){
		
		return null;
	}
	
	@DeleteMapping("/review/{mid}")
	public ResponseEntity<String> deleteReview(@PathVariable("mid") long mid, ReviewVO rvvo){
		
		return null;
	}
	
	
	@GetMapping("/like/{mid}")
	public ResponseEntity<String> getLikeCount(@PathVariable("mid") long mid){
		
		return null;
	}
	
	@PostMapping("/like/{mid}")
	public ResponseEntity<String> addLike(@PathVariable("mid") long mid, LikeVO lvo ) {  
		
		return null;
	}
	
	@DeleteMapping("/like/{mid}")
	public ResponseEntity<String> deleteLike(@PathVariable("mid") long mid, LikeVO lvo){
		
		return null;
	}
	
	@GetMapping("/rating/{mid}")
	public ResponseEntity<Double> getAvgRating(@PathVariable("mid") long mid){
		
		return null;
	}
	
	@PostMapping("/rating/{mid}")
	public ResponseEntity<String> postRating(@PathVariable("mid")long mid, RatingVO rtvo){
		
		return null;
	}
	
	@PatchMapping("/rating/{mid}")
	public ResponseEntity<String> modifyRating(@PathVariable("mid") long mid, RatingVO rtvo){
		
		return null;
	}
	
	@DeleteMapping("/rating/{mid}")
	public ResponseEntity<String> deleteRating(@PathVariable("mid") long mid, RatingVO rtvo){
		
		return null;
	}
}
