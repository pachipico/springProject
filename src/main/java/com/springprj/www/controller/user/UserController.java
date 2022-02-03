package com.springprj.www.controller.user;

import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.springprj.www.security.UserVO;
import com.springprj.www.service.movie.MovieService;
import com.springprj.www.service.tv.TVService;
import com.springprj.www.service.user.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	private UserService usv;

	@Inject
	private MovieService msv;

	@Inject
	private TVService tsv;
	
	@Inject
	private BCryptPasswordEncoder bcpEncoder;
	

	@GetMapping("/register")
	public void register() {
	}

	@PostMapping("/register")
	public String register(UserVO uvo, RedirectAttributes reAttr) {
		uvo.setPwd(bcpEncoder.encode(uvo.getPwd()));
		int isSuccess = usv.registerUser(uvo);
		reAttr.addFlashAttribute("isSuccess", isSuccess);
		return "redirect:/user/login";
	}

	@GetMapping("/findId")
	public void findId() {
	}

	@PostMapping("/findId")
	public String findId(String name, String nickName, RedirectAttributes reAttr) {
		reAttr.addFlashAttribute("email", usv.findEmailByNameAndNickName(name, nickName));
		return "redirect:/user/login";
	}

	@GetMapping("/findPwd")
	public void findPwd() {
	}

	@PostMapping("findPwd")
	public String findPwd(String email, RedirectAttributes reAttr) {
		// ??
		return "redirect:/user/login";
	}

	@GetMapping("/login")
	public void login() {
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request, RedirectAttributes reAttr) {
		
		reAttr.addFlashAttribute("email", request.getAttribute("email"));
		reAttr.addFlashAttribute("errMsg", request.getAttribute("errMsg"));
		return "redirect:/user/login";
	}

	@PostMapping("/logout")
	public String logout(String email, HttpSession session) {
		session.invalidate();
		return "redirect:/user/login";
	}

	@GetMapping("/{email}")
	public String detail(HttpSession session, Model model, @PathVariable("email") String email) {
		log.debug("{}'s main detail page", email);
		model.addAttribute("list", "main");
		model.addAttribute("tvAvg", usv.getUsersAvgTVRating(email));
		model.addAttribute("movieAvg", usv.getUsersAvgMovieRating(email));
		model.addAttribute("uvo", usv.getUserDetail(email));
		
		return "user/detail";
	}

	@GetMapping(value = {"/{email}/likedList", "/{email}/likedList/{tv}"})
	public String likedList(@PathVariable(name = "email") String email, @PathVariable(name = "tv", required = false) String tv, Model model) {
		ObjectMapper mapper = new ObjectMapper();
		model.addAttribute("platform" , tv != null ? "tv" : "movie");
		model.addAttribute("list", "liked");
		model.addAttribute("tvAvg", usv.getUsersAvgTVRating(email));
		model.addAttribute("movieAvg", usv.getUsersAvgMovieRating(email));
		model.addAttribute("uvo", usv.getUserDetail(email));
		try {
			model.addAttribute("moviesData", mapper.writeValueAsString(msv.getUserLikedList(email)));
			model.addAttribute("tvsData", mapper.writeValueAsString(tsv.getUserLikedList(email)));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "user/detail";
	}
	
	@GetMapping(value = {"/{email}/ratedList", "/{email}/ratedList/{tv}"})
	public String ratedList(@PathVariable(name = "email") String email,@PathVariable(name = "tv", required = false) String tv , Model model) {
		ObjectMapper mapper = new ObjectMapper();
		model.addAttribute("platform" , tv != null ? "tv" : "movie");
		model.addAttribute("list", "rated");
		model.addAttribute("tvAvg", usv.getUsersAvgTVRating(email));
		model.addAttribute("movieAvg", usv.getUsersAvgMovieRating(email));
		model.addAttribute("uvo", usv.getUserDetail(email));
		
		//영화 id 리스트를 자바스크립트로 주면, 자바스크립트에서 각각 getDetail로 정보 받아오기..?
		// 받아온 영화 리스트에 좋아요여부를 어떻게 넣을지..?
		try {
			model.addAttribute("moviesData", mapper.writeValueAsString(msv.getUserRatedList(email)));
			model.addAttribute("tvsData", mapper.writeValueAsString(tsv.getUserRatedList(email)));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "user/detail";
	}
	@GetMapping(value = {"/{email}/reviewedList", "/{email}/reviewedList/{tv}"})
	public String reviewedList(@PathVariable(name = "email") String email, @PathVariable(name = "tv", required = false) String tv, Model model) {
		ObjectMapper mapper = new  ObjectMapper();
		model.addAttribute("platform" , tv != null ? "tv" : "movie");
		model.addAttribute("list", "reviewed");
		model.addAttribute("tvAvg", usv.getUsersAvgTVRating(email));
		model.addAttribute("movieAvg", usv.getUsersAvgMovieRating(email));
		model.addAttribute("uvo", usv.getUserDetail(email));
		
		try {
			model.addAttribute("moviesData", mapper.writeValueAsString(msv.getUserReviewedList(email)));
			model.addAttribute("tvsData", mapper.writeValueAsString(tsv.getUserReviewdList(email)));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "user/detail";
	}
	
	@GetMapping("/{email}/modify")
	public void modify(String email, Model model) { 
		model.addAttribute("uvo", usv.getUserDetail(email));
	}

	@PostMapping("/modify")
	public String modify(UserVO uvo, RedirectAttributes reAttr) {
		int isSuccess = usv.updateUser(uvo); // 아직 구현 안함.
		reAttr.addFlashAttribute("isSuccess", isSuccess);
		return "redirect:/user/detail";
	}

	@GetMapping("/setting")
	public void setting(Model model, String email) {
		UserVO uvo = usv.getUserDetail(email);
		model.addAttribute("adult", uvo.isAdult());
		model.addAttribute("slang", uvo.isSlang());
	}

	@PostMapping("/setting")
	public String setting(String email, boolean slang, boolean adult, RedirectAttributes reAttr) {
		int isSuccess = usv.updateUserSetting(email, slang, adult);
		reAttr.addFlashAttribute("isSuccess", isSuccess);
		return "redirect:/user/detail";
	}

	@PostMapping(value = "/remove", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@RequestBody UserVO uvo) {
		return usv.removeUser(uvo.getEmail(), uvo.getPwd()) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// ====================== admin =======================

	@GetMapping("/userList")
	public void userList(Authentication authentication, Model model) {
		// @@@@@@@@@@@@@@@@@ ROLE_MANAGER(grade 50 이상) 인지 @@@@@@@@@@@@@@@@@@
		//
//		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//		System.out.println("role = " + userDetails.getAuthorities().stream().map(r -> String.valueOf(r)).collect(Collectors.joining(",")));
//		
		List<UserVO> list = usv.getUsersList("grade");
		log.info("userList: {}", list);
		model.addAttribute("list", list);
		
	}

	@PostMapping(value = "/modGrade", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modifyGrade(@RequestBody UserVO uvo) {
		return usv.updateUserGrade(uvo.getEmail(), uvo.getGrade()) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

//	@PostMapping("/modGrade")
//	public String modifyGrade(String email ) {
//		
//	}
	
}
