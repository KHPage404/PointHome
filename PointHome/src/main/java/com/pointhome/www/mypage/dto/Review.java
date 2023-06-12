package com.pointhome.www.mypage.dto;

import java.util.Date;

public class Review {
	
	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private int reviewGrade;
	private Date reviewDate;
	private int userNo;
	private int partNo;
	private int resNo;
	
	public Review() {}

	public Review(int reviewNo, String reviewTitle, String reviewContent, int reviewGrade, Date reviewDate, int userNo,
			int partNo, int resNo) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewGrade = reviewGrade;
		this.reviewDate = reviewDate;
		this.userNo = userNo;
		this.partNo = partNo;
		this.resNo = resNo;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", reviewGrade=" + reviewGrade + ", reviewDate=" + reviewDate + ", userNo=" + userNo + ", partNo="
				+ partNo + ", resNo=" + resNo + "]";
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getReviewGrade() {
		return reviewGrade;
	}

	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPartNo() {
		return partNo;
	}

	public void setPartNo(int partNo) {
		this.partNo = partNo;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	
	

}
