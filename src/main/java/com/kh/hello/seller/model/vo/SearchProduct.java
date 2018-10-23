package com.kh.hello.seller.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class SearchProduct implements java.io.Serializable{
	//Company
	private int cId;
	private String companyName;
	private String companyPhone;
	private String companyAddress;
	private int mId;
		
	//Registration History
	private int crId;
	private String term;
	private String status;
	private Date crDate;
	private Date apDate;
	private Date crEDate;
	
	public SearchProduct(){}

	public SearchProduct(int cId, String companyName, String companyPhone, String companyAddress, int mId, int crId,
			String term, String status, Date crDate, Date apDate, Date crEDate) {
		super();
		this.cId = cId;
		this.companyName = companyName;
		this.companyPhone = companyPhone;
		this.companyAddress = companyAddress;
		this.mId = mId;
		this.crId = crId;
		this.term = term;
		this.status = status;
		this.crDate = crDate;
		this.apDate = apDate;
		this.crEDate = crEDate;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public int getCrId() {
		return crId;
	}

	public void setCrId(int crId) {
		this.crId = crId;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCrDate() {
		return crDate;
	}

	public void setCrDate(Date crDate) {
		this.crDate = crDate;
	}

	public Date getApDate() {
		return apDate;
	}

	public void setApDate(Date apDate) {
		this.apDate = apDate;
	}

	public Date getCrEDate() {
		return crEDate;
	}

	public void setCrEDate(Date crEDate) {
		this.crEDate = crEDate;
	}

	@Override
	public String toString() {
		return "SearchProduct [cId=" + cId + ", companyName=" + companyName + ", companyPhone=" + companyPhone
				+ ", companyAddress=" + companyAddress + ", mId=" + mId + ", crId=" + crId + ", term=" + term
				+ ", status=" + status + ", crDate=" + crDate + ", apDate=" + apDate + ", crEDate=" + crEDate + "]";
	}



}
