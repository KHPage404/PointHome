package com.pointhome.www.main.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.util.Paging;

public interface MainDao {

	public List<Integer> selectReserveTime(Reservation reservation);

	public void insertUserReserveData(Reservation res);

	/**
	 * 유저가 보는 제휴사 상세 페이지의 정보 select
	 * 
	 * @param partNo
	 * @return
	 */
	public Partner selectPartnerView(int partNo);
	
	/**
	 * partNo에 해당하는 리뷰 개수 가져오기
	 * 
	 * @param partNo
	 * @return
	 */
	public int selectCntReview(int partNo);

	/**
	 * partNo으로 리뷰와 유저 닉네임의 리스트 뽑기
	 * @param paging 
	 * 
	 * @param partNo
	 * @return
	 */
	public List<Map<String, Object>> selectReviewListByPartNo(@Param("paging") Paging paging, @Param("partNo") int partNo);

	/**
	 * 예약시 알림 삽입
	 * 
	 * @param res - 예약 정보 담은 DTO
	 */
	public void insertReserveAlert(Reservation res);


}
