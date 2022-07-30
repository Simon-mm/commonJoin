package com.xm.bean;

import java.util.Date;

public class Club {
	private String id;
	private String clubName;
	private String president;
	private String secretary;
	private String type;
	private Integer number;
	private String instructor;
	private Date createDate;
	private String introduction;
	private Integer status;

	public Club() {
	}

	public Club(String id, String clubName, String president, String secretary, String type, Integer number,
			String instructor, Date createDate, String introduction, Integer status) {
		super();
		this.id = id;
		this.clubName = clubName;
		this.president = president;
		this.secretary = secretary;
		this.type = type;
		this.number = number;
		this.instructor = instructor;
		this.createDate = createDate;
		this.introduction = introduction;
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public String getClubName() {
		return clubName;
	}

	public String getPresident() {
		return president;
	}

	public String getSecretary() {
		return secretary;
	}

	public Integer getNumber() {
		return number;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
	}

	public void setPresident(String president) {
		this.president = president;
	}

	public void setSecretary(String secretary) {
		this.secretary = secretary;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Club [id=" + id + ", clubName=" + clubName + ", president=" + president + ", secretary=" + secretary
				+ ", type=" + type + ", number=" + number + ", instructor=" + instructor + ", createDate=" + createDate
				+ ", introduction=" + introduction + ", status=" + status + "]";
	}
}
