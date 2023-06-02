package com.pointhome.www.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pointhome.www.mypage.service.face.MypageService;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.service.face.PartnerService;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserFile;
import com.pointhome.www.util.Paging;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MypageService mypageService;
	@Autowired PartnerService partnerService;
	
	@GetMapping("/view")
	public void view( Model model, HttpSession session) {
		logger.debug("/mypage/userinfo [GET]");
		
		int userno= (int) session.getAttribute("userno"); 
		logger.debug("userno : {}", userno);
		
		User res= mypageService.selectInfo(userno);
		
		logger.debug("res{}",res);
		model.addAttribute("res", res);
		
		
		
		UserFile userFile = mypageService.selectImg(userno);
		logger.info("userFile : {}",userFile);
		
		model.addAttribute("userFile", userFile);
		
	}
		
	
	
	@GetMapping("/userinfo")
	public void mypageInfo( Model model, HttpSession session) {
		logger.debug("/mypage/userinfo [GET]");
		
		int userno= (int) session.getAttribute("userno"); 
		logger.debug("userno : {}", userno);
		
		User res= mypageService.selectInfo(userno);
		
		logger.debug("res{}",res);
		model.addAttribute("res", res);
		
		UserFile userFile = mypageService.selectImg(userno);
		logger.info("userFile : {}",userFile);
		
		model.addAttribute("userFile", userFile);
		
	}
	
	@GetMapping("/myreserve")
	public void myreserve() {}
	
	@GetMapping("/myreservedetail")
	public void myreservedetail() {}
	
	@RequestMapping("/mypick")
	public ModelAndView mypick(int partnerNo, 
			@RequestParam(defaultValue = "0") int curPage,  
			Model model,
			HttpSession session,
			String partnerType,
			ModelAndView mav
			
			) {

		logger.info("dsfa{}",partnerNo);

		//찜 업데이트
		int userNo = (Integer)session.getAttribute("userno");
		mypageService.pickUpdate(userNo, partnerNo);
		
		//업데이트 후 데이터 다시 셀렉트
		int isPick = mypageService.isPick(userNo, partnerNo);
		
		
		if(isPick == 1) {
			mav.addObject("isPick", true);
		} else {
			mav.addObject("isPick", false);
		}
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	
	@GetMapping("/myreview")
	public void myreview() {}
	
	
	@GetMapping("/serviceCenter")
	public void mypageService() {}

	@PostMapping("/update")
	public String userEdit(User user, MultipartFile file, HttpSession session, Model model) {
		
		int userno= (int) session.getAttribute("userno"); 
		
		logger.info("{}", userno);
		logger.info("{}", file);
		
		user.setUserNo(userno);
		logger.info("{}", user);
		
		mypageService.update(user, file);
		
		
		
		model.addAttribute("profile", file);
		model.addAttribute("user", user);
		
		
		return "redirect:./view";
	}
	
	@RequestMapping("/removeUser")
	public String userRemove(HttpSession session) {
		
		int userno= (int) session.getAttribute("userno"); 
		logger.debug("userno : {}", userno);
		
		mypageService.delete(userno);
		
		Object object = session.getAttribute("login");
		if(object != null ) {
			session.removeAttribute("login");
			session.invalidate();
		}

		
		return "redirect:/";
	}
	
	
	
	
}
