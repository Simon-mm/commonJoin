<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>社团活动列表</title>
<link rel="icon" href="images/pander.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/css.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/main.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.3.js"></script>
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF; float:left}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(images/main/list_input.jpg) no-repeat left top; border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(images/main/add.jpg) no-repeat -3px 7px #548fc9; padding:0 10px 0 26px; height:40px; line-height:40px; font-size:14px; font-weight:bold; color:#FFF; float:right}
#search a:hover.add{ text-decoration:underline; color:#d2e9ff;}
#main-tab{ border:1px solid #eaeaea; background:#FFF; font-size:12px;}
#main-tab th{ font-size:12px; background:url(images/main/list_bg.jpg) repeat-x; height:32px; line-height:32px;}
#main-tab td{ font-size:12px; line-height:40px;}
#main-tab td a{ font-size:12px; color:#548fc9;}
#main-tab td a:hover{color:#565656; text-decoration:underline;}
.bordertop{ border-top:1px solid #ebebeb}
.borderright{ border-right:1px solid #ebebeb}
.borderbottom{ border-bottom:1px solid #ebebeb}
.borderleft{ border-left:1px solid #ebebeb}
.gray{ color:#dbdbdb;}
td.fenye{ padding:10px 0 0 0; text-align:right;}
.bggray{ background:#f9f9f9}
</style>
<script type="text/javascript">
	function isLogin(){
		var login = "${applicationScope.login}" //1.这里是获取session域中的对象；2.需要用双引号将获取的值包含起来，否则会报错；
		
		if(login == ""){
	    	var is = confirm("请先登录，再报名活动！\n\n点击“确定”，您将跳转至登录界面.");
	    	if(is == true){
	    		window.parent.location.href="${pageContext.request.contextPath}/login.jsp";
	    	}else
	    		return false;
	    }else
	    	return true;
		
		/* if(login != ""){ //用户已登录，注意这里用双引号判断字符串是否为空；之前用null判断，是错误的！
			alert("success");
			
	    	$.ajax({
	    		url:"${pageContext.request.contextPath}/toSignAct",
	    		type:"GET",
	    		async:false,
	    		data:{club:"${sessionScope.clubname}"},
	    		success:function(data){
	    			if(date)
	    		}	    		
	    	});
	    } */		
	}
</script>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：我的管理&nbsp;&nbsp;>&nbsp;&nbsp;我的社团</td>
  </tr>
  <!-- 通过单选按钮的选择，得到社团的列表 -->
  <tr>
	<td align="left" valign="top">
	   <table width="" border="0" cellspacing="0" cellpadding="0" id="search">
	   	<tr>
		   <td ><form action="#" method="post">
		   <span style="line-height: 30px;font-size: 13px;height: 30px;margin-left: 8px;">
		   <!-- 使用label标签与input组合，可以起到点击文本内容即可选择按钮的效果；需要使得input的id属性值等于label的for属性值 -->	   
		   <input type="radio" id="all" name="selected" value="all"><label for="all">所有活动</label>&nbsp;&nbsp;&nbsp;
		   <input type="radio" id="finished" name="selected" value="finished"><label for="finished">已完结</label>
		   </span></form>
		   </td>
	   	</tr>
	   </table>
	</td>
  </tr>
  <!-- 某一社团的活动列表 -->
  <tr>
	<td align="left" valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
			<tr>
		        <th align="center" valign="middle" class="borderright">活动ID</th>
		        <th align="center" valign="middle" class="borderright">活动名称</th>
		        <th align="center" valign="middle" class="borderright">活动场地</th>
		        <th align="center" valign="middle" class="borderright">活动类别</th>
		        <th align="center" valign="middle" class="borderright">开始时间</th>
		        <th align="center" valign="middle" class="borderright">结束时间</th>
		        <th align="center" valign="middle" class="borderright">报名/总人数</th>
		        <th align="center" valign="middle" class="borderright">举办方</th>
		        <th align="center" valign="middle" class="borderright">学分</th>
		        <th align="center" valign="middle">活动范围</th>
		        <th align="center" valign="middle">操作</th>
		    </tr>
	    
			<c:forEach items="${actInfo }" var="act" varStatus="status">      
			<tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
				<td id="${act.actID}" align="center" valign="middle" class="borderright borderbottom">${act.actID}</td>
		        <td align="center" valign="middle" class="borderright borderbottom">${act.actName}</td>
		        <td align="center" valign="middle" class="borderright borderbottom">${act.actPlace}</td>
		        <td align="center" valign="middle" class="borderright borderbottom">
				<c:choose>
					<c:when test="${act.actType eq 0 }">体育竞技</c:when>
					<c:when test="${act.actType eq 1 }">才艺展示</c:when>
					<c:otherwise>知识竞赛</c:otherwise>
				</c:choose>
				</td>
				<td align="center" valign="middle" class="borderright borderbottom"><fmt:formatDate value="${act.actStart}" pattern='yyyy-MM-dd HH:mm'/></td>
				<td align="center" valign="middle" class="borderright borderbottom"><fmt:formatDate value="${act.actEnd}" pattern='yyyy-MM-dd HH:mm'/></td>
		        <td align="center" valign="middle" class="borderright borderbottom">${act.actNum}</td>
				<td align="center" valign="middle" class="borderright borderbottom">${act.organizer}</td>
				<td align="center" valign="middle" class="borderright borderbottom">${act.credit}</td>
				<td align="center" valign="middle" class="borderright borderbottom">
				<c:choose>
					<c:when test="${act.scope eq 0 }">社团内部</c:when>
					<c:when test="${act.scope eq 1 }">校级</c:when>
				</c:choose>
				</td>
				<td align="center" valign="middle" class="borderright borderbottom">
				<!-- 先通过js事件判断是否登录，若没有则提示登录，否则可以进行报名活动操作！ -->
				<a href="toSignAct?actId=${act.actID}" onclick="return isLogin();return true;" style="text-decoration: none;">报名活动</a>
				</td>
			</tr>
			</c:forEach>		
		</table>
	</td>
  </tr>
</table>
</body>
</html>