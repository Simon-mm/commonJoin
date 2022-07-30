<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>社团列表</title>
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
//点击单选按钮后触发，即，我们选择“男”时，触发一个事件，弹出选中的值
$(function(){
	$("input[name=selected]").click(function(){
	    var word = $(this).val();
	    var id = ${login.id };
	    $.ajax({
	    	url:"${pageContext.request.contextPath}/selectClubs",
	    	type:"POST",
	    	async:false,
	    	data:{"key":word,"id":id},
	    	success:function(result){
	    		if(result) alert("OK");
	    		else alert("Bad");
	    	}
	    });
	});
});

</script>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：我的管理&nbsp;&nbsp;>&nbsp;&nbsp;社团动态</td>
  </tr>
  <!-- 通过单选按钮的选择，得到社团的列表 -->
  <tr>
	<td align="left" valign="top">
	   <table width="" border="0" cellspacing="0" cellpadding="0" id="search">
	   	<tr>
		   <td ><form action="#" method="post">
		   <span style="line-height: 30px;font-size: 13px;height: 30px;margin-left: 8px;">
		   <!-- 使用label标签与input组合，可以起到点击文本内容即可选择按钮的效果；需要使得input的id属性值等于label的for属性值 -->
		   <input type="radio" id="all" name="selected" value="all"><label for="all">全部社团</label>&nbsp;&nbsp;&nbsp;
		   <input type="radio" id="some" name="selected" value="some"><label for="some">我加入的社团</label>		   
		   </span></form>
		   </td>
	   	</tr>
	   </table>
	</td>
  </tr>
  <!-- 社团列表 -->
	  <tr>
	    <td align="left" valign="top">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">	      
	      <%-- <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	      <c:forEach items="${club_news }" var="news" varStatus="status">	        
	        <td align="center" valign="middle" class="borderright borderbottom">
	        <a href="" title="点击进入详情" style="text-decoration: none;">${news}</a>
	        &nbsp;<a href="zsxx/10886a940ae742418b4c965f5fa4107a.htm">关于2022年符合教育部加分政策考生提供相关材料的通知</a>
	        </td><td style="border-bottom:dashed #CCC 1px;" width="25%" align="center">2022-03-19</td>
	      </c:forEach>	
	      </tr> --%>
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	      <td align="left" valign="middle" style="padding-left:10px;"><img src="images/dotnew.gif" width="8" height="8" align="middle">
	      &nbsp;<a href="zsxx/10886a940ae742418b4c965f5fa4107a.htm">关于2022年符合教育部加分政策考生提供相关材料的通知</a>
	      </td><td style="border-bottom:dashed #CCC 1px;" width="25%" align="center">2022-03-19</td>
	      </tr>
	      
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	      <td align="left" valign="middle" style="padding-left:10px;"><img src="images/dotnew.gif" width="8" height="8" align="middle">
	      &nbsp;<a href="zsxx/10886a940ae742418b4c965f5fa4107a.htm">关于2022年符合教育部加分政策考生提供相关材料的通知</a>
	      </td><td style="border-bottom:dashed #CCC 1px;" width="25%" align="center">2022-03-19</td>
	      </tr>
	      
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	      <td align="left" valign="middle" style="padding-left:10px;"><img src="images/dotnew.gif" width="8" height="8" align="middle">
	      &nbsp;<a href="zsxx/10886a940ae742418b4c965f5fa4107a.htm">关于2022年符合教育部加分政策考生提供相关材料的通知</a>
	      </td><td style="border-bottom:dashed #CCC 1px;" width="25%" align="center">2022-03-19</td>
	      </tr>
	                  
	    </table>
	    </td>
	  </tr>
</table>
</body>
</html>