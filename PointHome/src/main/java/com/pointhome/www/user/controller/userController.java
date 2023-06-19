package com.pointhome.www.user.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserSocial;
import com.pointhome.www.user.service.face.UserService;

@Controller
public class userController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userService;
	
	@GetMapping("/user/test")
	public void test() {
		logger.debug("/user/test [GET]");
		
	}
	
	@GetMapping("/user/join")
	public void join() {
		logger.debug("/user/join [GET]");

	}

	@PostMapping("/user/join")
	public String joinProc(User user, UserSocial socialParam, HttpSession session) {
		session.removeAttribute("EmailCode");

		logger.debug("/user/join [POST]");
		logger.debug("user : {}", user);
		logger.debug("socialParam : {}", socialParam);

		int userNo = userService.getUserIndex();

		user.setUserNo(userNo);
		logger.debug("user : {}", user);
		userService.addUser(user);
		
		if(socialParam.getSocialId() != null) {

			socialParam.setUserNo(userNo);
			logger.debug("socialParam : {}", socialParam);
			userService.addUserSocial(socialParam);
			session.setAttribute("login", true); 
			session.setAttribute("userno", socialParam.getUserNo()); 
			session.setMaxInactiveInterval(30*60); // 세션 유지시간 30분

			return "redirect:/";
		}
		
		return "redirect:/user/login";

	}
	
	@GetMapping("/user/login")
	public void login(HttpSession session) {
		logger.debug("/user/login [GET]");
		
	}

	@PostMapping("/user/login")
	public String loginProc(User Param, HttpSession session, String keepLogin) {
		logger.debug("/user/login [POST]");
		logger.debug("Param :{}", Param);
		logger.debug("keepLogin : {}", keepLogin);
		
		Boolean login = userService.isLogin(Param);
		
		if (login) {
			
			User user = new User();
			user = userService.getUser(Param);
			
			logger.debug("로그인 상태 : {}", login);
			logger.debug("로그인시 접속자 정보 : {}", user);
			session.setAttribute("login", true);
			session.setAttribute("userno", user.getUserNo());
			session.setAttribute("usernick", user.getUserNick());
			session.setAttribute("type", "u");
			session.setAttribute("keepLogin", keepLogin);
			session.setAttribute("chatNick", user.getUserNick());
			session.setMaxInactiveInterval(30*60); // 세션 유지시간 30분

			return "redirect:/";
		}

		return "redirect:/user/login";
		
	}

	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		logger.debug("/user/logout [GET]");
		
		String socialType = (String)session.getAttribute("socialType");
		logger.debug("socialType : {}", socialType);
		
		if (socialType == null) {
			logger.debug("일반로그아웃");
			session.invalidate();
			
		} else {
			
			if( socialType.equals("K")) {
				logger.debug("소셜로그아웃 socialType : {}", socialType);
				
				return "redirect:/user/kakaologout";
				
			} else if (socialType.equals("N")) {
				logger.debug("소셜로그아웃 socialType : {}", socialType);
				
				return "redirect:/user/naverlogout";
			}
			
		}
		
			
		
		return "redirect:/";
	}
	
	@GetMapping("/user/serviceCenter")
	public void qna() {}

	@GetMapping("/user/searchid")
	public void searchId() {
		logger.debug("/user/searchid [GET]");
	}

	@PostMapping("/user/searchid")
	public String searchIdProc(User param, Model model) {
		logger.debug("/user/searchid [POST]");
		
		User user = userService.getUserEmailByNamePhone(param);
		model.addAttribute("user", user);
		
		return "/searchresult";
	}

	
	@GetMapping("/user/searchpw")
	public void searchpw() {
		logger.debug("/user/searchpw [GET]");
		
	}
	
	@PostMapping("/user/searchpw")
	public void searchpwProc() {
		logger.debug("/user/searchpw [POST]");
		
	}
	
	@GetMapping("/user/naverlogin")
	public ModelAndView naverlogin(HttpSession session) {
		logger.debug("/user/naverlogin [GET]");
		
		Map<String, Object> map = userService.getStateApiUrl();
		
	    String apiURL = (String) map.get("apiURL");
	    String state = (String) map.get("state");
	    logger.debug("apiURL : {}",apiURL);
	    
	    session.setAttribute("state", state);
	    
	    // 외부 URL로 retrun
	    return new ModelAndView("redirect:" + apiURL);
	}
	
	@GetMapping("/user/navercallback")
	public String naverCallback(HttpServletRequest request, HttpSession session, Model model) {
		logger.debug("/user/callback [GET]");
		
		session.removeAttribute("state");
		
		String code = request.getParameter("code");
		String state = (String)session.getAttribute("state");

		String apiURL = userService.getApiURL(code, state);
		JsonObject Token = userService.getTokenNaver(apiURL);
		String accessToken = Token.get("access_token").getAsString();
		logger.info("엑세스토큰 Str : {}", accessToken);

		User userInfo = userService.getUserInfoNaver(Token);				
		logger.info("Naver에서 읽어온 User정보 : {}", userInfo);
		
		int res = userService.getCntUserByEmailPhone(userInfo);
		logger.debug("회원 가입 내역 [1]있음 | [0]없음 => res : {}", res);

		if ( res < 1 ) {
			logger.debug("회원 가입내역 없음");
			model.addAttribute("userInfo", userInfo);
			model.addAttribute("socialType", 'N'); // 네이버일때, N (char)
			
			return "/user/join";
			
		} else {
			
			logger.debug("회원 가입내역 존재");
			User user = userService.getUserNoByEmailPhone(userInfo);
			session.setAttribute("login", true); 
			session.setAttribute("userno", user.getUserNo()); 
			session.setAttribute("usernick", user.getUserNick()); 
			session.setAttribute("socialType", "N"); 
			session.setAttribute("accessToken", accessToken); 

			session.setMaxInactiveInterval(30*60);
			
			return "redirect:/";
		}
		
	}

	@GetMapping("/user/naverlogout")
	public String naverLogout(HttpSession session) throws IOException {
	
		logger.info("액세스 토큰 : {}", session.getAttribute("accessToken"));
		String accessToken = ((String) session.getAttribute("accessToken"));
		String logoutURL = userService.createNaverLogoutURL(accessToken);
		logger.info("logoutURL : {}", logoutURL);
		
		String ServerResult = userService.requestToServer(logoutURL, null);
		logger.info("ServerResult : {}", ServerResult);
		session.invalidate();
		
		return "redirect:/";
		
	}
	
  @GetMapping("/user/kakaologin")
	public ModelAndView kakaoLogin() {
		
		String apiURL= "";
		apiURL += "https://kauth.kakao.com/oauth/authorize?";
		apiURL += "response_type=code";
		apiURL += "&client_id=9bc229ac39da11c0c4922d0b6b945cad";
		apiURL += "&redirect_uri=http://localhost:8888/user/kakaocallback";
	    
	    // 외부 URL로 retrun
	    return new ModelAndView("redirect:" + apiURL);	
    }
	
	@RequestMapping("/user/kakaocallback")
	public String getKakaoAuthUrl(Model model, HttpSession session, @RequestParam("code") String code)
			throws Exception {
		
		logger.debug("code : {} ", code);
		
		String access_Token = userService.getKakaoAccessToken(code);
		userService.getUserInfo(access_Token);

		// 사용자정보 세션
		User userInfo = userService.getUserInfo(access_Token);
		logger.debug("login Controller :{} " , userInfo);

		int res = userService.getCntUserByEmail(userInfo);
		logger.debug("res :{}",res);

		
		if(res>0) {
			logger.debug("회원정보 존재"); 
			
			User user= userService.getUserNo(userInfo);
			session.setAttribute("login", true);
			session.setAttribute("userno", user.getUserNo());
			session.setAttribute("usernick", user.getUserNick());
			session.setAttribute("access_Token", access_Token);
			session.setAttribute("socialType", "K");
			
			return "redirect:/";
		} else {
			logger.debug("회원정보 존재 X");
			
			model.addAttribute("userInfo",userInfo);
			model.addAttribute("socialType",'K'); //카카오로 회원가입시 K
			
			return "/user/join";
		}
		
	}

	@RequestMapping("/user/kakaologout")
	public String kakaoLogout(HttpServletRequest request, HttpServletResponse response) {
		logger.debug("/user/kakaologout");

		String access_Token = (String) request.getSession().getAttribute("access_Token");
		
	    if (access_Token != null) {
	        userService.kakaoLogout(access_Token);
	    }

	    // 세션 초기화
	    request.getSession().invalidate();

	    return "redirect:/";
	}
	
	
	
	@GetMapping("/user/adminnoticelist")
	public String adminnoticelist(User Param, HttpSession session, Model model) {
		
		String type = (String) session.getAttribute("type");

	        model.addAttribute("type", type); 
	    

	    return "redirect:/admin/noticelist";
	}
	
	@GetMapping("/user/partnernoticelist")
	public String partnernoticelist(User Param, HttpSession session, Model model) {
		
		String type = (String) session.getAttribute("type");
		
		model.addAttribute("type", type); 
		
		
		return "redirect:/partner/partnernotice";
	}

	@PostMapping("/user/chkPhone")
	public String p(User Param, HttpSession session, Model model) {
		
		String type = (String) session.getAttribute("type");
		
		model.addAttribute("type", type); 
		
		
		return "redirect:/partner/partnernotice";
	}
	
}
