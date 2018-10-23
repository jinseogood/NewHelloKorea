package com.kh.hello.company.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

@Repository
public class Company2 implements Serializable{
	private int cid;
	private String contentid;
	private String cAddress;
	private String cName;
	private String cRnum;
	private String cPhone;
	private String cType;
	private String cpRnum;
	private int mid;
	private int areaCode;
	private String sigunguCode;
	private String areaName;
	private String sigunguName;
	private double grade;
	private double minPrice;
	private int reviewCount;
	
	public Company2(){}

	public Company2(int cid, String contentid, String cAddress, String cName, String cRnum, String cPhone, String cType,
			String cpRnum, int mid, int areaCode, String sigunguCode, String areaName, String sigunguName, double grade, double minPrice, int reviewCount) {
		super();
		this.cid = cid;
		this.contentid = contentid;
		this.cAddress = cAddress;
		this.cName = cName;
		this.cRnum = cRnum;
		this.cPhone = cPhone;
		this.cType = cType;
		this.cpRnum = cpRnum;
		this.mid = mid;
		this.areaCode = areaCode;
		this.sigunguCode = sigunguCode;
		this.areaName = areaName;
		this.sigunguName = sigunguName;
		this.grade = grade;
		this.minPrice = minPrice;
		this.reviewCount = reviewCount;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getcAddress() {
		return cAddress;
	}

	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}

	public String getContentid() {
		return contentid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcRnum() {
		return cRnum;
	}

	public void setcRnum(String cRnum) {
		this.cRnum = cRnum;
	}

	public String getcPhone() {
		return cPhone;
	}

	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}

	public String getcType() {
		return cType;
	}

	public void setcType(String cType) {
		this.cType = cType;
	}

	public String getCpRnum() {
		return cpRnum;
	}

	public void setCpRnum(String cpRnum) {
		this.cpRnum = cpRnum;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}
	
	public int getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}

	public String getSigunguCode() {
		return sigunguCode;
	}

	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getSigunguName() {
		return sigunguName;
	}

	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public double getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(double minPrice) {
		this.minPrice = minPrice;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	@Override
	public String toString() {
		return "Company2 [cid=" + cid + ", contentid=" + contentid + ", cAddress=" + cAddress + ", cName=" + cName
				+ ", cRnum=" + cRnum + ", cPhone=" + cPhone + ", cType=" + cType + ", cpRnum=" + cpRnum + ", mid=" + mid
				+ ", areaCode=" + areaCode + ", sigunguCode=" + sigunguCode + ", areaName=" + areaName
				+ ", sigunguName=" + sigunguName + ", grade=" + grade + ", minPrice=" + minPrice + ", reviewCount="
				+ reviewCount + "]";
	}






	
	
	
	

}
