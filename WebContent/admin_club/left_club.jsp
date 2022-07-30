<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%pageContext.setAttribute("ctp", request.getContextPath());  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧导航menu</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/css.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/sdmenu.js"></script>
<script type="text/javascript">
	// <![CDATA[
	var myMenu;
	window.onload = function() {
		myMenu = new SDMenu("my_menu");
		myMenu.init();
	};
	// ]]>
</script>
<style type=text/css>
html{ SCROLLBAR-FACE-COLOR: #538ec6; SCROLLBAR-HIGHLIGHT-COLOR: #dce5f0; SCROLLBAR-SHADOW-COLOR: #2c6daa; SCROLLBAR-3DLIGHT-COLOR: #dce5f0; SCROLLBAR-ARROW-COLOR: #2c6daa;  SCROLLBAR-TRACK-COLOR: #dce5f0;  SCROLLBAR-DARKSHADOW-COLOR: #dce5f0; overflow-x:hidden;}
body{overflow-x:hidden; background:url(images/main/leftbg.jpg) left top repeat-y #f2f0f5; width:194px;}
</style>
</head>
<body onselectstart="return false;" ondragstart="return false;" oncontextmenu="return false;">
<div id="left-top">
	<div><img src="${pageContext.request.contextPath}/header/${member.memberHeader}" width="44" height="44" /></div>
    <span>用户：${login.id }<br>角色：<c:choose><c:when test="${login.id eq 2}">社团管理员</c:when><c:otherwise>系统管理员</c:otherwise></c:choose></span>
</div>
    <div style="float: left" id="my_menu" class="sdmenu">
      <div class="collapsed">
        <span>社团管理</span>
        <a href="../toClubRegisterApply" target="mainFrame" onFocus="this.blur()">审核社团注册</a>
        <a href="../queryAllClubs" target="mainFrame" onFocus="this.blur()">展示社团列表</a>
        <a href="../display" target="mainFrame" onFocus="this.blur()">展示用户列表</a>
      </div>
      <div>
        <span>活动管理</span>
        <a href="../toCheckActApply" target="mainFrame" onFocus="this.blur()">社团活动审核</a>
        <a href="../selectAllActivites" target="mainFrame" onFocus="this.blur()">浏览社团活动</a>
      </div>
      <div>
        <span>公告管理</span>
        <a href="../toEditNotice" target="mainFrame" onFocus="this.blur()">发布公告</a>
        <a href="../selectAllNotices" target="mainFrame" onFocus="this.blur()">查看公告</a>
      </div>
      <div>
        <span>社联新闻</span>
        <a href="../toEditNews" target="mainFrame" onFocus="this.blur()">发布社联动态</a>
        <a href="../selectAllNews" target="mainFrame" onFocus="this.blur()">查看社联新闻</a>
      </div>
    </div>
</body>
</html>