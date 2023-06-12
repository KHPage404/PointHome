package com.pointhome.www.admin.dao.face;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.admin.dto.Admin;
import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.admin.dto.AdminNoticeFile;
import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerFile;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserFile;
import com.pointhome.www.util.Paging;

public interface AdminDao {
	/**
	 * admin 로그인 값을 비교한다.
	 * @param admin - id와 pw 비교 
	 * @return 성공 1 / 실패 0
	 */
	public int selectAdminIdPw(Admin admin);
	
	  /**
	    * 페이징과 필터, 검색 타입, 키워드가 적용된 게시글 목록 조회
	    * 
	    * @param paging - 페이징
	    * @param filter - 필터
	    * @param searchType - 검색 타입
	    * @param keyword - 키워드 
	    * @return -페이징과 필터, 검색 타입, 키워드가 적용된 게시글 목록
	    */
	public List<User> selectAllUser(@Param("paging") Paging paging, @Param("filter") String filter, @Param("searchType")  String searchType, @Param("keyword")  String keyword);

	/**
	 * DB에서 모든 공지 게시글 조회
	 * @return 모든 공지글 조회 
	 */
	public List<AdminNotice> selectAllAdminNotice(char filter,Paging paging);
	
	/**
	 *  해당 유저의 모든 정보 조회
	 * @param userNo - 선택한 유저
	 * @return map으로 반환
	 */
	public Map<String, Object> selectUserInfo(int userNo);
	/**
	 * 해당 유저의 게시글 조회
	 * @param userno - 해당 유저
	 * @return 해당 유저의 모든 게시글
	 */
	public List<FreeBoard> selectUserPost(@Param("userNo") int userNo,@Param("paging") Paging paging, @Param("filter") String filter, @Param("searchType")  String searchType, @Param("keyword")  String keyword);
	/**
	 * 해당 유저를 통해 모든 댓글 조회
	 * @param userno - 해당 유저 
	 * @return 전체 댓글 조회
	 */
	public List<Map<String, Object>> selectUserCmt(@Param("userNo") int userNo,@Param("paging") Paging paging, @Param("filter") String filter, @Param("searchType")  String searchType, @Param("keyword")  String keyword);

	/**
	 * 운영사 번호 조회
	 * @param admin - 운영사 
	 * @return 운영사 번호 
	 */
	public int selectAdminNo(Admin admin);
	
	/**
	 * 공지사항 작성폼으로부터 입력된 정보를 삽입
	 * @param  작성한 글 정보
	 * @return - 성공[1] 실패[0]
	 */
	public int insertNotice(AdminNotice adminnotice);

	/**
	 * 공지사항 작성폼에 파일 삽입
	 * 
	 * @param noticeFile
	 */
	public void insertFile(AdminNoticeFile noticeFile);


	/**
	 * 총 공지사항 게시글 수 조회
	 * @param type 
	 * @param filter 
	 * 
	 * @return 총 게시글 수 
	 */
	public int selectNoticeCntAll(@Param("filter") String filter, @Param("type")String type);

	   /**
	    * 페이징과 필터적용된 게시글 목록 조회
	    * 
	    * @param paging - 페이징
	    * @param filter - 필터
	 * @param type 
	    * @return -페이징과 필터가 적용된 게시글 목록
	    */
	public List<Map<String, Object>> selectAllSearch(@Param("paging") Paging paging, @Param("filter")String filter, @Param("type")String type);


	/**
	    * 게시글 번호에 해당하는 게시글의 정보 조회
	    * 
	    * @param noticeNo - 게시글 번호
	    * @return 게시글 정보
	    */
	public AdminNotice viewNotice(int noticeNo);
	
	/**
    * 게시글 번호에 해당하는 파일 목록들 가져오기
    * 
    * @param noticeNo - 게시글 번호
    * @return 게시글 번호에 해당하는 파일 목록들
    */
	public List<MultipartFile> getMultiFiles(int noticeNo);

	/**
	    * 회원번호에 해당하는 회원 정보
	    * 
	    * @param adminNo - 회원 번호
	    * @return 회원 정보 담은 DTO
	    */
	public Admin selectAllAdminNo(int adminNo);

	/**
	 * 로그인시 입력받은 Eamil, Password로
	 * 운영사의 정보를 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - select된 운영사의 정보
	 */
	public Admin selectByAdminEmailPw(Admin admin);
	 /**
	    * 파일 삭제
	    * 
	    * @param adminNotice - 삭제할 파일의 게시글 번호를 담은 DTO 객체
	    */
	public void deleteFile(AdminNotice adminNotice);
	   /**
	    * 게시글 삭제 
	    * 
	    * @param board - 삭제할 게시글의 번호를 담은 DTO  객체
	    */
	public void deleteNotice(AdminNotice adminNotice);

	   /**
	    * 게시글 번호에 해당하는 게시글 정보 조회
	    * 
	    * @param noticeNo - 게시글 번호
	    * @return 게시글 정보 담은 DTO
	    */

	public AdminNotice selectNoticebyNoticeNo(int noticeNo);
	 /**
	    * 게시글 번호에 해당하는 게시글 파일 목록 조회
	    * 
	    * @param noticeNo - 게시글 번호
	    * @return - 게시글 번호에 해당하는 게시글 파일 목록
	    */
	public List<AdminNoticeFile> selectNoticeFilebyNoticeNo(int noticeNo);

	/**
	    * 게시글 수정
	    * 
	    * @param notice - 게시글 정보 담은 DTO
	    */
	public void update(AdminNotice notice);
	/**
	    * 파일 번호에 해당하는 파일 DTO 조회하기
	    * 
	    * @param adminFileNo - 파일 번호
	    * @return 해당하는 파일 DTO
	    */
	public AdminNoticeFile selectFile(int adminFileNo);

	/**
	 * 회원 탈퇴
	 * 
	 * @param userno - 회원 번호
	 */
	public void deleteUserByUserNo(int userno);


	/**
	 *  해당 유저의 모든 정보 수정
	 * @param user - 선택한 유저
	 */
	public void updateUser(User user);

	/**
	 * 회원 프로필 이미지 삭제
	 * 
	 * @param userFile - 회원 프로필 이미지 정보를 담은 DTO
	 */
	public void deleteUserFile(UserFile userFile);

	/**
	 * 회원 프로필 이미지 삽입
	 * 
	 * @param userFile - 회원 프로필 이미지 정보를 담은 DTO
	 */
	public void insertUserFile(UserFile userFile);

	/**
	 * 회원번호에 해당하는 프로필 이미지 조회
	 * 
	 * @param userno - 회원 번호
	 * @return userFile - 해당 회원 프로필 이미지 정보를 담은 DTO
	 */
	public UserFile selectImgByUserno(int userNo);


	/**
	 *  해당 유저의 모든 정보 조회
	 * @param partnerNo - 선택한 유저
	 * @return list 으로 반환
	 */
	public Partner selectPartnerInfo(int partnerNo);

	/**
	 * 회원 탈퇴
	 * 
	 * @param partnerNo - 회원 번호
	 */
	public void deletePartnerByPartnerNo(int partnerNo);

	/**
	 * 회원번호에 해당하는 프로필 이미지 조회
	 * 
	 * @param partnerNo - 회원 번호
	 * @return PartnerFile - 해당 회원 프로필 이미지 정보를 담은 DTO
	 */
	public PartnerFile selectImgByPartnerno(int partnerNo);

	/**
	 * 회원 프로필 이미지 삭제
	 * 
	 * @param partnerFile - 회원 프로필 이미지 정보를 담은 DTO
	 */
	public void deletePartnerFile(PartnerFile partnerFile);

	/**
	 * 회원 프로필 이미지 삽입
	 * 
	 * @param partnerFile - 회원 프로필 이미지 정보를 담은 DTO
	 */
	public void insertPartnerFile(PartnerFile partnerFile);

	/**
	 *  해당 유저의 모든 정보 수정
	 * @param partner - 선택한 유저
	 */
	public void updatePartner(Partner partner);

	/**
	 * 총 사용자 수 조회
	 * 
	 * @param filter - 필터
	 * @param searchType - 검색 타입
	 * @param keyword - 키워드
	 * @return 필터, 검색타입, 키워드를 적용한 총 게시글 수 
	 */
	public int selectCntAll(@Param("filter") String filter, @Param("searchType") String searchType, @Param("keyword") String keyword);

	/**
	 * 총 제휴사 수 조회
	 * 
	 * @param filter - 필터
	 * @param searchType - 검색 타입
	 * @param keyword - 키워드
	 * @return 필터, 검색타입, 키워드를 적용한 총 게시글 수 
	 */
	public int selectCntAllPartner(@Param("filter") String filter, @Param("searchType") String searchType, @Param("keyword") String keyword);

	  /**
	    * 페이징과 필터, 검색 타입, 키워드가 적용된 게시글 목록 조회
	    * 
	    * @param paging - 페이징
	    * @param filter - 필터
	    * @param searchType - 검색 타입
	    * @param keyword - 키워드 
	    * @return -페이징과 필터, 검색 타입, 키워드가 적용된 게시글 목록
	    */
	public List<Partner> selectAllPartner(@Param("paging") Paging paging, @Param("filter") String filter, @Param("searchType")  String searchType, @Param("keyword")  String keyword);

	/**
	 * 사용자가 작성한 게시글 삭제
	 * @param freeboardNo
	 */
	public void userBoardDelete(String freeboardNo);

	/**
	 * 총 공지사항 게시글 수 조회
	 * @param type 
	 * @param filter 
	 * @return 총 게시글 수 
	 */
	public int selectUserPostCntAll(@Param("userNo") int userNo,@Param("filter") String filter, @Param("searchType") String searchType, @Param("keyword") String keyword);

	/**
	 * 사용자가 작성한 댓글 삭제
	 * @param cmtNo
	 */
	public void removeusercmt(String cmtNo);

	/**
	 * 총 공지사항 댓글 수 조회
	 * @param type 
	 * @param filter 
	 * @return 총 댓글 수 
	 */
	public int selectUserCmtCntAll(@Param("userNo") int userNo,@Param("filter") String filter, @Param("searchType") String searchType, @Param("keyword") String keyword);
	



	
	
	

}
