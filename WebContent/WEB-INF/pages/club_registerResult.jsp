<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册社团的申请处理结果展示</title>
<link rel="icon" href="images/pander.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/css.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/main.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.3.js"></script>
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(images/main/list_input.jpg) no-repeat left top; border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(images/main/add.jpg) no-repeat 0px 6px; padding:0 10px 0 26px; height:40px; line-height:40px; font-size:14px; font-weight:bold; color:#FFF}
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
.bggray{ background:#f9f9f9; font-size:14px; font-weight:bold; padding:10px 10px 10px 0; width:120px;}
.main-for{ padding:10px;}
.main-for input.text-word{ width:310px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; padding:0 10px;}
.main-for select{ width:310px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666;}
.main-for input.text-but{ width:100px; height:40px; line-height:30px; border: 1px solid #cdcdcd; background:#e6e6e6; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#969696; float:left; margin:0 10px 0 0; display:inline; cursor:pointer; font-size:14px; font-weight:bold;}
#addinfo a{ font-size:14px; font-weight:bold; background:url(${pageContext.request.contextPath}/admin/admin_image/main/addinfoblack.jpg) no-repeat 0 1px; padding:0px 0 0px 20px; line-height:45px;}
#addinfo a:hover{ background:url(images/main/addinfoblue.jpg) no-repeat 0 1px;}
</style>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：通知管理&nbsp;>&nbsp;注册社团申请结果</td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form id="sign_act" method="post" action="" >
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr style="color:black;background-color: yellow;">
        <th align="center" valign="middle" class="borderright">序号</th>
        <th align="center" valign="middle" class="borderright">社团ID</th>
        <th align="center" valign="middle" class="borderright">社团名称</th>
        <th align="center" valign="middle" class="borderright">社团类别</th>
        <th align="center" valign="middle" class="borderright">申请人</th>
        <th align="center" valign="middle" class="borderright">社团指导老师</th>
        <th align="center" valign="middle" class="borderright">申请时间</th>
        <th align="center" valign="middle" class="borderright">处理状态</th>
      </tr>     
      <c:forEach items="${registerClub }" var="club" varStatus="status">
      <tr class="bggray" onMouseOut="this.style.backgroundColor='#f9f9f9'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="center" valign="middle" class="borderright borderbottom">${status.index+1 }</td>
        <td align="center" valign="middle" class="borderright borderbottom">${club.id }</td>
        <!-- 鼠标移动到社团名称上，可以显示社团的简介！ -->
        <td align="center" valign="middle" class="borderright borderbottom">
        <a title="社团简介： ${club.introduction }" style="text-decoration: none;">${club.clubName }</a></td>
        <td align="center" valign="middle" class="borderright borderbottom">${club.type }</td>
        <td align="center" valign="middle" class="borderright borderbottom">${uname }</td>
        <td align="center" valign="middle" class="borderright borderbottom">${club.instructor }</td>
        <td align="center" valign="middle" class="borderright borderbottom"><fmt:formatDate value="${club.createDate }" pattern='yyyy-MM-dd'/></td>
        <!-- 处理状态 -->
        <td align="center" valign="middle" class="borderright borderbottom">
        <c:choose>
	        <c:when test="${pass[status.index] eq 0}"><font color="orange">等待审核</font></c:when>
	        <c:when test="${pass[status.index] eq 1}"><font color="green">注册成功</font></c:when>
	        <c:when test="${pass[status.index] eq 2}"><font color="red">注册失败！</font>
	        <font><a href="toRegisterClub?uid=${login.id }&cid=${club.id }&flag=1">再次申请？</a></font></c:when>
	        <c:otherwise>未知状态</c:otherwise>
	    </c:choose>
        </td>
      </tr>
      </c:forEach>
    </table>
    </form>
    </td>
    </tr>
</table>
</body>
<script type="text/javascript">
	function process(){
		var is = confirm("是否要执行此操作？\n\n点击“确定”，将执行您所选择的操作！");
		if(is == true){
			return true;
		}else{
			return false;
		}
	}
</script>
</html>