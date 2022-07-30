package com.xm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xm.bean.Login;
import com.xm.bean.User;
import com.xm.service.ActivityService;
import com.xm.service.UserService;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private ActivityService actService;

	// 启动本系统时，会处理该请求跳转到主页面
	@RequestMapping("/goToIndex")
	public String toIndexPage(Model model) {
		System.out.println("跳转……");
		model.addAttribute("stkx", actService.selectAllActsRegister());
		return "forward:/indexPage3.jsp";
	}

	// 登录信息验证
	@RequestMapping("/logged")
	public String isLogged(@RequestParam("username") String id, @RequestParam("userpass") String pwd,
			HttpSession session, Model model) {
		System.out.println("id=" + id + "  pwd =" + pwd);
		Login user = userService.getUser(id, pwd);
		String backURL = "";

		// 权限不同，跳转至不同页面
		if (user != null && user.getStatus() == 1) {
			backURL = "user/user";
		} else if (user != null && user.getStatus() == 2) {
			backURL = "admin_club/admin_club";
		} else if (user != null && user.getStatus() == 3) {
			backURL = "admin/admin";
		} else {
			backURL = "forward:/login.jsp";
			model.addAttribute("result", "error");
		}
		// 原来用的是session；改进：把用户信息存入application对象中，只要服务器不关闭或者不注销登录，就不会丢失里面的属性值
		session.getServletContext().setAttribute("login", user);
		return backURL;
	}

	// 点击欢迎登录某某某，显示用户信息
	@RequestMapping("/login")
	public String userInfo(Integer status) {
		if (status == 1)
			return "user/user";
		else if (status == 2)
			return "admin_club/admin_club";
		else if (status == 3)
			return "admin/admin";
		else
			return "error";
	}

	// 注销登录
	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session) {
		session.getServletContext().removeAttribute("login");
		session.removeAttribute("clubname");
		return "redirect:/index.jsp";
	}

	// 添加新用户，默认都是普通用户
	@RequestMapping("/addUser")
	public String addNewUser(User user) {
		return "";
	}

	// 跳转到修改用户信息的界面
	@RequestMapping("/toModify")
	public String jumpToModifyPage(String id, Model model) {
		User user = userService.getUserByID(id);
//		List<String> club_names = clubService.getClubOneJoin(id);
		if (user != null) {
			model.addAttribute("login", user);
//			model.addAttribute("clubs", club_names);
			System.out.println("要修改的用户为：" + user);
			return "forward:/admin/memberInfo.jsp";
		} else
			return "error";
	}

	// 修改用户信息，并保存到数据库中
	@RequestMapping("/MemberInfoUpdate")
	public String modifyInfo(@ModelAttribute("login") User user, Model model) {
		System.out.println("========修改后的用户为：" + user);
		if (userService.updateUser(user) == 1) {
			System.out.println("*********修改成功!!!********");
			model.addAttribute("login", user);
			model.addAttribute("modify", "success");
			// 注意，下面这里与redirect的不同，redirect则不传递参数；而请求转发可以！
			return "forward:/admin/memberInfo.jsp";
		} else {
			model.addAttribute("login", user);
			model.addAttribute("modify", "failed");
			return "forward:/admin/memberInfo.jsp";
		}
	}

	// 显示所有用户信息
	@RequestMapping("/display")
	public String getAllUsers(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "flag", defaultValue = "null") String flag,
			@RequestParam(value = "keyword", defaultValue = "null") String name, Model model) {

		String find_ones = "no"; // 用于返回搜索指定社团名称是否成功的标志变量

		if ("not_all".equals(flag) && name != null) {
			User user = userService.getUserByName(name);
			if (user != null)
				find_ones = "yes";
			model.addAttribute("user_ones", user);
			model.addAttribute("find_ones", find_ones);
		} else {
			PageHelper.startPage(pn, 10);
			List<User> user_list = userService.getAll();
			PageInfo<User> user_info = new PageInfo<User>(user_list, 10);

			if (user_list != null)
				model.addAttribute("msg", "success");
			else
				model.addAttribute("msg", "failed");

			model.addAttribute("members", user_list);
			model.addAttribute("user_page", user_info);
		}

		return "admin/user_list";
	}

	// 删除指定的用户信息【注意：这里的删除相当于注销用户的登录，而不删除原来的学籍信息
	@RequestMapping("/deleteUser")
	public String delUser(String id, Model model) {
		if (userService.delLogin(id) == 1)
			model.addAttribute("del", "success");
		else
			model.addAttribute("del", "failed");
		return "redirect:/display";
	}

	// 个人信息管理请求处理
	@RequestMapping("/info")
	public String infoManage() {
		return "forward:/admin/memberInfo.jsp";
	}

	// 修改个人登录密码
	@RequestMapping("/toReset")
	public String jumpToResetPwd(String id, Model model) {
		Login user = userService.getLoginByID(id);
		model.addAttribute("login", user);
		return "admin/reset_pwd";
	}

	@ResponseBody // 使用ajax异步请求，必须加上此注解
	@RequestMapping("/reset")
	public boolean resetPwd(String id, String pwd, String opwd) {
		if (userService.getUser(id, opwd) != null)
			return userService.resetPwd(id, pwd);
		else
			return false;
	}

	// 用户点击进入，查看社团详情
	@RequestMapping("/clickToClub")
	public ModelAndView clickToClub(String name, Model model, HttpSession session) {
		System.out.println(name);
		session.setAttribute("clubname", name);
		return new ModelAndView("user/user");
	}

	// 用户注册功能：查询登录表中是否存在已知账号，若有，可直接登录，不可重复注册
	@ResponseBody
	@RequestMapping("/isExistedUid")
	public boolean isExistedUid(String uid) {
		System.out.println("存在？");
		if (userService.getLoginByID(uid) != null)
			return true;// 存在此账号
		System.out.println("不存在");
		return false;// 不存在此账号
	}

	// 执行用户注册操作
	@ResponseBody
	@RequestMapping("/toRegister")
	public boolean doRegister(String uid, String pwd, Model model) {
		System.out.println("注册成功？");
		if (userService.getUserByID(uid) != null && userService.addNewLoginer(uid, pwd) == 1) {
			return true;
		}
		System.out.println("注册失败！");
		return false;
	}

	// 提前获取所有社团信息
//	@ModelAttribute
//	public void getAllNameOfClubs(Model model) {
//		List<String> club_name = clubService.getAllNames();
//		model.addAttribute("clubNames", club_name);
//		for (String name : club_name) {
//			System.out.println(name);
//		}
//		System.out.println("--------获取所有社团的名称--------");
//	}

}
