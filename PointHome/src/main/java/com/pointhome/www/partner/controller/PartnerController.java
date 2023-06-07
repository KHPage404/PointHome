package com.pointhome.www.partner.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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

import com.pointhome.www.mypage.service.face.MypageService;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerFile;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.partner.dto.PartnerNoticeFile;
import com.pointhome.www.partner.service.face.PartnerService;
import com.pointhome.www.util.Paging;


@Controller
@RequestMapping("/partner")
public class PartnerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired PartnerService partnerService;
	@Autowired MypageService mypageService;
	
	@GetMapping("/main")
	public void main(HttpSession session) {
		
//		partnerService.getPartnerInfo((Integer)session.getAttribute("partnerNo"));
			
		logger.debug("/partner/main[GET]");
	}
	
	@GetMapping("/join")
	public void join() {
		
		logger.debug("/partner/join[GET]");
	
		
	}
	@PostMapping("/join")
	public String joinProc(Partner partner) {
		logger.debug("/partner/join[POST]");
		logger.debug("partner{}",partner);
		
		partnerService.join(partner);
		
		
		return "redirect:./login";
		
	}
	
	@GetMapping("/login")
	public void login(Partner partner) {
		logger.debug("/partner/login [GET]");
		
		
	}
	@PostMapping("/login")
	public String loginProc(Partner partner, HttpSession session) {
		logger.debug("/partner/login [POST]");
		
		Boolean partnerLogin= partnerService.isLogin(partner);
		logger.debug("login???{}",partnerLogin);
				
//		int partnerNo = partnerService.getPartnerNoByEmail(partner);
//		logger.debug("partnerNo : {}",partnerNo);
		
		if(partnerLogin) {
			Partner part = new Partner();
			part = partnerService.getPartner(partner);
			
			logger.debug("login{}:",partnerLogin);
			logger.debug("partner_no{}:",part.getPartnerNo());
			
			session.setAttribute("partnerLogin", true);
			session.setAttribute("partnerNo", part.getPartnerNo());
			session.setAttribute("partnerNick", part.getPartnerNick());
			session.setAttribute("type", "p");
			
			return "redirect:./main";
		}
		return "redirect:./login";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:./main";
	}
	
	@GetMapping("/shopsetting")
	public void shopsettingGet(HttpSession session, Model model) {
		Partner partnerInfo = partnerService.getPartnerInfo((Integer)session.getAttribute("partnerNo"));
		
		model.addAttribute("partnerInfo", partnerInfo);
	}
	
	@GetMapping("/reservemanage")
	public void reservemanageGet(HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.debug("!!!!!!!!!!{}", curPage);
		logger.debug("!!!!!!!!!!!{}", (int)session.getAttribute("partnerNo"));
		Paging paging = partnerService.getPaging(curPage, (int)session.getAttribute("partnerNo"));
		List<Map<String, Object>> reserveList = partnerService.getReserveList(paging, (int)session.getAttribute("partnerNo"));
		
		model.addAttribute("reserveList", reserveList);
	}

	@PostMapping("/shopsetting")
	public String shopsettingPost(HttpSession session, Partner partner) {
		
		partner.setPartnerNo((int)session.getAttribute("partnerNo"));
		logger.debug("{}", partner);
		
		partnerService.partnerShopUpdate(partner);
		
		return "redirect:./shopsetting";
	}

	
	@GetMapping("/pages/404-error")
	public void error() {
		
		logger.debug("/partner/error[GET]");
		
	}
	
	@RequestMapping("/list")
	public void typeList(@RequestParam(defaultValue = "0") int curPage, 
			Model model, 
			String partnerType,
			HttpSession session
			) {

		logger.info("/partnerboard/list [GET]");

		Paging paging = partnerService.getPaging(curPage);
		
		List<Partner> list = partnerService.list(paging);

		logger.info("!!!!!!!!!!!!!!!!{}", list);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
	}
		
	@RequestMapping("/typelist")
	public void typeList(@RequestParam(defaultValue = "0") int curPage, Model model, String partnerType) {


		
		Map<String, Object> pagingMap = new HashMap<String, Object>();		
		
		logger.info("{}",partnerType);
		
		pagingMap.put("partnerType", partnerType);
		pagingMap.put("curPage", curPage);
	
		int userNo = (Integer)session.getAttribute("userno");
		
		Paging paging  = partnerService.getTypePaging(pagingMap);
		
		List<Map<String, Object >> list = partnerService.getPartTypePick(curPage, paging, userNo,partnerType);

		int alertCnt = mypageService.getAlertCnt(userNo);
		
		model.addAttribute("partnerType", partnerType);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute( "alertCnt" , alertCnt);
		
		
		logger.info("!!!!!!!!!!!!!!!!{}", list);

	}
	
	
	@GetMapping("/detail")
	public void detailView() {
		
	}
	@GetMapping("/partnernotice")
	public void partnerNotice(HttpSession session,@RequestParam(defaultValue = "0") int curPage,Model model)throws Exception
	{
		logger.debug("/partner/partnernotice");	
		
		Paging paging = partnerService.getPagingNotice(curPage);
		 List<PartnerNotice> noticelist = partnerService.noticeList(paging);
		 
		 
		  Partner partnerInfo = partnerService.partnerInfo((Integer)session.getAttribute("partnerNo"));
		 logger.debug("!!!!!{}:",partnerInfo);
		
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("paging", paging);
		model.addAttribute("partnerInfo", partnerInfo);

	}
	

	
	@GetMapping("/writenotice") 
	public void writeNotice() {
		logger.debug("/partner/writernotice [Get]");
		
		
	}
	
	@PostMapping("/writenotice")
	public String writeNoticePost(HttpSession session, List<MultipartFile> dataMul, PartnerNotice partnerNotice) {
		logger.debug("/partner/writenotice [Post]");
		
		partnerNotice.setPartnerNo((Integer)session.getAttribute("partnerNo"));
		
		logger.info("partnerNo : {}", session.getAttribute("partnerNo"));
		logger.debug("dataMul : {}",dataMul);
		logger.debug("partnerNotice : {}",partnerNotice);
				
		partnerService.writeNotice(partnerNotice,dataMul);
		
		 return "redirect:/partner/partnernotice";
	}
	
	@GetMapping("/view")
	public void noticeView(int partnerNoticeNo, Model model, HttpSession session ) {
		logger.debug("/noticeview [Get]");
		
		
		 PartnerNotice notice = partnerService.view(partnerNoticeNo);

		 model.addAttribute("notice", notice);
		 
		 List<MultipartFile> file = partnerService.getMultiFile(partnerNoticeNo);
		 model.addAttribute("file", file);
		
		 Partner viewPartner = partnerService.viewPartner(notice.getPartnerNo());
		 model.addAttribute("viewPartner", viewPartner);
		
	}
	
	@RequestMapping("/delete")
	public String delete(PartnerNotice partnerNotice) {
	     
		  partnerService.delete(partnerNotice);
	      
	      return "redirect:./partnernotice";
	   }
	
	 @GetMapping("/update")
	   public void update(int partnerNoticeNo, Model model) {
		 PartnerNotice notice = partnerService.selectNotice(partnerNoticeNo);
	      logger.info("update notice: {}", notice);
	      
	      model.addAttribute("notice", notice);
	      
	      
	      List<PartnerNoticeFile> noticeFile = partnerService.selectNoticeFile(partnerNoticeNo);
	      logger.info("update noticeFile: {}", noticeFile);
	      
	   }
	   
	   @PostMapping("/update")
	   public String updateRes(PartnerNotice partnerNotice, List<MultipartFile> dataMul) {
	
		   
	      logger.info("확인: {}", partnerNotice);
	      partnerService.update(partnerNotice, dataMul);
	      logger.debug("!!!!!!{}", dataMul);
	      logger.info("!!!!!!!!확인: {}", partnerNotice.getPartnerNo());
	      
	      return "redirect:./view?partnerNoticeNo=" + partnerNotice.getPartnerNoticeNo();
	
	
	   }
	   
	   @GetMapping("/adminnoticelist")
		public String adminnoticelist(Partner Param,HttpSession session, Model model) {
			
		   String type = (String) session.getAttribute("type");

	        model.addAttribute("type", type);
			
	        return "redirect:/admin/noticelist";
		}
		
		@GetMapping("/partnerinfo")
		public void partnerInfo(HttpSession session, Model model) {
			
			int partNo = (Integer)session.getAttribute("partnerNo");
			
			Partner res = partnerService.getPartnerInfo(partNo);
			
			logger.info("!!!!!{}", res);
			
			model.addAttribute("res", res);
			
			PartnerFile parnterFile = partnerService.getPartnerFile(partNo);
			model.addAttribute("partnerFile" ,parnterFile);
			
			
		}
		
		@PostMapping("/imgUpdate")
		public String partnerEdit(Partner partner,  MultipartFile file, HttpSession session, Model model) {
			
			int partNo= (int) session.getAttribute("partnerNo"); 
			
			logger.info("{}", partNo);
			logger.info("{}", file);
			
			partner.setPartnerNo(partNo);
			logger.info("{}", partner);
			
			partnerService.imgUpdate(partner, file);
			
			
			
			model.addAttribute("partProfile", file);
			model.addAttribute("parnter",  partner);
			
			
			return "redirect:./main";
		}
		
	   
	   

}
    