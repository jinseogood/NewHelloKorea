package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class CompanySaleStat implements java.io.Serializable{
	private String month;
	private String cName;
	private int price;
	
	public CompanySaleStat(){}

	public CompanySaleStat(String month, String cName, int price) {
		super();
		this.month = month;
		this.cName = cName;
		this.price = price;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CompanySaleStat [month=" + month + ", cName=" + cName + ", price=" + price + "]";
	}

}
