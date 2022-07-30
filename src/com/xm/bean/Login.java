package com.xm.bean;

public class Login {
	private String id;
	private String pwd;
	private Integer status;

	public Login() {
	}

	public Login(String id, String pwd, Integer status) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public String getPwd() {
		return pwd;
	}

	public Integer getStatus() {
		return status;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Login [id=" + id + ", pwd=" + pwd + ", status=" + status + "]";
	}

}
