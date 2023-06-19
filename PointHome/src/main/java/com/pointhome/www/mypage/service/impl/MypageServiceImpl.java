package com.pointhome.www.mypage.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.mypage.dao.face.MypageDao;
import com.pointhome.www.mypage.dto.MyPick;
import com.pointhome.www.mypage.dto.Review;
import com.pointhome.www.mypage.dto.ReviewFile;
import com.pointhome.www.mypage.service.face.MypageService;
import com.pointhome.www.partner.dao.face.PartnerDao;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserFile;
import com.pointhome.www.util.Paging;

@Service
public class MypageServiceImpl implements MypageService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MypageDao mypageDao;
	@Autowired private ServletContext context;
	
	@Override
	public User selectInfo(int userno) {

		return mypageDao.selectByUserId(userno);
	}
	
	@Override
	public void update(User user, MultipartFile file) {
		
		mypageDao.updateUser(user);
		
		if( file.getSize() <= 0 ) {
			return;
		}
		
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		
		
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		File dest = new File(storedFolder, storedName);

		logger.info("dsaffffffff{}",storedPath);
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		UserFile userFile = new UserFile();
		userFile.setUserNo(user.getUserNo());
		userFile.setUserImg(storedName);
		
		logger.info("{}", userFile);
		
		mypageDao.deleteFile(userFile);
		mypageDao.insertFile(userFile);
		
	}

	@Override
	public UserFile selectImg(int userno) {
		return mypageDao.selectImgByUserno(userno);
	}

	@Override
	public void delete(int userno) {
		
		mypageDao.deleteMemberByUserno(userno);
	}

	@Override
	public int isPick(int partnerNo, int userNo) {
		
		int pickNo = 0;
		MyPick myPick = new MyPick(pickNo, partnerNo, userNo);
		
		return mypageDao.selectByPickUserNo(myPick);
	}
	
	@Override
	public void pickUpdate(int userNo, int partnerNo) {
		
		int pickNo = 0;
		MyPick myPick = new MyPick(pickNo, userNo, partnerNo);

		int isPick = mypageDao.selectByPickUserNo(myPick);
		
		if( isPick == 0) {
			mypageDao.insertPick(myPick);
		} else if ( isPick == 1 ) {
			mypageDao.deletePick(myPick);
		}
		
	}

	@Override
	public List<Map<String, Object>> selectPickList(Paging paging, int userNo) {
		return mypageDao.getPickList(paging, userNo);
	}

	@Override
	public List<Map<String, Object>> selectAlList(Paging paging, int userNo) {
		return mypageDao.selectAlarmList(paging, userNo);
	}

	@Override
	public int getAlertCnt(int userNo) {
		return mypageDao.selectAlertCnt(userNo);
	}

	@Override
	public void deleteAlert(int userNo) {
		mypageDao.deleteAlertByUserno(userNo);
	}

	@Override
	public List<Map<String, Object>> selectReserve(Paging paging, int userNo) {
		return mypageDao.selectReserveList(paging, userNo);
	}
	
	@Override
	public void insertReview(Review myreview) {
		mypageDao.insertMyReview(myreview);

	}

	@Override
	public void deleteReview(Review myreview) {
		mypageDao.deleteMyReview(myreview);
	}
	
	@Override
	public List<Map<String, Object>> selectReviewList(Paging paging, int userNo) {
		return mypageDao.selectMyReviewList(paging, userNo);
	}

	@Override
	public Paging getPaging(int curPage, int userNo) {
		
		int totalPage = mypageDao.selectBoardPaging(curPage, userNo);
		
		logger.info("total: {}", totalPage);
		
		Paging paging = new Paging(totalPage, curPage);
		
		return paging;
	}
	
	@Override
	public List<FreeBoard> selectboard(Paging paging, int userNo) {
		return mypageDao.getMyBoardList(paging, userNo);
	}

	@Override
	public void removeboardlist(String freeboardNo) {
		mypageDao.myBoardListDelete(freeboardNo);
	}
	
	@Override
	public Paging getPickPaging(int curPage, int userNo) {
		
		int totalPage = mypageDao.selectPickPaging(curPage, userNo);
		
		Paging paging = new Paging(totalPage, curPage);
		
		return paging;
	}
	
	@Override
	public void removepicklist(String partnerNo) {
		mypageDao.myPickListDelete(partnerNo);
	}
	
	@Override
	public Paging getAlertPaging(int curPage, int userNo) {

		int totalPage = mypageDao.selectAlertPaging(curPage, userNo);
		
		Paging paging = new Paging(totalPage, curPage);
		return paging;
	}

	@Override
	public void removeAlertlist(String alertNo) {
		mypageDao.myAlertListDelete(alertNo);
	}
	
	@Override
	public Paging getReservePaging(int curPage, int userNo) {
		int totalPage = mypageDao.selectReservePaging(curPage, userNo);
		
		Paging paging = new Paging(totalPage, curPage);
		return paging;
	}
	
	@Override
	public List<Map<String, Object>> selectReserve(int userno) {
		return mypageDao.selectNewReserveList(userno);
	}

	@Override
	public Paging getReviewPaging(int curPage, int userNo) {
		int totalPage = mypageDao.selectReviewPaging(curPage, userNo);
		
		Paging paging = new Paging(totalPage, curPage);
		
		logger.info("!!!!!{}", paging);
		
		return paging;
	}
	
	@Override
	public void removeReviewlist(String reviewNo) {
		mypageDao.myReviewListDelete(reviewNo);
	}

	@Override
	public Map<String, Object> selectPay(int userNo, int resNo) {
		return mypageDao.selectPaylist(userNo, resNo);
	}

	@Override
	public Paging getCommentPaging(int curPage, int userNo) {
		
		int totalPage = mypageDao.selectCommentPaging(curPage, userNo);
		
		Paging paging = new Paging(totalPage, curPage);
		
		logger.info("!!!!!{}", paging);
		
		return paging;
	}
	
	@Override
	public List<Map<String, Object>> selectComment(Paging paging, int userNo) {
		return mypageDao.selectCommentList(paging, userNo);
	}
	
	@Override
	public void removeCommentlist(String commNo) {
		mypageDao.deleteMyComment(commNo);
	}

	@Override
	public List<PartnerNotice> selectNoticeList(int userno) {
		return mypageDao.selectPickNotice(userno);
	}
	
	@Override
	public Paging getNoticelistPaging(int curPage, int userNo) {
		int totalPage = mypageDao.selectNoticePaging(curPage, userNo);
		
		Paging paging = new Paging(totalPage, curPage);
		
		logger.info("!!!!!{}", paging);
		
		return paging;
	}
	
	@Override
	public List<Map<String, Object>> selectPickNotice(Paging paging, int userNo) {
		
		logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!{}", userNo);
		logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!{}", paging);
		return mypageDao.selectPickNoticeByuserno(paging, userNo);
	}
	
	@Override
	public String selectUserNick(int userno) {
		return mypageDao.selectUsernick(userno);
	}
}
