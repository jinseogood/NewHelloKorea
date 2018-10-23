package com.kh.hello.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class CompanyDetails implements java.io.Serializable{
	private int cId;
	private int crId;
	private String cName;
	private String cPhone;
	private String cAddress;
	private String crStatus;
	private Date crDate;
	private Date apDate;
	private int crTerm;
	private Date crEDate;
	private String rType;
	private int rCount;
	private String rPrice;
	private int rLimit;
	private String startDate;
	private String endDate;
	
	public CompanyDetails(){}

	public CompanyDetails(int cId, int crId, String cName, String cPhone, String cAddress, String crStatus, Date crDate,
			Date apDate, int crTerm, Date crEDate, String rType, int rCount, String rPrice, int rLimit,
			String startDate, String endDate) {
		super();
		this.cId = cId;
		this.crId = crId;
		this.cName = cName;
		this.cPhone = cPhone;
		this.cAddress = cAddress;
		this.crStatus = crStatus;
		this.crDate = crDate;
		this.apDate = apDate;
		this.crTerm = crTerm;
		this.crEDate = crEDate;
		this.rType = rType;
		this.rCount = rCount;
		this.rPrice = rPrice;
		this.rLimit = rLimit;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getCrId() {
		return crId;
	}

	public void setCrId(int crId) {
		this.crId = crId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcPhone() {
		return cPhone;
	}

	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}

	public String getcAddress() {
		return cAddress;
	}

	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}

	public String getCrStatus() {
		return crStatus;
	}

	public void setCrStatus(String crStatus) {
		this.crStatus = crStatus;
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

	public int getCrTerm() {
		return crTerm;
	}

	public void setCrTerm(int crTerm) {
		this.crTerm = crTerm;
	}

	public Date getCrEDate() {
		return crEDate;
	}

	public void setCrEDate(Date crEDate) {
		this.crEDate = crEDate;
	}

	public String getrType() {
		return rType;
	}

	public void setrType(String rType) {
		this.rType = rType;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	public String getrPrice() {
		return rPrice;
	}

	public void setrPrice(String rPrice) {
		this.rPrice = rPrice;
	}

	public int getrLimit() {
		return rLimit;
	}

	public void setrLimit(int rLimit) {
		this.rLimit = rLimit;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "CompanyDetails [cId=" + cId + ", crId=" + crId + ", cName=" + cName + ", cPhone=" + cPhone
				+ ", cAddress=" + cAddress + ", crStatus=" + crStatus + ", crDate=" + crDate + ", apDate=" + apDate
				+ ", crTerm=" + crTerm + ", crEDate=" + crEDate + ", rType=" + rType + ", rCount=" + rCount
				+ ", rPrice=" + rPrice + ", rLimit=" + rLimit + ", startDate=" + startDate + ", endDate=" + endDate
				+ "]";
	}

	
	
}
