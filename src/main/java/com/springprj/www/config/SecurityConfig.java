package com.springprj.www.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import com.springprj.www.security.CustomAuthUserService;
import com.springprj.www.security.LoginFailureHandler;
import com.springprj.www.security.LoginSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.csrf().disable();
		
//		http.authorizeRequests()
//		.antMatchers("/movie/detail/*", "/tv/detail/*").hasRole("ADMIN")
//		.antMatchers("/home","/user/register","/resources/**", "/user/login", "/user/findId","/user/findPwd", "/movie/popular", "/movie/up-coming", "/movie/now-playing", "/movie/rating")
//		.permitAll().anyRequest().authenticated();
		
		http.authorizeRequests()
		.antMatchers("/user/userList").hasRole("ADMIN")
		.antMatchers("/user/*/modify", "/user/*/setting","/user/modify/nickName","/user/modify/pwd").hasAnyRole("USER")
		.antMatchers("/","/movie/*", "/tv/*","/movie/popular", "/movie/now-playing", "/movie/up-coming", "/movie/rating", "/tv/netflix", "/tv/amazon", "/tv/watcha", "/tv/waave","/movie/detail/*", "/tv/detail/*",
			"/actor/*",	"/resources/**", "/fileUpload/**",
			"/user/login", "/user/register", "/user/findPwd", "/user/findId", "/user/*", "/user/userRank", "/user/info/*" ).permitAll().anyRequest().authenticated();
		
		
		
		http.formLogin().usernameParameter("email").passwordParameter("pwd").loginPage("/user/login")
				.successHandler(authSuccessHandler()).failureHandler(authFailureHandler());

		// 로그아웃도 무조건 POST 로
		http.logout().logoutUrl("/user/logout").invalidateHttpSession(true).deleteCookies("JSESSIONID")
				.logoutSuccessUrl("/");
	}

	@Bean
	public AuthenticationSuccessHandler authSuccessHandler() {
		return new LoginSuccessHandler();
	}

	@Bean
	public AuthenticationFailureHandler authFailureHandler() {
		return new LoginFailureHandler();
	}

	@Bean
	public UserDetailsService customService() {
		return new CustomAuthUserService();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.userDetailsService(customService()).passwordEncoder(passwordEncoder());
	}

}
