package com.kh.hello.admin.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class NationalStatistics implements java.io.Serializable{
	private String national;
	private int count;
	
	public NationalStatistics(){}
	
	public NationalStatistics(String national, int count) {
		super();
		this.national = national;
		this.count = count;
	}

	public String getNational() {
		return national;
	}

	public void setNational(String national) {
		this.national = national;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "nationalStatistics [national=" + national + ", count=" + count + "]";
	}
	
	

}
