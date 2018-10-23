package com.kh.hello.admin.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class PlatformStatistics implements java.io.Serializable{
	private String month;
	private int facebookCount;
	private int googleCount;
	private int emailCount;
	
	public PlatformStatistics(){}

	public PlatformStatistics(String month, int facebookCount, int googleCount, int emailCount) {
		super();
		this.month = month;
		this.facebookCount = facebookCount;
		this.googleCount = googleCount;
		this.emailCount = emailCount;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getFacebookCount() {
		return facebookCount;
	}

	public void setFacebookCount(int facebookCount) {
		this.facebookCount = facebookCount;
	}

	public int getGoogleCount() {
		return googleCount;
	}

	public void setGoogleCount(int googleCount) {
		this.googleCount = googleCount;
	}

	public int getEmailCount() {
		return emailCount;
	}

	public void setEmailCount(int emailCount) {
		this.emailCount = emailCount;
	}

	@Override
	public String toString() {
		return "PlatformStatistics [month=" + month + ", facebookCount=" + facebookCount + ", googleCount="
				+ googleCount + ", emailCount=" + emailCount + "]";
	}
	
	

}
