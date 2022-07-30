package com.xm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xm.bean.Activity;
import com.xm.bean.SignActForm;
import com.xm.dao.ActivityDao;

@Service
public class ActivityService {

	@Autowired
	private ActivityDao actDao;

	public List<Activity> selectAllActs() {
		return actDao.selectAllActs();
	}

	public List<Activity> selectSomeActNewsByClub(String clubName) {
		return actDao.selectSomeActNewsByClub(clubName);
	}

	public Activity selectActById(String actId) {
		return actDao.selectActById(actId);
	}

	public int addActivity(Activity act) {
		return actDao.addActivity(act);
	}

	public int delActivity(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public boolean selectActByUidAndAid(String uid, String actid) {
		if (actDao.selectActByUidAndAid(uid, actid) != null)
			return true;
		return false;
	}

	public boolean addSignActForm(SignActForm actForm) {
		if (actDao.addSignActForm(actForm) == 1)
			return true;
		return false;
	}

	public List<String> selectActByOrganizer(String cname) {
		return actDao.selectActByOrganizer(cname);
	}

	public List<SignActForm> selectUnsolvedActSignApply(String aid) {
		return actDao.selectUnsolvedActSignApply(aid);
	}

	public int updateSignStatus(String uid, String aid, int status) {
		return actDao.updateStatus(uid, aid, status);
	}

	public int updateSignStatusWithRemarks(String uid, String aid, int status, String remarks) {
		return actDao.updateSignStatusWithRemarks(uid, aid, status, remarks);
	}

	public List<Activity> selectActByUid(String uid) {
		return actDao.selectActByUid(uid);
	}

	public List<SignActForm> selectActSignByUid(String uid) {
		return actDao.selectActSignByUid(uid);
	}

	public List<SignActForm> selectAllActApply() {
		return actDao.selectAllActApply();
	}

	public SignActForm selectActPublishApplyByUidAndAid(String uid, String aid) {
		return actDao.selectActPublishApplyByUidAndAid(uid, aid);
	}

	public int updateActInfoPassStatus(String aid, int status) {
		return actDao.updateActInfoPassStatus(aid, status);
	}

	public List<SignActForm> selectActPublishApplyByUid(String uid) {
		return actDao.selectActPublishApplyByUid(uid);
	}

	public int updateActInfo(Activity act) {
		return actDao.updateAct(act);
	}

	public Integer countMemberOfAct(String actid) {
		return actDao.countMemberOfAct(actid);
	}

	public List<Activity> selectAllActsRegister() {
		return actDao.selectAllActsRegister();
	}

	public SignActForm selectActSignByUidAndAid(String uid, String aid) {
		return actDao.selectActSignByUidAndAid(uid, aid);

	}

}
