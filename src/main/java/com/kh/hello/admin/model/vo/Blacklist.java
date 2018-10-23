package com.kh.hello.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;
   
@Repository
public class Blacklist implements java.io.Serializable{
	
	private int bRecordId;
	private Date inDate;
	private int mId;
	private String reason;
	private int period;
	private Date outDate;
	
	public Blacklist(){}

	public Blacklist(int bRecordId, Date inDate, int mId, String reason, int period, Date outDate) {
		super();
		this.bRecordId = bRecordId;
		this.inDate = inDate;
		this.mId = mId;
		this.reason = reason;
		this.period = period;
		this.outDate = outDate;
	}

	public int getbRecordId() {
		return bRecordId;
	}

	public void setbRecordId(int bRecordId) {
		this.bRecordId = bRecordId;
	}

	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public Date getOutDate() {
		return outDate;
	}

	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}

	@Override
	public String toString() {
		return "Blacklist [bRecordId=" + bRecordId + ", inDate=" + inDate + ", mId=" + mId + ", reason=" + reason
				+ ", period=" + period + ", outDate=" + outDate + "]";
	}

	
	
}
