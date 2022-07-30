package com.xm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xm.bean.Club;
import com.xm.bean.ClubMemberForm;
import com.xm.bean.User;
import com.xm.dao.ClubDao;

@Service
public class ClubService {

	@Autowired
	private ClubDao clubDao;

	public List<Club> getAll() {
		return clubDao.getAllClubs();
	}

	public List<User> getAllMembersOfClub(String id) {
		return clubDao.getAllMembersOfClub(id);
	}

	public Club getClubById(String id) {
		return clubDao.getClubById(id);
	}

	public Club getClubByName(String name) {
		return clubDao.getClubByName(name);
	}

	public List<String> getClubOneJoin(String id) {
		return clubDao.getClubOneJoin(id);
	}

	public List<String> getAllNames() {
		return clubDao.getAllClubName();
	}

	public List<Club> getClubByLikeName(String name) {
		return clubDao.getClubByLikeName(name);
	}

	public List<String> getClubNameByUserid(String uid) {
		return clubDao.getClubNameByUserid(uid);
	}

	public List<ClubMemberForm> selectClubApplyByCID(String cid) {
		return clubDao.selectClubApplyByCID(cid);
	}

	public boolean getClubSignByUidAndCid(String uid, String cid) {
		if (clubDao.getClubSignByUidAndCid(uid, cid) != null)
			return true;
		return false;
	}

	public ClubMemberForm getCMFByUidAndCid(String uid, String cid) {
		return clubDao.getClubSignByUidAndCid(uid, cid);
	}

	public int updateSignStatus(String uid, String cid, int status) {
		return clubDao.updateSignStatus(uid, cid, status);
	}

	public int updateSignStatusWithRemarks(String uid, String cid, int status, String remarks) {
		return clubDao.updateSignStatusWithRemarks(uid, cid, status, remarks);
	}

	public List<ClubMemberForm> getClubSignByUid(String uid) {
		return clubDao.getClubSignByUid(uid);
	}

	public boolean addSignClubApply(ClubMemberForm clubSign) {
		if (clubDao.addSignClubApply(clubSign) == 1)
			return true;
		return false;
	}

	public ClubMemberForm getCMFByUidAndCidAsUser(String uid, String cid) {
		return clubDao.getClubSignByUidAndCidAsUser(uid, cid);
	}

	public int addNewClub(Club club) {
		return clubDao.addClub(club);
	}

	public List<ClubMemberForm> getClubSignByUidAsAdmin(String uid) {
		return clubDao.getClubSignByUidAsAnAdmin(uid);
	}

	public List<ClubMemberForm> getClubSignByUidAsUser(String uid) {
		return clubDao.getClubSignByUidAsUser(uid);
	}

	public int updateClubInfo(Club club) {
		return clubDao.updateClub(club);
	}

	public List<Club> getAllClubsWithRegister() {
		return clubDao.getAllClubsWithRegister();
	}

	public List<ClubMemberForm> getAllClubRegisterApply() {
		return clubDao.getAllClubRegisterApply();
	}

	public int updateClubInfoStatus(String cid, int status) {
		return clubDao.updateClubInfoStatus(cid, status);
	}

	public int delClub(String cid) {
		return clubDao.delClub(cid);
	}

	public int delClubSignForm(String cid) {
		return clubDao.delClubSignForm(cid);
	}

	public void updateClubMember(String cid, int count) {
		int i = clubDao.updateClubMember(cid, count);
		if (i == 1)
			System.out.println("社团人数更新成功！");
		else
			System.out.println("社团人数更新失败！");
	}

}
