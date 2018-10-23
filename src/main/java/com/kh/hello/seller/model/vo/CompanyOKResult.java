package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class CompanyOKResult implements java.io.Serializable{
	private String cName;
	private String apDate;
	
	public CompanyOKResult(){}

	public CompanyOKResult(String cName, String apDate) {
		super();
		this.cName = cName;
		this.apDate = apDate;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getApDate() {
		return apDate;
	}

	public void setApDate(String apDate) {
		this.apDate = apDate;
	}

	@Override
	public String toString() {
		return "CompanyOKResult [cName=" + cName + ", apDate=" + apDate + "]";
	}
	
}
