package com.xm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xm.bean.Activity;
import com.xm.bean.SignActForm;

public interface ActivityDao {
	public List<Activity> selectAllActs();// 获取所有社团的所有活动

	public List<Activity> selectSomeActNewsByClub(String clubName);// 获取某个社团的所有活动

	public Activity selectActById(String actId);// 根据id值获取某一活动信息

	// 根据报名用户id和活动id
	public SignActForm selectActByUidAndAid(@Param("uid") String uid, @Param("actid") String actid);

	public List<String> selectActByOrganizer(String organizer);// 根据承办方（即社团名字）查询其所举办的所有活动

	public int addActivity(Activity act);// 社团发布活动动态

	public int delActivity(String id);// 删除社团活动动态

	public int addSignActForm(SignActForm actForm);// 向报名活动申请表中添加新的记录

	public List<SignActForm> selectUnsolvedActSignApply(String aid);// 获取报名某一活动的待处理申请

	// 管理员身份下修改某个用户申请报名某一活动的状态值，此时不涉及备注信息的修改，仅仅是显示出来而已
	public int updateStatus(@Param("uid") String uid, @Param("aid") String aid, @Param("status") int status);

	// 用户身份下修改申请报名活动的信息，可以重新填写备注
	public int updateSignStatusWithRemarks(@Param("uid") String uid, @Param("aid") String aid,
			@Param("status") int status, @Param("remarks") String remarks);

	public List<Activity> selectActByUid(String uid);// 获取当前用户参加过或正在报名的社团

	public List<SignActForm> selectActSignByUid(String uid);// 获取当前用户报名活动的全部申请信息

	public List<SignActForm> selectAllActApply();// 获取所有的活动申请信息

	// 根据uid和aid获取活动发布的申请信息
	public SignActForm selectActPublishApplyByUidAndAid(String uid, String aid);

	public int updateActInfoPassStatus(String aid, int status);// 更新activity表中的某活动的通过状态

	public List<SignActForm> selectActPublishApplyByUid(String uid);// 获取某社团管理员发布活动的所有申请信息

	public int updateAct(Activity act);// 再次申请注册活动，更新注册信息

	public Integer countMemberOfAct(String actid);// 统计某活动报名了总人数，来限制报名人数

	public List<Activity> selectAllActsRegister();// 获取所有申请发布成功的活动

	public SignActForm selectActSignByUidAndAid(String uid, String aid);

}
