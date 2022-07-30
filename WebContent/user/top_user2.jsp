<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台页面头部</title>
<link rel="icon" href="../images/pander.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/css.css" />
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
        <td align="left" valign="bottom" id="header-name" style="font-size: 20px;font-style: italic;text-shadow: yellow;">HUAT社团欢迎你！</td>
        <td align="right" valign="top" id="header-right">
        	<a href="${pageContext.request.contextPath}/loginOut" target="topFrame" onFocus="this.blur()" class="admin-out" onclick="javascript:topframe.close();">注销</a>
	        <a href="../toReset?id=${login.id }" target="mainFrame" onFocus="this.blur()" class="admin-reset">修改密码</a>
            <a href="main.jsp" target="mainFrame" onFocus="this.blur()" class="admin-home">返回首页</a>
            <a href="../toModify?id=${login.id }" target="mainFrame" onFocus="this.blur()" class="admin-home">个人信息</a>
        	<a href="${pageContext.request.contextPath}/index.jsp" target="_blank" onFocus="this.blur()" class="admin-index" onclick="javascript:topframe.close();">网站首页</a>
            <span>
				<!-- 日历 -->
				<SCRIPT type=text/javascript src="js/clock.js"></SCRIPT>
				<SCRIPT type=text/javascript>showcal();</SCRIPT>
            </span>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="left" valign="bottom">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <!-- <td align="left" valign="top" id="header-admin">后台管理系统</td> -->
        <td align="left" valign="bottom" id="header-menu">
        <a style="margin-left: 125px;" href="javascript:;" onclick="javascript:;" onFocus="this.blur()" id="menuon">当前页面</a>
        <!-- <a href="#" target="left" onFocus="this.blur()">管理 1</a>
        <a href="#" target="left" onFocus="this.blur()">管理 2</a>
        <a href="#" target="left" onFocus="this.blur()">管理 3</a>
        <a href="#" target="left" onFocus="this.blur()">管理 4</a>
        <a href="#" target="left" onFocus="this.blur()">管理 5</a>
        <a href="#" target="left" onFocus="this.blur()">管理 6</a> -->
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>