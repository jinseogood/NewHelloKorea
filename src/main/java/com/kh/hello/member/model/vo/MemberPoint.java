package com.kh.hello.member.model.vo;

public class MemberPoint implements java.io.Serializable {
	private int pId;
	private int mId;
	private String pDate;
	private int amount;
	private String paType;
	
	
	
	public MemberPoint(){}



	public MemberPoint(int pId, int mId, String pDate, int amount, String paType) {
		super();
		this.pId = pId;
		this.mId = mId;
		this.pDate = pDate;
		this.amount = amount;
		this.paType = paType;
	}



	public int getpId() {
		return pId;
	}



	public int getmId() {
		return mId;
	}



	public String getpDate() {
		return pDate;
	}



	public int getAmount() {
		return amount;
	}



	public String getPaType() {
		return paType;
	}



	public void setpId(int pId) {
		this.pId = pId;
	}



	public void setmId(int mId) {
		this.mId = mId;
	}



	public void setpDate(String pDate) {
		this.pDate = pDate;
	}



	public void setAmount(int amount) {
		this.amount = amount;
	}



	public void setPaType(String paType) {
		this.paType = paType;
	}



	@Override
	public String toString() {
		return "MemberPoint [pId=" + pId + ", mId=" + mId + ", pDate=" + pDate + ", amount=" + amount + ", paType="
				+ paType + "]";
	}

	

	

	
	
	
}
