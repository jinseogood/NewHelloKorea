package com.kh.hello.board.model.vo;

public class Report implements java.io.Serializable{
	private int r_record_id;
	private String reason;
	private String r_date;
	private int r_level;
	private String m_id;
	private int r_target;
	private int ref_id;
	private String result;
	
	public Report(){}

	public Report(int r_record_id, String reason, String r_date, int r_level, String m_id, int r_target, int ref_id,
			String result) {
		super();
		this.r_record_id = r_record_id;
		this.reason = reason;
		this.r_date = r_date;
		this.r_level = r_level;
		this.m_id = m_id;
		this.r_target = r_target;
		this.ref_id = ref_id;
		this.result = result;
	}

	public int getR_record_id() {
		return r_record_id;
	}

	public void setR_record_id(int r_record_id) {
		this.r_record_id = r_record_id;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public int getR_level() {
		return r_level;
	}

	public void setR_level(int r_level) {
		this.r_level = r_level;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getR_target() {
		return r_target;
	}

	public void setR_target(int r_target) {
		this.r_target = r_target;
	}

	public int getRef_id() {
		return ref_id;
	}

	public void setRef_id(int ref_id) {
		this.ref_id = ref_id;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "Report [r_record_id=" + r_record_id + ", reason=" + reason + ", r_date=" + r_date + ", r_level="
				+ r_level + ", m_id=" + m_id + ", r_target=" + r_target + ", ref_id=" + ref_id + ", result=" + result
				+ "]";
	}
	
}
