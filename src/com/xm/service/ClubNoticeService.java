package com.xm.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xm.bean.ClubNotice;
import com.xm.bean.Comment;
import com.xm.dao.NoticeAndNewsDao;

@Service
public class ClubNoticeService {
	@Autowired
	private NoticeAndNewsDao noticeAndNewsDao;

	public ClubNotice getNoticeByNidAndCid(String cid, String noticeid) {
		return noticeAndNewsDao.getNoticeByNidAndCid(cid, noticeid);
	}

	public int addNotice(ClubNotice notice) {
		return noticeAndNewsDao.addNotice(notice);
	}

	public int updateNotice(ClubNotice notice) {
		return noticeAndNewsDao.updateNotice(notice);
	}

	public List<ClubNotice> getAllNotices() {
		return noticeAndNewsDao.getAllNotices();
	}

	public ClubNotice getNoticeByNid(String noticeid) {
		return noticeAndNewsDao.getNoticeByNid(noticeid);
	}

	public List<ClubNotice> getNoticeByCid(String cid) {
		return noticeAndNewsDao.getNoticeByCid(cid);
	}

	public boolean updateNoticeLikesNum(String nid, int likes) {
		if (noticeAndNewsDao.updateNoticeLikesNum(nid, likes) == 1)
			return true;
		return false;
	}

	public List<Comment> getCommentsByNid(String nid) {
		return noticeAndNewsDao.getCommentsByNid(nid);
	}

	public boolean updateNoticeComments(String uid, String nid, String comment, Date date) {
		if (noticeAndNewsDao.updateNoticeComments(uid, nid, comment, date) == 1)
			return true;
		return false;
	}

}
