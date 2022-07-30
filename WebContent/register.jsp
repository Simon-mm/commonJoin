<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="pande.png">
    <title>社团管理</title>
</head>
<link href="css/register.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.3.js"></script>
<!-- js files -->
<!-- <script src="js/register.js"></script> -->
<!-- /js files -->
</head>
<body>
    <div class="wrap">
        <div class="container">
            <h1>注册</h1><br>   
            <form action="" method="post" name="myfor">
            		<font size="4px" color=red><b id="result"></b></font>
                <input id="name" name="username" type="text" placeholder="请输入您的学号"/>
                	<font size="4px" color=red>&nbsp;&nbsp;&nbsp;<b id="user_id"></b></font>
                <input id="password" name="userpass" type="password" placeholder="密码"/>
                <input id="passwordAgain" name="repass" type="password" placeholder="确认密码"/>
                	<font size="4px" color=red>&nbsp;&nbsp;&nbsp;<b id="user_pass"></b></font>
                <input id="email" name="email" type="text" placeholder="邮箱"/>
                <input id="tel" name="phone" type="text" placeholder="电话"/>
                <input id="register" type="submit" pattern="[0-9]*" maxlength="11" value="注 册"/>
            </form>
            <div id="regst">
                	如果您已有账号，请点击这里<a href="login.jsp" class="link">&nbsp;&nbsp;登录</a>
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
		var id,pass,repass,email,tel;
		var flag = false;		
		
		$("#name").blur(function(){
			id = $("#name").val();
			if(id == ""){
				$("#user_id").text("用户名不能为空！");
			}else{
				$.post("${pageContext.request.contextPath}/isExistedUid",{"uid":id},function(res){
					if(!res){
						flag = true;
						$("#user_id").text("");
					} else {
						flag = false;/* 这句话时必须的，如果第一次输入已经存在账号后，flag=true；当看到错误提示后，重新填写未注册过的账号，注意此时flag是true，而不是false*/
						$("#user_id").text("此用户已存在，请直接登录！");
					}
						
				});
			}
		});
		$("#password").blur(function(){
			pass = $("#password").val();
			if(pass==""){
				$("#user_pass").text("密码不能为空！");
				return ;
			} else{
				$("#user_pass").text("");
			}
		});
		$("#passwordAgain").blur(function(){
			repass = $("#passwordAgain").val();
			if(repass != pass){
				$("#user_pass").text("两次输入的密码不一致！");
				return ;
			} else{
				$("#user_pass").text("");
			}
		});		
		
		$("#register").click(function(){/* 为注册按钮添加点击事件：检验数据合法性后，再异步提交 */
			id = $("#name").val();
			pass = $("#password").val();
			alert(id+pass);
			if(flag){
				$.ajax({
					url:"${pageContext.request.contextPath}/toRegister",
					type:"post",
					async:true,
					data:{"uid":id,"pwd":pass},
					success:function(result){
						/*这里的代码为何不运行？*/ 
						if(result){
							alert("注册成功！现在可以去登录啦~");
							window.parent.location.href="${pageContext.request.contextPath}/login.jsp";
						}else{
							alert("注册失败！请重试！");
							$("#result").text("注册失败！");
						}
					},
					error:function(e){
						alert("注册失败！可能您的账号不在本校学籍库中，请联系学校解决！");
					}
				});
			}else{
				alert("请完善或者填写正确的注册信息！");
			}
		});
	});
</script>
</html>