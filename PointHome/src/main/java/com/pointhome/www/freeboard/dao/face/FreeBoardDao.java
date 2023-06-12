package com.pointhome.www.freeboard.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.freeboard.dto.FreeBoardFile;
import com.pointhome.www.freeboard.dto.FreeBoardRecommend;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.util.Paging;

public interface FreeBoardDao {

	/**
	 * 총 게시글 수 조회
	 * 
	 * @param filter - 필터
	 * @param searchType - 검색 타입
	 * @param keyword - 키워드
	 * @return 필터, 검색타입, 키워드를 적용한 총 게시글 수 
	 */
   public int selectCntAll(@Param("filter") String filter, @Param("searchType") String searchType, @Param("keyword") String keyword);

   /**
    * 페이징을 적용해 보여질 목록들의 정보 조회
    * 
    * @param paging - 목록에서 보여줄 시작번호와 끝 번호를 담은 페이징 객체
    * @return 페이징을 적용해 화면에 보여질 목록들의 정보
    */
   public List<FreeBoard> selectAll(Paging paging);

   /**
    * 게시글 번호에 해당하는 게시글의 정보 조회
    * 
    * @param boardNo - 게시글 번호
    * @return 게시글 정보
    */
   public FreeBoard viewBoard(int boardNo);

   /**
    * 게시글의 조회수 삽입
    * 
    * @param boardNo - 게시글 번호
    */
   public void hit(int boardNo);

   /**
    * 게시글 작성 내역 삽입
    * 
    * @param board - 삽입할 게시글 정보를 담은 DTO
    */
   public void insertBoard(FreeBoard board);

   /**
    * 게시글 파일 삽입
    * 
    * @param freeboardFile - 삽입할 게시글 파일의 정보를 담은 DTO
    */
   public void insertFile(FreeBoardFile freeboardFile);

   /**
    * 게시글 번호에 해당하는 댓글들의 목록 정보 가져오기
    *  
    * @param freeboardNo - 게시글 번호
    * @return 게시글 번호에 해당하는 댓글 목록들 
    */
   public List<FreeBoardComment> viewBoardComment(int freeboardNo);

   /**
    * 댓글 삽입
    * 
    * @param comment - 댓글 정보를 담은 DTO
    */
   public void insertBoardComment(FreeBoardComment comment);

   /**
    * 게시글 번호에 해당하는 파일 목록들 가져오기
    * 
    * @param freeboardNo - 게시글 번호
    * @return 게시글 번호에 해당하는 파일 목록들
    */
   public List<MultipartFile> getMultiFiles(int freeboardNo);

   /**
    * 파일 번호에 해당하는 파일 DTO 조회하기
    * 
    * @param fileNo - 파일 번호
    * @return 해당하는 파일 DTO
    */
   public FreeBoardFile selectFile(int fileNo);

   /**
    * 파일 삭제
    * 
    * @param board - 삭제할 파일의 게시글 번호를 담은 DTO 객체
    */
   public void deleteFile(FreeBoard board);

   /**
    * 게시글 삭제 
    * 
    * @param board - 삭제할 게시글의 번호를 담은 DTO  객체
    */
   public void deleteBoard(FreeBoard board);
   
   /**
    * 회원이 단 추천 수 조회
    * 
    * @param recommend - 추천 DTO
    * @return 추천 수
    */
   public int selectByBoardUserNo(FreeBoardRecommend recommend);

   /**
    * 게시글에 달린 총 추천 수 조회
    * 
    * @param freeboardNo - 게시글 번호
    * @return 총 추천 수
    */
   public int selectCntRecommend(int freeboardNo);

   /**
    * 추천 삭제
    * 
    * @param recommend - 추천 정보 담은 DTO
    */
   public void deleteRecommend(FreeBoardRecommend recommend);

   /**
    * 추천 삽입
    * 
    * @param recommend - 추천 정보 담은 DTO
    */
   public void insertRecommend(FreeBoardRecommend recommend);

   /**
    * 2개의 객체로 페이징이 적용된 리스트 조회
    * 
    * @param paging- 페이징 객체
    * @return 페이징이 적용되 리스트
    */
   public List<Map<String, Object>> selectAllMap(Paging paging);

   /**
    * 댓글 삭제
    * 
    * @param commNo
    */
   public void deleteComment(int commNo);

   /**
    * 회원번호에 해당하는 회원 정보
    * 
    * @param userNo - 회원 번호
    * @return 회원 정보 담은 DTO
    */
   public User selectUserNo(int userNo);

   /**
    * 댓글 수정
    * 
    * @param comment - 댓글 정보 담은 DTO
    */
   public void updateComment(FreeBoardComment comment);

   /**
    * 게시글 번호에 해당하는 게시글 정보 조회
    * 
    * @param freeboardNo - 게시글 번호
    * @return 게시글 정보 담은 DTO
    */
   public FreeBoard selectBoardbyBoardNo(int freeboardNo);

   /**
    * 페이징과 필터가 적용된 게시글 목록 조회
    * 
    * @param paging - 페이징
    * @param filter - 필터
    * @return 페이징과 필터가 적용된 게시글 목록
    */
   public List<Map<String, Object>> selectBoardByFilter(@Param("paging") Paging paging, @Param("filter") String filter);

   /**
    * 게시글 번호에 해당하는 게시글 파일 목록 조회
    * 
    * @param freeboardNo - 게시글 번호
    * @return - 게시글 번호에 해당하는 게시글 파일 목록
    */
   public List<FreeBoardFile> selectBoardFilebyBoardNo(int freeboardNo);

   /**
    * 게시글 수정
    * 
    * @param board - 게시글 정보 담은 DTO
    */
   public void update(FreeBoard board);
   
   /**
    * 페이징과 필터, 검색 타입, 키워드가 적용된 게시글 목록 조회
    * 
    * @param paging - 페이징
    * @param filter - 필터
    * @param searchType - 검색 타입
    * @param keyword - 키워드 
    * @return -페이징과 필터, 검색 타입, 키워드가 적용된 게시글 목록
    */
   public List<Map<String, Object>> selectAllSearch(@Param("paging") Paging paging, @Param("filter") String filter, @Param("searchType")  String searchType, @Param("keyword")  String keyword);

   /**
    * 댓글 달린 게시글 제목 조회
    * 
    * @param comment - 댓글 DTO 속 boardno
    * @return 게시글 제목
    */
   public String selectTitleByFreeboardNo(FreeBoardComment comment);

   /**
    * 댓글 달릴 때 알람 삽입
    *
    * @param comment - 댓글 DTO
    * @param freeboardTitle - 댓글 달린 게시글 제목
    */
   public void insettAlarm(@Param("comment") FreeBoardComment comment, @Param("freeboardTitle") String freeboardTitle);

   /**
    * 추천 달린 게시글 제목 조회
    * 
    * @param recommend - 추천 DTO 속 boardno
    * @return 게시글 제목
    */
   public String selectTitleByFreeboardReNo(FreeBoardRecommend recommend);

   /**
    * 추천 달릴 때 알람 삽입
    * 
    * @param recommend - 추천 DTO
    * @param freeboardTitle - 게시글 제목
    */
   public void insertAlertRecom(@Param("recommend") FreeBoardRecommend recommend, @Param("freeboardTitle") String freeboardTitle);
   
   /**
    * 댓글 달린 게시글의 글쓴이 조회
    * 
    * @param comment - 댓글 DTO
    * @return 게시글 글쓴이 
    */
   public int selectWriter(FreeBoardComment comment);


}
