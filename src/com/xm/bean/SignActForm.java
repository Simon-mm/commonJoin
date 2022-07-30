package com.xm.bean;

public class SignActForm {
	private String uid;
	private String actid;
	private Integer finished;
	private String remarks;
	private Integer limit;

	public SignActForm() {
	}

	public SignActForm(String uid, String actid, Integer finished, String remarks, Integer limit) {
		super();
		this.uid = uid;
		this.actid = actid;
		this.finished = finished;
		this.remarks = remarks;
		this.limit = limit;
	}

	public String getUid() {
		return uid;
	}

	public String getActid() {
		return actid;
	}

	public Integer getFinished() {
		return finished;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public void setActid(String actid) {
		this.actid = actid;
	}

	public void setFinished(Integer finished) {
		this.finished = finished;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	@Override
	public String toString() {
		return "SignActForm [uid=" + uid + ", actid=" + actid + ", finished=" + finished + ", remarks=" + remarks
				+ ", limit=" + limit + "]";
	}

}
