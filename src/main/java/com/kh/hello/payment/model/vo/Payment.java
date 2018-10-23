package com.kh.hello.payment.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class Payment implements java.io.Serializable{
	private int paId;
	private int mId;
	private String paName;
	private String paPhone;
	private String paEmail;
	
	public Payment(){}

	public Payment(int paId, int mId, String paName, String paPhone, String paEmail) {
		super();
		this.paId = paId;
		this.mId = mId;
		this.paName = paName;
		this.paPhone = paPhone;
		this.paEmail = paEmail;
	}

	public int getPaId() {
		return paId;
	}

	public void setPaId(int paId) {
		this.paId = paId;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String getPaName() {
		return paName;
	}

	public void setPaName(String paName) {
		this.paName = paName;
	}

	public String getPaPhone() {
		return paPhone;
	}

	public void setPaPhone(String paPhone) {
		this.paPhone = paPhone;
	}

	public String getPaEmail() {
		return paEmail;
	}

	public void setPaEmail(String paEmail) {
		this.paEmail = paEmail;
	}

	@Override
	public String toString() {
		return "Payment [paId=" + paId + ", mId=" + mId + ", paName=" + paName + ", paPhone=" + paPhone + ", paEmail="
				+ paEmail + "]";
	}
	
}
