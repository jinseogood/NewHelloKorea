package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class CompanyGoodStat implements java.io.Serializable{
	private String cName;
	private double good;
	
	public CompanyGoodStat(){}

	public CompanyGoodStat(String cName, int good) {
		super();
		this.cName = cName;
		this.good = good;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public double getGood() {
		return good;
	}

	public void setGood(double good) {
		this.good = good;
	}

	@Override
	public String toString() {
		return "CompanyGoodStat [cName=" + cName + ", good=" + good + "]";
	}
	
	
}
