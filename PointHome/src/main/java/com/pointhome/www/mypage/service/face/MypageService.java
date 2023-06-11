package com.pointhome.www.mypage.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.mypage.dto.AlertRecomm;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserFile;

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

	public List<FreeBoard> selectboard(int userNo);

	public List<Map<String, Object>> selectPickList(int userNo);

	public List<Map<String, Object>> selectAlList(int userNo);

//	public List<Map<String, Object>> selectREList(int userNo);

	public int getAlertCnt(int userNo);

	public void deleteAlert(int userNo);

	public List<Map<String, Object>> selectReserve(int userNo);


	



	

}
