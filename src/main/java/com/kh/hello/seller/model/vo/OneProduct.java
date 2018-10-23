package com.kh.hello.seller.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class OneProduct implements java.io.Serializable{
	private int cId;
	private String companyName;
	private String companyPhone;
	private String companyAddress;
	private int rId;
	private String roomType;
	private int roomCount;
	private String roomPrice;
	private int roomPeople;
	private int crId;
	private String term;
	private Date crDate;
	private Date apDate;
	private Date crEDate;
	
	public OneProduct(){}

	public OneProduct(int cId, String companyName, String companyPhone, String companyAddress, int rId, String roomType,
			int roomCount, String roomPrice, int roomPeople, int crId, String term, Date crDate, Date apDate,
			Date crEDate) {
		super();
		this.cId = cId;
		this.companyName = companyName;
		this.companyPhone = companyPhone;
		this.companyAddress = companyAddress;
		this.rId = rId;
		this.roomType = roomType;
		this.roomCount = roomCount;
		this.roomPrice = roomPrice;
		this.roomPeople = roomPeople;
		this.crId = crId;
		this.term = term;
		this.crDate = crDate;
		this.apDate = apDate;
		this.crEDate = crEDate;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
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

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getRoomCount() {
		return roomCount;
	}

	public void setRoomCount(int roomCount) {
		this.roomCount = roomCount;
	}

	public String getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(String roomPrice) {
		this.roomPrice = roomPrice;
	}

	public int getRoomPeople() {
		return roomPeople;
	}

	public void setRoomPeople(int roomPeople) {
		this.roomPeople = roomPeople;
	}

	public int getCrId() {
		return crId;
	}

	public void setCrId(int crId) {
		this.crId = crId;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public Date getCrDate() {
		return crDate;
	}

	public void setCrDate(Date crDate) {
		this.crDate = crDate;
	}

	public Date getApDate() {
		return apDate;
	}

	public void setApDate(Date apDate) {
		this.apDate = apDate;
	}

	public Date getCrEDate() {
		return crEDate;
	}

	public void setCrEDate(Date crEDate) {
		this.crEDate = crEDate;
	}

	@Override
	public String toString() {
		return "OneProduct [cId=" + cId + ", companyName=" + companyName + ", companyPhone=" + companyPhone
				+ ", companyAddress=" + companyAddress + ", rId=" + rId + ", roomType=" + roomType + ", roomCount="
				+ roomCount + ", roomPrice=" + roomPrice + ", roomPeople=" + roomPeople + ", crId=" + crId + ", term="
				+ term + ", crDate=" + crDate + ", apDate=" + apDate + ", crEDate=" + crEDate + "]";
	}

	
}
