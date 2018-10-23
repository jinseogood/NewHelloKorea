package com.kh.hello.admin.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class SalesStatistics implements java.io.Serializable{
    private String term;
    private int sales;
    private int profit;
    
    public SalesStatistics(){}
    
	public SalesStatistics(String term, int sales, int profit) {
		super();
		this.term = term;
		this.sales = sales;
		this.profit = profit;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getProfit() {
		return profit;
	}

	public void setProfit(int profit) {
		this.profit = profit;
	}

	@Override
	public String toString() {
		return "SalesStatistics [term=" + term + ", sales=" + sales + ", profit=" + profit + "]";
	}
 
}
