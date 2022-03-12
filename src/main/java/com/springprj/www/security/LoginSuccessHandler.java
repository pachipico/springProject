package com.springprj.www.security;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springprj.www.service.user.UserService;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Getter
	@Setter
	private String authEmail;

	@Getter
	@Setter
	private String authUrl;

	@Inject
	private UserService usv;

	private RedirectStrategy reStg = new DefaultRedirectStrategy();

	private RequestCache reqCache = new HttpSessionRequestCache();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		setAuthEmail(authentication.getName());
		setAuthUrl("/");
		LocalDateTime current = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE;
		String formatted = current.format(formatter);
		
		UserVO user = usv.getUserDetail(authentication.getName()); // 로그인 하는 유저 정보
		String lastLoginString = "";
		HttpSession ses = request.getSession(false); // 기존에 존재하는 세션 받아오기.
		
		
		if(user.getLastLogin() != null) { // 유저가 처음 로그인 한게 아니면 
			lastLoginString = user.getLastLogin().substring(0, 10);		 // 마지막 로그인일자 가져옴
			if(!formatted.equals(lastLoginString)) {
				
				ses.setAttribute("msg", "출석체크 5포인트 획득!");
				usv.gainPoint(user.getEmail(), 5);
			}
		} else {  // 첫 로그인이면 	
			ses.setAttribute("msg", "첫 로그인을 축하합니다! 10포인트 획득!");
			usv.gainPoint(user.getEmail(), 10);
		}

		

		boolean isUp = usv.updateLastLogin(getAuthEmail()); // 질문 : 같은 클래스 안인데 게터 쓰는이유
		if (!isUp || ses == null) {
			return;
		} else {
			// 인증 실패 기록 삭제
			ses.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
		SavedRequest savedReq = reqCache.getRequest(request, response);
//		log.debug("login success, redirect to : {}", savedReq);
//		
//		reStg.sendRedirect(request, response, (savedReq != null ? savedReq.getRedirectUrl() : getAuthUrl()));
		reStg.sendRedirect(request, response, "/");
	}

}
