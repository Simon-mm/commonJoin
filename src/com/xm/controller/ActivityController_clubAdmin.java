package com.xm.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xm.bean.Activity;
import com.xm.bean.SignActForm;
import com.xm.service.ActivityService;

@Controller
public class ActivityController_clubAdmin {

	@Autowired
	private ActivityService actService;

	private List<SignActForm> formList = null;

	// 跳转到所管理社团的活动管理页面
	@RequestMapping("/unsolveActSign")
	public String getUnsolveActSign(String name, Model model) {
		List<String> actid = actService.selectActByOrganizer(name);// 获取某社团举办的所有活动
		List<Activity> actList = new ArrayList<Activity>();

		for (String id : actid) {
			actList.add(actService.selectActById(id));// 根据活动id列表获取所有相应的活动信息
		}
		model.addAttribute("actList", actList);
		return "admin_club/act_signApply";
	}

	// 跳转到处理用户申请报名社团活动的界面（Ajax异步请求）
	@RequestMapping("/selectApplyAjax")
	@ResponseBody
	public Integer getSignApplyAjax(String aid) {
		formList = actService.selectUnsolvedActSignApply(aid); // 获取报名某个活动的待处理申请的任务数，并存到全局变量中
		System.out.println(formList);
		return formList.size(); // 返回一个整型数值，表示待处理消息的个数
	}

	// 跳转到处理用户申请报名社团活动的界面
	@RequestMapping("/selectApply")
	public String getSignApply(String aid, Model model) {
		formList = actService.selectUnsolvedActSignApply(aid); // 获取报名某个活动的待处理申请的任务数，并存到全局变量中
		System.out.println(formList + aid);
		model.addAttribute("formList", formList);
		return "admin_club/act_signApplySolve";
	}

	// 处理活动报名的申请
	@RequestMapping("/solveActSignApply")
	public String solveApply(String uid, String aid, String flag, Model model) {
		int status = 0;
		status = "p".equals(flag) ? 1 : 2; // “1”是同意申请，“2”是拒绝申请

		if (actService.selectActByUidAndAid(uid, aid)) {
			System.out.println("执行通过申请处理");
			if (actService.updateSignStatus(uid, aid, status) > 0) {
				model.addAttribute("formList", formList = actService.selectUnsolvedActSignApply(aid));
				return "admin_club/act_signApplySolve";
			}
		}
		return "admin_club/act_signApplySolve";
	}

	// 社团管理员查看社团发布的活动，同时也可以看到未发布的活动
	@RequestMapping("/showClubAct")
	public String showActAsAdmin(String uid, String name, Model model) {
		int i, j, num;
		SignActForm saf = null;
		Date nowTime = new Date();
		List<Activity> actlist = actService.selectSomeActNewsByClub(name);
		List<Integer> countMember = new ArrayList<Integer>();// 统计各活动报名成功了的总人数，为后续限制报名人数行个方便
		List<Integer> actStatus = new ArrayList<Integer>();// 保存活动进行的状态 （0.表示活动发布中，是可报名的；1.表示活动进行中，不可报名；2.活动已经结束
		List<Integer> isJoin = new ArrayList<Integer>();// 判断用户是否已报名此活动以及判断用户是否能够报名此活动（活动可分为校级和内部）
		// 先判断用户是否已报名？如果未报名，需要判断是否符合报名条件？
		// 一共是3种情况:1.已报名；0：未报名，需再次判断：若可以报，且还有名额则为0，否则为3；
		for (Activity act : actlist) {
			i = 0;// 默认用户未报名
			j = 0;// 默认活动发布中

			// 根据活动起止时间与当前时间的比较，判断活动的进度
			if (nowTime.getTime() < act.getActStart().getTime())
				j = 0;
			else if (nowTime.getTime() > act.getActStart().getTime() && nowTime.getTime() < act.getActEnd().getTime())
				j = 1;
			else
				j = 2;

			// 1.判断是否已报名？
			num = actService.countMemberOfAct(act.getActID());
			saf = actService.selectActSignByUidAndAid(uid, act.getActID());
			if (saf != null && saf.getFinished() == 1)// warning：如果saf为空，可能会出错
				i = 1;
			else if (num == act.getActNum())// 如果已经报名，则不考虑人数限额问题了
				i = 3;

			isJoin.add(i);
			actStatus.add(j);
			countMember.add(num);
		}
		model.addAttribute("cname", name);
		model.addAttribute("isJoin", isJoin);
		model.addAttribute("actlist", actlist);
		model.addAttribute("cnum", countMember);
		model.addAttribute("actStatus", actStatus);
		return "admin_club/act_list";
	}

	// 跳转到发布活动的编辑页面
	@RequestMapping("/toEditNewAct")
	public String toEditAct(String cname, Integer flag, Model model) {
		if (flag == 0) {
			model.addAttribute("cname", cname);
			System.out.println("1st time活动边界页面：" + cname);
		} else {
			// 这里的cname指的是活动id
			System.out.println("活动再次申请");
			Activity act = actService.selectActById(cname);
			model.addAttribute("actSend", act);// 将活动发布的信息回显到编辑页面上
			if (act != null)
				model.addAttribute("cname", act.getOrganizer());// 间接获取举办方
		}
		return "admin_club/act_edit";
	}

	// 执行发布活动操作，根据请求参数判断是发布还是保存草稿？
	@ResponseBody
	@RequestMapping("/publishAct")
	public Map<String, String> sendAct(@RequestBody Activity act, String uid) {
		HashMap<String, String> map = new HashMap<String, String>();
		System.out.println("响应体：" + act);
		if (actService.selectActById(act.getActID()) == null) {// 判断原来的记录表中是否含有相同的记录
			// 添加新记录到activityinfo表中
			int i = actService.addActivity(act);
			System.out.println("i=" + i + "添加记录到actinfo中：" + act);
			// 同时也添加到t_user_act表中
			boolean add = actService.addSignActForm(new SignActForm(uid, act.getActID(), 0, "活动申请发布！", 2));
			System.out.println("添加成功？" + add);
			if (i == 1 && add)
				map.put("result", "success");
			else
				map.put("result", "failed");
		} else {// 否则就直接更新原来记录中的申请状态值即可
			act.setIsPass(0);
			int i = actService.updateActInfo(act);
			int j = actService.updateSignStatus(uid, act.getActID(), 0);
			System.out.println("i=" + i + "j=" + j);
			if (i == 1 && j == 1)
				map.put("result", "success");
			else
				map.put("result", "failed");
		}

		return map;
	}

	// 显示社团管理员发布活动申请的处理结果
	@RequestMapping("/showActPublishResult")
	public String showActPublishResult(String uid, Model model) {
		List<SignActForm> saf = actService.selectActPublishApplyByUid(uid);
		List<Activity> act = new ArrayList<Activity>();

		for (SignActForm form : saf) {
			act.add(actService.selectActById(form.getActid()));
		}

		model.addAttribute("applylist", saf);
		model.addAttribute("plist", act);
		return "admin_club/act_publishApplyResult";
	}

}
