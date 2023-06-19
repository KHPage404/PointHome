 package com.pointhome.www.partner.dto;

import java.util.Date;

public class PartnerNotice {
	private int partnerNoticeNo;
	private String partnerNoticeTitle;
	private String partnerNoticeContent;
	private Date partnerNoticeDate;
	private int partnerNo;
	private char div;

	public PartnerNotice() {
		// TODO Auto-generated constructor stub
	}

	public PartnerNotice(int partnerNoticeNo, String partnerNoticeTitle, String partnerNoticeContent,
			Date partnerNoticeDate, int partnerNo, char div) {
		super();
		this.partnerNoticeNo = partnerNoticeNo;
		this.partnerNoticeTitle = partnerNoticeTitle;
		this.partnerNoticeContent = partnerNoticeContent;
		this.partnerNoticeDate = partnerNoticeDate;
		this.partnerNo = partnerNo;
		this.div = div;
	}

	@Override
	public String toString() {
		return "PartnerNotice [partnerNoticeNo=" + partnerNoticeNo + ", partnerNoticeTitle=" + partnerNoticeTitle
				+ ", partnerNoticeContent=" + partnerNoticeContent + ", partnerNoticeDate=" + partnerNoticeDate
				+ ", partnerNo=" + partnerNo + ", div=" + div + "]";
	}

	public int getPartnerNoticeNo() {
		return partnerNoticeNo;
	}

	public void setPartnerNoticeNo(int partnerNoticeNo) {
		this.partnerNoticeNo = partnerNoticeNo;
	}

	public String getPartnerNoticeTitle() {
		return partnerNoticeTitle;
	}

	public void setPartnerNoticeTitle(String partnerNoticeTitle) {
		this.partnerNoticeTitle = partnerNoticeTitle;
	}

	public String getPartnerNoticeContent() {
		return partnerNoticeContent;
	}

	public void setPartnerNoticeContent(String partnerNoticeContent) {
		this.partnerNoticeContent = partnerNoticeContent;
	}

	public Date getPartnerNoticeDate() {
		return partnerNoticeDate;
	}

	public void setPartnerNoticeDate(Date partnerNoticeDate) {
		this.partnerNoticeDate = partnerNoticeDate;
	}

	public int getPartnerNo() {
		return partnerNo;
	}

	public void setPartnerNo(int partnerNo) {
		this.partnerNo = partnerNo;
	}

	public char getDiv() {
		return div;
	}

	public void setDiv(char div) {
		this.div = div;
	}
	
	
	
	

}
