package com.pointhome.www.partner.service.impl;

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

import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.mypage.dto.MyPick;
import com.pointhome.www.partner.dao.face.PartnerDao;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerFile;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.partner.dto.PartnerNoticeFile;
import com.pointhome.www.partner.dto.PartnerVideo;
import com.pointhome.www.partner.service.face.PartnerService;
import com.pointhome.www.util.Paging;

@Service
public class PartnerServiceImpl implements PartnerService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	PartnerDao partnerDao;
	@Autowired private ServletContext context;

	@Override
	public void join(Partner partner) {

		int res = partnerDao.selectCntByEmailPhone(partner);
		if (res > 0) {
			logger.debug("아이디 or 번호 중복");
		} else {
			logger.debug("중복아님");
			partnerDao.insertPartner(partner);
		}

	}

	@Override
	public Boolean isLogin(Partner partner) {

		int res = partnerDao.selectCntByPartnerEmailPw(partner);

		if (res > 0) {
			logger.debug("회원정보 존재 : {}", res);
			return true;
		} else {

			return false;
		}
	}
	
	
	@Override
	public void updateReservation(Reservation reservation) {
		partnerDao.updateReservation(reservation);
	}
	
	

	@Override
	public Partner getPartner(Partner partner) {

		Partner param = new Partner();
		param = partnerDao.selectByPartnerEmailPw(partner);
		logger.debug("partner{}", param);

		return param;
	}
	
	@Override
	public Paging getTypePaging(Map<String, Object> pagingMap) {
		int totalPage = partnerDao.selectCntTypeAll(pagingMap);
		Paging paging = new Paging(totalPage, (int) pagingMap.get("curPage"), 12, 10);

		return paging;
	}

	
	
	@Override
	public Partner getPartnerInfo(Integer partnerNo) {
		
		return partnerDao.getPartInfo(partnerNo);
	}


	@Override
	public  List<Map<String,Object  >> noticeList(Paging paging) {
		 List<Map<String,Object  >> alist = partnerDao.selectAllPartnerNotice(paging);

		logger.debug("{}", alist);
		return alist;
	}

	@Override
	public void writeNotice(PartnerNotice partnerNotice, List<MultipartFile> dataMul) {
		partnerDao.insertNotice(partnerNotice);
		
		List<MyPick> pickUser = partnerDao.selectPickList(partnerNotice);
		logger.info("{}", pickUser);
		if (pickUser != null) {
			for( MyPick mp: pickUser) {
				partnerDao.insertNoticeAlert(partnerNotice, mp );
			}
			logger.info("partnerno: {}", partnerNotice.getPartnerNo());
		}
		
		for(MultipartFile m : dataMul ) {
			if(m.getSize() <= 0 ) {
				
				logger.info("0보다 작음, 처리 중단");
				
				continue;
			}
		
			String storedPath = context.getRealPath("upload");
			logger.info("storedPath : {}", storedPath);
			
			File storedFolder = new File(storedPath);
			
			storedFolder.mkdir();
			File dest = null;
			String originName = null;
			String storedName = null;
			
			do {
			originName = m.getOriginalFilename();
			storedName = originName + UUID.randomUUID().toString().split("-")[4];
			
			logger.info("storedName : {}", storedName);
		
			dest = new File(storedFolder, storedName);
			
			} while(dest.exists());
			
				try {
					m.transferTo(dest);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			
			PartnerNoticeFile noticeFile = new PartnerNoticeFile();
			
			noticeFile.setPartnerNoticeNo(partnerNotice.getPartnerNoticeNo());
			noticeFile.setPartnerNoticeFileOrigin(originName);
			noticeFile.setPartnerNoticeFileStored(storedName);
			
			logger.info("filetest :{} ", noticeFile);
			
			partnerDao.insertFile(noticeFile);
		}
	}

	@Override
	public int getPartnerNoByEmail(Partner partner) {
		
		return partnerDao.selectPartnerNo(partner);
	}

	@Override

	public Paging getPagingNotice(int curPage) {
		
		 int totalPage = partnerDao.selectNoticeCntAll();
	      
	      Paging paging = new Paging(totalPage, curPage); 
	      
		return paging;
	}
	

	@Override
	public Partner partnerInfo(Integer partnerNo) {
		
		return partnerDao.selectPartnerInfo(partnerNo);
	}

	@Override
	public PartnerNotice view(int partnerNoticeNo) {
		
		
		return partnerDao.viewNotice(partnerNoticeNo);
	}

	@Override
	public List<MultipartFile> getMultiFile(int partnerNoticeNo) {
		
		return partnerDao.getMultiFiles(partnerNoticeNo);
	}

	@Override
	public Partner viewPartner(int partnerNo) {
		return partnerDao.selectByPartnerNo(partnerNo);

	}

//	@Override
//	public List<Map<String, Object>> list(Paging paging, int userNo) {
//		return partnerDao.selectPartPick(paging, userNo );
//			
//	}

	@Override
	public void delete(PartnerNotice partnerNotice) {
		
		partnerDao.deleteFile(partnerNotice);
		partnerDao.deleteNotice(partnerNotice);
	}

	@Override
	public PartnerNotice selectNotice(int partnerNoticeNo) {
		
		return partnerDao.selectNoticebyNoticeNo(partnerNoticeNo);
	}

	 @Override
	   public List<PartnerNoticeFile> selectNoticeFile(int partnerNoticeNo) {

	      
	      return partnerDao.selectNoticeFilebyNoticeNo(partnerNoticeNo);
	   }
	 
	 @Override
		public void update(PartnerNotice partnerNotice, List<MultipartFile> dataMul) {

		 partnerDao.deleteFile(partnerNotice);
		 partnerDao.update(partnerNotice);
			
			for(MultipartFile m : dataMul ) {
		         if(m.getSize() <= 0 ) {
		            
		            logger.info("0보다 작음, 처리 중단");
		            
		            continue;
		         }
		         
		      
		         String storedPath = context.getRealPath("upload");
		         logger.info("storedPath : {}", storedPath);
		         
		         File storedFolder = new File(storedPath);
		         
		         storedFolder.mkdir();
		         File dest = null;
		         String originName = null;
		         String storedName = null;
		         
		         do {
		            logger.debug("!!!!!!!!!++++++++++++++++");
		            originName = m.getOriginalFilename();
		            storedName = originName + UUID.randomUUID().toString().split("-")[4];
		            
		            logger.info("storedName : {}", storedName);
		         
		            dest = new File(storedFolder, storedName);
		         
		         } while(dest.exists());
		         
		            try {
		               m.transferTo(dest);
		            } catch (IllegalStateException e) {
		               e.printStackTrace();
		            } catch (IOException e) {
		               e.printStackTrace();
		            }
		         
		         PartnerNoticeFile partnerNoticeFile = new PartnerNoticeFile();
		         
		         partnerNoticeFile.setPartnerNoticeNo(partnerNotice.getPartnerNoticeNo());
		         partnerNoticeFile.setPartnerNoticeFileOrigin(originName);
		         partnerNoticeFile.setPartnerNoticeFileStored(storedName);
		         
		         logger.info("filetest :{} ", partnerNoticeFile);
		         
		         logger.info("++++++++++++++++++++++++삭제");
		         partnerDao.insertFile(partnerNoticeFile);
			}

		}

	@Override
	public List<Map<String, Object>> getPartTypePick(int curPage, Paging paging, int userNo, String partnerType) {
		return partnerDao.selectPartnerPick(curPage, paging, userNo, partnerType);
	}


	@Override
	public void imgUpdate(Partner partner, MultipartFile file) {
		
		partnerDao.updatePartner(partner);
		
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
		
		PartnerFile partnerFile = new PartnerFile();
		partnerFile.setPartnerNo(partner.getPartnerNo());
		partnerFile.setPartnerImg(storedName);
		
		logger.info("{}", partnerFile);
		
		partnerDao.deletePartFile(partnerFile);
		partnerDao.insertPartFile(partnerFile);
		
	}
	
	@Override
	public PartnerFile getPartnerFile(int partNo) {
		return partnerDao.getPartnerImg(partNo);
	}
	
	@Override
	public Paging getPaging(int curPage, int partNo) {
		int totalPage = partnerDao.selectCntReservation(partNo);
		Paging paging = new Paging(totalPage, curPage);

		return paging;
	}

	@Override
	public List<Map<String, Object>> getReserveList(Paging paging, int partNo) {

		return partnerDao.selectReserveList(paging, partNo);
	}

	@Override
	public List<PartnerVideo> viewVideo(int partnerNo) {
		
		logger.info("여긴 서비스 임플 왔냐 : {}", partnerNo);
		
		List<PartnerVideo> video = partnerDao.viewVideo(partnerNo);
		
		return video;
	}
	
	@Override
	public void insertVideo(PartnerVideo video) {
		
		partnerDao.insertVideo(video);
		
		List<MyPick> pickUser = partnerDao.selectPickListByVideo(video);
		logger.info("{}", pickUser);
		if (pickUser != null) {
			for( MyPick mp: pickUser) {
				partnerDao.insertVideoAlert(video, mp );
			}
			logger.info("partnerno: {}", video.getPartnerNo());
		}
		
	}

	@Override
	public void deleteVideo(int partnerVideoNo) {
		
		partnerDao.deleteVideo(partnerVideoNo);
		
	}

	@Override
	public int test(String videoId) {
		return partnerDao.test(videoId);
	}

	@Override
	public String getUserName(int userSessionNo) {
		
		return partnerDao.selectUserName(userSessionNo);
	}
			
}
