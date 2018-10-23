package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class CompanyReviewResult implements java.io.Serializable{
	private int cId;
	private int contentId;
	private String cName;
	private int count;
	
	public CompanyReviewResult(){}

	public CompanyReviewResult(int cId, int contentId, String cName, int count) {
		super();
		this.cId = cId;
		this.contentId = contentId;
		this.cName = cName;
		this.count = count;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "CompanyReviewResult [cId=" + cId + ", contentId=" + contentId + ", cName=" + cName + ", count=" + count
				+ "]";
	}
	
	
}
