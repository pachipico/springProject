package com.springprj.www.controller.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String findPwd(String email, String pwd, RedirectAttributes reAttr) {
		// ??
		return "redirect:/user/login";
	}

	@GetMapping("/login")
	public void login() {
	}

//	@PostMapping("/login")
//	public String login(String email, String pwd, RedirectAttributes reAttr, HttpSession session) {
//		UserVO uvo = usv.login(email, pwd);
//		if (uvo != null) {
//			reAttr.addFlashAttribute("isSuccess", true);
//			session.setAttribute("ses", uvo);
//			
//			return "redirect:/home";
//		} else {
//			reAttr.addFlashAttribute("isSuccess", false);
//			return "redirect:/user/login";
//		}
//	}
	
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

	@GetMapping("/detail")
	public void detail(HttpSession session, Model model, String email) {

		model.addAttribute("uvo", usv.getUserDetail(email));

		
		// @@@@@@@@@@@@@ 구매내역에서 포스터 목록 가져오기 추가해야함.@@@@@@@@@@@@@

		
		model.addAttribute("likedMovies", msv.getUserLikedList(email));   //===========================
		model.addAttribute("ratedMovies", msv.getUserRatedList(email));
		model.addAttribute("reviewedMovies", msv.getUserReviewedList(email));
																		// 			이부분 따로 분리할지?
		model.addAttribute("likedTVs", tsv.getUserLikedList(email));
		model.addAttribute("ratedTVs", tsv.getUserRatedList(email));
		model.addAttribute("reviewedTVs", tsv.getUserReviewdList(email));  //============================
	}

	@GetMapping("/modify")
	public void modify(String email, Model model) { // 받아서 올지? 세션에서 꺼낼지?
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

	@GetMapping(value = "/userList", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<UserVO>> getUserList() {

		
		// @@@@@@@@@@@@@@@@@ ROLE_MANAGER(grade 50 이상) 인지 @@@@@@@@@@@@@@@@@@

		
		return new ResponseEntity<List<UserVO>>(usv.getUsersList("reg_at"), HttpStatus.OK);
	}

	@PostMapping(value = "/modGrade", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modifyGrade(@RequestBody UserVO uvo) {
		return usv.updateUserGrade(uvo.getEmail(), uvo.getGrade()) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
