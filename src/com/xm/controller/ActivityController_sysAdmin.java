package com.xm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xm.bean.Activity;
import com.xm.bean.SignActForm;
import com.xm.service.ActivityService;

@Controller
public class ActivityController_sysAdmin {

	@Autowired
	private ActivityService actService;

	/**
	 * 系统管理员的消息通知管理
	 */
	// 进入到活动消息审核处理页面
	@RequestMapping("/unsolvedActApply")
	public String unsolvedActApply(Model model) {
		// 所谓的活动申请，申请人一定是活动的管理者；
		List<SignActForm> applylist = actService.selectAllActApply();
		List<Activity> act = new ArrayList<Activity>();// 用于存放活动申请信息表中对应活动信息表的信息
		for (SignActForm saf : applylist) {// 事实上，活动只能由一名管理员来申请
			act.add(actService.selectActById(saf.getActid()));
		}
		model.addAttribute("actlist", act);
		model.addAttribute("applylist", applylist);
		System.out.println("活动申请信息：" + applylist);
		System.out.println("活动详细表" + act);
		return "admin/act_publishApplySolve";
	}

	// 处理活动的申请发布信息
	@RequestMapping("/solvedActApply")
	public String solveActApply(String uid, String aid, String flag, Model model) {
		int status = "p".equals(flag) ? 1 : 2;// 根据传来的flag判断是通过or拒绝

		if (actService.selectActByUidAndAid(uid, aid)) {// 如果查找成功，则修改t_user_act发布活动的申请状态以及activity表活动的状态
			int i = actService.updateSignStatus(uid, aid, status);
			int j = actService.updateActInfoPassStatus(aid, status);
			if (i == 1 && j == 1) {
				unsolvedActApply(model);
				System.out.println("申请处理中……");
			}

		}
		return "admin/act_publishApplySolve";
	}
}
