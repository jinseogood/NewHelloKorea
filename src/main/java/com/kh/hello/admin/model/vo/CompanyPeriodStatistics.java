package com.kh.hello.admin.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class CompanyPeriodStatistics implements java.io.Serializable{
    private String period;
    private int count;
    
    public CompanyPeriodStatistics(){}

	public CompanyPeriodStatistics(String period, int count) {
		super();
		this.period = period;
		this.count = count;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "CompanyPeriodStatistics [period=" + period + ", count=" + count + "]";
	}
    
    
}
