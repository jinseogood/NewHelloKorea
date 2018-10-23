package com.kh.hello.board.model.vo;

public class Point {

	private int p_id;
	private String p_type;
	private String p_date;
	private int amount;
	private int m_id;
	private int pd_id;
	private int reply_id;
	private String pa_type;
	private int help_count;
	
	public Point(int p_id, String p_type, String p_date, int amount, int m_id, int pd_id, int reply_id, String pa_type,
			int help_count) {
		super();
		this.p_id = p_id;
		this.p_type = p_type;
		this.p_date = p_date;
		this.amount = amount;
		this.m_id = m_id;
		this.pd_id = pd_id;
		this.reply_id = reply_id;
		this.pa_type = pa_type;
		this.help_count = help_count;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getP_type() {
		return p_type;
	}

	public void setP_type(String p_type) {
		this.p_type = p_type;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public int getPd_id() {
		return pd_id;
	}

	public void setPd_id(int pd_id) {
		this.pd_id = pd_id;
	}

	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public String getPa_type() {
		return pa_type;
	}

	public void setPa_type(String pa_type) {
		this.pa_type = pa_type;
	}

	public int getHelp_count() {
		return help_count;
	}

	public void setHelp_count(int help_count) {
		this.help_count = help_count;
	}

	@Override
	public String toString() {
		return "Point [p_id=" + p_id + ", p_type=" + p_type + ", p_date=" + p_date + ", amount=" + amount + ", m_id="
				+ m_id + ", pd_id=" + pd_id + ", reply_id=" + reply_id + ", pa_type=" + pa_type + ", help_count="
				+ help_count + "]";
	}
	
}
