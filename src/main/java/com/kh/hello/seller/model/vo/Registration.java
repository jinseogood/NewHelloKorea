package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class Registration implements java.io.Serializable{
	//Company
	private int cId;
	private int contentId;
	private String sellerType;
	private String companyNum;
	private String personalNum;
	private String companyName;
	private String companyPhone;
	private String companyAddress;
	private int mId;
	
	//Registration History
	private String term;
	private String status;
	
	//Room
	private int rId;
	private String roomType1;
	private int roomCount1;
	private String roomPrice1;
	private int roomPeople1;
	private String roomType2;
	private int roomCount2;
	private String roomPrice2;
	private int roomPeople2;
	private String roomType3;
	private int roomCount3;
	private String roomPrice3;
	private int roomPeople3;
	private String roomType4;
	private int roomCount4;
	private String roomPrice4;
	private int roomPeople4;
	private String roomType5;
	private int roomCount5;
	private String roomPrice5;
	private int roomPeople5;
	private String roomType6;
	private int roomCount6;
	private String roomPrice6;
	private int roomPeople6;
	private String roomType7;
	private int roomCount7;
	private String roomPrice7;
	private int roomPeople7;
	private String roomType8;
	private int roomCount8;
	private String roomPrice8;
	private int roomPeople8;
	private String roomType9;
	private int roomCount9;
	private String roomPrice9;
	private int roomPeople9;
	
	public Registration(){}

	public Registration(int cId, int contentId, String sellerType, String companyNum, String personalNum,
			String companyName, String companyPhone, String companyAddress, int mId, String term, String status,
			int rId, String roomType1, int roomCount1, String roomPrice1, int roomPeople1, String roomType2,
			int roomCount2, String roomPrice2, int roomPeople2, String roomType3, int roomCount3, String roomPrice3,
			int roomPeople3, String roomType4, int roomCount4, String roomPrice4, int roomPeople4, String roomType5,
			int roomCount5, String roomPrice5, int roomPeople5, String roomType6, int roomCount6, String roomPrice6,
			int roomPeople6, String roomType7, int roomCount7, String roomPrice7, int roomPeople7, String roomType8,
			int roomCount8, String roomPrice8, int roomPeople8, String roomType9, int roomCount9, String roomPrice9,
			int roomPeople9) {
		super();
		this.cId = cId;
		this.contentId = contentId;
		this.sellerType = sellerType;
		this.companyNum = companyNum;
		this.personalNum = personalNum;
		this.companyName = companyName;
		this.companyPhone = companyPhone;
		this.companyAddress = companyAddress;
		this.mId = mId;
		this.term = term;
		this.status = status;
		this.rId = rId;
		this.roomType1 = roomType1;
		this.roomCount1 = roomCount1;
		this.roomPrice1 = roomPrice1;
		this.roomPeople1 = roomPeople1;
		this.roomType2 = roomType2;
		this.roomCount2 = roomCount2;
		this.roomPrice2 = roomPrice2;
		this.roomPeople2 = roomPeople2;
		this.roomType3 = roomType3;
		this.roomCount3 = roomCount3;
		this.roomPrice3 = roomPrice3;
		this.roomPeople3 = roomPeople3;
		this.roomType4 = roomType4;
		this.roomCount4 = roomCount4;
		this.roomPrice4 = roomPrice4;
		this.roomPeople4 = roomPeople4;
		this.roomType5 = roomType5;
		this.roomCount5 = roomCount5;
		this.roomPrice5 = roomPrice5;
		this.roomPeople5 = roomPeople5;
		this.roomType6 = roomType6;
		this.roomCount6 = roomCount6;
		this.roomPrice6 = roomPrice6;
		this.roomPeople6 = roomPeople6;
		this.roomType7 = roomType7;
		this.roomCount7 = roomCount7;
		this.roomPrice7 = roomPrice7;
		this.roomPeople7 = roomPeople7;
		this.roomType8 = roomType8;
		this.roomCount8 = roomCount8;
		this.roomPrice8 = roomPrice8;
		this.roomPeople8 = roomPeople8;
		this.roomType9 = roomType9;
		this.roomCount9 = roomCount9;
		this.roomPrice9 = roomPrice9;
		this.roomPeople9 = roomPeople9;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getSellerType() {
		return sellerType;
	}

	public void setSellerType(String sellerType) {
		this.sellerType = sellerType;
	}

	public String getCompanyNum() {
		return companyNum;
	}

	public void setCompanyNum(String companyNum) {
		this.companyNum = companyNum;
	}

	public String getPersonalNum() {
		return personalNum;
	}

	public void setPersonalNum(String personalNum) {
		this.personalNum = personalNum;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
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

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getRoomType1() {
		return roomType1;
	}

	public void setRoomType1(String roomType1) {
		this.roomType1 = roomType1;
	}

	public int getRoomCount1() {
		return roomCount1;
	}

	public void setRoomCount1(int roomCount1) {
		this.roomCount1 = roomCount1;
	}

	public String getRoomPrice1() {
		return roomPrice1;
	}

	public void setRoomPrice1(String roomPrice1) {
		this.roomPrice1 = roomPrice1;
	}

	public int getRoomPeople1() {
		return roomPeople1;
	}

	public void setRoomPeople1(int roomPeople1) {
		this.roomPeople1 = roomPeople1;
	}

	public String getRoomType2() {
		return roomType2;
	}

	public void setRoomType2(String roomType2) {
		this.roomType2 = roomType2;
	}

	public int getRoomCount2() {
		return roomCount2;
	}

	public void setRoomCount2(int roomCount2) {
		this.roomCount2 = roomCount2;
	}

	public String getRoomPrice2() {
		return roomPrice2;
	}

	public void setRoomPrice2(String roomPrice2) {
		this.roomPrice2 = roomPrice2;
	}

	public int getRoomPeople2() {
		return roomPeople2;
	}

	public void setRoomPeople2(int roomPeople2) {
		this.roomPeople2 = roomPeople2;
	}

	public String getRoomType3() {
		return roomType3;
	}

	public void setRoomType3(String roomType3) {
		this.roomType3 = roomType3;
	}

	public int getRoomCount3() {
		return roomCount3;
	}

	public void setRoomCount3(int roomCount3) {
		this.roomCount3 = roomCount3;
	}

	public String getRoomPrice3() {
		return roomPrice3;
	}

	public void setRoomPrice3(String roomPrice3) {
		this.roomPrice3 = roomPrice3;
	}

	public int getRoomPeople3() {
		return roomPeople3;
	}

	public void setRoomPeople3(int roomPeople3) {
		this.roomPeople3 = roomPeople3;
	}

	public String getRoomType4() {
		return roomType4;
	}

	public void setRoomType4(String roomType4) {
		this.roomType4 = roomType4;
	}

	public int getRoomCount4() {
		return roomCount4;
	}

	public void setRoomCount4(int roomCount4) {
		this.roomCount4 = roomCount4;
	}

	public String getRoomPrice4() {
		return roomPrice4;
	}

	public void setRoomPrice4(String roomPrice4) {
		this.roomPrice4 = roomPrice4;
	}

	public int getRoomPeople4() {
		return roomPeople4;
	}

	public void setRoomPeople4(int roomPeople4) {
		this.roomPeople4 = roomPeople4;
	}

	public String getRoomType5() {
		return roomType5;
	}

	public void setRoomType5(String roomType5) {
		this.roomType5 = roomType5;
	}

	public int getRoomCount5() {
		return roomCount5;
	}

	public void setRoomCount5(int roomCount5) {
		this.roomCount5 = roomCount5;
	}

	public String getRoomPrice5() {
		return roomPrice5;
	}

	public void setRoomPrice5(String roomPrice5) {
		this.roomPrice5 = roomPrice5;
	}

	public int getRoomPeople5() {
		return roomPeople5;
	}

	public void setRoomPeople5(int roomPeople5) {
		this.roomPeople5 = roomPeople5;
	}

	public String getRoomType6() {
		return roomType6;
	}

	public void setRoomType6(String roomType6) {
		this.roomType6 = roomType6;
	}

	public int getRoomCount6() {
		return roomCount6;
	}

	public void setRoomCount6(int roomCount6) {
		this.roomCount6 = roomCount6;
	}

	public String getRoomPrice6() {
		return roomPrice6;
	}

	public void setRoomPrice6(String roomPrice6) {
		this.roomPrice6 = roomPrice6;
	}

	public int getRoomPeople6() {
		return roomPeople6;
	}

	public void setRoomPeople6(int roomPeople6) {
		this.roomPeople6 = roomPeople6;
	}

	public String getRoomType7() {
		return roomType7;
	}

	public void setRoomType7(String roomType7) {
		this.roomType7 = roomType7;
	}

	public int getRoomCount7() {
		return roomCount7;
	}

	public void setRoomCount7(int roomCount7) {
		this.roomCount7 = roomCount7;
	}

	public String getRoomPrice7() {
		return roomPrice7;
	}

	public void setRoomPrice7(String roomPrice7) {
		this.roomPrice7 = roomPrice7;
	}

	public int getRoomPeople7() {
		return roomPeople7;
	}

	public void setRoomPeople7(int roomPeople7) {
		this.roomPeople7 = roomPeople7;
	}

	public String getRoomType8() {
		return roomType8;
	}

	public void setRoomType8(String roomType8) {
		this.roomType8 = roomType8;
	}

	public int getRoomCount8() {
		return roomCount8;
	}

	public void setRoomCount8(int roomCount8) {
		this.roomCount8 = roomCount8;
	}

	public String getRoomPrice8() {
		return roomPrice8;
	}

	public void setRoomPrice8(String roomPrice8) {
		this.roomPrice8 = roomPrice8;
	}

	public int getRoomPeople8() {
		return roomPeople8;
	}

	public void setRoomPeople8(int roomPeople8) {
		this.roomPeople8 = roomPeople8;
	}

	public String getRoomType9() {
		return roomType9;
	}

	public void setRoomType9(String roomType9) {
		this.roomType9 = roomType9;
	}

	public int getRoomCount9() {
		return roomCount9;
	}

	public void setRoomCount9(int roomCount9) {
		this.roomCount9 = roomCount9;
	}

	public String getRoomPrice9() {
		return roomPrice9;
	}

	public void setRoomPrice9(String roomPrice9) {
		this.roomPrice9 = roomPrice9;
	}

	public int getRoomPeople9() {
		return roomPeople9;
	}

	public void setRoomPeople9(int roomPeople9) {
		this.roomPeople9 = roomPeople9;
	}

	@Override
	public String toString() {
		return "Registration [cId=" + cId + ", contentId=" + contentId + ", sellerType=" + sellerType + ", companyNum="
				+ companyNum + ", personalNum=" + personalNum + ", companyName=" + companyName + ", companyPhone="
				+ companyPhone + ", companyAddress=" + companyAddress + ", mId=" + mId + ", term=" + term + ", status="
				+ status + ", rId=" + rId + ", roomType1=" + roomType1 + ", roomCount1=" + roomCount1 + ", roomPrice1="
				+ roomPrice1 + ", roomPeople1=" + roomPeople1 + ", roomType2=" + roomType2 + ", roomCount2="
				+ roomCount2 + ", roomPrice2=" + roomPrice2 + ", roomPeople2=" + roomPeople2 + ", roomType3="
				+ roomType3 + ", roomCount3=" + roomCount3 + ", roomPrice3=" + roomPrice3 + ", roomPeople3="
				+ roomPeople3 + ", roomType4=" + roomType4 + ", roomCount4=" + roomCount4 + ", roomPrice4=" + roomPrice4
				+ ", roomPeople4=" + roomPeople4 + ", roomType5=" + roomType5 + ", roomCount5=" + roomCount5
				+ ", roomPrice5=" + roomPrice5 + ", roomPeople5=" + roomPeople5 + ", roomType6=" + roomType6
				+ ", roomCount6=" + roomCount6 + ", roomPrice6=" + roomPrice6 + ", roomPeople6=" + roomPeople6
				+ ", roomType7=" + roomType7 + ", roomCount7=" + roomCount7 + ", roomPrice7=" + roomPrice7
				+ ", roomPeople7=" + roomPeople7 + ", roomType8=" + roomType8 + ", roomCount8=" + roomCount8
				+ ", roomPrice8=" + roomPrice8 + ", roomPeople8=" + roomPeople8 + ", roomType9=" + roomType9
				+ ", roomCount9=" + roomCount9 + ", roomPrice9=" + roomPrice9 + ", roomPeople9=" + roomPeople9 + "]";
	}



	
}
