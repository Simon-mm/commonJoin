package com.xm.bean;

public class ClubMemberForm {
	private String uid;
	private String cid;
	private String role;
	private Integer limit;
	private Integer status;
	private String remarks;

	public ClubMemberForm() {
	}

	public ClubMemberForm(String uid, String cid, String role, Integer limit, Integer status, String remarks) {
		super();
		this.uid = uid;
		this.cid = cid;
		this.role = role;
		this.limit = limit;
		this.status = status;
		this.remarks = remarks;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getUid() {
		return uid;
	}

	public String getCid() {
		return cid;
	}

	public String getRole() {
		return role;
	}

	public Integer getLimit() {
		return limit;
	}

	public Integer getStatus() {
		return status;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ClubMemberForm [uid=" + uid + ", cid=" + cid + ", role=" + role + ", limit=" + limit + ", status="
				+ status + ", remarks=" + remarks + "]";
	}

}
