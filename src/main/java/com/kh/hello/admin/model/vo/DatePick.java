package com.kh.hello.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;
   
@Repository
public class DatePick implements java.io.Serializable{
	private String fromDate;
	private String toDate;
	
	public DatePick(){}

	public DatePick(String fromDate, String toDate) {
		super();
		this.fromDate = fromDate;
		this.toDate = toDate;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	@Override
	public String toString() {
		return "DatePick [fromDate=" + fromDate + ", toDate=" + toDate + "]";
	}

	
}
