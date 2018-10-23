package com.kh.hello.admin.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class CompanyRegistStatistics implements java.io.Serializable{
    private String month;
    private int registCount;
    private int approvalCount;
    private int terminateCount;
    
    public CompanyRegistStatistics(){}

	public CompanyRegistStatistics(String month, int registCount, int approvalCount, int terminateCount) {
		super();
		this.month = month;
		this.registCount = registCount;
		this.approvalCount = approvalCount;
		this.terminateCount = terminateCount;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getRegistCount() {
		return registCount;
	}

	public void setRegistCount(int registCount) {
		this.registCount = registCount;
	}

	public int getApprovalCount() {
		return approvalCount;
	}

	public void setApprovalCount(int approvalCount) {
		this.approvalCount = approvalCount;
	}

	public int getTerminateCount() {
		return terminateCount;
	}

	public void setTerminateCount(int terminateCount) {
		this.terminateCount = terminateCount;
	}

	@Override
	public String toString() {
		return "CompanyRegistStatistics [month=" + month + ", registCount=" + registCount + ", approvalCount="
				+ approvalCount + ", terminateCount=" + terminateCount + "]";
	}
    
    
}
