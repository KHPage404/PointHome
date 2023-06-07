package com.pointhome.www.admin.service.face;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.admin.dto.Admin;
import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.admin.dto.AdminNoticeFile;
import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.util.Paging;

public interface AdminService {
	/**
	 * 어드민 로그인
	 * 
	 * @param admin - admin id와 pw로 로그인
	 * @return 조회 성공시 true / 실패시 false
	 */
	public boolean adminLogin(Admin admin);
	/**
	 * 전체 회원 조회
	 * 
	 * @return 모든 회원을 조회한다.
	 */
	public List<User> userList();
	/**
	 * 선택한 유저의 회원을 삭제한다.
	 * 
	 * @param userno - 선택한 회원의 userno
	 */
	public void admindeleteUser(User userno);
	
	/**
	 * 선택한 유저의 상세 조회 
	 * @param userNo - 선택한 유저
	 * @return 
	 */
	public Map<String, Object> userdetail(int userNo);
	
	/**
	 * 공지글 전체 조회
	 * @param filterchar 
	 * @return 모든 공지 게시글
	 */
	public List<AdminNotice> noticeList(char filter, Paging paging);
	/**
	 * 선택한 유저의 게시글을 조회한다.
	 * @param userno - 유저
	 * @return - 글 전체 조회 
	 */
	public List<FreeBoard> userPost(int userno);
	/**
	 *  댓글 전체 조회
	 * @param userno - 유저 번호
	 * @return 유저 번호로 조회한 전체 댓글
	 */
	public List<FreeBoardComment> userCmt(int userno);
	
	/**
	 * 로그인시, DB에서 운영사의 정보 조회
	 * @param admin - 운영사 입력받은 Email, Password
	 * @return 운영사 조회
	 */
	public Admin getAdmin(Admin admin);
	
	/**
	 * 제휴사 또는 사용자에게 보여질 공지사항을 삽입한다
	 * @param adminnotice - 운영사 공지사항 정보
	 * @param dataMul 
	 * @return  삽입된 게시글 [1]: 존재 | [0]: 없음
	 */
	public void writeNotice(AdminNotice adminnotice, List<MultipartFile> dataMul);
	/**
	 * 게시글 목록을 위한 페이징 객체 생성
 	*@param type -  로그인 된 사용자 타입
	 * @param filter 
	 * @param curPage- 현재페이지
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPagingNotice(int curPage, String filter, String type);
	
	/**
	 * 페이징 적용 , 필터 적용한 목록 조회
	 * 
	 * @param paging - 페이징 객체
	 * @param filter - 필터
	 * * @param type -  로그인 된 사용자 타입
	 * @return 페이징과 필터를 적용한 리스트 정보 
	 */
	public List<Map<String, Object>> selectAllSearch(Paging paging, String filter, String type);
	

    /**
    * 게시글 상세보기 
    * @param noticeNo - 상세 조회할 게시글 번호 객체
    * @return 조회된 상세 게시글 객체
    */
	public AdminNotice view(int noticeNo);
	/**
	    * 게시글 번호를 이용한 업로드된 파일 정보 조회 
	    * 
	    * @param noticeNo - 조회할 게시글 번호
	    * @return 다중 첨부파일의 정보
	    */
	public List<MultipartFile> getMultiFile(int noticeNo);
	
		/**
	    * 뷰에 보낼 운영자 정보 조회
	    * 
	    * @param adminNo - 세션에 저장된 회원 번호
	    * @return 회원 정보
	    */
	public Admin viewAdmin(int adminNo);

	   /**
	    * 게시판 글 삭제
	    * 
	    * @param adminNotice- 삭제할 게시판의 객체
	    */
	
	public void delete(AdminNotice adminNotice);
	/**
	    * 게시글 번호를 통한 게시글 정보 조회
	    * 
	    * @param noticeNo - 게시글 번호
	    * @return 게시글 번호에 해당하는 정보 DTO
	    */
	public AdminNotice selectNotice(int noticeNo);
	/**
	    * 게시글 번호를 통한 게시글 파일의 정보 조회
	    * 
	    * @param noticeNo - 조회할 해당 게시글의 번호
	    * @return 게시글 파일들 정보의 목록
	    */
	public List<AdminNoticeFile> selectNoticeFile(int noticeNo);

	/**
    * 게시글 정보와 파일 수정하기
    * 
    * @param notice - 게시글 DTO
    * @param dataMul - 게시글 파일 리스트 DTO
    */
	public void update(AdminNotice notice, List<MultipartFile> dataMul);
	/**
	    * 파일 번호를 이용한 업로드 파일 정보 조회
	    * 
	    * @param fileNo - 조회할 파일의 번호
	    * @return 첨부 파일의 정보
	    */
	public AdminNoticeFile getFile(int adminFileNo);

	/**
	 * 회원 번호에 해당하는 회원 탈퇴
	 * 
	 * @param userno - 회원번호
	 */
	public void delete(int userno);
	

	
	
	
	
}
