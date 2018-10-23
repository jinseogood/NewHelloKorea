package com.kh.hello.common;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Attachment implements java.io.Serializable{
	private int fId;
	private String filePath;
	private String originName;
	private String changeName;
	private Date uploadDate;
	private int aLevel;
	private int refId;
	private String status;
	
	public Attachment(){}

	public Attachment(int fId, String filePath, String originName, String changeName, Date uploadDate, int aLevel,
			int refId, String status) {
		super();
		this.fId = fId;
		this.filePath = filePath;
		this.originName = originName;
		this.changeName = changeName;
		this.uploadDate = uploadDate;
		this.aLevel = aLevel;
		this.refId = refId;
		this.status = status;
	}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getaLevel() {
		return aLevel;
	}

	public void setaLevel(int aLevel) {
		this.aLevel = aLevel;
	}

	public int getRefId() {
		return refId;
	}

	public void setRefId(int refId) {
		this.refId = refId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [fId=" + fId + ", filePath=" + filePath + ", originName=" + originName + ", changeName="
				+ changeName + ", uploadDate=" + uploadDate + ", aLevel=" + aLevel + ", refId=" + refId + ", status="
				+ status + "]";
	}
	
}
