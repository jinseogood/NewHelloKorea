package com.kh.hello.good.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Good2 implements java.io.Serializable{
	
	private int lid;			//찜번호
	private String lType;		//구분
	private int originId;		//고유아이디
	private int mid;			//회원아이디
	private int cid;
	private double grade;
	
	public Good2(){}

	public Good2(int lid, String lType, int originId, int mid, int cid, double grade) {
		super();
		this.lid = lid;
		this.lType = lType;
		this.originId = originId;
		this.mid = mid;
		this.cid = cid;
		this.grade = grade;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getlType() {
		return lType;
	}

	public void setlType(String lType) {
		this.lType = lType;
	}

	public int getOriginId() {
		return originId;
	}

	public void setOriginId(int originId) {
		this.originId = originId;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Good2 [lid=" + lid + ", lType=" + lType + ", originId=" + originId + ", mid=" + mid + ", cid=" + cid
				+ ", grade=" + grade + "]";
	}


	

}
