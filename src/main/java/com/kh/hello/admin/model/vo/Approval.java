package com.kh.hello.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;
   
@Repository
public class Approval implements java.io.Serializable{
	private int crId;
	private Date crDate;
	private String crStatus;
	private int cId;
	private String cName;
	private String cPhone;
	private int crTerm;
	private Date apDate;
	
	public Approval(){}

	public Approval(int crId, Date crDate, String crStatus, int cId, String cName, String cPhone, int crTerm,
			Date apDate) {
		super();
		this.crId = crId;
		this.crDate = crDate;
		this.crStatus = crStatus;
		this.cId = cId;
		this.cName = cName;
		this.cPhone = cPhone;
		this.crTerm = crTerm;
		this.apDate = apDate;
	}

	public int getCrId() {
		return crId;
	}

	public void setCrId(int crId) {
		this.crId = crId;
	}

	public Date getCrDate() {
		return crDate;
	}

	public void setCrDate(Date crDate) {
		this.crDate = crDate;
	}

	public String getCrStatus() {
		return crStatus;
	}

	public void setCrStatus(String crStatus) {
		this.crStatus = crStatus;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
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

	public int getCrTerm() {
		return crTerm;
	}

	public void setCrTerm(int crTerm) {
		this.crTerm = crTerm;
	}

	public Date getApDate() {
		return apDate;
	}

	public void setApDate(Date apDate) {
		this.apDate = apDate;
	}

	@Override
	public String toString() {
		return "Approval [crId=" + crId + ", crDate=" + crDate + ", crStatus=" + crStatus + ", cId=" + cId + ", cName="
				+ cName + ", cPhone=" + cPhone + ", crTerm=" + crTerm + ", apDate=" + apDate + "]";
	}

	
	

}
