package com.pointhome.www.freeboard.dao.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.freeboard.dto.FreeBoard;

import com.pointhome.www.freeboard.dto.FreeBoardFile;

import com.pointhome.www.freeboard.dto.FreeBoardComment;

import com.pointhome.www.util.Paging;

public interface FreeBoardDao {

	public int selectCntAll();

	public List<FreeBoard> selectAll(Paging paging);

	public FreeBoard viewBoard(int boardNo);

	public void hit(int boardNo);

	public void insertBoard(FreeBoard board);

	public void insertFile(FreeBoardFile freeboardFile);

	public List<FreeBoardComment> viewBoardComment(int freeboardNo);

	public void insertBoardComment(FreeBoardComment comment);

	public List<MultipartFile> getMultiFiles(int freeboardNo);

	public FreeBoardFile selectFile(int fileNo);

	public void deleteFile(FreeBoard board);

	public void deleteBoard(FreeBoard board);





}