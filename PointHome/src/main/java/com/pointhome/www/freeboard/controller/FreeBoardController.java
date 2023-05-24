package com.pointhome.www.freeboard.controller;

import java.util.List;

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

import com.pointhome.www.freeboard.dto.FreeBoard;


import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.freeboard.dto.FreeBoardFile;
import com.pointhome.www.freeboard.service.face.FreeBoardService;
import com.pointhome.www.util.Paging;

@Controller
@RequestMapping("/freeboard")
public class FreeBoardController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired FreeBoardService freeBoardService;



	@GetMapping("/list")
	public void BoardList( @RequestParam(defaultValue = "0") int curPage,
			Model model
			) {
		logger.info("/freeboard/list [GET]");

		Paging paging = freeBoardService.getPaging(curPage);

		List<FreeBoard> list = freeBoardService.list(paging);

		logger.info("list{}",list);

		model.addAttribute("list", list);

		model.addAttribute("paging", paging);


	}

	@GetMapping("/view")
	public void BoardView(int freeboardNo,Model model) {
		logger.info("/freeboard/view [GET]");

		FreeBoard board = freeBoardService.view(freeboardNo);
		
		List<FreeBoardComment> boardCommentList = freeBoardService.commentView(freeboardNo);
		
		model.addAttribute("board", board);

		List<MultipartFile> file = freeBoardService.getMultiFile(freeboardNo);
		logger.info("file:{}", file);
		model.addAttribute("file",file);
		
		logger.info("{}",boardCommentList);
		model.addAttribute("boardCommentList", boardCommentList);
		
		
		
		
	}
	

	 @GetMapping("/write")
	   public void write() {
	      logger.info("/board/write");
	   }
	 
	 @PostMapping("/write")
	 	public String writeRes(FreeBoard board, List<MultipartFile> dataMul, HttpSession session ) 
	 { 

  		board.setUserNo( (Integer)session.getAttribute("userno"));
		

  		logger.info("{}", session.getAttribute("userno"));
		freeBoardService.write(board, dataMul);
		
			
		return "redirect:./list"; 
	 }

	@PostMapping("/view")
	public String BoardView(FreeBoardComment comment,Model model) {
		logger.info("/freeboard/view [Post]");
		logger.info("{}",comment);
		
		freeBoardService.insert(comment);
		
		model.addAttribute("freeboardNo", comment.getFreeboardNo());
		
		
		
		return "redirect:./view";
	}	
	
	@RequestMapping("/download")
	public String download( int fileNo,Model model ) {
		
		FreeBoardFile file = freeBoardService.getFile(fileNo);
		model.addAttribute("downFile", file);
		
		return "down";
	}
	
	@GetMapping("/update")
	public void update() {}
	
	@RequestMapping("/delete")
	public String delete(FreeBoard board) {
		
		logger.info("safd: {}", board);
		freeBoardService.delete(board);
		
		return "redirect:./list";
	}
	
	



}
