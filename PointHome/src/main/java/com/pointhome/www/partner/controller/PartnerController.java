package com.pointhome.www.partner.controller;

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

import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.partner.service.face.PartnerService;
import com.pointhome.www.util.Paging;


@Controller
@RequestMapping("/partner")
public class PartnerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired PartnerService partnerService;
	
	@GetMapping("/main")
	public void main() {
		
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
		
		Boolean login= partnerService.isLogin(partner);
		logger.debug("login???{}",login);
				
		int partnerNo = partnerService.getPartnerNoByEmail(partner);
		logger.debug("partnerNo : {}",partnerNo);
		
		if(login) {
			Partner part = new Partner();
			part = partnerService.getPartner(partner);
			
			logger.debug("login{}:",login);
			logger.debug("partner_no{}:",part.getPartnerNo());
			
			session.setAttribute("login", true);
			session.setAttribute("partnerNo", partnerNo);
			
			return "redirect:./main";
		}
		return "redirect:./login";
		
		
	}
	
	@GetMapping("/pages/404-error")
	public void error() {
		
		logger.debug("/partner/error[GET]");
		
	}
	
	@RequestMapping("/list")
	public void typeList(@RequestParam(defaultValue = "0") int curPage, 
			Model model, 
			String partnerType,
			HttpSession session) {
		
		Map<String, Object> pagingMap = new HashMap<String, Object>();		
		
		pagingMap.put("partnerType", partnerType);
		pagingMap.put("curPage", curPage);
	
		Paging paging  = partnerService.getTypePaging(pagingMap);
		
		int userNo = (Integer)session.getAttribute("userno");
		
		logger.info("!!!!!{}", paging);
		logger.info("!!!!!{}", partnerType);
		logger.info("!!!!!{}", userNo);
		
		List<Map<String, Object>> list = partnerService.typelist(paging, partnerType, userNo);
		
		
		model.addAttribute("partnerType", partnerType);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		
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
	

	
	


}
    