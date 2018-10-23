package com.kh.hello.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;
   
@Repository
public class Reservation implements java.io.Serializable{
	private int oId; //예약번호
	private String cName; //예약처
	private String paName; //예약자
	private Date rSDate; //예약 시작일
	private Date rEDate; //예약 종료일
	private Date pdDate; //예약일=결제일
	private String rType; //객실 타입
	private String oRCount; //예약 객실 수
	private int people; //객실 당 인원
	private int price; //가격
	private String pdType; //결제 구분(구매, 환불)
	//예약 상태 결제 완료(pdType이 구매만 존재), 결제 취소(pdType 환불이 존재)
	public Reservation(){}
	public Reservation(int oId, String cName, String paName, Date rSDate, Date rEDate, Date pdDate, String rType,
			String oRCount, int people, int price, String pdType) {
		super();
		this.oId = oId;
		this.cName = cName;
		this.paName = paName;
		this.rSDate = rSDate;
		this.rEDate = rEDate;
		this.pdDate = pdDate;
		this.rType = rType;
		this.oRCount = oRCount;
		this.people = people;
		this.price = price;
		this.pdType = pdType;
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
	public String getPaName() {
		return paName;
	}
	public void setPaName(String paName) {
		this.paName = paName;
	}
	public Date getrSDate() {
		return rSDate;
	}
	public void setrSDate(Date rSDate) {
		this.rSDate = rSDate;
	}
	public Date getrEDate() {
		return rEDate;
	}
	public void setrEDate(Date rEDate) {
		this.rEDate = rEDate;
	}
	public Date getPdDate() {
		return pdDate;
	}
	public void setPdDate(Date pdDate) {
		this.pdDate = pdDate;
	}
	public String getrType() {
		return rType;
	}
	public void setrType(String rType) {
		this.rType = rType;
	}
	public String getoRCount() {
		return oRCount;
	}
	public void setoRCount(String oRCount) {
		this.oRCount = oRCount;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPdType() {
		return pdType;
	}
	public void setPdType(String pdType) {
		this.pdType = pdType;
	}
	@Override
	public String toString() {
		return "Reservation [oId=" + oId + ", cName=" + cName + ", paName=" + paName + ", rSDate=" + rSDate
				+ ", rEDate=" + rEDate + ", pdDate=" + pdDate + ", rType=" + rType + ", oRCount=" + oRCount
				+ ", people=" + people + ", price=" + price + ", pdType=" + pdType + "]";
	}
	
	
	
}
