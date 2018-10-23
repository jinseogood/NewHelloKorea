package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class SellerOneReservation implements java.io.Serializable{
	private int oId;
	private String cName;
	private String rSDate;
	private String rEDate;
	private String paName;
	private int people;
	private int oRCount;
	private int rId;
	private String rType;
	private int price;
	private String status;
	
	public SellerOneReservation(){}

	public SellerOneReservation(int oId, String cName, String rSDate, String rEDate, String paName, int people,
			int oRCount, int rId, String rType, int price, String status) {
		super();
		this.oId = oId;
		this.cName = cName;
		this.rSDate = rSDate;
		this.rEDate = rEDate;
		this.paName = paName;
		this.people = people;
		this.oRCount = oRCount;
		this.rId = rId;
		this.rType = rType;
		this.price = price;
		this.status = status;
	}

	public int getoId() {
		return oId;
	}

	public void setoId(int oId) {
		this.oId = oId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getrSDate() {
		return rSDate;
	}

	public void setrSDate(String rSDate) {
		this.rSDate = rSDate;
	}

	public String getrEDate() {
		return rEDate;
	}

	public void setrEDate(String rEDate) {
		this.rEDate = rEDate;
	}

	public String getPaName() {
		return paName;
	}

	public void setPaName(String paName) {
		this.paName = paName;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getoRCount() {
		return oRCount;
	}

	public void setoRCount(int oRCount) {
		this.oRCount = oRCount;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrType() {
		return rType;
	}

	public void setrType(String rType) {
		this.rType = rType;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "SellerOneReservation [oId=" + oId + ", cName=" + cName + ", rSDate=" + rSDate + ", rEDate=" + rEDate
				+ ", paName=" + paName + ", people=" + people + ", oRCount=" + oRCount + ", rId=" + rId + ", rType="
				+ rType + ", price=" + price + ", status=" + status + "]";
	}

	
}
