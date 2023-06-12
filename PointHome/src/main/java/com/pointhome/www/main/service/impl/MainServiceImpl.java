package com.pointhome.www.main.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pointhome.www.main.dao.face.MainDao;
import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.main.service.face.MainService;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.util.Paging;

@Service
public class MainServiceImpl implements MainService {

	@Autowired MainDao mainDao;
	
	@Override
	public List<Integer> reserveTime(Reservation reservation) {
		
		return mainDao.selectReserveTime(reservation); 
	}
	
	@Override
	public void insertReserveData(Reservation res) {
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        String str = format.format(now);
		res.setResReserveno(str);
		
		mainDao.insertUserReserveData(res);
		mainDao.insertReserveAlert(res);
		
	}
	
	@Override
	public Partner getPartnerView(int partNo) {
		
		return mainDao.selectPartnerView(partNo);
	}
	
	@Override
	public Paging getPaging(int curPage, int partNo) {
		int totalPage = mainDao.selectCntReview(partNo);
		Paging paging = new Paging(totalPage, curPage);

		return paging;
	}

	@Override
	public List<Map<String, Object>> getReviewList(Paging paging, int partNo) {

		return mainDao.selectReviewListByPartNo(paging, partNo);
	}
	
}
