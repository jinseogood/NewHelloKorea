package com.kh.hello.seller.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class RegistrationHistory implements java.io.Serializable{
	private int rhId;
	private int cId;
	private Date rDate;
	private String term;
	private String status;
	
	public RegistrationHistory(){}

	public RegistrationHistory(int rhId, int cId, Date rDate, String term, String status) {
		super();
		this.rhId = rhId;
		this.cId = cId;
		this.rDate = rDate;
		this.term = term;
		this.status = status;
	}

	public int getRhId() {
		return rhId;
	}

	public void setRhId(int rhId) {
		this.rhId = rhId;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "RegistrationHistory [rhId=" + rhId + ", cId=" + cId + ", rDate=" + rDate + ", term=" + term
				+ ", status=" + status + "]";
	}
	
}
