package com.pointhome.www.partner.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.mypage.dto.MyPick;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerFile;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.partner.dto.PartnerNoticeFile;
import com.pointhome.www.partner.dto.PartnerVideo;
import com.pointhome.www.util.Paging;

public interface PartnerDao {
	
	/**
	 * partner insert
	 * 
	 * @param partner 행 삽입
	 */
	public void insertPartner(Partner partner);

	/**
	 * 이메일 번호 중복검사
	 * 
	 * @param partner
	 * @return - 중복이면 1행 반환, 없으면 0
	 */

	public int selectCntByEmailPhone(Partner partner);

	/**
	 * 로그인시 입력받은 Eamil, Password를 count로 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - 존재[1], 없음[0]
	 */
	public int selectCntByPartnerEmailPw(Partner partner);

	/**
	 * 로그인시 입력받은 Eamil, Password로 회원의 정보를 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - select된 회원의 정보
	 */
	public Partner selectByPartnerEmailPw(Partner partner);

	/**
	 * 제휴사 타입별, 전체 총수 조회
	 * 
	 * @param pagingMap - 제휴사 타입별 페이징 객체
	 * @return
	 */
	public int selectCntTypeAll(Map<String, Object> pagingMap);
	
	/**
	 * 제휴사 페이지에서 보여줄 예약 리스트 가져오기
	 * @param paging 
	 * 
	 * @param partNo
	 * @return
	 */
	public List<Map<String, Object>> selectReserveList(@Param("paging") Paging paging, @Param("partNo") Integer partNo);

	/**
	 * partNo으로 reserve 갯수 select
	 * 
	 * @param partNo
	 * @return
	 */
	public int selectCntReservation(int partNo);
	
	/**
	 * 파트너 -> 유저 공지사항 조회
	 * 
	 * @param filter
	 * @return
	 */
	public List<Map<String,Object  >> selectAllPartnerNotice(Paging paging);

	/**
	 * 공지사항 작성폼으로부터 입력된 정보를 삽입
	 * 
	 * @param 작성한 글 정보
	 * @return - 성공[1] 실패[0]
	 */
	public void insertNotice(PartnerNotice partnerNotice);

	/**
	 * 공지사항 작성폼에 파일 삽입
	 * 
	 * @param noticeFile
	 */
	public void insertFile(PartnerNoticeFile noticeFile);

	/**
	 * 제휴사 번호 조회
	 * 
	 * @param partner- 제휴사
	 * @return 제휴사 번호
	 */
	public int selectPartnerNo(Partner partner);

	/**
	 * 총 공지사항 게시글 수 조회
	 * 
	 * @return 총 게시글 수
	 */
	public int selectNoticeCntAll();

	/**
	 * 파트너 정보 조회
	 * 
	 * @param partnerNo -파트너 번호
	 * @return 파트너 정보 조회
	 */
	public Partner selectPartnerInfo(Integer partnerNo);

	/**
	 * 게시글 번호에 해당하는 게시글의 정보 조회
	 * 
	 * @param noticeNo - 게시글 번호
	 * @return 게시글 정보
	 */
	public PartnerNotice viewNotice(int partnerNoticeNo);

	/**
	 * 게시글 번호에 해당하는 파일 목록들 가져오기
	 * 
	 * @param partnerNoticeNo - 게시글 번호
	 * @return 게시글 번호에 해당하는 파일 목록들
	 */
	public List<MultipartFile> getMultiFiles(int partnerNoticeNo);

	/**
	 * 회원번호에 해당하는 회원 정보
	 * 
	 * @param partnerNo - 회원 번호
	 * @return 회원 정보 담은 DTO
	 */
	public Partner selectByPartnerNo(int partnerNo);

	/**
	 * 수정할 partner 정보들을 partnerNo으로 select
	 * 
	 * @param partnerNo
	 * @return
	 */
	public Partner selectPartnerByPartnerNo(Integer partnerNo);

	/**
	 * 파일 삭제
	 * 
	 * @param adminNotice - 삭제할 파일의 게시글 번호를 담은 DTO 객체
	 */
	public void deleteFile(PartnerNotice partnerNotice);

	/**
	 * 게시글 삭제
	 * 
	 * @param board - 삭제할 게시글의 번호를 담은 DTO 객체
	 */
	public void deleteNotice(PartnerNotice partnerNotice);

	/**
	 * 게시글 번호에 해당하는 게시글 정보 조회
	 * 
	 * @param partnerNoticeNo - 게시글 번호
	 * @return 게시글 정보 담은 DTO
	 */
	public PartnerNotice selectNoticebyNoticeNo(int partnerNoticeNo);
	
	/**
    * 게시글 번호에 해당하는 게시글 파일 목록 조회
    * 
    * @param noticeNo - 게시글 번호
    * @return - 게시글 번호에 해당하는 게시글 파일 목록
    */
	public List<PartnerNoticeFile> selectNoticeFilebyNoticeNo(int partnerNoticeNo);
	
	/**
    * 게시글 수정
    * 
    * @param notice - 게시글 정보 담은 DTO
    */
	public void update(PartnerNotice partnerNotice);
	
	/**
	 * 제휴사 타입에 따른 카테고리 분류, 회원이 찜한 제휴사가 담긴 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param paging - 페이징 객체
	 * @param userNo - 회원 정보
	 * @param partnerType - 제휴사 타입
	 * @return 제휴사 타입, 유저가 찜한 제휴사 정보를 담은 페이징
	 */
	public List<Map<String, Object>> selectPartnerPick(@Param("curPage") int curPage, @Param("paging") Paging paging, @Param("userNo") int userNo, @Param("partnerType") String partnerType);

	/**
	 * 제휴사 정보 조회
	 * 
	 * @param partNo - 제휴사 번호
	 * @return 제휴사 정보 담은 객체
	 */
	public Partner getPartInfo(int partNo);

	/**
	 * 제휴사 정보 수정
	 * 
	 * @param partner - 수정된 제휴사 정보 담은 DTO
	 */
	public void updatePartner(Partner partner);

	/**
	 * 제휴사 프로필 이미지 삭제
	 * 
	 * @param partnerFile - 제휴사 프로필 이미지 정보 담은 DTO
	 */
	public void deletePartFile(PartnerFile partnerFile);

	/**
	 * 제휴사 프로필 이미지 삽입
	 * 
	 * @param partnerFile - 제휴사 프로필 이미지 정보 담은 DTO
	 */
	public void insertPartFile(PartnerFile partnerFile);

	/**
	 * 제휴사 프로필 이미지 조회
	 * 
	 * @param partNo - 제휴사 번호
	 * @return 제휴사 프로필 이미지 정보
	 */
	public PartnerFile getPartnerImg(int partNo);
	
	/**
	 * 찜한 제휴사의 공지
	 * 
	 * @param partnerNotice - 제휴사 공지
	 * @return 찜한 제휴사의 공지 내역
	 */
	public List<MyPick> selectPickList(PartnerNotice partnerNotice);
	
	/**
	 * 찜한 제휴사 공지 삽입 시 알림 삽입
	 * 
	 * @param partnerNotice - 제휴사의 공지
	 * @param mp - 찜한 제휴사 내역
	 */
	public void insertNoticeAlert(@Param("partnerNotice") PartnerNotice partnerNotice, @Param("pickUser") MyPick mp);

	/**
	 * 파트너 페이지에서 예약 update
	 * 
	 * @param reservation
	 */
	public void updateReservation(Reservation reservation);
	
	/**
	 * 영상 보여주기
	 * 
	 * @param partnerNo - 제휴사 고유 번호
	 * @return video - 영상 출력 정보를 담은 DTO
	 */
	public List<PartnerVideo> viewVideo(int partnerNo);
	
	/**
	 * 영상 넣기
	 * 
	 * @param video - 영상 URL
	 */
	public void insertVideo(PartnerVideo video);
	
	/**
	 * 영상 삭제
	 * 
	 * @param partnerVideoNo - 제휴사 고유 번호
	 * @return video - 영상 출력 정보를 담은 DTO
	 */
	public void deleteVideo(int partnerVideoNo);
	
	/**
	 * 영상 중복검사
	 * 
	 * @param videoId - 영상 url
	 * @return video - 중복 값이 있으면 반환
	 */
	public int test(String videoId);

	/**
	 * 영상을 올힌 제휴사중 회원의 찜한 제휴사 조회
	 * 
	 * @param video - 유투브 DTO
	 * @return - 찜한 제휴사 내역과 영상 정보
	 */
	public List<MyPick> selectPickListByVideo(PartnerVideo video);


	/**
	 * 찜한 제휴사의 영상 삽입시 알림 삽입
	 * 
	 * @param video - 영상 DTO
	 * @param mp - 찜 DTO
	 */
	public void insertVideoAlert(@Param("video") PartnerVideo video, @Param("pickUser") MyPick mp);	

	public String selectUserName(int userSessionNo);	


}
