package com.kh.hello.member.model.vo;

import java.sql.Date;

public class MemberGoods implements java.io.Serializable{
	private int lId;// 찜아이디
	private String lType;//찜타입
	private int originId;//
	private Date endDate;
	private int mId;
	private int cId;
	private String cName;
	private String cPhone;
	
	
	public MemberGoods(){}


	public int getlId() {
		return lId;
	}


	public String getlType() {
		return lType;
	}


	public int getOriginId() {
		return originId;
	}


	public Date getEndDate() {
		return endDate;
	}


	public int getmId() {
		return mId;
	}


	public int getcId() {
		return cId;
	}


	public String getcName() {
		return cName;
	}


	public String getcPhone() {
		return cPhone;
	}


	public void setlId(int lId) {
		this.lId = lId;
	}


	public void setlType(String lType) {
		this.lType = lType;
	}


	public void setOriginId(int originId) {
		this.originId = originId;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public void setmId(int mId) {
		this.mId = mId;
	}


	public void setcId(int cId) {
		this.cId = cId;
	}


	public void setcName(String cName) {
		this.cName = cName;
	}


	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}


	@Override
	public String toString() {
		return "MemberGoods [lId=" + lId + ", lType=" + lType + ", originId=" + originId + ", endDate=" + endDate
				+ ", mId=" + mId + ", cId=" + cId + ", cName=" + cName + ", cPhone=" + cPhone + "]";
	}
	
	
	
	
}
