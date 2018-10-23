package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class SellerReservation implements java.io.Serializable{
	private int oId;
	private String cName;
	private String rSDate;
	private String rEDate;
	private int paId;
	private String paName;
	private String status;
	
	public SellerReservation(){}

	public SellerReservation(int oId, String cName, String rSDate, String rEDate, int paId, String paName,
			String status) {
		super();
		this.oId = oId;
		this.cName = cName;
		this.rSDate = rSDate;
		this.rEDate = rEDate;
		this.paId = paId;
		this.paName = paName;
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

	public int getPaId() {
		return paId;
	}

	public void setPaId(int paId) {
		this.paId = paId;
	}

	public String getPaName() {
		return paName;
	}

	public void setPaName(String paName) {
		this.paName = paName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "SellerReservation [oId=" + oId + ", cName=" + cName + ", rSDate=" + rSDate + ", rEDate=" + rEDate
				+ ", paId=" + paId + ", paName=" + paName + ", status=" + status + "]";
	}

	
}
