package com.pointhome.www.mypage.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.mypage.dto.AlertRecomm;
import com.pointhome.www.mypage.dto.Review;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserFile;
import com.pointhome.www.util.Paging;

public interface MypageService {
	
	/**
	 * MypageController에서,
	 * userno 가져와서 유저정보조회
	 * @param userno
	 * @return 
	 */
	public User selectInfo(int userno);
	
	/**
	 * 회원 번호로 프로필 사진 정보 조회
	 * 
	 * @param userno - 회원 정보
	 * @return - 프로필 사진 정보
	 */
	public UserFile selectImg(int userno);
	
	/**
	 * 마이페이지 사용자의 정보 수정
	 * 
	 * @param user - 사용자 정보
	 * @param file - 사용자 프로필 사진 정보
	 */
	public void update(User user, MultipartFile file);
	
	/**
	 * 회원 번호에 해당하는 회원 탈퇴
	 * 
	 * @param userno - 회원번호
	 */
	public void delete(int userno);

	/**
	 * 찜하기 수정
	 * 
	 * @param partnerNo - 제휴사 번호
	 * @param userNo - 회원 번호
	 * @return 
	 */
	public void pickUpdate(int userNo, int partnerNo);

	/**
	 * 사용자가 찜한 제휴사의 목록 조회
	 * 
	 * @param partnerNo - 제휴사 번호
	 * @param userNo - 회원 번호
	 * @return 0일 때는 삽입, 1일때는 삭제
	 * 
	 */
	public int isPick(int userNo, int partnerNo);

	/**
	 * 내가 쓴 글 내역 조회
	 *
	 * @param paging - 페이징 객체
	 * @param userNo - 회원 번호
	 * @return 작성 글 리스트
	 */
	public List<FreeBoard> selectboard(Paging paging, int userNo);

	/**
	 * 찜 내역 조회
	 * 
	 * @param paging - 페이징 객체
	 * @param userNo - 회원 번호
	 * @return 찜 내역 리스트
	 */
	public List<Map<String, Object>> selectPickList(Paging paging, int userNo);

	/**
	 * 알림 내역 조회
	 * 
	 * @param paging - 페이징
	 * @param userNo - 회원 번호
	 * @return 알림 내역 리스트
	 */
	public List<Map<String, Object>> selectAlList(Paging paging, int userNo);

	/**
	 * 읽지 않은 알림 총 갯수
	 * 
	 * @param userNo - 회원 번호
	 * @return 안 읽은 알람 갯수
	 */
	public int getAlertCnt(int userNo);

	/**
	 * 알림 누르면 읽은 알림(is_read : N -> Y) 으로 업데이트
	 * 
	 * @param userNo - 회원 번호
	 */
	public void deleteAlert(int userNo);

	/**
	 * 예약 내역 조회
	 * 
	 * @param paging - 페이징 객체
	 * @param userNo - 회원 번호
	 * @return 예약 내역 리스트
	 */
	public List<Map<String, Object>> selectReserve(Paging paging, int userNo);

	/**
	 * 리뷰 작성
	 * 
	 * @param myreview - 리뷰 정보 담은 DTO
	 */
	public void insertReview(Review myreview);

	/**
	 * 리뷰 삭제
	 * 
	 * @param myreview - 리뷰 정보 담은 DTO
	 */
	public void deleteReview(Review myreview);

	/**
	 * 리뷰 내역 조회
	 * 
	 * @param paging - 페이징 객체
	 * @param userNo - 회원 번호
	 * @return 내가 쓴 리뷰 내역 리스트
	 */
	public List<Map<String, Object>> selectReviewList(Paging paging, int userNo);

	/**
	 * 내가 쓴 글 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param userNo - 회원 번호
	 * @return - 찜한 내역 총 수와 적용한 페이징
	 */
	public Paging getPaging(int curPage, int userNo);

	/**
	 * 사용자가 작성한 게시글 삭제
	 * 
	 * @param freeboardNo - 게시글 번호
	 */
	public void removeboardlist(String freeboardNo);

	/**
	 * 찜한 내역 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param userNo - 회원 번호
	 * @return 찜한 내역 총 수와 적용한 페이징
	 */
	public Paging getPickPaging(int curPage, int userNo);

	/**
	 * 찜한 내역 삭제
	 * 
	 * @param partnerNo- 찜한 제휴사 번호
	 */
	public void removepicklist(String partnerNo);

	/**
	 * 알림 리스트 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param userNo - 회원 번호
	 * @return - 알림의 총 개수
	 */
	public Paging getAlertPaging(int curPage, int userNo);

	/**
	 * 알림내역 삭제
	 * 
	 * @param alertNo - 알림 번호
	 */
	public void removeAlertlist(String alertNo);

	/**
	 * 예약 내역 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param userNo - 회원 번호
	 * @return - 총 예약 개수
	 */
	public Paging getReservePaging(int curPage, int userNo);

	/**
	 * 마이페이지에 뷰에서 보여줄 예약 내역
	 * 
	 * @param userno - 회원 번호
	 * @return 예약 내역
	 */
	public List<Map<String, Object>> selectReserve(int userno);

	/**
	 * 리뷰 내역 페이징
	 *  
	 * @param curPage - 현재 페이지
	 * @param userNo - 회원 번호
	 * @return - 총 리뷰 개수
	 */
	public Paging getReviewPaging(int curPage, int userNo);

	/**
	 * 리뷰 삭제
	 * 
	 * @param reviewNo - 리뷰 번호
	 */
	public void removeReviewlist(String reviewNo);

	/**
	 * 결제 내역 조회
	 * 
	 * @param userNo - 회원 번호
	 * @param resNo - 예약 번호
	 * @return
	 */
	public Map<String, Object> selectPay(int userNo, int resNo);

	/**
	 * 댓글 내역 
	 * 
	 * @param curPage - 현재 페이지
	 * @param userNo - 회원 번호
	 * @return - 총 댓글 개수
	 */
	public Paging getCommentPaging(int curPage, int userNo);

	/**
	 * 댓글 내역 조회
	 * 
	 * @param paging - 페이징 객체
	 * @param userNo - 회원 번호
	 * @return - 페이징 적용된 댓글 내역
	 */
	public List<Map<String, Object>> selectComment(Paging paging, int userNo);

	/**
	 * 댓글 삭제
	 * 
	 * @param commNo- 댓글 번호
	 */
	public void removeCommentlist(String commNo);

	/**
	 * 마이페이지 뷰에서 보여줄 공지 내역 조회
	 * 
	 * @param userNo - 회원 번호
	 * @return 찜한 제휴사 공지 내역
	 */
	public List<PartnerNotice> selectNoticeList(int userNo);

	/**
	 * 찜한 제휴사 공지 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param userNo - 회원 번호
	 * @return - 찜한 제휴사 공지의 총 개수
	 */
	public Paging getNoticelistPaging(int curPage, int userNo);

	/**
	 * 찜한 상점 공지사항 가져오기
	 * 
	 * @param paging - 페이징 객체
	 * @param userNo - 회원번호
	 * @return - 공지사항 내역
	 */
	public List<Map<String, Object>> selectPickNotice(Paging paging, int userNo);

	/**
	 * 별명 가져오기
	 * 
	 * @param userno - 회원 번호
	 * @return - 별명
	 */
	public String selectUserNick(int userno);

	


	



	

}
