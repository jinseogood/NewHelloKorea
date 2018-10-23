package com.kh.hello.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;
@Repository
public class Report implements java.io.Serializable{
    private int rRecordId;
	private int rLevel;
	private String rLevelText;
	private int mId;
	private int rTarget;
	private Date rDate;
	private String reason;
	private String result;
	private String resultText;
	private int refId;
	private String rContent;
	
	public Report(){}

	public Report(int rRecordId, int rLevel, String rLevelText, int mId, int rTarget, Date rDate, String reason,
			String result, String resultText, int refId, String rContent) {
		super();
		this.rRecordId = rRecordId;
		this.rLevel = rLevel;
		this.rLevelText = rLevelText;
		this.mId = mId;
		this.rTarget = rTarget;
		this.rDate = rDate;
		this.reason = reason;
		this.result = result;
		this.resultText = resultText;
		this.refId = refId;
		this.rContent = rContent;
	}

	public int getrRecordId() {
		return rRecordId;
	}

	public void setrRecordId(int rRecordId) {
		this.rRecordId = rRecordId;
	}

	public int getrLevel() {
		return rLevel;
	}

	public void setrLevel(int rLevel) {
		this.rLevel = rLevel;
	}

	public String getrLevelText() {
		return rLevelText;
	}

	public void setrLevelText(String rLevelText) {
		this.rLevelText = rLevelText;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public int getrTarget() {
		return rTarget;
	}

	public void setrTarget(int rTarget) {
		this.rTarget = rTarget;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getResultText() {
		return resultText;
	}

	public void setResultText(String resultText) {
		this.resultText = resultText;
	}

	public int getRefId() {
		return refId;
	}

	public void setRefId(int refId) {
		this.refId = refId;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	@Override
	public String toString() {
		return "Report [rRecordId=" + rRecordId + ", rLevel=" + rLevel + ", rLevelText=" + rLevelText + ", mId=" + mId
				+ ", rTarget=" + rTarget + ", rDate=" + rDate + ", reason=" + reason + ", result=" + result
				+ ", resultText=" + resultText + ", refId=" + refId + ", rContent=" + rContent + "]";
	}

	
	
	
}
