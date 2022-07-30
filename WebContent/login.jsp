<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./images/pander.png">
    <title>Login</title>
</head>
    <link href="css/login.css" type="text/css" rel="stylesheet" />
	<!-- js files -->
	<script src="js/login.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.3.js"></script>
	<!-- /js files -->
</head>
<body>
    <div class="wrap">
        <div class="container">
            <h1>欢迎</h1>
            <c:if test="${result =='error' }"><font color=red >登录信息错误！</font></c:if>            
            <form name="myform" action="logged" method="post">
                <input id="id" name="username" type="text" placeholder="登录名"/>
                <input id="pwd" name="userpass" type="password" placeholder="密码" />
                <input type="submit" value="登录" id="loginbtn"/>
            </form>
			<div id="regst">
                	如果你还没有账户，请点击&nbsp;&nbsp;<a href="register.jsp">注册</a>
            </div>
        </div>
        <ul>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</body>
<script type="text/javascript">
	$(function(){
		$('#loginbtn').click(function(){
			var id = $('#id').val();
			var pwd = $('#pwd').val();
			if(!id || !pwd){
				alert('用户登录信息不完整！');
				return false;
			}else
				return true;
		})			
	})		
</script>
</html>