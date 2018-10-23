package com.kh.hello.member.model.vo;

import java.sql.Date;

public class MemberReservation implements java.io.Serializable {
	private int oId;
	private String rSdate;
	private String rEdate;
	private int people;
	private int oRcount;
	private String cName;
	private String rType;
	private String pdType;
	
	
	public MemberReservation(){}


	public MemberReservation(int oId, String rSdate, String rEdate, int people, int oRcount, String cName, String rType,
			String pdType) {
		super();
		this.oId = oId;
		this.rSdate = rSdate;
		this.rEdate = rEdate;
		this.people = people;
		this.oRcount = oRcount;
		this.cName = cName;
		this.rType = rType;
		this.pdType = pdType;
	}


	public int getoId() {
		return oId;
	}


	public String getrSdate() {
		return rSdate;
	}


	public String getrEdate() {
		return rEdate;
	}


	public int getPeople() {
		return people;
	}


	public int getoRcount() {
		return oRcount;
	}


	public String getcName() {
		return cName;
	}


	public String getrType() {
		return rType;
	}


	public String getPdType() {
		return pdType;
	}


	public void setoId(int oId) {
		this.oId = oId;
	}


	public void setrSdate(String rSdate) {
		this.rSdate = rSdate;
	}


	public void setrEdate(String rEdate) {
		this.rEdate = rEdate;
	}


	public void setPeople(int people) {
		this.people = people;
	}


	public void setoRcount(int oRcount) {
		this.oRcount = oRcount;
	}


	public void setcName(String cName) {
		this.cName = cName;
	}


	public void setrType(String rType) {
		this.rType = rType;
	}


	public void setPdType(String pdType) {
		this.pdType = pdType;
	}


	@Override
	public String toString() {
		return "MemberReservation [oId=" + oId + ", rSdate=" + rSdate + ", rEdate=" + rEdate + ", people=" + people
				+ ", oRcount=" + oRcount + ", cName=" + cName + ", rType=" + rType + ", pdType=" + pdType + "]";
	}
	
	
	
	



	
	
	
	
	
}
