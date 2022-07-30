package com.xm.dao;

import java.util.Date;
import java.util.List;

import com.xm.bean.ClubNotice;
import com.xm.bean.Comment;

public interface NoticeAndNewsDao {

	public ClubNotice getNoticeByNidAndCid(String cid, String noticeid);// 根据cid，noticeid获取公告信息

	public int addNotice(ClubNotice notice);// 添加公告信息到数据库中（保存notice信息为草稿）

	public int updateNotice(ClubNotice notice);// 更新公告内容，也可以是重新发送原已有的草稿（更新已保存为草稿的notice信息）

	public List<ClubNotice> getAllNotices();// 获取所有的公告信息，以系统管理员身份的话就包括未发布的公告

	public ClubNotice getNoticeByNid(String noticeid);// 根据nid获取公告信息

	public List<ClubNotice> getNoticeByCid(String cid);// 根据cid获取该社团的所有公告

	public int updateNoticeLikesNum(String nid, int likes);// 用户点赞公告后需要更新数据库信息

	public List<Comment> getCommentsByNid(String nid);// 获取某公告附属的评论信息

	// 保存评论公告的信息
	public int updateNoticeComments(String uid, String nid, String comment, Date date);

}
