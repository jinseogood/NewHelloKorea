package com.kh.hello.admin.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class Deposit implements java.io.Serializable{
     private int cId;
     private String cName;
     private String bankNum;
     private int dAmount;
     private String dDate;
     private String dStatus;
     
     public Deposit(){}

	public Deposit(int cId, String cName, String bankNum, int dAmount, String dDate, String dStatus) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.bankNum = bankNum;
		this.dAmount = dAmount;
		this.dDate = dDate;
		this.dStatus = dStatus;
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

	public String getBankNum() {
		return bankNum;
	}

	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}

	public int getdAmount() {
		return dAmount;
	}

	public void setdAmount(int dAmount) {
		this.dAmount = dAmount;
	}

	public String getdDate() {
		return dDate;
	}

	public void setdDate(String dDate) {
		this.dDate = dDate;
	}

	public String getdStatus() {
		return dStatus;
	}

	public void setdStatus(String dStatus) {
		this.dStatus = dStatus;
	}

	@Override
	public String toString() {
		return "Deposit [cId=" + cId + ", cName=" + cName + ", bankNum=" + bankNum + ", dAmount=" + dAmount + ", dDate="
				+ dDate + ", dStatus=" + dStatus + "]";
	}
     
     
}
