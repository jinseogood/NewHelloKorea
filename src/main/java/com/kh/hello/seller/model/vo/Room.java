package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class Room implements java.io.Serializable{
	private int rId;
	private String roomType;
	private int roomCount;
	private int roomPrice;
	private int roomPeople;
	private int cId;
	
	public Room(){}

	public Room(int rId, String roomType, int roomCount, int roomPrice, int roomPeople, int cId) {
		super();
		this.rId = rId;
		this.roomType = roomType;
		this.roomCount = roomCount;
		this.roomPrice = roomPrice;
		this.roomPeople = roomPeople;
		this.cId = cId;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getRoomCount() {
		return roomCount;
	}

	public void setRoomCount(int roomCount) {
		this.roomCount = roomCount;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}

	public int getRoomPeople() {
		return roomPeople;
	}

	public void setRoomPeople(int roomPeople) {
		this.roomPeople = roomPeople;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	@Override
	public String toString() {
		return "Room [rId=" + rId + ", roomType=" + roomType + ", roomCount=" + roomCount + ", roomPrice=" + roomPrice
				+ ", roomPeople=" + roomPeople + ", cId=" + cId + "]";
	}

	
	
}
