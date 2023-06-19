package com.pointhome.www.user.dao.face;

import java.util.Map;

import com.pointhome.www.user.dto.User;

import com.pointhome.www.user.dto.UserSocial;


public interface UserDao {

	/**
	 * 회원가입 폼으로부터 입력 받은
	 * 회원의 정보를 추가
	 * 
	 * @param user - 입력받은 회원 정보
	 * @return - 성공[1] 실패[0]
	 */
	public int insertUser(User user);

	/**
	 * 로그인시 입력받은 Eamil, Password를
	 * count로 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - 존재[1], 없음[0]
	 */
	public int selectCntByUserEmailPw(User param);

	/**
	 * 로그인시 입력받은 Eamil, Password로
	 * 회원의 정보를 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - select된 회원의 정보
	 */
	public User selectByUserEmailPw(User param);

	/**
	 * Naver에서 받은 User정보를
	 * 이용한 회원 조회
	 * 
	 * @param userInfo - Naver에서 읽어온 정보 파라미터
	 * @return - [1]: 존재 | [0]: 없음
	 */
	public int selectCntByUserEmailPhone(User userInfo);

	/**
	 * 사용자의 정보를 조회
	 * 
	 * @param userInfo - 회원의 정보
	 * @return - 회원가입 되어있는 사용자의 정보
	 */
	public User selectUserNoByEmailPhone(User userInfo);
	
	/**
	 * 회원가입시 추가될 다음 회원의 인덱스
	 * 
	 * @return - userNo
	 */
	public int selectUserIndex();

	/**
	 * 소셜 회원가입의 경우
	 * 회원의 소셜ID, TYPE을 추가
	 * @param socialParam - 소셜가입시 읽어온 회원의 정보
	 */
	public void insertUserSocial(UserSocial socialParam);

	/**
	 * 이메일(아이디)를 이용하여 사용자 정보 조회
	 * @param userInfo - 사용자 정보
	 * @return 조회된 사용자 정보 1 성공 0 실패
	 */
	public int selectCntUserByEmail(User userInfo);

	/**
	 * 카카오에서 가져온 유저정보를 통해 userno을 조회
	 * @param userInfo -카카오로부터 읽어온 사용자 정보 
	 * @return 사용자의 userno
	 */
	public User selectUserNoByEmail(User userInfo);

	/**
	 * 회원가입시 입력된 연락처의 가입여부를 조회하는 메소드
	 * 
	 * @param jsonData - ajax로 넘겨받은 연락처
	 * @return Map<String, Object> - 조회된 회원의 정보
	 */
	public Map<String, Object> selectUserByPhone(Map<String, Object> jsonData);

	/**
	 * 사용자 Email찾기에 사용되는 메소드
	 * @param param - userName, userPhone
	 * @return User - userEmail
	 */
	public User selectUserEmailByNamePhone(User param);

	/**
	 * 발급된 임시 비밀번호로 회원의 비밀번호를 변경
	 * @param sendNumber - 발급된 임시 비밀번호
	 */
	public void updateUserPw(User changePwUser);


}