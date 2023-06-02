package com.pointhome.www.partner.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.util.Paging;

public interface PartnerService {

	/**
	 * 회원가입시 파트너를 추가
	 * 
	 * @param user - 입력받은 회원 정보
	 */
	public void join(Partner partner);

	/**
	 * 로그인시, DB에 회원이 존재 유무 확인
	 * 
	 * @param partner - 입력받은 Email, Password
	 * @return - 회원일 경우 = [true]
	 */
	public Boolean isLogin(Partner partner);

	/**
	 * 로그인시, DB에서 회원의 정보 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - 회원의 정보
	 */
	public Partner getPartner(Partner partner);

	/**
	 * 게시글 목록을 위한 페이징 객체 생성
	 * 
	 * @param curPage- 현재페이지
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(int curPage);

	public List<Partner> list(Paging paging);

	public Paging getTypePaging(Map<String, Object> pagingMap);

	public List<Partner> typelist(Map<String, Object> listMap);

	/**
	 * 공지글 전체 조회
	 * @param filterchar 
	 * @return 모든 공지 게시글
	 */
	public List<PartnerNotice> noticeList(Paging paging);

	/**
	 * 제휴사 또는 사용자에게 보여질 공지사항을 삽입한다
	 * @param partnerNotice - 운영사 공지사항 정보
	 * @param dataMul 
	 * @return  삽입된 게시글 [1]: 존재 | [0]: 없음
	 */
	public void writeNotice(PartnerNotice partnerNotice, List<MultipartFile> dataMul);

	/**
	 * partnerNo 조회
	 * @param partnerNo - 사용자 번호
	 * @return 제휴사 번호 조회
	 */
	public int getPartnerNoByEmail(Partner partner);


	/**
	 * 게시글 목록을 위한 페이징 객체 생성
	 * 
	 * @param curPage- 현재페이지
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPagingNotice(int curPage);

	/**
	 *제휴사 정보 가져오기 
	 * @param partnerNo - 로그인한 제휴사 세션값
	 * @return 제휴사 정보
	 */
	public Partner partnerInfo(Integer partnerNo);


    /**
    * 게시글 상세보기 
    * 
    * @param notice_no - 상세 조회할 게시글 번호 객체
    * @return 조회된 상세 게시글 객체
    */
	public PartnerNotice view(int noticeNo);
	
	   /**
	    * 게시글 번호를 이용한 업로드된 파일 정보 조회 
	    * 
	    * @param partnerNoticeNo - 조회할 게시글 번호
	    * @return 다중 첨부파일의 정보
	    */
	public List<MultipartFile> getMultiFile(int partnerNoticeNo);
		/**
	    * 뷰에 보낼 유저 정보 조회
	    * 
	    * @param partnerNo - 세션에 저장된 회원 번호
	    * @return 회원 정보
	    */
	public Partner viewPartner(int partnerNo);

		public List<Map<String, Object>> list(Paging paging, int userNo);

		public List<Map<String, Object>> typelist(Paging paging, String partnerType, int userNo);



	


}
