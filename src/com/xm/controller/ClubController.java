package com.xm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xm.bean.Club;
import com.xm.bean.ClubMemberForm;
import com.xm.bean.Login;
import com.xm.bean.User;
import com.xm.service.ClubService;
import com.xm.service.UserService;

@Controller
public class ClubController {

	@Autowired
	private ClubService clubService;
	@Autowired
	private UserService userService;

	List<Club> list = null;
	Club club = null;

	/**
	 * 根据传来的参数，判断是获取所有或者某一社团的信息（社管
	 * 
	 * @param pn    如果没有获取到pn参数的值，则默认当前页数为第一页
	 * @param flag  根据flag可以判断是查询所有信息，还是根据关键字查询指定的信息
	 * @param name  获取要查询信息的关键字
	 * @param model
	 * @return
	 */
	@RequestMapping("/queryAllClubs")
	public String getAllClubs(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "flag", defaultValue = "null") String flag,
			@RequestParam(value = "keyword", defaultValue = "null") String name, String delMsg, Model model) {
		String find_ones = "no"; // 用于返回搜索指定社团名称是否成功的标志变量
		String isNull = "yes";

		if ("not_all".equals(flag) && name != null) {
			PageHelper.startPage(pn, 10);// 查询第pn页，每页10条记录
			list = clubService.getClubByLikeName(name); // 判断查询结果是否为空，若不为空则修改标志变量
			PageInfo<Club> info = new PageInfo<Club>(list, 10);// 将查询出来的结果放到pageInfo中，每次最多显示10页
			if (list != null)
				find_ones = "yes";

			model.addAttribute("page", info);
			model.addAttribute("clubs", list);
			model.addAttribute("find_ones", find_ones);
		} else {
			PageHelper.startPage(pn, 10);// 查询第pn页，每页10条记录
			list = clubService.getAll();
			PageInfo<Club> info = new PageInfo<Club>(list, 10);// 将查询出来的结果放到pageInfo中，每次最多显示10页
			if (list != null)// 如果查询成功，修改标志变量的值
				isNull = "no";

			model.addAttribute("page", info);
			model.addAttribute("clubs", list);
			model.addAttribute("isNull", isNull);
		}
		// 由删除操作成功后又请求转发请求来到这里，需要返回一个delMsg到前端页面
		model.addAttribute("delMsg", delMsg);
		System.out.println(delMsg);
		return "admin/club_list";
	}

	// 以普通用户的身份去获取全部已注册成功的社团
	@RequestMapping("/queryAllClubsAsUser")
	public String queryAllClubsAsUser(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String uid,
			Model model) {
		String isNull = "yes";
		int i = 0;
		List<Integer> joins = new ArrayList<Integer>();
		PageHelper.startPage(pn, 10);// 查询第pn页，每页10条记录
		list = clubService.getAllClubsWithRegister();
		PageInfo<Club> info = new PageInfo<Club>(list, 10);

		if (list != null)// 如果查询成功，修改标志变量的值
			isNull = "no";
		for (Club club : list) {
			i = clubService.getClubSignByUidAndCid(uid, club.getId()) == true ? 1 : 0;
			joins.add(i);// 用于存放当前用户是否报名全部社团的状态
		}

		model.addAttribute("page", info);
		model.addAttribute("club_all", list);
		model.addAttribute("isNull", isNull);
		model.addAttribute("isJoin", joins);
		return "user/clubs_list";
	}

	/**
	 * 根据社团名称获取某一社团的具体信息（社管，系统
	 * 
	 * @param flag
	 * @param keyword
	 * @param mv
	 * @return
	 */
	@RequestMapping("/queryClubInfo")
	public ModelAndView getClubInfo(String flag, String keyword, ModelAndView mv) {
		mv = new ModelAndView();
		club = clubService.getClubById(keyword);
		ClubMemberForm cmf = null;
		List<User> member = clubService.getAllMembersOfClub(keyword);
		List<String> roles = new ArrayList<String>();// 保存某社团成员在社团中的职务

		// 判断：根据社团id号查询出这个社团的所有会员
		if ("club_id".equals(flag) && member != null) {
			for (User user : member) {
				cmf = clubService.getCMFByUidAndCidAsUser(user.getId(), keyword);
				roles.add(cmf.getRole());
			}
			mv.setViewName("admin/club_info");
			mv.addObject("introduction", club.getIntroduction());// 获取社团简介
			mv.addObject("club_name", club.getClubName());// 获取社团的名字
			mv.addObject("club_members", member);
			mv.addObject("club_role", roles);
		} else {
			mv.setViewName("error");
		}
		return mv;
	}

	// 查看某社团成员（用户
	@RequestMapping("/showClubMember_user")
	public String getClubById(String cid, Model model, HttpSession session) {
		List<User> ulist = clubService.getAllMembersOfClub(cid);// 获取某社团的所有成员
		List<Integer> status = new ArrayList<Integer>();// 用于存放每个成员在社团对应的状态
		List<String> role = new ArrayList<String>();// 用于存放每个成员在该社团中的职位

		for (User u : ulist) {
			ClubMemberForm cmf = clubService.getCMFByUidAndCid(u.getId(), cid);
			status.add(cmf.getStatus());
			role.add(cmf.getRole());
		}
		Login login = (Login) session.getServletContext().getAttribute("login");
		System.out.println(login.getId());
		String crole = clubService.getCMFByUidAndCid(login.getId(), cid).getRole();

		// 判断该用户是否为某社团的会长或者团支书。若是，则能够设置其他社团成员为干部（属于社团管理员）
		// 需要向前端传递信息，改变前端操作
		if ("会长".equals(crole) || "团支书".equals(crole)) {
			System.out.println("111");
			model.addAttribute("crole", "admin");
		}System.out.println(login.getId() + "的角色是：" + crole);

		model.addAttribute("club_members", ulist);
		model.addAttribute("isMember", status);
		model.addAttribute("role", role);

		return "user/club_member";
	}

	// 查看管理的社团的信息（用户
	@RequestMapping("/showClubInfo")
	public String showClubInfo(String name, Model model) {
		List<Club> clist = new ArrayList<Club>();
		clist.add(clubService.getClubByName(name));
		System.out.println(clist);
		System.out.println("获取社团信息中");
		model.addAttribute("club", clist);
		return "user/club_info";
	}

	// 查看某社团成员（社管
	@RequestMapping("/showClubMember")
	public String showClubMember(String name, Model model) {
		Club club = clubService.getClubByName(name);
		List<String> roles = new ArrayList<String>();
		List<User> club_members = clubService.getAllMembersOfClub(club.getId());
		for (User u : club_members) {
			roles.add(clubService.getCMFByUidAndCid(u.getId(), club.getId()).getRole());
		}
		model.addAttribute("club_members", club_members);
		model.addAttribute("club_role", roles);
		return "admin/club_info";
	}

	/**
	 * 社团管理模块
	 * 
	 * @return
	 */
	// 跳转到社团注册界面（三种身份均可）
	@RequestMapping("/toRegisterClub")
	public String toRegisterClub(String uid, String cid, Integer flag, Model model) {
		System.out.println("flag = " + flag);
		User user = userService.getUserByID(uid);
		if (user == null)
			return "club_register";
		// 获取当前用户姓名，并返回给目标页面
		if (flag == 0) {// 说明是第一次注册，注册表中没有数据
			model.addAttribute("uname", user.getName());
		} else {// 说明是再次申请，这时需要回显出原来的注册信息
			Club club = clubService.getClubById(cid);
			System.out.println("再次申请的社团注册信息" + club);
			model.addAttribute("clubReg", club);
			model.addAttribute("uname", user.getName());
		}
		return "club_register";
	}

	/**
	 * 提交注册社团的申请，并由管理员审核通过与否（三种身份均可）
	 * 
	 * @param club
	 * @return 根据spring的映射机制，可通过使用@requestBody注解，将前台传来的json字符串注入到club对象中
	 * 
	 */
	@ResponseBody
	@RequestMapping("/submitClubApply")
	public boolean submitApply(@RequestBody Club club, String uid) {
		// 由社团管理员或者普通用户发起的社团注册申请，其注册状态都必须设定为0，最后经由系统管理员来处理
		System.out.println("uid=" + uid);

		System.out.println("JSON字符串转来的对象：" + club);
		System.out.println("注册社团正在提交信息中……同时club的id为多少？" + club.getId());

		if (clubService.getClubById(club.getId()) == null) {// 判断是否已经存在相同的申请信息？
			// 将新记录添加到clubinfo表中，两个表必须同步！发布活动也是同理的
			club.setStatus(0);
			int i = clubService.addNewClub(club);
			if (i == 1) {
				ClubMemberForm cmf = new ClubMemberForm(club.getPresident(), club.getId(), "会长", 2, 0, null);
				System.out.println("cmf获得的记录为：" + cmf);
				// 将新记录添加到t_user_club表中
				if (clubService.addSignClubApply(cmf))
					return true;
			}
			return false;
		} else {
			System.out.println("注册信息记录已存在？！现在更新记录……");
			int i = clubService.updateSignStatus(uid, club.getId(), 0);
			club.setStatus(0);// 修改clubinfo表中的社团状态值
			int j = clubService.updateClubInfo(club);
			System.out.println("i=" + i + ",j=" + j);
			if (i == 1 && j == 1)
				return true;
			return false;
		}
	}

	// 进入到编辑社团信息编辑页面（社管，系统管理员
	@RequestMapping("/toEditClubInfo")
	public String editClub(String cid, String name, Model model) {
		// cid不为空，name为空：说明是系统管理员进入编辑信息的操作
		if (cid != null && name == null) {
			// 获取数据库中原来的社团信息回显出来，然后修改，再重新保存！
			club = clubService.getClubById(cid);
		}
		// 第二种情况：就是社团管理员查看自己所管理的社团的详细信息
		if (name != null && cid == null) {
			club = clubService.getClubByName(name);
		}
		model.addAttribute("clubEdit", club);
		model.addAttribute("president", userService.getUserByID(club.getPresident()));
		return "club_edit";
	}

	// 保存社团信息（社管，系统管理员
	@ResponseBody
	@RequestMapping("/updateClubInfo")
	public boolean updateClub(@RequestBody Club club, String cid, Model model) {
		int i = clubService.updateClubInfo(club);
		if (i == 1)
			return true;
		return false;
	}

	// 注销社团信息，也即删除某一社团信息，并返回一个字符串，用来判断是否删除成功？
	@RequestMapping("/delClubInfo")
	public String delClub(String cid, Model model) {
		String msg = null;
		// 执行删除社团信息操作：两个数据库表中的数据必须同时删除成功
		if (clubService.delClub(cid) == 1 && clubService.delClubSignForm(cid) == 1) {
			msg = "success";
		}
		// 再次请求返回新的社团列表
		return "forward:/queryAllClubs?delMsg=" + msg;
	}

	// 进入审核社团注册申请页面（系统管理员
	@RequestMapping("/unsolvedClubRegister")
	public String unsolvedClubRegister(Model model) {
		// 获取所有的社团注册信息
		List<ClubMemberForm> cmflist = clubService.getAllClubRegisterApply();
		List<Club> clist = new ArrayList<Club>();
		List<String> whoRegister = new ArrayList<String>();

		// 根据社团注册信息里的cid属性获取对应的社团信息，并保存到clist集合中去
		for (ClubMemberForm cmf : cmflist) {
			clist.add(clubService.getClubById(cmf.getCid()));
			whoRegister.add(userService.getUserByID(cmf.getUid()).getName());
		}
		model.addAttribute("regClubs", clist);
		model.addAttribute("namelist", whoRegister);
		model.addAttribute("cmflist", cmflist);
		return "admin/club_registerApplySolve";
	}

	// 处理社团注册的信息
	@RequestMapping("/solveClubRegisterApply")
	public String solveClubRegister(String uid, String cid, String flag) {
		int status = "p".equals(flag) ? 1 : 2; // “1”是同意申请，“2”是拒绝申请
		int limit = status == 1 ? 2 : 1;// 如果社团注册申请通过，将修改原来的用户的权限为管理员权限

		if (clubService.getClubSignByUidAndCid(uid, cid)) {
			System.out.println("执行通过社团注册申请处理……");
			if (clubService.updateSignStatus(uid, cid, status) == 1
					&& clubService.updateClubInfoStatus(cid, status) == 1) {
				if (status == 1) {
					int i = userService.updateLoginLimit(uid, limit);
					System.out.println("社团注册成功？i=" + i);
				}
			}
		}
		return "redirect:/unsolvedClubRegister";// 无论是通过还是拒绝申请，都重定向到此请求，起到刷新当前页面的效果
	}

	/**
	 * 活动管理模块
	 * 
	 * @return
	 */
	// 进入社团活动审核页面（系统管理员
	@RequestMapping("/toCheckActApply")
	public ModelAndView toActivityApply() {
		return new ModelAndView("admin/clubActivity_list");
	}

	// 查看全部的社团活动（系统管理员
	@RequestMapping("/selectAllActivites")
	public ModelAndView showAllActivities() {
		return new ModelAndView("admin/activity_list");
	}

	/**
	 * 普通社团会员功能模块
	 */
	// 获取当前用户所加入的所有社团
	@RequestMapping("/showClubOfWho")
	public String showClubOfWho(String uid, Model model) {
		int i = 0;
		String pid = "", pname = "", sid = "", sname = "";
		List<String> club_id = clubService.getClubOneJoin(uid);
		List<Integer> status = new ArrayList<Integer>();
		List<Club> club = new ArrayList<Club>();
		HashMap<String, String> vitalPerson = new HashMap<String, String>();

		for (String cid : club_id) {
			status.add(clubService.getCMFByUidAndCid(uid, cid).getStatus());// 循环获取用户在社团里的状态
			club.add(clubService.getClubById(cid));// 循环获取社团编号所对应的社团基本信息
			// 获取社团负责人的id号，作为map的key；对应的人名，作为map的值
			pid = club.get(i).getPresident();
			sid = club.get(i).getSecretary();
//			if (pid != null && pid != "") {
//				pname = userService.getUserByID(pid).getName();
//				vitalPerson.put(pid, pname);
//			}
//			if (sid != null && sid != "") {
//				sname = userService.getUserByID(sid).getName();
//				vitalPerson.put(sid, sname);
//			}
			System.out.println("i=" + i + "时" + pid + "，" + pname + "，" + sid + "，" + sname);
			++i;
		}

		model.addAttribute("map", vitalPerson);
		model.addAttribute("clubs_ofWho", club);
		model.addAttribute("club_status", status);
		System.out.println(club_id);
		return "user/clubs_whoJoin";
	}

	// 通过单选按钮获取指定的社团名字
	@ResponseBody
	@RequestMapping("/selectClubs")
	public boolean getSomeClubs(String key, String id, Model model) {
		boolean result = false;
		List<String> club_name = null;
		System.out.println(id);
		if ("all".equals(key)) {
			System.out.println("huhuhuh");
			List<Club> clubs = clubService.getAll();
			// 获取某列表的某字段的集合
			club_name = clubs.stream().map(Club::getClubName).collect(Collectors.toList());
			model.addAttribute("clubs_ofWho", club_name);
			result = true;
		} else if ("some".equals(key)) {
			club_name = clubService.getClubOneJoin(id);
			model.addAttribute("clubs_ofWho", club_name);
			result = true;
		} else {
		}
		return result;
	}

	// 获取当前用户所管理的全部社团名称（社管
	@ResponseBody
	@RequestMapping("/getClubNameByUserid")
	public String getClubNameByUserid(String uid) {
		System.out.println("传入的参数" + uid);
		List<String> nameList = clubService.getClubNameByUserid(uid);
		String jsonStr = JSON.toJSONString(nameList); // 将查询出来的集合转为JSON字符串，并响应给前端
		System.out.println("jsonstr" + jsonStr);
		return jsonStr;
	}

	// 查看社团动态（会员，社管
	@RequestMapping("/showClubNews")
	public String showClubNews(String name, Model model) {

		return "user/club_news";
	}

	// 进入留言论坛（会员，社管
	@RequestMapping("/showYourView")
	public String showYourView(/* String id, */Model model) {

		return "user/club_views";
	}

	// 查看个人成长记录（成员，社管
	@RequestMapping("/showGrowthRecord")
	public String showGrowthRecord(/* String id, */Model model) {

		return "user/growthRecords";
	}

	// 跳转到社团申请加入界面
	@RequestMapping("/toSignClub")
	public String signClub(String cid, Model model) {
		System.out.println("正在跳转到社团报名页面……");
		Club club = clubService.getClubById(cid);// 获取到某社团的基本信息，并传给前端显示出来
		if (club != null) {
			model.addAttribute("club", club);
			System.out.println("啊哈" + club);
		} else
			model.addAttribute("result", "error");
		return "user/club_sign";
	}

	// 提交加入社团的申请信息，并存入数据库中
	@ResponseBody
	@RequestMapping("/sendClubSignApply")
	public boolean sendClubSign(String uid, String cid, String remarks) {
		System.out.println("社团报名申请提交中……" + uid + cid + remarks);

		if (clubService.getClubSignByUidAndCid(uid, cid)) { // 如果数据库表中已经存在这样的元组，则直接修改最近一次的申请状态；否则，添加新的申请信息
			int i = clubService.updateSignStatusWithRemarks(uid, cid, 0, remarks);// 修改元组中的status属性值为0，表示申请ing
			System.out.println("修改原来信息");
			if (i == 1)
				return true;
			else
				return false;
		} else {
			System.out.println("新建");
			ClubMemberForm clubSign = new ClubMemberForm(uid, cid, "普通会员", 1, 0, remarks);
			if (clubService.addSignClubApply(clubSign))// 添加申请加入社团的信息到指定的数据库表中
				return true;
			else
				return false;
		}
	}

	// 显示申请加入社团的处理结果
	@RequestMapping("/showClubSignResult")
	public String resultOfClubSign(String uid, Model model) {
		List<ClubMemberForm> result_list = clubService.getClubSignByUid(uid);
		model.addAttribute("result", result_list);
		System.out.println("社团申请结果：" + result_list);
		return "user/clubSignApplyResult";
	}

	/**
	 * 社团管理员模块
	 */
	// 查询申请加入当前某社团的报名信息
	@RequestMapping("/unsolveClubSign")
	public String showClubApply(String name, Model model) {

		List<ClubMemberForm> clubMember = clubService.selectClubApplyByCID(clubService.getClubByName(name).getId());
		System.out.println(clubMember);
		model.addAttribute("formList", clubMember);
		return "admin_club/club_signApplySolve";
	}

	// 处理报名加入社团的申请
	@RequestMapping("/solveClubSignApply")
	public String solveApply(String uid, String cid, String flag, Model model) {
		int status = 0;
		status = "p".equals(flag) ? 1 : 2; // “1”是同意申请，“2”是拒绝申请

		if (clubService.getClubSignByUidAndCid(uid, cid)) {
			System.out.println("执行通过申请处理");
			if (clubService.updateSignStatus(uid, cid, status) > 0) {
				model.addAttribute("formList", clubService.selectClubApplyByCID(cid));
				if (status == 1)// 如果通过某人加入社团申请，需更新社团总人数
					clubService.updateClubMember(cid, clubService.getAllMembersOfClub(cid).size());
				System.out.println(clubService.getAllMembersOfClub(cid));
				return "admin_club/club_signApplySolve";
			}
		}
		return "admin_club/club_signApplySolve";
	}

	// 查看个人申请注册社团的处理结果（三种身份均具有此功能）
	@RequestMapping("/showClubRegisterResult")
	public String showRegClubResult(String uid, Model model) {
		List<ClubMemberForm> cmfList = clubService.getClubSignByUidAsAdmin(uid);
		List<Club> clist = new ArrayList<Club>();
		List<Integer> slist = new ArrayList<Integer>();

		for (ClubMemberForm cmf : cmfList) {
			clist.add(clubService.getClubById(cmf.getCid()));// 将社团申请表中对应的社团信息查出来，并存放到一个list集合中去
			slist.add(cmf.getStatus());
		}
		User user = userService.getUserByID(uid);
		model.addAttribute("registerClub", clist);
		model.addAttribute("pass", slist);
		model.addAttribute("uname", user.getName());
		return "club_registerResult";
	}

	// 获取所有已注册社团
	@RequestMapping("/getClubList")
	public String getClubList(Model model) {
		model.addAttribute("clublist", clubService.getAllClubsWithRegister());
		return "forward:/html/goodClub.jsp";
	}

	// 获取某社团的详细信息
	@RequestMapping("/getClubInfo")
	public String getClubInfo(String cid, Model model) {
		model.addAttribute("clubInfo", clubService.getClubById(cid));
		return "forward:/html/clubDetail.jsp";
	}
}
