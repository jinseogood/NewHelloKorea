package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class Revenue implements java.io.Serializable{
	private int dhId;
	private int cId;
	private String cName;
	private int rCount;
	private String rDate;
	private int price;
	private String status;
	
	public Revenue(){}

	public Revenue(int dhId, int cId, String cName, int rCount, String rDate, int price, String status) {
		super();
		this.dhId = dhId;
		this.cId = cId;
		this.cName = cName;
		this.rCount = rCount;
		this.rDate = rDate;
		this.price = price;
		this.status = status;
	}

	public int getDhId() {
		return dhId;
	}

	public void setDhId(int dhId) {
		this.dhId = dhId;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
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
		return "Revenue [dhId=" + dhId + ", cId=" + cId + ", cName=" + cName + ", rCount=" + rCount + ", rDate=" + rDate
				+ ", price=" + price + ", status=" + status + "]";
	}

	
}
