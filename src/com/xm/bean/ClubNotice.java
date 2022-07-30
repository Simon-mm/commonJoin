package com.xm.bean;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

public class ClubNotice {
	String cid;
	String noticeid;
	String title;
	String content;
	Integer likes;
	Integer browser;
	Integer status;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm" ,timezone = "GMT+8")
	Date launch;

	public ClubNotice() {
		super();
	}

	public ClubNotice(String uid, String noticeid, String title, String content, Integer likes, Integer browser,
			Integer status, Date launch) {
		super();
		this.cid = uid;
		this.noticeid = noticeid;
		this.title = title;
		this.content = content;
		this.likes = likes;
		this.browser = browser;
		this.status = status;
		this.launch = launch;
	}

	public String getCid() {
		return cid;
	}

	public String getNoticeid() {
		return noticeid;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public Integer getLikes() {
		return likes;
	}

	public Integer getBrowser() {
		return browser;
	}

	public Integer getStatus() {
		return status;
	}

	public Date getLaunch() {
		return launch;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public void setNoticeid(String noticeid) {
		this.noticeid = noticeid;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setLikes(Integer likes) {
		this.likes = likes;
	}

	public void setBrowser(Integer browser) {
		this.browser = browser;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setLaunch(Date launch) {
		this.launch = launch;
	}

	@Override
	public String toString() {
		return "ClubNotice [uid=" + cid + ", noticeid=" + noticeid + ", title=" + title + ", content=" + content
				+ ", likes=" + likes + ", browser=" + browser + ", status=" + status + ", launch=" + launch + "]";
	}

}
