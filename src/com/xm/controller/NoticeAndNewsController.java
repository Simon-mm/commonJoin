package com.xm.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xm.bean.ClubMemberForm;
import com.xm.bean.ClubNotice;
import com.xm.bean.Comment;
import com.xm.service.ClubNoticeService;
import com.xm.service.ClubService;

@Controller
public class NoticeAndNewsController {

	@Autowired
	private ClubNoticeService noticeService;
	@Autowired
	private ClubService clubService;

	/**
	 * =======系统管理员身份下的操作==================================================================================
	 * 1.发布、保存、修改、删除、查看公告
	 */

	/**
	 * 公告管理模块
	 * 
	 * @return
	 */
	// 进入公告编辑页面
	@RequestMapping("/toEditNotice")
	public String toEditNotice(String name, String nid, String identify, Model model) {
		System.out.println("公告编号nid" + "=" + nid + ",身份identify=" + identify);
		ClubNotice cn = new ClubNotice();
		if ("sys".equals(identify)) {// 系统管理身份下的请求
			if (nid != null) {// 说明是编辑原有的信息，需要回显数据；
				model.addAttribute("publisher", "all");
				TimeZone.setDefault(TimeZone.getTimeZone("GMT+8"));
				model.addAttribute("non", noticeService.getNoticeByNidAndCid("all", nid));
				System.out.println(noticeService.getNoticeByNidAndCid("all", nid).getLaunch());
				System.out.println("now time:" + new Date());
				System.out.println("时区偏移："+new Date().getTimezoneOffset());
			} else {// 说明是第一次编辑公告，无需回显数据
				cn.setCid("all");
				model.addAttribute("publisher", "all");
				model.addAttribute("non", cn);
			}
			return "admin/notice_edit";
		} else {// 社团管理员身份下的操作处理
			if (nid != null) {// 如果nid,cid不为空，说明是编辑已有信息，而不是新建公告信息
				model.addAttribute("non", noticeService.getNoticeByNid(nid));// 回显原来的公告信息
				model.addAttribute("publisher", name);
			} else if (name != null) {// 说明是第一次编辑公告，无需回显数据
				String cid = clubService.getClubByName(name).getId();
				cn.setCid(cid);
				System.out.println("操作方：" + cid + "," + name);
				model.addAttribute("publisher", name);
				model.addAttribute("non", cn);
			}
			return "admin/notice_edit";
		}
	}

	// 发送/保存notice
	@ResponseBody
	@RequestMapping("/sendNotice")
	public boolean sendNotice(@RequestBody ClubNotice notice, String flag) {
		System.out.println("操作标志是：" + flag);
		ClubNotice cn = noticeService.getNoticeByNid(notice.getNoticeid());
		System.out.println("cn=" + cn);
		System.out.println("发送方是：" + notice.getCid());
		int status = "send".equals(flag) ? 1 : 0;// 0：保存；1：发布

		if (cn == null) {// cn为null，说明不论是保存为草稿还是发布公告，都是第一次编辑，直接添加新记录到数据库中
			// 获取随机字符组合，并赋给noticeid属性
			String nid = UUID.randomUUID().toString().substring(0, 5);
			System.out.println("随机生成的noticedi = " + nid);
			notice.setNoticeid(nid);
			notice.setLaunch(new Date());// 设置为当前时间
			notice.setStatus(status);// 设置为发送成功状态——1
			notice.setCid(notice.getCid());// 根据前端传来的公告对象的cid属性值来进行赋值
			if (noticeService.addNotice(notice) == 1)// 判断是否添加成功？
				return true;
			else
				return false;
		} else {// cn不为null，说明是再次保存或者发布公告
			System.out.println("againOperator");
			if (status == 0)// 如果是保存再次编辑的草稿，则需要更新时间
				notice.setLaunch(new Date());
			notice.setStatus(status);
			System.out.println(cn.getLaunch());
			if (noticeService.updateNotice(notice) == 1)
				return true;
			else
				return false;
		}
	}

	// 查看所有公告（系统管理员
	@RequestMapping("/selectAllNotices")
	public String showAllNotices(Model model) {
		model.addAttribute("notices", noticeService.getAllNotices());
		return "admin/notice_list";
	}

	/**
	 * 社团动态模块
	 * 
	 * @return
	 */

	// 进入社联新闻编辑页面（系统管理员
	@RequestMapping("/toEditNews")
	public String toEditNews(Model model) {
		model.addAttribute("notices", null);
		return "";
	}

	// 查看所有社联新闻（系统管理员
	@RequestMapping("/selectAllNews")
	public ModelAndView showAllNews() {
		return new ModelAndView("admin/news_list");
	}

	/**
	 * ========社团管理员身份下的操作==================================================================================
	 * 1.发布公告 2.修改公告 3.删除公告 4.查看公告
	 */

	@RequestMapping("/selectAllNoticesAsAdmin_club")
	public String showAllNoticesAsAdmin_club(String name, Model model) {
		model.addAttribute("news", noticeService.getAllNotices());
		// 根据社团名得到对应cid，返回给页面，以达到筛选其他社团的公告，
		// 并且显示自己社团（包括未发布）、系统管理员发布的面向全体用户的以及其他加入的社团（但自己并非管理员）的已发布的公告的效果
		model.addAttribute("cid", clubService.getClubByName(name).getId());
		model.addAttribute("cname", name);
		model.addAttribute("club", "yes");// 如果判断是由社团管理员身份跳转过去的，给一个标志表示是社管
		return "admin/notice_list";
	}

	/**
	 * ========普通用户身份下的操作===================================================================================
	 * 1.查看公告 2.给公告点赞 3.留言功能
	 * 
	 */
	@RequestMapping("/selectAllNoticesAsUser")
	public String showAllNoticesAsUser(String uid, Model model) {
		List<ClubNotice> notice_list = noticeService.getAllNotices();
		// 用来保存普通用户可以看到的公告信息
		List<ClubNotice> notice_user = new ArrayList<ClubNotice>();
		// 获取某人参加的所有社团id
		List<ClubMemberForm> cmf_list = clubService.getClubSignByUidAsUser(uid);
		System.out.println(cmf_list);
		// 先考虑保存社团联发布的面向全体用户的公告信息
		for (ClubNotice cn : notice_list) {
			if ("all".equals(cn.getCid()))
				notice_user.add(cn);
		}
		// 然后，保存用户所在社团已发布的公告信息
		for (ClubMemberForm cmf : cmf_list) {
			notice_list = noticeService.getNoticeByCid(cmf.getCid());
			if (notice_list != null) {// 如果某社团的notice信息不为空，那么就遍历它
				for (ClubNotice notice : notice_list) {
					notice_user.add(notice);// 保存用户可见的社团公告信息
				}
			}
		}
		model.addAttribute("news_user", notice_user);
		return "admin/notice_list";
	}

	// 点击进入公告详情，可以点赞、评论；
	@RequestMapping("/intoNoticeDetail")
	public String showNoticeDetail(String nid, Model model) {
		List<Comment> comments = noticeService.getCommentsByNid(nid);
		// 公告的基本信息回显到前端
		model.addAttribute("notice", noticeService.getNoticeByNid(nid));
		// 公告所附属的评论，如果有也都需要回显出来
		model.addAttribute("c_size", comments.size());
		model.addAttribute("comments", comments);
		return "notice_detail";
	}

	// 异步处理点赞数据更新
	@ResponseBody
	@RequestMapping("/refreshLikesNumber")
	public boolean refreshLikes(String nid, String likes) {
		System.out.println(nid + likes);
		return noticeService.updateNoticeLikesNum(nid, Integer.parseInt(likes));
	}

	// 异步保存评论信息
	@ResponseBody
	@RequestMapping("/saveComments")
	public boolean saveComments(String uid, String nid, String comment, Model model) {
		System.out.println(uid + nid + comment + new Date());
		return noticeService.updateNoticeComments(uid, nid, comment, new Date());
	}
	
	// 获取社团中资讯，也即所有公告列表
	@RequestMapping("/getClubNotice")
	public ModelAndView getClubNotice() {
		ModelAndView mv = new ModelAndView("forward:/html/clubNotice.jsp");
		mv.addObject("notices", noticeService.getAllNotices());
		return mv;
	}
}
