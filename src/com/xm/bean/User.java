package com.xm.bean;

public class User {
	private String id;
	private String name;
	private String nickname;
	private Integer gender;
	private Integer limit;
	private String password;
	private String institute;
	private String major;
	private String year;
	private String club;
	private String role;
	private String tel;
	private String email;

	public User() {
	}

	public User(String id, String name, String nickname, Integer gender, Integer limit, String password,
			String institute, String major, String year, String club, String role, String tel, String email) {
		super();
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.gender = gender;
		this.limit = limit;
		this.password = password;
		this.institute = institute;
		this.major = major;
		this.year = year;
		this.club = club;
		this.role = role;
		this.tel = tel;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getNickname() {
		return nickname;
	}

	public Integer getGender() {
		return gender;
	}

	public Integer getLimit() {
		return limit;
	}

	public String getPassword() {
		return password;
	}

	public String getInstitute() {
		return institute;
	}

	public String getMajor() {
		return major;
	}

	public String getYear() {
		return year;
	}

	public String getClub() {
		return club;
	}

	public String getRole() {
		return role;
	}

	public String getTel() {
		return tel;
	}

	public String getEmail() {
		return email;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setInstitute(String institute) {
		this.institute = institute;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public void setClub(String club) {
		this.club = club;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", nickname=" + nickname + ", gender=" + gender + ", limit="
				+ limit + ", password=" + password + ", institute=" + institute + ", major=" + major + ", year=" + year
				+ ", club=" + club + ", role=" + role + ", tel=" + tel + ", email=" + email + "]";
	}

}
