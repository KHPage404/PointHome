package com.pointhome.www.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.service.face.UserService;

@Controller
public class userController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userService;
	
	@GetMapping("/user/join")
	public void join() {
		logger.debug("/user/join [GET]");
	}

	@PostMapping("/user/join")
	public String joinProc(User user) {
		logger.debug("/user/join [POST]");
		logger.debug("{}", user);

		userService.addUser(user);

		return "redirect:./login";
	}

	@GetMapping("/user/login")
	public void login() {
		logger.debug("/user/login [GET]");
		
	}

	@PostMapping("/user/login")
	public String loginProc(User Param, HttpSession session) {
		logger.debug("/user/login [POST]");
		logger.debug("{}", Param);
		
		Boolean login = userService.isLogin(Param);
		
		
		if (login) {
			
			User user = new User();
			user = userService.getUser(Param);
			
			logger.debug("{}", login);
			logger.debug("{}", user.getUserNo());
			session.setAttribute("login", true);
			session.setAttribute("userno", user.getUserNo());
			
			
			return "redirect:/";
		}

		return "redirect:/user/login";
		
	}

	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		logger.debug("/user/logout [GET]");
		
		session.invalidate();
		
		return "redirect:/";
	}


}