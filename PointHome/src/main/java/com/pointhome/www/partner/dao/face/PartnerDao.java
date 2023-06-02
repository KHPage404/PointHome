package com.pointhome.www.partner.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;


import com.pointhome.www.admin.dto.AdminNoticeFile;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.partner.dto.PartnerNoticeFile;
import com.pointhome.www.util.Paging;

public interface PartnerDao {

	/**
	 * partner insert
	 * @param partner 행 삽입
	 */
	public void insertPartner(Partner partner);

	/**
	 * 이메일 번호 중복검사
	 * @param partner
	 * @return - 중복이면 1행 반환, 없으면 0
	 */

	public int selectCntByEmailPhone(Partner partner);

	/**
	 * 로그인시 입력받은 Eamil, Password를
	 * count로 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - 존재[1], 없음[0]
	 */
	public int selectCntByPartnerEmailPw(Partner partner);

	/**
	 * 로그인시 입력받은 Eamil, Password로
	 * 회원의 정보를 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - select된 회원의 정보
	 */
	public Partner selectByPartnerEmailPw(Partner partner);

	public int selectCntAll();

	public List<Partner> selectAll(Paging paging);

	public int selectCntTypeAll(Map<String, Object> pagingMap);

	public List<Partner> selectTypeListAll(Map<String, Object> listMap);

	/**
	 * 파트너 -> 유저 공지사항 조회
	 * @param filter
	 * @return
	 */
	public List<PartnerNotice> selectAllPartnerNotice(Paging paging);
	/**
	 * 공지사항 작성폼으로부터 입력된 정보를 삽입
	 * @param  작성한 글 정보
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
	 *  파트너 정보 조회
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

	public List<Map<String, Object>> selectPartPick(@Param("paging") Paging paging, @Param("userNo") int userNo);

	public List<Map<String, Object>> selectPartTypePick(@Param("paging") Paging paging, @Param("userNo") int userNo, @Param("partnerType") String partnerType);







	

	

}
