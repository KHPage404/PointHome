package com.pointhome.www.partner.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.admin.dto.AdminNoticeFile;
import com.pointhome.www.partner.dao.face.PartnerDao;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.partner.dto.PartnerNoticeFile;
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
	public Partner getPartner(Partner partner) {

		Partner param = new Partner();
		param = partnerDao.selectByPartnerEmailPw(partner);
		logger.debug("partner{}", param);

		return param;
	}

	@Override
	public Paging getPaging(int curPage) {

		int totalPage = partnerDao.selectCntAll();
		logger.info("total: {}", totalPage);
		
		
		Paging paging = new Paging(totalPage, curPage);

		return paging;
	}

	@Override
	public List<Partner> list(Paging paging) {

		List<Partner> list = partnerDao.selectAll(paging);

		logger.info("service!!!!!!!!!!!!!!!!{}", list);

		return list;
	}

	@Override
	public Paging getTypePaging(Map<String, Object> pagingMap) {

		logger.info("맵 !!!!!!!!!!!!!!!!{}", pagingMap.get("partnerType"));
		logger.info("맵 !!!!!!!!!!!!!!!!{}", pagingMap.get("curPage"));

		int totalPage = partnerDao.selectCntTypeAll(pagingMap);

		logger.info("total: {}", totalPage);

		Paging paging = new Paging(totalPage, (int) pagingMap.get("curPage"));

		return paging;
	}

	@Override
	public List<Partner> typelist(Map<String, Object> listMap) {

		logger.info("리스트 !!!!!!!!!!!!!!!!{}", listMap.get("partnerType"));
		logger.info("리스트 !!!!!!!!!!!!!!!!{}", listMap.get("paging"));

		List<Partner> list = partnerDao.selectTypeListAll(listMap);

		logger.info("service!!!!!!!!!!!!!!!!{}", list);

		return list;
	}

	@Override
	public List<PartnerNotice> noticeList(Paging paging) {
		List<PartnerNotice> alist = partnerDao.selectAllPartnerNotice(paging);

		logger.debug("{}", alist);
		return alist;
	}

	@Override
	public void writeNotice(PartnerNotice partnerNotice, List<MultipartFile> dataMul) {
		partnerDao.insertNotice(partnerNotice);
		logger.info("partnerno: {}", partnerNotice.getPartnerNo());
		
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

	@Override
	public List<Map<String, Object>> list(Paging paging, int userNo) {
		return partnerDao.selectPartPick(paging, userNo );
			
	}

	@Override
	public List<Map<String, Object>> typelist(Paging paging, String partnerType, int userNo) {
		return partnerDao.selectPartTypePick(paging, userNo, partnerType);
	}

}
