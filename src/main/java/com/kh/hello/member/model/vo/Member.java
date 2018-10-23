package com.kh.hello.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable {
	private int mId;
	private String platformType;
	private String mType;
	private String snsToken;
	private String snsId;
	private String password;
	private String tempPassword;
	private Date registDate;
	private String status;
	private String email;
	private String nickname;
	private String national;
	private String interest;
	private String snsType;
	private String phone;
	private String bankNum;
	
	public Member(){}

	public Member(int mId, String platformType, String mType, String snsToken, String snsId, String password,
			String tempPassword, Date registDate, String status, String email, String nickname, String national,
			String interest, String snsType, String phone, String bankNum) {
		super();
		this.mId = mId;
		this.platformType = platformType;
		this.mType = mType;
		this.snsToken = snsToken;
		this.snsId = snsId;
		this.password = password;
		this.tempPassword = tempPassword;
		this.registDate = registDate;
		this.status = status;
		this.email = email;
		this.nickname = nickname;
		this.national = national;
		this.interest = interest;
		this.snsType = snsType;
		this.phone = phone;
		this.bankNum = bankNum;
	}

	public int getmId() {
		return mId;
	}

	public String getPlatformType() {
		return platformType;
	}

	public String getmType() {
		return mType;
	}

	public String getSnsToken() {
		return snsToken;
	}

	public String getSnsId() {
		return snsId;
	}

	public String getPassword() {
		return password;
	}

	public String getTempPassword() {
		return tempPassword;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public String getStatus() {
		return status;
	}

	public String getEmail() {
		return email;
	}

	public String getNickname() {
		return nickname;
	}

	public String getNational() {
		return national;
	}

	public String getInterest() {
		return interest;
	}

	public String getSnsType() {
		return snsType;
	}

	public String getPhone() {
		return phone;
	}

	public String getBankNum() {
		return bankNum;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public void setPlatformType(String platformType) {
		this.platformType = platformType;
	}

	public void setmType(String mType) {
		this.mType = mType;
	}

	public void setSnsToken(String snsToken) {
		this.snsToken = snsToken;
	}

	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setTempPassword(String tempPassword) {
		this.tempPassword = tempPassword;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setNational(String national) {
		this.national = national;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}

	@Override
	public String toString() {
		return "Member [mId=" + mId + ", plateformType=" + platformType + ", mType=" + mType + ", snsToken=" + snsToken
				+ ", snsId=" + snsId + ", password=" + password + ", tempPassword=" + tempPassword + ", registDate="
				+ registDate + ", status=" + status + ", email=" + email + ", nickname=" + nickname + ", national="
				+ national + ", interest=" + interest + ", snsType=" + snsType + ", phone=" + phone + ", bankNum="
				+ bankNum + "]";
	}
	
	
	

	
}
