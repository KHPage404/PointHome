package com.pointhome.www.mypage.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.mypage.dto.Alert;
import com.pointhome.www.mypage.dto.AlertRecomm;
import com.pointhome.www.mypage.dto.MyPick;
import com.pointhome.www.mypage.dto.Review;
import com.pointhome.www.mypage.service.face.MypageService;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerFile;
import com.pointhome.www.partner.dto.PartnerNotice;
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
		
		String userNick = mypageService.selectUserNick(userno);
		logger.debug("!!!!!!!!!!!!!!userno : {}", userNick);
		
		User res= mypageService.selectInfo(userno);
		List<Map<String, Object>> reservelist = mypageService.selectReserve(userno);
		
		for (Map<String, Object> map : reservelist) {
			
			map.get("RES_TIME");
			logger.info("{}",map.get("RES_TIME"));

			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==1) {
				map.put("RESERVE_TIME", String.valueOf(map.get("RES_DATE")) + " " + "10:00" );
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==2) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "10:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==3) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "11:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==4) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "11:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==5) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "13:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==6) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "13:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==7) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "14:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==8) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "14:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==9) {
				map.put("RESERVE_TIME",   String.valueOf(map.get("RES_DATE")) + " " + "15:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==10) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "15:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==11) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "16:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==12) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "16:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==13) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "17:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==14) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "17:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==15) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "18:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==16) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "18:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==17) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "19:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==18) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "19:30");
			}
			
		}
		
		logger.debug("res{}",res);
		logger.debug("!!!!!!!!!!!!!!!!!!!res{}",reservelist);
		model.addAttribute("res", res);
		model.addAttribute("reservelist", reservelist);
		
		List<PartnerNotice> partnerNotice = mypageService.selectNoticeList(userno);
		logger.info("공지 리스트 {}" , partnerNotice);
		
		int alertCnt = mypageService.getAlertCnt(userno);
		
		UserFile userFile = mypageService.selectImg(userno);
		logger.info("userFile : {}",userFile);
				
		model.addAttribute("pNotice", partnerNotice);
		model.addAttribute( "alertCnt" , alertCnt);
		model.addAttribute("userFile", userFile);
		model.addAttribute("userNick", userNick);
	}
		
	
	
	@GetMapping("/userinfo")
	public void mypageInfo( Model model, HttpSession session) {
		logger.debug("/mypage/userinfo [GET]");
		
		int userno= (int) session.getAttribute("userno"); 
		String usernick = mypageService.selectUserNick(userno);
		logger.debug("userno : {}", userno);
		
		User res= mypageService.selectInfo(userno);
		
		logger.debug("res{}",res);
		
		
		
		UserFile userFile = mypageService.selectImg(userno);
		logger.info("userFile : {}",userFile);
		
		model.addAttribute("userFile", userFile);
		
		int alertCnt = mypageService.getAlertCnt(userno);
		model.addAttribute( "alertCnt" , alertCnt);
		model.addAttribute("userNick", usernick);
		model.addAttribute("res", res);
	
		
		
	}
	
	@GetMapping("/myreserve")
	public void myreserve(HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage) {
		
		int userNo = (Integer)session.getAttribute("userno");
		String usernick = mypageService.selectUserNick(userNo);
		
		
		Paging paging = mypageService.getReservePaging(curPage, userNo);
		
		List<Map<String, Object>> reservelist = mypageService.selectReserve(paging, userNo);
		
		for (Map<String, Object> map : reservelist) {
			
			map.get("RES_TIME");
			logger.info("{}",map.get("RES_TIME"));

			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==1) {
				map.put("RESERVE_TIME", String.valueOf(map.get("RES_DATE")) + " " + "10:00" );
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==2) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "10:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==3) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "11:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==4) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "11:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==5) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "13:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==6) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "13:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==7) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "14:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==8) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "14:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==9) {
				map.put("RESERVE_TIME",   String.valueOf(map.get("RES_DATE")) + " " + "15:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==10) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "15:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==11) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "16:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==12) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "16:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==13) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "17:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==14) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "17:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==15) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "18:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==16) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "18:30");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==17) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "19:00");
			}
			if(Integer.parseInt(String.valueOf(map.get("RES_TIME")))==18) {
				map.put("RESERVE_TIME",  String.valueOf(map.get("RES_DATE")) + " " + "19:30");
			}
			
		}
		
		logger.info("{}",reservelist);

		model.addAttribute("paging", paging);
		model.addAttribute("reservelist", reservelist);
		
		int alertCnt = mypageService.getAlertCnt(userNo);
		model.addAttribute( "alertCnt" , alertCnt);
		
		UserFile userFile = mypageService.selectImg(userNo);
		logger.info("userFile : {}",userFile);
		
		model.addAttribute("userFile", userFile);
		model.addAttribute("userNick", usernick);
		
	}
	
	
	@GetMapping("/myreserveDetail")
	public void myreservedetail(HttpSession session, Model model, int resNo) {

		int userNo = (Integer)session.getAttribute("userno");
		String usernick = mypageService.selectUserNick(userNo);
		
		Map<String, Object> mypay = mypageService.selectPay(userNo, resNo);
		
		logger.info("과연  {}", mypay);
		int alertCnt = mypageService.getAlertCnt(userNo);
		
		UserFile userFile = mypageService.selectImg(userNo);
		logger.info("userFile : {}",userFile);
		model.addAttribute("pay", mypay);

		model.addAttribute( "alertCnt" , alertCnt);
		model.addAttribute("userFile", userFile);
		model.addAttribute("userNick", usernick);
		
	}
	
	@RequestMapping("/mypick")
	public ModelAndView mypick(int partNo, 
			@RequestParam(defaultValue = "0") int curPage,  
			Model model, 
			HttpSession session,
			ModelAndView mav
			) {


		int userNo = (Integer)session.getAttribute("userno");
	
		mypageService.pickUpdate(userNo, partNo);
		
		int isPick = mypageService.isPick(userNo, partNo);
	
		if( isPick == 1 ) {
			mav.addObject("isPick", true);
		} else {
			mav.addObject("isPick", false);
		}
		
		mav.setViewName("jsonView");		
		
		return mav;
		
	}
	
	@RequestMapping("/myreview")
	public void myreviewList(HttpSession session, Model model,  @RequestParam(defaultValue = "0") int curPage) {
		int userNo = (Integer)session.getAttribute("userno");
		String usernick = mypageService.selectUserNick(userNo);
		
		Paging paging = mypageService.getReviewPaging(curPage, userNo);
		
		List<Map<String, Object>> reviewList = mypageService.selectReviewList(paging,userNo);
		
		logger.info("ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ{}", reviewList);
		
		model.addAttribute("reviewlist", reviewList);
		
		int alertCnt = mypageService.getAlertCnt(userNo);
		model.addAttribute( "alertCnt" , alertCnt);
		
		UserFile userFile = mypageService.selectImg(userNo);
		logger.info("userFile : {}",userFile);
		
		model.addAttribute("paging", paging);
		model.addAttribute("userFile", userFile);
		model.addAttribute("userNick", usernick);
	}
	
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
		session.removeAttribute("usernick");
		
		String usernick = mypageService.selectUserNick(userno);
		session.setAttribute("usernick", usernick);
		
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
	
	@GetMapping("/mypickList")
	public void mypickList(HttpSession session, Model model,  @RequestParam(defaultValue = "0") int curPage) {
		
		int userNo = (Integer)session.getAttribute("userno");
		String usernick = mypageService.selectUserNick(userNo);
		
		Paging paging = mypageService.getPickPaging(curPage, userNo);
		
		
		List<Map<String, Object >> list = mypageService.selectPickList(paging, userNo);
		
		logger.info("!!!!!!!!!!!!!!!!{}", list);
		
		model.addAttribute( "pickList" , list);
		
		int alertCnt = mypageService.getAlertCnt(userNo);
		model.addAttribute( "alertCnt" , alertCnt);
		
		UserFile userFile = mypageService.selectImg(userNo);
		logger.info("userFile : {}",userFile);
		
		model.addAttribute("paging", paging);
		model.addAttribute("userFile", userFile);
		model.addAttribute("userNick", usernick);
		
		
	}
	
	@GetMapping("/myboardList")
	public void myboardList(HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage ) {
		
		int userNo = (Integer)session.getAttribute("userno");
		String usernick = mypageService.selectUserNick(userNo);
		
		Paging paging = mypageService.getPaging(curPage, userNo);
		
		logger.info("paging {}" , paging);
		
		List<FreeBoard> boardList = mypageService.selectboard(paging, userNo);
		
		logger.info("{}", boardList);
		
		model.addAttribute("paging", paging);
		model.addAttribute( "boardList" , boardList);
		
		int alertCnt = mypageService.getAlertCnt(userNo);
		model.addAttribute( "alertCnt" , alertCnt);
		
		UserFile userFile = mypageService.selectImg(userNo);
		logger.info("userFile : {}",userFile);
		
		model.addAttribute("userFile", userFile);
		model.addAttribute("userNick", usernick);
		
	}
	
	@GetMapping("/alertList")
	public void myAlarm(HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage) {
		
		int userNo = (Integer)session.getAttribute("userno");
		String usernick = mypageService.selectUserNick(userNo);
		
		mypageService.deleteAlert(userNo);
		
		Paging paging = mypageService.getAlertPaging(curPage, userNo);
		
		logger.info("paging {}" , paging);
		
		List<Map<String, Object>> alertlist = mypageService.selectAlList(paging, userNo);
		
		int alertCnt = mypageService.getAlertCnt(userNo);
		
		logger.info("{}", alertlist);

		model.addAttribute( "alarmList" , alertlist);
		model.addAttribute( "alertCnt" , alertCnt);
		
		UserFile userFile = mypageService.selectImg(userNo);
		logger.info("userFile : {}",userFile);
		
		model.addAttribute("paging", paging);
		model.addAttribute("userFile", userFile);
		model.addAttribute("userNick", usernick);
		
	}
	
//	@RequestMapping("/deleteAlert")
//	public ModelAndView deleteAlertCnt(HttpSession session, Model model, ModelAndView mav) {
//
//		int userNo = (Integer)session.getAttribute("userno");
//		logger.info("{}", userNo);
//		mypageService.deleteAlert(userNo);
//		
//		
//		mav.setViewName("jsonView");
//		
//		return mav;
//	
//	}
	
	@GetMapping("/writeReview")
	public void writeReview(HttpSession session, int resNo, Model model) {
		session.setAttribute("resNo", resNo);
		
		int userNo = (Integer)session.getAttribute("userno");
		int alertCnt = mypageService.getAlertCnt(userNo);
		model.addAttribute( "alertCnt" , alertCnt);
	}
	
	@PostMapping("/writeReview")
	public String review(Review myreview, HttpSession session) {
		logger.info("!!!!!!!!!!{}", myreview);
		
		int userNo = (Integer)session.getAttribute("userno");
		int resNo = (Integer)session.getAttribute("resNo");
		
		myreview.setUserNo(userNo);
		myreview.setResNo(resNo);
		
		logger.info("ㅎㅎㅎ!!!!!!!!!!{}", myreview);
		
		mypageService.insertReview(myreview);
		
		
//		return null;
		
		return "redirect:./myreserve";
	}
	
	@RequestMapping("/deleteReview")
	public String deleteReview(HttpSession session, int resNo) {
		int userNo = (Integer)session.getAttribute("userno");
		
		Review myreview = new Review();
		
		myreview.setUserNo(userNo);
		myreview.setResNo(resNo);

		
		mypageService.deleteReview(myreview);
		
		return "redirect:./myreserve";
		
	}	
	
	//boardlist 전체 삭제
	@RequestMapping(value = "/removeboardlist", method = RequestMethod.GET)
    public void boarddelete(String freeboardNo,FreeBoard freeBoard) throws Exception {
    	mypageService.removeboardlist(freeboardNo);
    	
    }
    
    //boardlist 선택삭제
    @RequestMapping(value = "/removeboardlist",method = RequestMethod.POST)
    public void boardajax(HttpServletRequest request,FreeBoard freeBoard, 
    		HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage ) throws Exception {
            
        String[] ajaxMsg = request.getParameterValues("valueArr");
 
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	mypageService.removeboardlist(ajaxMsg[i]);
        }
        
        
        int userNo = (Integer)session.getAttribute("userno");
        
		Paging paging = mypageService.getPaging(curPage, userNo);
		
		logger.info("paging {}" , paging);
		
		List<FreeBoard> boardList = mypageService.selectboard(paging, userNo);
		
		logger.info("{}", boardList);
		
		model.addAttribute("paging", paging);
		model.addAttribute( "boardList" , boardList);
    
    }	
	
    //picklist 전체 삭제
    @RequestMapping(value = "/removePicklist", method = RequestMethod.GET)
    public void pickdelete(String partnerNo, MyPick mypick) throws Exception {
    	mypageService.removepicklist(partnerNo);	
    }
    
    //picklist 선택삭제
    @RequestMapping(value = "/removePicklist",method = RequestMethod.POST)
    public void pickajax(HttpServletRequest request, MyPick mypick,
    		HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage ) throws Exception {
        String[] ajaxMsg = request.getParameterValues("valueArr");
        
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	mypageService.removepicklist(ajaxMsg[i]);
        }
    	
		int userNo = (Integer)session.getAttribute("userno");		
		Paging paging = mypageService.getPickPaging(curPage, userNo);
		List<Map<String, Object >> list = mypageService.selectPickList(paging, userNo);

		model.addAttribute( "pickList" , list);
		model.addAttribute("paging", paging);

        
    }	
    
    
    //alertlist 전체 삭제
    @RequestMapping(value = "/removeAlertlist", method = RequestMethod.GET)
    public void alertelete(String alertNo, Alert alert) throws Exception {
    	mypageService.removeAlertlist(alertNo);	
    }
    
    //alertlist 선택삭제
    @RequestMapping(value = "/removeAlertlist",method = RequestMethod.POST)
    public void alertajax(HttpServletRequest request, Alert alert, 
    		HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage ) throws Exception {
    	String[] ajaxMsg = request.getParameterValues("valueArr");
    	
    	int size = ajaxMsg.length;
    	for(int i=0; i<size; i++) {
    		mypageService.removeAlertlist(ajaxMsg[i]);
    	}
    	
    	int userNo = (Integer)session.getAttribute("userno");		
    	Paging paging = mypageService.getAlertPaging(curPage, userNo);
    	List<Map<String, Object>> alertlist = mypageService.selectAlList(paging, userNo);
		
		model.addAttribute( "alarmList" , alertlist);
		model.addAttribute("paging", paging);
    	
    }	

    //reviewlist 전체 삭제
    @RequestMapping(value = "/removeReviewlist", method = RequestMethod.GET)
    public void reviewdelete(String reviewNo, Review review) throws Exception {
    	mypageService.removeReviewlist(reviewNo);	
    }
    
    //reviewlist 선택삭제
    @RequestMapping(value = "/removeReviewlist",method = RequestMethod.POST)
    public void reviewajax(HttpServletRequest request,Review review, 
    		HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage ) throws Exception {
    	String[] ajaxMsg = request.getParameterValues("valueArr");
    	
    	int size = ajaxMsg.length;
    	for(int i=0; i<size; i++) {
    		mypageService.removeReviewlist(ajaxMsg[i]);
    	}
    	
    	int userNo = (Integer)session.getAttribute("userno");
		Paging paging = mypageService.getReviewPaging(curPage, userNo);
		List<Map<String, Object>> reviewList = mypageService.selectReviewList(paging,userNo);

		model.addAttribute("reviewlist", reviewList);
		model.addAttribute("paging", paging);

    }	
    
    @RequestMapping("/mypayList")
    public void mypay(HttpSession session, Model model,  @RequestParam(defaultValue = "0") int curPage ) {
    	
		int userNo = (Integer)session.getAttribute("userno");
		String usernick = mypageService.selectUserNick(userNo);
		
		Paging paging = mypageService.getReservePaging(curPage, userNo);
    
		List<Map<String, Object>> paylist = mypageService.selectReserve(paging, userNo);
		
		int alertCnt = mypageService.getAlertCnt(userNo);
		UserFile userFile = mypageService.selectImg(userNo);
		
		logger.info("{}",paylist);
		logger.info("{}",paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("paylist", paylist);
		model.addAttribute( "alertCnt" , alertCnt);
		model.addAttribute("userFile", userFile);
		model.addAttribute("userNick", usernick);
		
		
    }
    
    @RequestMapping("/myCommentlist")
    public void reviewlist(HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage) {
		int userNo = (Integer)session.getAttribute("userno");
		String usernick = mypageService.selectUserNick(userNo);
		
		Paging paging = mypageService.getCommentPaging(curPage, userNo);
		
		List<Map<String, Object>> commentlist = mypageService.selectComment(paging, userNo);
		
		logger.info("댓글 내역 {}", commentlist);
		
		UserFile userFile = mypageService.selectImg(userNo);
		logger.info("userFile : {}",userFile);
		
		int alertCnt = mypageService.getAlertCnt(userNo);
		model.addAttribute( "alertCnt" , alertCnt);
		model.addAttribute("userFile", userFile);
		model.addAttribute("userNick", usernick);
		model.addAttribute("paging", paging);
		model.addAttribute("commentList", commentlist);
		
		
    	
    }
    
	
    //commentlist 전체 삭제
    @RequestMapping(value = "/removecommentlist", method = RequestMethod.GET)
    public void commentdelete(String commNo) throws Exception {
    	mypageService.removeCommentlist(commNo);	
    }
    
    //reviewlist 선택삭제
    @RequestMapping(value = "/removecommentlist",method = RequestMethod.POST)
    public void commentajax(HttpServletRequest request, 
    		HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage ) throws Exception {
    	String[] ajaxMsg = request.getParameterValues("valueArr");
    	
    	int size = ajaxMsg.length;
    	for(int i=0; i<size; i++) {
    		mypageService.removeCommentlist(ajaxMsg[i]);
    	}
    	int userNo = (Integer)session.getAttribute("userno");
    	
		Paging paging = mypageService.getCommentPaging(curPage, userNo);
		List<Map<String, Object>> commentlist = mypageService.selectComment(paging, userNo);
		model.addAttribute("paging", paging);
		model.addAttribute("commentList", commentlist);    	
    }	
    
    @RequestMapping("/myPickNoticeList")
    public void picknoticelist(HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage) {
    	
    	int userNo = (Integer)session.getAttribute("userno");
    	String usernick = mypageService.selectUserNick(userNo);
		
		Paging paging = mypageService.getNoticelistPaging(curPage, userNo);
		
		logger.info("왜!!!!!!!!!! {}" , paging);
		
		List<Map<String, Object>> pickNotice = mypageService.selectPickNotice(paging, userNo);
		
		logger.info("왜!!!!!!!!!! {}" , pickNotice);
		
		UserFile userFile = mypageService.selectImg(userNo);
		int alertCnt = mypageService.getAlertCnt(userNo);
		
		model.addAttribute( "pickNotice" , pickNotice);
		model.addAttribute( "alertCnt" , alertCnt);
		model.addAttribute("userFile", userFile);
		model.addAttribute("userNick", usernick);
		model.addAttribute("paging", paging);
    	
    }
}
