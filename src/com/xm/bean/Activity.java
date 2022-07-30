package com.xm.bean;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Activity {
	private String actID;
	private String actName;
	@JSONField(format = "yyyy-MM-dd HH:mm")
	private Date actStart;
	@JSONField(format = "yyyy-MM-dd HH:mm")
	private Date actEnd;
	private String actPlace;
	private String actAttempt;
	private Integer actNum;
	private String organizer;
	private Integer actType;
	private String checker;
	private Double credit;
	private Double cost;
	private Integer isPass;
	private Integer scope;

	public Activity() {
	}

	public Activity(String actID, String actName, Date actStart, Date actEnd, String actPlace, String actAttempt,
			Integer actNum, String organizer, Integer actType, String checker, Double credit, Double cost,
			Integer isPass, Integer scope) {
		super();
		this.actID = actID;
		this.actName = actName;
		this.actStart = actStart;
		this.actEnd = actEnd;
		this.actPlace = actPlace;
		this.actAttempt = actAttempt;
		this.actNum = actNum;
		this.organizer = organizer;
		this.actType = actType;
		this.checker = checker;
		this.credit = credit;
		this.cost = cost;
		this.isPass = isPass;
		this.scope = scope;
	}

	public String getActID() {
		return actID;
	}

	public String getActName() {
		return actName;
	}

	public Date getActStart() {
		return actStart;
	}

	public Date getActEnd() {
		return actEnd;
	}

	public String getActPlace() {
		return actPlace;
	}

	public String getActAttempt() {
		return actAttempt;
	}

	public Integer getActNum() {
		return actNum;
	}

	public String getOrganizer() {
		return organizer;
	}

	public Integer getActType() {
		return actType;
	}

	public String getChecker() {
		return checker;
	}

	public Double getCredit() {
		return credit;
	}

	public Double getCost() {
		return cost;
	}

	public Integer getIsPass() {
		return isPass;
	}

	public Integer getScope() {
		return scope;
	}

	public void setActID(String actID) {
		this.actID = actID;
	}

	public void setActName(String actName) {
		this.actName = actName;
	}

	public void setActStart(Date actStart) {
		this.actStart = actStart;
	}

	public void setActEnd(Date actEnd) {
		this.actEnd = actEnd;
	}

	public void setActPlace(String actPlace) {
		this.actPlace = actPlace;
	}

	public void setActAttempt(String actAttempt) {
		this.actAttempt = actAttempt;
	}

	public void setActNum(Integer actNum) {
		this.actNum = actNum;
	}

	public void setOrganizer(String organizer) {
		this.organizer = organizer;
	}

	public void setActType(Integer actType) {
		this.actType = actType;
	}

	public void setChecker(String checker) {
		this.checker = checker;
	}

	public void setCredit(Double credit) {
		this.credit = credit;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

	public void setIsPass(Integer isPass) {
		this.isPass = isPass;
	}

	public void setScope(Integer scope) {
		this.scope = scope;
	}

	@Override
	public String toString() {
		return "Activity [actID=" + actID + ", actName=" + actName + ", actStart=" + actStart + ", actEnd=" + actEnd
				+ ", actPlace=" + actPlace + ", actAttempt=" + actAttempt + ", actNum=" + actNum + ", organizer="
				+ organizer + ", actType=" + actType + ", checker=" + checker + ", credit=" + credit + ", cost=" + cost
				+ ", isPass=" + isPass + ", scope=" + scope + "]";
	}
}
