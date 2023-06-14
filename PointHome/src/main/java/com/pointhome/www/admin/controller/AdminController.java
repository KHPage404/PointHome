package com.pointhome.www.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.admin.dto.Admin;
import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.admin.dto.AdminNoticeFile;
import com.pointhome.www.admin.service.face.AdminService;
import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerFile;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserFile;
import com.pointhome.www.util.Paging;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired AdminService adminService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/main")
	public void Main() {
		logger.debug("/admin/main [GET]");
	}
	
	@GetMapping("/login")
	public void loginGet() {
		logger.debug("/admin/login [GET]");
		
	}
	
	@PostMapping("/login") 
	public String loginPost(Admin admin, HttpSession session) {
		logger.info("{}", admin);
		
		boolean adminLogin = adminService.adminLogin(admin);
		logger.debug("{}", adminLogin);
		
		
		if(adminLogin) {
			Admin ad = new Admin();
			ad = adminService.getAdmin(admin);
			
			logger.debug("login{}:",adminLogin);
			
			session.setAttribute("adminLogin", true);
//			session.setAttribute("adminSession", true);
			session.setAttribute("adminNo", ad.getAdminNo());
			session.setAttribute("adminId", ad.getAdminId());
			session.setAttribute("type", "a");
			
			return "redirect:/admin/main";
			
			
		}
		return "redirect:/admin/login";
		
	}
	
	@GetMapping("/logout")
	public String logoutGet(HttpSession session) {
		logger.info("/admin/logout [GET]");
		session.invalidate();
		return "redirect:/admin/login" ;	
	}
	
	
	
	
	
//	사용자 회원 관리
	@GetMapping("/usermanage")
	public void usermanage(@RequestParam(defaultValue = "0") int curPage,
	         @RequestParam(defaultValue = "date")  String filter, Model model, 
	         @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
	         @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
	         )throws Exception{
		
		
		Paging paging = adminService.getPagingUserManage(curPage, filter, searchType, keyword);
//		logger.debug("paging!!{}",paging);
		
		List<User> userList = adminService.userList(paging, filter, searchType, keyword);
		
//		logger.info("!!!!!!!!!!!!!!!!{}", userList);
		model.addAttribute("userList", userList);

	      model.addAttribute("list", userList);
	      model.addAttribute("paging", paging);
	      model.addAttribute("filter", filter);
	      model.addAttribute("searchType", searchType);
	      model.addAttribute("keyword", keyword);
		
	}
	
	
	
	@GetMapping("/userdetail")
	public void userdetail(int userNo, Model model) {
		logger.debug("userNo!!!!!!!!!!!!{}",userNo);
		
		Map<String, Object> detailList = adminService.userdetail(userNo);
		
		
		model.addAttribute("detailList", detailList);
		
	}
	
	@RequestMapping("/removeuser")
	public String userremove(int userNo) {
		
		adminService.deleteUser(userNo);
		
		return "redirect:/admin/usermanage";
	}
	
	@GetMapping("/userupdate")
	public void userupdate(int userNo, Model model) {
		
		Map<String, Object> detailList = adminService.userdetail(userNo);

		UserFile userFile = adminService.selectImg(userNo);
		
		model.addAttribute("userFile", userFile);
		model.addAttribute("detailList", detailList);
		
	}
	
	@PostMapping("/userupdate")
	public String userupdatepost(User user ,MultipartFile file,Model model) {
		
		adminService.userupdate(user,file);
		
		model.addAttribute("profile", file);
		
		return "redirect:/admin/userdetail?userNo="+user.getUserNo();
	}
	
	
	
	
	
	
	// 제휴사 관리
	@GetMapping("/partnermanage")
	public void partnerrmanage(@RequestParam(defaultValue = "0") int curPage,
	         @RequestParam(defaultValue = "date")  String filter, Model model, 
	         @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
	         @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
	         )throws Exception{
		
		Paging paging = adminService.getPagingPartnerManage(curPage, filter, searchType, keyword);
		
		List<Partner> partnerList = adminService.partnerList(paging, filter, searchType, keyword);
		
		model.addAttribute("partnerList", partnerList);
	      model.addAttribute("paging", paging);
	      model.addAttribute("filter", filter);
	      model.addAttribute("searchType", searchType);
	      model.addAttribute("keyword", keyword);
		
	}
	@GetMapping("/partnerdetail")
	public void partnerdetail(int partnerNo, Model model) {
		logger.debug("partnerNo!!!!!!!!!!!!{}",partnerNo);
		
		Partner detailList = adminService.partnerdetail(partnerNo);
		 
		model.addAttribute("detailList", detailList);
		
	}
	
	@RequestMapping("/removepartner")
	public String partnerremove(int partnerNo) {
		
		adminService.deletePartner(partnerNo);
		
		return "redirect:/admin/partnermanage";
	}
	
	@GetMapping("/partnerupdate")
	public void partnerupdate(int partnerNo, Model model) {
		
		Partner detailList = adminService.partnerdetail(partnerNo);

		PartnerFile partnerFile = adminService.selectPartnerImg(partnerNo);
		
		logger.debug("file11 {}",partnerFile);
		
		model.addAttribute("partnerFile", partnerFile);
		model.addAttribute("detailList", detailList);
		
	}
	
	@PostMapping("/partnerupdate")
	public String partnerupdatepost(Partner partner ,MultipartFile file,Model model) {
		
		adminService.partnerupdate(partner,file);
		
		logger.debug("file222 {}",file);
		
		model.addAttribute("profile", file);
		
		return "redirect:/admin/partnerdetail?partnerNo="+partner.getPartnerNo();
	}
	
	
	//파트너 예약
	@GetMapping("/partreserve")
	public void partreserveGet(@RequestParam(name = "partnerNo") int partNo, @RequestParam(defaultValue = "0") int curPage,
	         @RequestParam(defaultValue = "date")  String filter, Model model, 
	         @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
	         @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
	         )throws Exception{

		  logger.debug("partNo!!!!!!!!!!!{}:",partNo);  
		   
		Paging paging = adminService.getPartReservePaging(partNo,curPage,filter,searchType,keyword);
		List<Map<String, Object>> partReserveList = adminService.getPartReserveList(partNo,paging,filter,searchType,keyword);

		model.addAttribute("partReserveList", partReserveList);
		model.addAttribute("paging", paging);
	      model.addAttribute("filter", filter);
	      model.addAttribute("searchType", searchType);
	      model.addAttribute("keyword", keyword);
	      
	      
	      
	}
	@GetMapping("/partupdatereserve")
	public void partUpdateReserveGet(HttpSession session, Model model, String date, String time, int resNo) {
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("resNo", resNo);
	}
	
	
	
	@GetMapping("/reserveDateAjax")
	public void reserveDateAjaxGet(Reservation reservation,int partnerPrice, Model model) {	
		
		List<Integer> reserveList = adminService.reserveTime(reservation);
		
		logger.debug("!!!!!!!!!!!!!!!!!!!!!!!!!!{}", reserveList);
		
		
		model.addAttribute("reserveList", reserveList);
		model.addAttribute("resDate", reservation.getResDate());
		model.addAttribute("partnerPrice", partnerPrice);
		
	}
	
	
	@GetMapping("/partupdatereserveajax")
	public void updateReserveAjax(int partnerNo,Reservation reservation, int resNo, HttpSession session, Model model) {
		reservation.setPartNo(partnerNo);
		List<Integer> reserveList = adminService.reserveTime(reservation);
		logger.debug("partnerNo { } :",partnerNo);
		
		model.addAttribute("reserveList", reserveList);
		model.addAttribute("resNo", resNo);
		model.addAttribute("resDate", reservation.getResDate());
	}
	
	@GetMapping("/updateReserveComplete")
	public String updateReserveComplete(Partner partner ,@RequestParam(name = "partnerNo") int partnerNo,Reservation reservation, HttpSession session) {
		reservation.setPartNo(partnerNo);
		adminService.updateReservation(reservation);
		
		return "redirect:./partreserve?partnerNo="+partner.getPartnerNo();
	}
	
	
	
	//공지사항 
	@GetMapping("/noticelist")
	public void adminnotice(@RequestParam(defaultValue = "0") int curPage,Model model, @RequestParam(defaultValue = "a") String filter,HttpSession session,@RequestParam(defaultValue = "a") String type) throws Exception{
		logger.debug("/admin/noticelist");	
		
		Paging paging = adminService.getPagingNotice(curPage,filter,type);
		
		List<Map<String,Object>> noticelist = adminService.selectAllSearch(paging,filter,type);
		
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("paging",paging);
		model.addAttribute("filter", filter);
	}

	
	 @GetMapping("/view")
	   public void view(int noticeNo,Model model, HttpSession session) {
//	      logger.info("/notice/view [GET]");

	      AdminNotice view = adminService.view(noticeNo);
	      model.addAttribute("view", view);
	      
	      List<MultipartFile> file = adminService.getMultiFile(noticeNo);
	      model.addAttribute("file", file);

	      Admin viewAdmin = adminService.viewAdmin(view.getAdminNo());
	      model.addAttribute("viewAdmin", viewAdmin);

	   }
	
	
	
	@GetMapping("/writenotice") 
	public void writeNotice() {
//		logger.debug("/admin/writernotice [Get]");
		
		
	}
	
	@PostMapping("/writenotice")
	public String writeNoticePost(HttpSession session, List<MultipartFile> dataMul, AdminNotice adminnotice) {
//		logger.debug("/admin/writenotice [Post]");
		
		adminnotice.setAdminNo((Integer)session.getAttribute("adminNo"));
		
//		logger.info("adminNo : {}", session.getAttribute("adminNo"));
//		logger.debug("dataMul : {}",dataMul);
//		logger.debug("adminnotice : {}",adminnotice);
				
		adminService.writeNotice(adminnotice,dataMul);
		
		 return "redirect:/admin/noticelist";
	}
	
	
	
	
	//사용자가 작성한 글 가져오기 
	@GetMapping("/userboardpost")
	public void userboardpost(@RequestParam("userNo") int userNo, Model model,@RequestParam(defaultValue = "0") int curPage,
	         @RequestParam(defaultValue = "date")  String filter, 
	         @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
	         @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
	         )throws Exception{
		
		Paging paging = adminService.getPagingUserPost(userNo,curPage,filter,searchType,keyword);
		
		logger.debug("paging!!{}",paging);
//		logger.debug("userboardpost --userno - {}", userNo);	
		
		List<FreeBoard> fblist = adminService.userPost(userNo,paging,filter,searchType,keyword);
		
		
		model.addAttribute("fblist", fblist);
	    model.addAttribute("paging", paging);
	      model.addAttribute("filter", filter);
	      model.addAttribute("searchType", searchType);
	      model.addAttribute("keyword", keyword);
	}
	 
	//사용자가 작성한 댓글 조회
	@GetMapping("/usercmtpost")
	public void usercmtpost(@RequestParam("userNo") int userNo, Model model,@RequestParam(defaultValue = "0") int curPage,
	         @RequestParam(defaultValue = "date")  String filter, 
	         @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
	         @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
	         )throws Exception{
		
		Paging paging = adminService.getPagingUserCmt(userNo,curPage,filter,searchType,keyword);
		
		logger.debug("paging!@#{}:",paging);
		List<Map<String, Object>> cmtList = adminService.userCmt(userNo,paging,filter,searchType,keyword);
		logger.debug("usercmt!@#{}:",cmtList);
		
		
		model.addAttribute("cmtList", cmtList);
	    model.addAttribute("paging", paging);
	      model.addAttribute("filter", filter);
	      model.addAttribute("searchType", searchType);
	      model.addAttribute("keyword", keyword);
	}
	
	
	
	// 사용자가 작성한 게시물 삭제
    @RequestMapping(value = "/removeuserpost", method = RequestMethod.GET)
    public String postdelete(String freeboardNo,FreeBoard freeBoard) throws Exception {
    	adminService.userBoardDelete(freeboardNo);
    	return "redirect:/admin/userboardpost?userNo="+ freeBoard.getUserNo();
    }
    
    //게시물 선택삭제
    @RequestMapping(value = "/removeuserpost",method = RequestMethod.POST)
    public String ajaxTest(HttpServletRequest request,FreeBoard freeBoard) throws Exception {
            
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	adminService.userBoardDelete(ajaxMsg[i]);
        }
    	return "redirect:/admin/userboardpost?userNo="+ freeBoard.getUserNo();
    }	

    
    //사용자가 작성한 댓글 삭제 
   @RequestMapping(value = "/removeusercmt", method = RequestMethod.GET)
    public String cmtdelete(String cmtNo,FreeBoard freeBoard) throws Exception {
    	adminService.removeusercmt(cmtNo);
    	return "redirect:/admin/usercmtpost?userNo="+ freeBoard.getUserNo();
    }
    
    //댓글 선택삭제
    @RequestMapping(value = "/removeusercmt",method = RequestMethod.POST)
    public String cmtajax(HttpServletRequest request,FreeBoard freeBoard) throws Exception {
            
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	adminService.removeusercmt(ajaxMsg[i]);
        }
    	return "redirect:/admin/usercmtpost?userNo="+ freeBoard.getUserNo();
    }	


	
	

	@RequestMapping("/delete")
	public String delete(AdminNotice adminNotice) {
	     
		  adminService.delete(adminNotice);
	      
	      return "redirect:./noticelist";
	   }
	
	 @GetMapping("/update")
	   public void update(int noticeNo, Model model) {
	      AdminNotice notice = adminService.selectNotice(noticeNo);
	      logger.info("update notice: {}", notice);
	      
	      model.addAttribute("notice", notice);
	      
	      
	      List<AdminNoticeFile> noticeFile = adminService.selectNoticeFile(noticeNo);
	      logger.info("update noticeFile: {}", noticeFile);
	      
	   }
	   
	   @PostMapping("/update")
	   public String updateRes(AdminNotice notice, List<MultipartFile> dataMul) {
	      
	      logger.info("확인: {}", notice);
	      adminService.update(notice, dataMul);
	      logger.debug("!!!!!!{}", dataMul);
	      logger.info("!!!!!!!!확인: {}", notice.getNoticeNo());
	      
	      return "redirect:./view?noticeNo=" + notice.getNoticeNo();
	   }  
	   
	   
	   @RequestMapping("/download")
	   public String download(int adminFileNo, Model model) {
	      
	      AdminNoticeFile adminNoticeFile = adminService.getFile(adminFileNo);
	      logger.info("ㄴ:{}",adminNoticeFile);
	      model.addAttribute("downFile", adminNoticeFile);
	      
	      return "down";
	   }
	
}

