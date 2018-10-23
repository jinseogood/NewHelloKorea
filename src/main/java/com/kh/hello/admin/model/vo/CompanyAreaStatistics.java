package com.kh.hello.admin.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class CompanyAreaStatistics implements java.io.Serializable{
    private String area;
    private int count;
    
    public CompanyAreaStatistics(){}

	public CompanyAreaStatistics(String area, int count) {
		super();
		this.area = area;
		this.count = count;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "CompanyAreaStatistics [area=" + area + ", count=" + count + "]";
	}
    
    
    
}
