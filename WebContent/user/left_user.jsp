<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	var myMenu;
	window.onload = function() {
		myMenu = new SDMenu("my_menu");
		myMenu.init();
	};
</script>
<style type=text/css>
html{ SCROLLBAR-FACE-COLOR: #538ec6; SCROLLBAR-HIGHLIGHT-COLOR: #dce5f0; SCROLLBAR-SHADOW-COLOR: #2c6daa; SCROLLBAR-3DLIGHT-COLOR: #dce5f0; SCROLLBAR-ARROW-COLOR: #2c6daa;  SCROLLBAR-TRACK-COLOR: #dce5f0;  SCROLLBAR-DARKSHADOW-COLOR: #dce5f0; overflow-x:hidden;}
body{overflow-x:hidden; background:url(images/main/leftbg.jpg) left top repeat-y #f2f0f5; width:194px;}
</style>
</head>
<body onselectstart="return false;" ondragstart="return false;" oncontextmenu="return false;">

    <c:choose><c:when test="${empty login.id}">
	    <div id="left-top">
	    <div><img src="${pageContext.request.contextPath}/header/head.jpg" width="44" height="44" /></div>        
	    <span>
		    ~游客~<br/>
		    <button style="font-size: 5px;margin: 7px 5px;">点击注册</button>
		    <button style="font-size: 5px;">立即登录</button>
	    </span></div>
	    <div style="float: left" id="my_menu" class="sdmenu">
      	<div class="collapsed">
	        <span>请先登录！</span>	       
      	</div>
    	</div></c:when>
    <c:otherwise>
    	<div id="left-top">
	    <div><img src="${pageContext.request.contextPath}/header/head.jpg" width="44" height="44" /></div>        
	    <span>您好！${login.id }</span></div>
    <div style="float: left" id="my_menu" class="sdmenu">
      	<div class="collapsed">
	        <span>我的管理</span>
	        <a href="../showClubOfWho?uid=${login.id }" target="mainFrame" onFocus="this.blur()">我的社团</a>
	        <a href="../showActOfWho?uid=${login.id }" target="mainFrame" onFocus="this.blur()">我的活动</a>
	        <!-- 如果是从登录界面进入则不显示此选项；如果是从index页面点击某一社团进入，则显示 -->
	        <a href="../selectAllNoticesAsUser?uid=${login.id }" target="mainFrame" onFocus="this.blur()">社团动态</a>        
	        <!-- <a href="../showYourView" target="mainFrame" onFocus="this.blur()">畅所欲言</a>
	        <a href="../showGrowthRecord" target="mainFrame" onFocus="this.blur()">成长记录</a> -->
	        <a href="../toRegisterClub?uid=${login.id }&flag=0" target="mainFrame" onFocus="this.blur()">注册社团</a>
      	</div>
      	<div class="collapsed">
      		<span>消息通知</span>
      		<a href="../showActSignResult?uid=${login.id }" target="mainFrame" onFocus="this.blur()">活动报名处理结果</a>
      		<a href="../showClubSignResult?uid=${login.id }" target="mainFrame" onFocus="this.blur()">加入社团处理结果</a>
      		<a href="../showClubRegisterResult?uid=${login.id }" target="mainFrame" onFocus="this.blur()">注册社团申请结果</a>
      	</div>
    </div>
    </c:otherwise></c:choose>
</body>
</html>