package com.kh.hello.admin.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class InterestStatistics implements java.io.Serializable{
    private String interest;
    private int count;
    
    public InterestStatistics(){}

	public InterestStatistics(String interest, int count) {
		super();
		this.interest = interest;
		this.count = count;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "InterestStatistics [interest=" + interest + ", count=" + count + "]";
	}
    
    
}
