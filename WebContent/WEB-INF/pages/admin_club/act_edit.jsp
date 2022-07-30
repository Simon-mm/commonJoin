<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑社团活动</title>
<link rel="icon" href="images/pander.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/css.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/main.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.serializejson.js"></script>
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
#addinfo a{ font-size:14px; font-weight:bold; background:url(images/main/addinfoblack.jpg) no-repeat 0 1px; padding:0px 0 0px 20px; line-height:45px;}
#addinfo a:hover{ background:url(images/main/addinfoblue.jpg) no-repeat 0 1px;}
</style>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：我的管理&nbsp;&nbsp;>&nbsp;&nbsp;社团活动&nbsp;&nbsp;>&nbsp;&nbsp;发布活动</td>
  </tr>
  <!-- 表头部分 -->
  <tr>
	<td align="left" valign="top">
	   <table width="" border="0" cellspacing="0" cellpadding="0" id="search">
	   	<tr>
		   <td ><form action="#" method="post">
		   <span style="line-height: 30px;font-size: 13px;height: 30px;margin-left: 8px;">编辑活动</span></form>
	   	</tr>
	   </table>
	</td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form id="sendActForm" action="">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">活动ID：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="actID" value="${actSend.actID }" class="text-word"></td>
      </tr>
    
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">活动名称：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="actName" value="${actSend.actName }" class="text-word"></td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">活动简介：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="actAttempt" value="${actSend.actAttempt }" class="text-word"></td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">活动地点：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="actPlace" value="${actSend.actPlace }" class="text-word"></td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">活动起止时间：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="datetime-local" name="actStart" id="start" value="${actSend.actStart }" class="text-word">&nbsp;--到--&nbsp;
        <input type="datetime-local" name="actEnd" id="end" value="${actSend.actEnd }" class="text-word"></td>
      </tr>
      
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">活动人数：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="actNum" value="${actSend.actNum }" class="text-word"></td>
      </tr>
      
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">活动类别：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <select name="actType" id="actType">
	        <option value="0">--请选择--</option>
	        <option value="1">体育竞技</option>
	        <option value="2">思想成长</option>
	        <option value="3">人文社科</option>
	        <option value="4">交流研讨</option>
	        <option value="5">座谈演讲</option>
        </select></td>
      </tr>
      
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">申请学分：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="credit" value="${actSend.credit }" class="text-word"></td>
      </tr>
      
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">举办方：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="organizer" value="${cname }" class="text-word"></td>
      </tr>
      
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">活动范围：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <select name="scope" id="scope">
	        <option value="-1">--请选择--</option>
	        <option value="0">社团内部</option>
	        <option value="1">校级</option>
        </select></td>
      </tr>
      
      <tr><td><input type="hidden" name="isPass" value="0"></td></tr>
            
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input id="submitBtn" type="button" value="提交" class="text-but">
        <input type="reset" value="重置" class="text-but"></td>
        </tr>
    </table>
    </form>
    </td>
    </tr>
</table>
</body>
<script type="text/javascript">
	$(function(){
		/*将后台数据回显到下拉框中*/
		$("#actType").find("option[value='${actSend.actType}']").attr("selected","true");
		$("#scope").find("option[value='${actSend.scope}']").attr("selected","true");
		
		/*提交申请，发送ajax同步请求*/
		$("#submitBtn").click(function(){
			var send = confirm("是否确认发布活动？");
			if(send==true){
				var sAct = $("#sendActForm").serializeJSON();
				console.log(JSON.stringify(sAct));
				$.ajax({
					url:"${pageContext.request.contextPath}/publishAct?uid=${login.id}",
					type:"post",
					async:true,
					contentType:"application/json",
					data:JSON.stringify(sAct),
					success:function(data){
						if(data.result == "success"){
							alert('发布活动申请成功！');
						} else {
							alert('活动发布申请失败！请重试！');
						}
					},
					error:function(e){
						alert("请求出错!!!" + e);
					}
				});
			}
			else
				alert('no');			
		});
	});
</script>
</html>