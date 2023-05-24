package com.pointhome.www.freeboard.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.freeboard.dao.face.FreeBoardDao;
import com.pointhome.www.freeboard.dto.FreeBoard;

import com.pointhome.www.freeboard.dto.FreeBoardFile;

import com.pointhome.www.freeboard.dto.FreeBoardComment;

import com.pointhome.www.freeboard.service.face.FreeBoardService;
import com.pointhome.www.util.Paging;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired FreeBoardDao freeBoardDao;
	@Autowired private ServletContext context;

	@Override
	public Paging getPaging(int curPage) {

		int totalPage = freeBoardDao.selectCntAll();
		
		Paging paging = new Paging(totalPage, curPage);
		
		return paging;
	}

	@Override
	public List<FreeBoard> list(Paging paging) {
		
		
		
		return freeBoardDao.selectAll(paging);
		
		
	}

	@Override
	public FreeBoard view(int boardNo) {
		
		freeBoardDao.hit(boardNo);
		return freeBoardDao.viewBoard(boardNo);
	}

	@Override

	public void write(FreeBoard board, List<MultipartFile> dataMul) {

		freeBoardDao.insertBoard(board);
		logger.info("boardno: {}", board.getFreeboardNo());
		
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
			
			FreeBoardFile freeboardFile = new FreeBoardFile();
			
			freeboardFile.setFreeboardNo(board.getFreeboardNo());
			freeboardFile.setFreeboardfileOrigin(originName);
			freeboardFile.setFreeboardfileStored(storedName);
			
			logger.info("filetest :{} ", freeboardFile);
			
			freeBoardDao.insertFile(freeboardFile);
			

		}
	
	}

	@Override
	public List<FreeBoardComment> commentView(int freeboardNo) {
		
		return freeBoardDao.viewBoardComment(freeboardNo);
	}

	@Override
	public void insert(FreeBoardComment comment) {
		
		freeBoardDao.insertBoardComment(comment);

	}

	@Override
	public List<MultipartFile> getMultiFile (int freeboardNo) {
		
		return freeBoardDao.getMultiFiles(freeboardNo);
	}

	@Override
	public FreeBoardFile getFile(int fileNo) {

		logger.info("ds{}", freeBoardDao.selectFile(fileNo));
		return freeBoardDao.selectFile(fileNo);
	}
	
	@Override
	public void delete(FreeBoard board) {
		
		freeBoardDao.deleteFile(board);
		freeBoardDao.deleteBoard(board);
		
	}

}
