<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改个人登录密码</title>
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
    <td width="99%" align="left" valign="top">您的位置：修改密码</td>
  </tr>
  
  <tr>
    <td align="left" valign="top">
    <form id="resetForm" method="post" action="" >
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="right" valign="middle" class="borderright borderbottom bggray">系统管理员账号：</td>
	        <td align="left" valign="middle" class="borderright borderbottom main-for">
	        <input  id="userid" type="text" name="username" value="${login.id }" class="text-word" readonly="readonly"></td>
	      </tr>
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="right" valign="middle" class="borderright borderbottom bggray">请输入原密码：</td>
	        <td align="left" valign="middle" class="borderright borderbottom main-for">
	        <input id="oldpwd" type="password" name="userpass" placeholder="请输入原密码" class="text-word" ></td>
	      </tr>
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="right" valign="middle" class="borderright borderbottom bggray">请输入新密码：</td>
	        <td align="left" valign="middle" class="borderright borderbottom main-for">
	        <input id="newpwd1" type="password" name="newpass" placeholder="请输入新密码" class="text-word"></td>
	      </tr>
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="right" valign="middle" class="borderright borderbottom bggray">请再次输入新密码：</td>
	        <td align="left" valign="middle" class="borderright borderbottom main-for">
	        <input id="newpwd2" type="password" name="newpass2" placeholder="请再次输入新密码" class="text-word"></td>
	      </tr>	       
	      <tr>
	      	<td><input name="ope" type="hidden" value="mupdate"/></td>
	      </tr>	      
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
	        <td align="left" valign="middle" class="borderright borderbottom main-for">
	        <input name="" type="button" value="提交" class="text-but" id="updateBtn">
	        <input name="" type="reset" value="重置" class="text-but"></td>
	      </tr>	      
	    </table>
    </form>
    </td>
    </tr>
</table>
</body>
<script type="text/javascript">
	$(function(){
		$("#updateBtn").click(function(){
			var flag = false;
			var user_id = $("#userid").val();
			var old_pwd = $("#oldpwd").val();
			var new_pwd1 = $("#newpwd1").val();
			var new_pwd2 = $("#newpwd2").val();
			
			if(old_pwd == "" || old_pwd == null){
				alert("原密码不能为空！");
				$("#oldpwd").focus();
				return ;
			}
			
			if(!new_pwd1){
				alert("新密码不能为空！");
				$("#newpwd1").focus();
				return ;
			}
			
			if(!new_pwd2){
				alert("新密码二次输入不能为空！");
				$("#newpwd2").focus();
				return ;
			}
			
			if(new_pwd1 == new_pwd2 && new_pwd1 != null && new_pwd1 != ""){
				flag = true;
			}
			
			if(flag){
				$.ajax({
					url:"${pageContext.request.contextPath}/reset",
					type:"POST",
					async:true,
					/* data:$("#resetForm").serialize(),	//表单数据序列化, 可以对form表单进行序列化，从而将form表单中的所有参数传递到服务端 */
					data:{"id":user_id,"pwd":new_pwd1,"opwd":old_pwd},
					success:function(result){
						if(result){
							alert("修改密码成功！");
							window.parent.location.href="${pageContext.request.contextPath}/login.jsp";
						}else{
							alert("修改失败，请检查原密码是否输入正确！");
						}
					},
					error:function(e){
						alert("请求出错！");
					}				
				});
			}else{
				alert('两次输入的新密码不一致！');
			}
		});
	});
	
</script>
</html>