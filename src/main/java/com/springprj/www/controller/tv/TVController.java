package com.springprj.www.controller.tv;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
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
import com.springprj.www.domain.RatingVO;
import com.springprj.www.domain.ReviewVO;
import com.springprj.www.domain.TVDTO;
import com.springprj.www.service.tv.TVService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/tv/*")
public class TVController {

	@Inject
	private TVService tsv;

	@GetMapping("/netflix")
	public String netflixList(Model model) {
		model.addAttribute("platform", "8");
		return "tv/list";
	}

	@GetMapping("/amazon")
	public String amazonList(Model model) {
		model.addAttribute("platform", "119");
		return "tv/list";
	}

	@GetMapping("/watcha")
	public String watchaList(Model model) {
		model.addAttribute("platform", "97");
		return "tv/list";
	}

	@GetMapping("/wavve")
	public String wavveList(Model model) {
		model.addAttribute("platform", "356");
		return "tv/list";
	}
	
	@GetMapping("/detail/{id}")
	public String detail(Model model, @PathVariable("id") long id) {
		model.addAttribute("id", id);
		model.addAttribute("category", "tv");
		return "detail";
	}

	@GetMapping(value = "/{tvid}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<TVDTO> getTVdata(@PathVariable("tvid") long tvid) {
		TVDTO dto = tsv.getTVData(tvid, "123@123.com");
		return new ResponseEntity<TVDTO>(dto, HttpStatus.OK);
	}

	// ============================== review ================================

	@PostMapping(value = "/review/{tvid}", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> registerReview(@PathVariable("tvid") long tvid,@RequestBody TVDTO dto) {
		tsv.registerTVIfNotExists(dto.getTvvo());
		return tsv.registerReview(dto.getRvvo()) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PatchMapping(value = "/review/{tvid}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modifyReview(@PathVariable("tvid") long tvid, @RequestBody ReviewVO rvvo){
		return tsv.modifyReview(rvvo) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/review/{tvid}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteReview(@PathVariable("tvid") long tvid, @RequestBody ReviewVO rvvo){
		return tsv.deleteReview(rvvo.getTvid(), rvvo.getWriter()) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// ============================= like ===============================
	
	@PostMapping(value = "/like/{tvid}" , consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> addLike(@PathVariable("tvid") long tvid, @RequestBody TVDTO dto){
		tsv.registerTVIfNotExists(dto.getTvvo());
		return tsv.registerLike(dto.getLvo()) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/like/{tvid}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> removeLike(@PathVariable("tvid") long tvid, @RequestBody LikeVO lvo){
		return tsv.deleteLike(lvo.getTvid(), lvo.getEmail()) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// ============================= rating ================================
	
	@PostMapping(value = "/rating/{tvid}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<Double> registerRating(@PathVariable("tvid") long tvid , @RequestBody TVDTO dto){
		tsv.registerTVIfNotExists(dto.getTvvo());
		Double changedRating = tsv.registerRating(dto.getRtvo());
		return changedRating != null ? new ResponseEntity<Double>(changedRating, HttpStatus.OK)
				: new ResponseEntity<Double>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PatchMapping(value = "/rating/{tvid}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<Double> modifyRating(@PathVariable("tvid") long tvid, @RequestBody RatingVO rtvo){
		Double changedRating = tsv.modifyRating(rtvo);
		return changedRating != null ? new ResponseEntity<Double>(changedRating, HttpStatus.OK)
				: new ResponseEntity<Double>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/rating/{tvid}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<Double> deleteRating(@PathVariable("tvid") long tvid, @RequestBody RatingVO rtvo){
		Double changedRating = tsv.deleteRating(rtvo.getTvid(), rtvo.getEmail());
		return changedRating != null ? new ResponseEntity<Double>(changedRating, HttpStatus.OK)
				: new ResponseEntity<Double>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
