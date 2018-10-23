package com.kh.hello.payment.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class PayDetail implements java.io.Serializable{
	private int pdId;
	private String pdDate;
	private String pdType;
	private int price;
	private String pdMethod;
	private int paId;
	
	public PayDetail(){}

	public PayDetail(int pdId, String pdDate, String pdType, int price, String pdMethod, int paId) {
		super();
		this.pdId = pdId;
		this.pdDate = pdDate;
		this.pdType = pdType;
		this.price = price;
		this.pdMethod = pdMethod;
		this.paId = paId;
	}

	public int getPdId() {
		return pdId;
	}

	public void setPdId(int pdId) {
		this.pdId = pdId;
	}

	public String getPdDate() {
		return pdDate;
	}

	public void setPdDate(String pdDate) {
		this.pdDate = pdDate;
	}

	public String getPdType() {
		return pdType;
	}

	public void setPdType(String pdType) {
		this.pdType = pdType;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPdMethod() {
		return pdMethod;
	}

	public void setPdMethod(String pdMethod) {
		this.pdMethod = pdMethod;
	}

	public int getPaId() {
		return paId;
	}

	public void setPaId(int paId) {
		this.paId = paId;
	}

	@Override
	public String toString() {
		return "PayDetail [pdId=" + pdId + ", pdDate=" + pdDate + ", pdType=" + pdType + ", price=" + price
				+ ", pdMethod=" + pdMethod + ", paId=" + paId + "]";
	}
	
	

}
