package com.xm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xm.bean.Club;
import com.xm.bean.ClubMemberForm;
import com.xm.bean.User;

public interface ClubDao {

	public List<Club> getAllClubs();// 获取已注册的全部社团

	public List<User> getAllMembersOfClub(String id);// 根据社团id找到社团的所有会员

	public Club getClubByName(String name);

	public int countClubNumber(String uid);// 统计某社团的实际人数

	public List<String> getClubNameByUserid(String uid);// 获取某一管理员管理的所有社团

	public List<Club> getClubByLikeName(String name);// 相似查询

	public Club getClubById(String id);

	public List<String> getClubOneJoin(String id);// 获取某用户报名参加的所有社团

	public List<String> getAllClubName();

	public int addClub(Club club);// 新建社团信息，也即注册社团；三种身份都有这个功能

	public List<ClubMemberForm> selectClubApplyByCID(String cid);// 获取申报某社团的成员申请信息列表

	// 查询是否存在某条申请加入社团的报名信息
	public ClubMemberForm getClubSignByUidAndCid(@Param("uid") String uid, @Param("cid") String cid);

	// 修改普通用户报名某一社团的申请状态，这个是由社团管理员操作的，因此备注内容不可修改
	public int updateSignStatus(@Param("uid") String uid, @Param("cid") String cid, @Param("status") int status);

	// 以用户的身份修改申请加入社团的状态，可以重新天填写备注，与上一个方法有所不同
	public int updateSignStatusWithRemarks(@Param("uid") String uid, @Param("cid") String cid,
			@Param("status") int status, @Param("remarks") String remarks);

	public List<ClubMemberForm> getClubSignByUid(String uid);// 显示申请加入社团的处理结果

	public int addSignClubApply(ClubMemberForm clubSign);// 新增加入社团的申请信息到数据库表中

	// 获取某社团成员，以普通用户身份
	public ClubMemberForm getClubSignByUidAndCidAsUser(@Param("uid") String uid, @Param("cid") String cid);

	// 申请注册的用户就是该社团的管理员，此时需要从申请表中获取是自己所在的且是自己管理的社团申请信息
	public List<ClubMemberForm> getClubSignByUidAsAnAdmin(String uid);

	public int updateClub(Club club);// 更新社团信息，可用于编辑社团信息，也可以用于社团的再次注册，修改必要的信息

	public List<Club> getAllClubsWithRegister();// 获取用户视角下的已注册社团列表

	public List<ClubMemberForm> getAllClubRegisterApply();// 获取所有的社团注册信息

	public int updateClubInfoStatus(String cid, int status);// 系统管理员修改社团注册的状态

	public int delClub(String cid);// 注销某社团信息

	public int delClubSignForm(String cid);// 注销社团的同时也要删除社团注册表中的信息

	public List<ClubMemberForm> getClubSignByUidAsUser(String uid);// 根据uid，获取普通用户加入的社团

	public int updateClubMember(String cid, int count);// 更新社团人数

}
