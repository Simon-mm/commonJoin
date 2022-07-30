<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>普通用户界面头部</title>
<link rel="icon" href="../images/pander.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/css.css" /><%-- 
<script type="text/javascript">
	$(function(){
		var current = new Date(<%=new java.util.Date().getTime()%>);
		alert(current);
		function run(){
			current.setSeconds(current.getSeconds()+1);
			document.getElementById("dt").innerHTML = current.toLocaleString();
			
		}
		window.setInterval("run();", 1000);
		function isLogin(){
			var id = ${login.id };
			if(id != null){
				alert('请先登录再使用！');
				/* window.parent.location.href="${pageContext.request.contextPath}/login.jsp"; */
				
			}else
				alert('jhaha');								
		}
	});
</script> --%>
</head>
<body onselectstart="return false" oncontextmenu=return(false) style="overflow-x:hidden;">
<!--禁止网页另存为-->
<noscript><iframe scr="*.htm"></iframe></noscript>
<!--禁止网页另存为-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="header">
  <tr>
    <td rowspan="2" align="left" valign="top" id="logo"><img src="../images/xiaohui.png" width="74" height="74"></td>
    <td align="left" valign="bottom">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="bottom" id="header-name">HUAT社团，欢迎你！</td>
        <td align="right" valign="top" id="header-right">
        	<c:if test="${not empty login.id }">
        	<a href="${pageContext.request.contextPath}/loginOut" target="topFrame" onFocus="this.blur()" class="admin-out" onclick="javascript:topframe.close();">注销</a>
	        <a href="../toReset?id=${login.id }" target="mainFrame" onFocus="this.blur()" class="admin-reset">修改密码</a>
            <a href="../toModify?id=${login.id }" target="mainFrame" onFocus="this.blur()" class="admin-home">个人信息</a>
            <!-- 这一标签内容用于显示未读信息数目，并显示红色 -->
            <span ></span>
            <a href="" target="mainFrame" onFocus="this.blur()" ><img id="msg" alt="Message" src="../images/message.png" width="15px" height="15px">&nbsp;消息通知&nbsp;</a>
            </c:if>
        	<a href="${pageContext.request.contextPath}/index.jsp" target="_blank" onFocus="this.blur()" class="admin-index" onclick="javascript:topframe.close();">网站首页</a>
            <span id="dt">
				<!-- 日历 -->
				<!-- <SCRIPT type=text/javascript src="js/clock.js"></SCRIPT>
				<SCRIPT type=text/javascript>showcal();</SCRIPT> -->
            </span>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="bottom">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="bottom" id="header-menu">
        <a href="javascript:;" onclick="javascript:history.back(-1);" style="margin-left: 125px;" onFocus="this.blur()" id="menuon">返回上一级</a>
        <%-- <a href="#" target="mainFrame" onFocus="this.blur()">社团简介</a>
        <a href="#" target="mainFrame" onFocus="this.blur()">社团动态</a>
        <a href="../showActOfClub?name=${sessionScope.clubname }" target="mainFrame" onFocus="this.blur()">社团活动</a>
        <a href="#" target="mainFrame" onFocus="this.blur()">消息列表</a>
        <a href="#" target="mainFrame" onFocus="this.blur()">联系我们</a> --%>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>