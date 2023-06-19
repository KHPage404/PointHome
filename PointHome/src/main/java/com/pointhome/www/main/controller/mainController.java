package com.pointhome.www.main.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.main.service.face.MainService;
import com.pointhome.www.mypage.service.face.MypageService;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerFile;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.partner.dto.PartnerVideo;
import com.pointhome.www.partner.service.face.PartnerService;
import com.pointhome.www.util.Paging;

@Controller
public class mainController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MainService mainService;
	@Autowired MypageService mypageService;
	@Autowired PartnerService partnerService;

	@GetMapping("/")
	public String main(HttpSession session, Model model) {
		logger.debug("/");
		
		if(session.getAttribute("login") != null) {
			int userno= (int) session.getAttribute("userno"); 
			
			int alertCnt = mypageService.getAlertCnt(userno);
			model.addAttribute( "alertCnt" , alertCnt);
		}
		
		return "main";
	}
	
	@GetMapping("/main/detail")
	public void detailGet(int partNo, @RequestParam(defaultValue = "0") int curPage, Model model, HttpSession session) {
		
		//partner,partnerfile
		Partner partner = mainService.getPartnerView(partNo);
		PartnerFile partnerFile = partnerService.getPartnerFile(partNo);
		
		//페이징 후 reviewList
		Paging paging = mainService.getPaging(curPage, partNo);
		List<Map<String, Object>> reviewList  = mainService.getReviewList(paging, partNo);
		
		//video
		List<PartnerVideo> video = partnerService.viewVideo(partNo);
		
		//notice
		List<PartnerNotice> noticeList = mainService.getPartnerNotice(partNo);
		
		//로그인 안되어있으면 userno세션 사용 불가능(오류)
		if(session.getAttribute("userno") == null) {
		} else {
			//로그인 상태에서 구독, 알람 상황 전달 
			int userNo = (Integer)session.getAttribute("userno");
			int isPick = mypageService.isPick(userNo, partNo);
			int alertCnt = mypageService.getAlertCnt(userNo);
			
			model.addAttribute("isPick", isPick);
			model.addAttribute( "alertCnt" , alertCnt);
		}

		//평균 별점 계산
		double grade = 0;
		String avgGrade = "0";
		if(reviewList.size() != 0) {
			for(Map review : reviewList) {
				grade += ((BigDecimal) review.get("REVIEW_GRADE")).doubleValue();
			}
			grade = grade/reviewList.size();
			avgGrade = String.format("%.1f", grade);
		}
		
		logger.debug("!!!!!!!!!!!!!{}", avgGrade);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewCnt", reviewList.size());
		model.addAttribute("avgGrade", avgGrade);
		model.addAttribute("partnerFile", partnerFile);
		model.addAttribute("partNo", partNo);
		model.addAttribute("partner", partner);
		model.addAttribute("video", video);
		model.addAttribute("noticeList", noticeList);
	}
	
	@RequestMapping("/main/detailPick")
	public ModelAndView mypick(int partNo, 
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
	
	@GetMapping("/main/review")
	public void reviewGet(int partNo, @RequestParam(defaultValue = "0") int curPage, Model model) {
		Partner partner = mainService.getPartnerView(partNo);

		Paging paging = mainService.getPaging(curPage, partNo);
		List<Map<String, Object>> reviewList  = mainService.getReviewList(paging, partNo);

		logger.debug("+!+!+!+!+!!+{}", reviewList);

		model.addAttribute("partNo", partNo);
		model.addAttribute("partner", partner);
		model.addAttribute("reviewList", reviewList);
	}
	
	@GetMapping("/main/notice")
	public void noticeGet() {
		
	}
	
	@GetMapping("/main/reservation")
	public void reservation(Model model, int partNo) {
		logger.debug("/main/reservation [GET]");
		Partner partner = mainService.getPartnerView(partNo);

		model.addAttribute("partner", partner);
		model.addAttribute("partNo", partNo);
		
	}
	
	
	@GetMapping("/main/reserveDateAjax")
	public void reserveDateAjaxGet(Reservation reservation,int partnerPrice, Model model, HttpSession session) {	
		
		List<Integer> reserveList = mainService.reserveTime(reservation);
		String orderId = UUID.randomUUID().toString().substring(0,8) + '-' + UUID.randomUUID().toString().substring(0,8);
		logger.debug("!!!!!!!!!!!!!!!!!!!!!!!!!!{}", reserveList);
		
		int userSessionNo = (int) session.getAttribute("userno");
		String userName = partnerService.getUserName(userSessionNo);
		
		logger.debug("----------------- {}", userName);
		
		
		model.addAttribute("reserveList", reserveList);
		model.addAttribute("resDate", reservation.getResDate());
		model.addAttribute("partnerPrice", partnerPrice);
		model.addAttribute("userName", userName);
		
		model.addAttribute("orderId", orderId);
		
		
	}
	
	
	@GetMapping("/main/reserveComplete")
	public String reserveComplete(int partNo, Reservation res, HttpSession session, HttpServletRequest request) {
		res.setUserNo((Integer)session.getAttribute("userno"));
		
		String orderId = request.getParameter("orderId");
		String paymentKey = request.getParameter("paymentKey");
		String amount = request.getParameter("amount");
		String secretKey = "test_sk_YPBal2vxj81wD47MXPeV5RQgOAND:";

		logger.info(orderId);
		logger.info(paymentKey);
		logger.info(amount);
		logger.info(secretKey);

	    JSONObject jsonObject = null;

	      Encoder encoder = Base64.getEncoder(); 
	      byte[] encodedBytes;
	      HttpURLConnection connection = null;
	      int code = 0;
	      try {
	    	 // secretKey를 형변환 해서 clientKey랑 비교한다.
	         encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
	         String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);

	         paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);

	         URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");

	         connection = (HttpURLConnection) url.openConnection();
	         connection.setRequestProperty("Authorization", authorizations);
	         connection.setRequestProperty("Content-Type", "application/json");
	         connection.setRequestMethod("POST");
	         connection.setDoOutput(true);

	         JSONObject obj = new JSONObject();
	         obj.put("paymentKey", paymentKey);
	         obj.put("orderId", orderId);
	         obj.put("amount", amount);

	         OutputStream outputStream = connection.getOutputStream();
	         outputStream.write(obj.toString().getBytes("UTF-8"));

	         code = connection.getResponseCode();
	         boolean isSuccess = code == 200 ? true : false;

	         InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();

	         Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
	         JSONParser parser = new JSONParser();
	         jsonObject = (JSONObject) parser.parse(reader);

	         responseStream.close();

	            if (isSuccess) {
	                //결제 성공
	                     logger.info("결과 데이터 : {}", jsonObject.toJSONString()); 
	                     logger.info("orderName : {}", jsonObject.get("orderName")); 
	                     logger.info("method : {}", jsonObject.get("method")); 

	                     if(jsonObject.get("method").equals("카드")) {  logger.info("method : {}",(((JSONObject)jsonObject.get("card")).get("number")));}
	             
	                    } else { 
	                   //결제 실패
	                        logger.info("method : {}", jsonObject.get("message")); 
	                        logger.info("에러코드 : {}", jsonObject.get("code") ); 
	                    }
	      } catch (UnsupportedEncodingException e) {
	         e.printStackTrace();
	      } catch (MalformedURLException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      } catch (ParseException e) {
	         e.printStackTrace();
	      }

	 
		mainService.insertReserveData(res);

		return "redirect:/main/detail?partNo=" + partNo;
		//return "redirect:/main/reserveComplete";
	}
	
}










