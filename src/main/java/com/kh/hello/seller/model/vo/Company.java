package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class Company implements java.io.Serializable{
	private int cId;
	private int contentId;
	private String sellerType;
	private String companyNum;
	private String personalNum;
	private String companyName;
	private String companyPhone;
	private String companyAddress;
	private int mId;
	
	public Company(){}
	
	public Company(int cId, int contentId, String sellerType, String companyNum, String personalNum, String companyName,
			String companyPhone, String companyAddress, int mId) {
		super();
		this.cId = cId;
		this.contentId = contentId;
		this.sellerType = sellerType;
		this.companyNum = companyNum;
		this.personalNum = personalNum;
		this.companyName = companyName;
		this.companyPhone = companyPhone;
		this.companyAddress = companyAddress;
		this.mId = mId;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getSellerType() {
		return sellerType;
	}

	public void setSellerType(String sellerType) {
		this.sellerType = sellerType;
	}

	public String getCompanyNum() {
		return companyNum;
	}

	public void setCompanyNum(String companyNum) {
		this.companyNum = companyNum;
	}

	public String getPersonalNum() {
		return personalNum;
	}

	public void setPersonalNum(String personalNum) {
		this.personalNum = personalNum;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	@Override
	public String toString() {
		return "Company [cId=" + cId + ", contentId=" + contentId + ", sellerType=" + sellerType + ", companyNum="
				+ companyNum + ", personalNum=" + personalNum + ", companyName=" + companyName + ", companyPhone="
				+ companyPhone + ", companyAddress=" + companyAddress + ", mId=" + mId + "]";
	}
	
	
}
