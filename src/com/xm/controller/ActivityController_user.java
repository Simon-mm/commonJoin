package com.xm.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.xm.bean.Activity;
import com.xm.bean.SignActForm;
import com.xm.service.ActivityService;
import com.xm.service.ClubService;

@Controller
public class ActivityController_user {

	@Autowired
	private ActivityService actService;

	@Autowired
	private ClubService clubService;

	// 在项目启动首页预加载时，使用ajax异步请求获取到数据库中所有的社团信息，并返回给前端
	@RequestMapping(value = "/showAllActsInfo", produces = { "text/html;charset=UTF-8" })
	@ResponseBody
	public String showAllActsInfo() {
		List<Activity> actlist = actService.selectAllActsRegister();
		String jsonStr = JSON.toJSONString(actlist);
		System.out.println("将获取到的活动列表转为JSON字符串：" + jsonStr);
		return jsonStr;
	}

	// 查询用户已报名或者已参加过的活动
	@RequestMapping("/showActOfWho")
	public String myActivity(String uid, Model model) {
		Activity act = null;
		int num = 0, i;
		Date nowTime = new Date();
		List<SignActForm> form = actService.selectActSignByUid(uid);// 查询出某人正在报名或已经报名成功的社团申请信息
		List<Activity> act_list = new ArrayList<Activity>();// 用来保存上一句查询出来申请信息所对应的详细社团信息
		List<Integer> countMember = new ArrayList<Integer>();// 统计各活动报名成功了的总人数，为后续限制报名人数行个方便
		List<Integer> actStatus = new ArrayList<Integer>();// 保存活动进行的状态 （0.表示活动发布中，是可报名的；1.表示活动进行中，不可报名；2.活动已经结束

		for (SignActForm f : form) {
			i = 0;// 默认活动发布中
			act = actService.selectActById(f.getActid());
			num = actService.countMemberOfAct(f.getActid());

			if (nowTime.getTime() < act.getActStart().getTime())
				i = 0;// 活动发布中
			else if (nowTime.getTime() > act.getActStart().getTime() && nowTime.getTime() < act.getActEnd().getTime())
				i = 1;// 活动进行中，不可报名
			else
				i = 2;// 活动已结束

			countMember.add(num);
			act_list.add(act);
			actStatus.add(i);
			System.out.println("查询出来的社团社团id有：" + f.getActid());
		}

		System.out.println("act_list=" + act_list);
		model.addAttribute("act_ofWho", act_list);
		model.addAttribute("num", countMember);
		model.addAttribute("form_status", form);
		model.addAttribute("actStatus", actStatus);
		return "user/acts_whoJoin";
	}

	// 查询已发布成功的全部活动
	@RequestMapping("/queryAllActsAsUser")
	public String queryAllActsAsUser(String uid, Model model) {
		int i, j, num;
		Date nowTime = new Date();// 获取当前时间
		SignActForm saf = null;
		List<Activity> actlist = actService.selectAllActsRegister();// 发布成功的所有社团的所有活动
		List<Integer> isJoin = new ArrayList<Integer>();// 判断用户是否已报名此活动以及判断用户是否能够报名此活动（活动可分为校级和内部）
		List<Integer> joinedNum = new ArrayList<Integer>();// 保存每个活动已报名的人数
		List<Integer> actStatus = new ArrayList<Integer>();// 保存活动进行的状态 （0.表示活动发布中，是可报名的；1.表示活动进行中，不可报名；2.活动已经结束
		// 先判断用户是否已报名？如果未报名，需要判断是否符合报名条件？
		// 一共是4种情况:1.已报名；0：未报名，需再次判断：若可以报，且还有名额则为0，否则为3；不可报名，则为2；
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
			saf = actService.selectActSignByUidAndAid(uid, act.getActID());
			num = actService.countMemberOfAct(act.getActID());
			if (saf != null && saf.getFinished() == 1)// warning：如果saf为空，可能会出错
				i = 1;
			// 未报名：活动范围是社团内部，且在社团报名表中没有用户的入团信息
			if (i == 0 && act.getScope() == 0 && !clubService.getClubSignByUidAndCid(uid,
					clubService.getClubByName(act.getOrganizer()).getId())) {
				i = 2;
			} else if (num == act.getActNum())// 如果已经报名，则不考虑人数限额问题了
				i = 3;

//			System.out.println("是否为社团成员？"
//					+ clubService.getClubSignByUidAndCid(uid, clubService.getClubByName(act.getOrganizer()).getId()));
//			System.out.println("i的值：" + i);
			isJoin.add(i);
			joinedNum.add(num);
			actStatus.add(j);
		}
		model.addAttribute("actlist", actlist);
//		model.addAttribute("jsonStr", JSON.toJSONString(actlist));
		model.addAttribute("isJoin", isJoin);
		model.addAttribute("actStatus", actStatus);
		model.addAttribute("joinNum", joinedNum);
		System.out.println("actlist" + actlist);
		return "user/acts_list";
	}

	// 普通用户查看某社团发布的活动，只能是已成功发布的活动
	@RequestMapping("/showActOfClub")
	public String showAct(@RequestParam(value = "name", defaultValue = "null") String name, Model model) {
		List<Activity> act = null;
		if (name != null) {// 如果是从某一社团点击进入，查看的是该社团的活动
			System.out.println("name = " + name);
			act = actService.selectSomeActNewsByClub(name);
		} else {// 否则，就是所有社团举办过的活动
			System.out.println("name空值");
			act = actService.selectAllActs();
		}
		model.addAttribute("actInfo", act);
		return "user/activity_List";
	}

	// 判断是否重复报名同一个活动
	@RequestMapping("/isSignAgain")
	public boolean isSignAgain(String uid, String actid) {
		System.out.println("chongfu ?");
		if (actService.selectActByUidAndAid(uid, actid))
			return true;
		return false;
	}

	// 跳转到报名活动页面
	@RequestMapping("/toSignAct")
	public String signAct(String uid, String actid, Model model) {
		System.out.println("正在跳转到活动报名页面……");
		Activity act = actService.selectActById(actid);
		if (act != null)
			model.addAttribute("activity", act);
		System.out.println(act);
		return "user/activity_sign";
	}

	// 将报名信息添加到数据库表中
	@ResponseBody
	@RequestMapping("/sendActSignApply")
	public boolean sendApply(String uid, String actid, String remarks, Model model) {
		System.out.println("活动报名申请提交中……" + uid + actid);

		if (actService.selectActByUidAndAid(uid, actid)) { // 如果数据库表中已经存在这样的元组，则直接修改最近一次的申请状态；否则，添加新的申请信息
			int i = actService.updateSignStatusWithRemarks(uid, actid, 0, remarks);
			if (i == 1) // 判断是否修改申请状态成功
				return true;
			else
				return false;
		} else {
			SignActForm actForm = new SignActForm(uid, actid, 0, remarks, 1);
			if (actService.addSignActForm(actForm)) // 判断是否添加申请信息成功
				return true;
			else
				return false;
		}
	}

	// 显示活动报名申请的处理结果
	@RequestMapping("/showActSignResult")
	public String resultOfActSign(String uid, Model model) {
		List<SignActForm> result_list = actService.selectActSignByUid(uid);
		List<String> cname = new ArrayList<String>();
		for (SignActForm saf : result_list) {// 将活动名称循环存入list集合中
			cname.add(actService.selectActById(saf.getActid()).getActName());
		}
		model.addAttribute("actName", cname);
		model.addAttribute("result", result_list);
		return "user/actSignApplyResult";
	}

	/**
	 * 更换前端风格后的请求处理
	 */

	// 获取社团详细显示给前端
	@RequestMapping("/activityDetail")
	public String actDetail(String actid, Model model) {
		model.addAttribute("actInfo", actService.selectActById(actid));
		return "forward:/html/activityDetail.jsp";
	}

}
