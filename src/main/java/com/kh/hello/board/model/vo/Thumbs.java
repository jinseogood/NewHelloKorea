package com.kh.hello.board.model.vo;

public class Thumbs { 
	private int t_id;
	private int m_id;
	private int t_type;
	private int t_target;
	private int ref_id;
	private String status;
	
	public Thumbs(){}

	public Thumbs(int t_id, int m_id, int t_type, int t_target, int ref_id, String status) {
		super();
		this.t_id = t_id;
		this.m_id = m_id;
		this.t_type = t_type;
		this.t_target = t_target;
		this.ref_id = ref_id;
		this.status = status;
	}

	public int getT_id() {
		return t_id;
	}

	public void setT_id(int t_id) {
		this.t_id = t_id;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public int getT_type() {
		return t_type;
	}

	public void setT_type(int t_type) {
		this.t_type = t_type;
	}

	public int getT_target() {
		return t_target;
	}

	public void setT_target(int t_target) {
		this.t_target = t_target;
	}

	public int getRef_id() {
		return ref_id;
	}

	public void setRef_id(int ref_id) {
		this.ref_id = ref_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Thumbs [t_id=" + t_id + ", m_id=" + m_id + ", t_type=" + t_type + ", t_target=" + t_target + ", ref_id="
				+ ref_id + ", status=" + status + "]";
	}
	
}
