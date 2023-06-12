package com.pointhome.www.freeboard.controller;

import java.util.List;
import java.util.Map;

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
import com.pointhome.www.user.dto.User;
import com.pointhome.www.util.Paging;

@Controller
@RequestMapping("/freeboard")
public class FreeBoardController {

   private final Logger logger = LoggerFactory.getLogger(this.getClass());

   @Autowired FreeBoardService freeBoardService;

   @RequestMapping("/list")
   public void BoardList( @RequestParam(defaultValue = "0") int curPage,
         @RequestParam(defaultValue = "date")  String filter, Model model, 
         @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
         @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
         )throws Exception{

      logger.info("/freeboard/list [GET]");

      Paging paging = freeBoardService.getPaging(curPage, filter, searchType, keyword);

      List<Map<String, Object>> list = freeBoardService.selectAllSearch(paging, filter, searchType, keyword);

      
      

      logger.info("!!!!!!!!!!!!!!!!{}", list);

      model.addAttribute("list", list);
      model.addAttribute("paging", paging);
      model.addAttribute("filter", filter);
      model.addAttribute("searchType", searchType);
      model.addAttribute("keyword", keyword);

   }
   
   @GetMapping("/view")
   public void BoardView(int freeboardNo,Model model, HttpSession session) {
      logger.info("/freeboard/view [GET]");

      FreeBoard board = freeBoardService.view(freeboardNo);

      List<FreeBoardComment> boardCommentList = freeBoardService.commentView(freeboardNo);
      logger.info("{}",boardCommentList);

      int cntRecommend = freeBoardService.getCntRecommend(freeboardNo);
      
      model.addAttribute("board", board);
      model.addAttribute("boardCommentList", boardCommentList);
      model.addAttribute("commentCnt", boardCommentList.size());

      
      List<MultipartFile> file = freeBoardService.getMultiFile(freeboardNo);
      model.addAttribute("file", file);
      model.addAttribute("cntRecommend", cntRecommend);

      // 추천부분
      if(session.getAttribute("login") != null)
      {
         int isRecommend = freeBoardService.isRecommend(freeboardNo, (Integer)session.getAttribute("userno"));
         model.addAttribute("isRecommend", isRecommend);
      }

      User viewUser = freeBoardService.viewUser(board.getUserNo());
      
      model.addAttribute("viewUser", viewUser);

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
   public String commentWrite(FreeBoardComment comment, Model model, HttpSession session) {
      logger.info("/freeboard/view [Post]");
      logger.info("{}",comment);

      comment.setUserNo((Integer)session.getAttribute("userno"));
      
      // 작성 후 input 내용 null 검사
      if(comment.getCommContent()=="") {
         comment.setCommContent(" ");
      }
      
      freeBoardService.insert(comment);
      
      logger.info("afdsadfsaaaaaaaa{}",comment);
      

      model.addAttribute("freeboardNo", comment.getFreeboardNo());
      return "redirect:./view";
   }   

   @RequestMapping("/recommend")
   public void recommend(int freeboardNo,Model model, HttpSession session) {

      freeBoardService.updateRecommend(freeboardNo, (Integer)session.getAttribute("userno"));

      int isRecommend = freeBoardService.isRecommend(freeboardNo, (Integer)session.getAttribute("userno"));
      int cntRecommend = freeBoardService.getCntRecommend(freeboardNo);

      model.addAttribute("isRecommend", isRecommend);
      model.addAttribute("cntRecommend", cntRecommend);

   }

   
   @RequestMapping("/delete")
   public String delete(FreeBoard board) {
      freeBoardService.delete(board);
      return "redirect:./list";
   }

   @GetMapping("/commentDelete")
   public String commentDelete(int commNo, int freeboardNo, Model model) {
      
      logger.info("삭제삭제삭제삭제");
      
      freeBoardService.deleteComment(commNo);
      
      model.addAttribute("freeboardNo", freeboardNo);
      
      return "redirect:./view";
   }
   @GetMapping("/updateComment")
   public void updateComment(FreeBoardComment comment, int freeboardNo, Model model, HttpSession session) {
            
      logger.info("*수정 가져오기*");
      
      FreeBoard board = freeBoardService.view(freeboardNo);
      model.addAttribute("board", board);
      
//      comment.setUserNo((Integer)session.getAttribute("userno"));   
      
      
      freeBoardService.updateComment(comment);
      
      List<FreeBoardComment> boardCommentList = freeBoardService.commentView(freeboardNo);
      model.addAttribute("boardCommentList", boardCommentList);
      
      
      User viewUser = freeBoardService.viewUser(board.getUserNo());
      model.addAttribute("viewUser", viewUser);
      
      
      logger.info("**아아아아아아아 {}",comment);
      model.addAttribute("comment", comment);
   }
   
   @GetMapping("/update")
   public void update(int freeboardNo, Model model) {
      FreeBoard board = freeBoardService.selectBoard(freeboardNo);
      logger.info("update freeboard: {}", board);
      
      model.addAttribute("board", board);
      
      
      List<FreeBoardFile> boardFile = freeBoardService.selectBoardFile(freeboardNo);
      logger.info("update freeboardFile: {}", boardFile);
      
   }
   
   @PostMapping("/update")
   public String updateRes(FreeBoard board, List<MultipartFile> dataMul) {
      
      logger.info("확인: {}", board);
      freeBoardService.update(board, dataMul);
      logger.debug("!!!!!!{}", dataMul);
      logger.info("!!!!!!!!확인: {}", board.getFreeboardNo());
      
      return "redirect:./view?freeboardNo=" + board.getFreeboardNo();
   }
   
   
   @RequestMapping("/download")
   public String download(int fileNo, Model model) {
      
      FreeBoardFile freeboardFile  = freeBoardService.getFile(fileNo);
      logger.info("ㄴ:{}",freeboardFile);
      model.addAttribute("downFile", freeboardFile);
      
      return "down";
   }
   
}







