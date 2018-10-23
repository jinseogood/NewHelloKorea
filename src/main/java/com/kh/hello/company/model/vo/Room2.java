package com.kh.hello.company.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

@Repository
public class Room2 implements Serializable{
	
	private int rid;				//객실아이디
	private String rType;			//객실유형(객실이름)
	private int rCount;				//객실수
	private int rPrice;				//가격
	private int rLimit;				//객실정원
	private int cid;				//업체아이디
	
	public Room2(){}

	public Room2(int rid, String rType, int rCount, int rPrice, int rLimit, int cid) {
		super();
		this.rid = rid;
		this.rType = rType;
		this.rCount = rCount;
		this.rPrice = rPrice;
		this.rLimit = rLimit;
		this.cid = cid;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getrType() {
		return rType;
	}

	public void setrType(String rType) {
		this.rType = rType;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	public int getrPrice() {
		return rPrice;
	}

	public void setrPrice(int rPrice) {
		this.rPrice = rPrice;
	}

	public int getrLimit() {
		return rLimit;
	}

	public void setrLimit(int rLimit) {
		this.rLimit = rLimit;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	@Override
	public String toString() {
		return "Room2 [rid=" + rid + ", rType=" + rType + ", rCount=" + rCount + ", rPrice=" + rPrice + ", rLimit="
				+ rLimit + ", cid=" + cid + "]";
	}
	
	

}
