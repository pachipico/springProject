package com.springprj.www.controller.movie;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springprj.www.domain.LikeVO;
import com.springprj.www.domain.MovieDTO;
import com.springprj.www.domain.MovieVO;
import com.springprj.www.domain.RatingVO;
import com.springprj.www.domain.ReviewVO;
import com.springprj.www.service.movie.MovieService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/movie/*")
public class MovieController {

	@Inject
	private MovieService msv;

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

	@GetMapping("/detail/{id}")
	public String detail(Model model, @PathVariable("id") long id) {
		model.addAttribute("category", "movie");
		model.addAttribute("id", id);

		return "detail";
	}

	@GetMapping(value = "/{id}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<MovieDTO> getMovieData(@PathVariable("id") long id) {
		MovieDTO dto = msv.getMovieData(id, "123@123.com");
		
		return new ResponseEntity<MovieDTO>(dto, HttpStatus.OK);
	}

	// ============================== review ==================================

	@PostMapping(value = "/review/{mid}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> postReview(@PathVariable("mid") long mid, @RequestBody MovieDTO dto) {
		msv.registerMovieIfNotExists(dto.getMvvo());

		return msv.registerReview(dto.getRvvo()) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PatchMapping(value = "/review/{mid}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modifyReview(@PathVariable("mid") long mid, @RequestBody ReviewVO rvvo) {

		return msv.modifyReview(rvvo) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@DeleteMapping(value = "/review/{mid}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deleteReview(@PathVariable("mid") long mid, @RequestBody ReviewVO rvvo) {

		return msv.deleteReview(mid, rvvo.getWriter()) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// ============================== like ==================================

	@PostMapping(value = "/like/{mid}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> postLike(@PathVariable("mid") long mid, @RequestBody MovieDTO dto) {
		msv.registerMovieIfNotExists(dto.getMvvo());

		return msv.registerLike(dto.getLvo()) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@DeleteMapping(value = "/like/{mid}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteLike(@PathVariable("mid") long mid, @RequestBody RatingVO rtvo){
		return msv.deleteLike(rtvo.getMid(), rtvo.getEmail()) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// ============================== rating ==================================

	@PostMapping(value = "/rating/{mid}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<Double> postRating(@PathVariable("mid") long mid, @RequestBody MovieDTO dto) {
		msv.registerMovieIfNotExists(dto.getMvvo());
		Double changedRating = msv.registerRating(dto.getRtvo());
		return changedRating != null ? new ResponseEntity<Double>(changedRating, HttpStatus.OK)
				: new ResponseEntity<Double>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PatchMapping(value = "/rating/{mid}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<Double> updateRating(@PathVariable("mid") long mid, @RequestBody RatingVO rtvo){
		Double changedRating = msv.modifyRating(rtvo);
		return changedRating != null ? new ResponseEntity<Double>(changedRating, HttpStatus.OK)
				: new ResponseEntity<Double>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/rating/{mid}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<Double> deleteRating(@PathVariable("mid") long mid, @RequestBody RatingVO rtvo){
		Double changedRating = msv.deleteRating(mid, rtvo.getEmail());
		return changedRating != null ? new ResponseEntity<Double>(changedRating, HttpStatus.OK)
				: new ResponseEntity<Double>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// ======================== 유저가 평점,즐겨찾기,평점 남긴 영화 리스트 ==========================
	@GetMapping("/{email}/liked")
	public ResponseEntity<List<MovieVO>> getUserLikedMovieList(@PathVariable("email") String email){
		List<MovieVO> list = msv.getUserLikedList(email);
		return new ResponseEntity<List<MovieVO>>(list, HttpStatus.OK);
	}
	
	@GetMapping(value = "/{email}/reviewed", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<MovieVO>> getUserReviewedList(@PathVariable("email") String email){
		List<MovieVO> list = msv.getUserReviewedList(email);
		return new ResponseEntity<List<MovieVO>>(list, HttpStatus.OK);
	}
	
	@GetMapping(value = "/{email}/rated")
	public ResponseEntity<List<MovieVO>> getUserRatedList(@PathVariable("email") String email){
		List<MovieVO> list = msv.getUserRatedList(email);
		return new ResponseEntity<List<MovieVO>>(list, HttpStatus.OK);
	}
}
