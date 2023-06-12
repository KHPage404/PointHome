package com.pointhome.www.mypage.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.mypage.dto.AlertRecomm;
import com.pointhome.www.mypage.dto.MyPick;
import com.pointhome.www.mypage.dto.Review;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserFile;

public interface MypageDao {
	
	/**
	 * 회원 번호에 해당하는 회원 정보 조회
	 * 
	 * @param userno - 회원 번호
	 * @return - 회원 정보 담은 DTO
	 */
	public User selectByUserId(int userno);
	
	/**
	 * 회원 정보 수정
	 * 
	 * @param user - 회원 정보 담은 DTO
	 */
	public void updateUser(User user);
	
	/**
	 * 회원 프로필 이미지 삭제
	 * 
	 * @param userFile - 회원 프로필 이미지 정보를 담은 DTO
	 */
	public void deleteFile(UserFile userFile);

	/**
	 * 회원 프로필 이미지 삽입
	 * 
	 * @param userFile - 회원 프로필 이미지 정보를 담은 DTO
	 */
	public void insertFile(UserFile userFile);
	
	/**
	 * 회원번호에 해당하는 프로필 이미지 조회
	 * 
	 * @param userno - 회원 번호
	 * @return userFile - 해당 회원 프로필 이미지 정보를 담은 DTO
	 */
	public UserFile selectImgByUserno(int userno);

	/**
	 * 회원 탈퇴
	 * 
	 * @param userno - 회원 번호
	 */
	public void deleteMemberByUserno(int userno);

	/**
	 * 사용자가 찜한 제휴사 수 조회
	 * 
	 * @param myPick - 회원 번호와 제휴사 번호를 담은 DTO
	 * @return - 사용자가 찜한 제휴사 수
	 */
	public int selectByPickUserNo(MyPick myPick);

	/**
	 * 찜 삽입
	 * 
	 * @param myPick - 회원 번호와 제휴사 번호를 담은 DTO
	 */
	public void insertPick(MyPick myPick);

	/**
	 * 찜 삽입 취소
	 * 
	 * @param myPick - 회원 번호와 제휴사 번호를 담은 DTO
	 */
	public void deletePick(MyPick myPick);

	/**
	 * 내가 쓴 글 내역 조회
	 * 
	 * @param userNo - 회원 번호
	 * @return 작성 글 리스트
	 */
	public List<FreeBoard> selectBoardByUserNo(int userNo);

	/**
	 * 찜 내역 조회
	 * 
	 * @param userNo - 회원 번호
	 * @return 찜 내역 리스트
	 */
	public List<Map<String, Object>> getPickList(int userNo);

	/**
	 * 알림 내역 조회
	 * 
	 * @param userNo - 회원 번호
	 * @return 알림 내역 리스트
	 */
	public List<Map<String, Object>> selectAlarmList(int userNo);

	/**
	 * 읽지 않은 알림 총 갯수
	 * 
	 * @param userNo - 회원 번호
	 * @return 안 읽은 알람 갯수
	 */
	public int selectAlertCnt(int userNo);

	/**
	 * 알림 누르면 읽은 알림(is_read : N -> Y) 으로 업데이트
	 * 
	 * @param userNo - 회원 번호
	 */
	public void deleteAlertByUserno(int userNo);

	/**
	 * 예약 내역 조회
	 * 
	 * @param userNo - 회원 번호
	 * @return 예약 내역 리스트
	 */
	public List<Map<String, Object>> selectReserveList(int userNo);

	/**
	 * 리뷰 작성
	 * 
	 * @param myreview - 리뷰 정보 담은 DTO
	 */
	public void insertMyReview(Review myreview);

	/**
	 * 리뷰 삭제
	 * 
	 * @param myreview - 리뷰 정보 담은 DTO
	 */
	public void deleteMyReview(Review myreview);

	/**
	 * 리뷰 내역 조회
	 * 
	 * @param userNo - 회원 번호
	 * @return 내가 쓴 리뷰 내역 리스트
	 */
	public List<Map<String, Object>> selectMyReviewList(int userNo);
	

	

}
