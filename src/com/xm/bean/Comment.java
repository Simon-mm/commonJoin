package com.xm.bean;

import java.util.Date;

public class Comment {

	private String noticeid;
	private String uid;
	private String content;
	private Date ctime;

	public Comment() {
		super();
	}

	public Comment(String noticeid, String uid, String content, Date ctime) {
		super();
		this.noticeid = noticeid;
		this.uid = uid;
		this.content = content;
		this.ctime = ctime;
	}

	public String getNoticeid() {
		return noticeid;
	}

	public String getUid() {
		return uid;
	}

	public String getContent() {
		return content;
	}

	public Date getCtime() {
		return ctime;
	}

	public void setNoticeid(String noticeid) {
		this.noticeid = noticeid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	@Override
	public String toString() {
		return "Comment [noticeid=" + noticeid + ", uid=" + uid + ", content=" + content + ", ctime=" + ctime + "]";
	}
}
