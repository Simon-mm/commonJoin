<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>高校社团管理系统</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/pander.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/css.css" />

</head>
<!--框架样式-->
<frameset rows="95,*,30" cols="*" frameborder="no" border="0" framespacing="0">
<!--top样式-->
	<frame src="user/top_user.jsp" name="topframe" scrolling="no" noresize id="topframe" title="topframe" />
<!--contact样式-->
	<frameset id="attachucp" framespacing="0" border="0" frameborder="no" cols="194,12,*" rows="*">
		<frame scrolling="auto" frameborder="0" name="leftFrame" src="user/left_user.jsp"></frame>
		<frame id="leftbar" scrolling="no" name="switchFrame" src="admin/swich.jsp"></frame>
		<frame id="subFrame" scrolling="auto" name="mainFrame" src="admin/main.jsp"></frame>
	</frameset>
<!--bottom样式-->
	<frame src="admin/bottom.jsp" name="bottomFrame" scrolling="no" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset><noframes></noframes>

</html>