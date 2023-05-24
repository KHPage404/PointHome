package com.pointhome.www.freeboard.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.freeboard.dto.FreeBoardFile;
import com.pointhome.www.util.Paging;

public interface FreeBoardService {

	public Paging getPaging(int curPage);

	public List<FreeBoard> list(Paging paging);

	public FreeBoard view(int board_no);


	public void write(FreeBoard board, List<MultipartFile> dataMul);

	public List<FreeBoardComment> commentView(int freeboardNo);

	public void insert(FreeBoardComment comment);

	public List<MultipartFile> getMultiFile(int freeboardNo);

	public FreeBoardFile getFile(int fileNo);

	public void delete(FreeBoard board);






}

