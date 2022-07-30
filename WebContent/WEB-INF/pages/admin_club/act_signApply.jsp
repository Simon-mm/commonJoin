<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主要内容区</title>
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
    <td width="99%" align="left" valign="top">您的位置：消息通知&nbsp;>&nbsp;活动报名申请</td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form id="sign_act" method="post" action="" >
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr style="color:black;background-color: yellow;">
        <th align="center" valign="middle" class="borderright">序号</th>
        <th align="center" valign="middle" class="borderright">活动名称</th>
        <th align="center" valign="middle" class="borderright">开始时间</th>
        <th align="center" valign="middle" class="borderright">结束时间</th>
        <th align="center" valign="middle" class="borderright">活动场地</th>
        <th align="center" valign="middle" class="borderright">已报人数/总人数</th>
        <th align="center" valign="middle">其他</th>
      </tr>     
      <c:forEach items="${actList }" var="actList" varStatus="status">
      <tr class="bggray" onMouseOut="this.style.backgroundColor='#f9f9f9'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="center" valign="middle" class="borderright borderbottom">${status.index+1 }</td>
        <td align="center" valign="middle" class="borderright borderbottom">${actList.actName }</td>
        <td align="center" valign="middle" class="borderright borderbottom"><fmt:formatDate value="${actList.actStart}" pattern='yyyy-MM-dd HH:mm'/></td>
        <td align="center" valign="middle" class="borderright borderbottom"><fmt:formatDate value="${actList.actStart}" pattern='yyyy-MM-dd HH:mm'/></td>
        <td align="center" valign="middle" class="borderright borderbottom">${actList.actPlace}</td>
        <td align="center" valign="middle" class="borderright borderbottom">${actList.actNum }</td>
        <td align="center" valign="middle" class="borderbottom">
	        <c:if test="${actList.isPass eq 1 }">
	        <a id="solveApply" href="selectApply?aid=${actList.actID }" target="mainFrame" onFocus="this.blur()" class="add" style="text-decoration: none;">点击查看</a>
	        </c:if>
        	<c:if test="${actList.isPass eq 0 }"><font color="red" style="font-size: 15px">活动发布尚未通过</font></c:if>
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
	$(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/selectApplyAjax",
			type:"POST",
			async:true,
			data:{ "aid": aid},
			success:function(data){
				if(data>0){
					alert('success' + data);
					var msg = "未处理消息" + data;
					document.getElementById("solveApply").innerHTML = msg;
				}
			},
			error:function(e){
				alert('error'+e);
			}
		});
	});
</script>
</html>