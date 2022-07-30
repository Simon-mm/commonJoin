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
span{line-height: 30px;font-size: 13px;height: 30px;margin-left: 8px;}
font{font-size: 15px;}
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
    <td width="99%" align="left" valign="top">您的位置：我的管理&nbsp;&nbsp;>&nbsp;&nbsp;我的社团</td>
  </tr>
  <!-- 通过单选按钮的选择，得到社团的列表 -->
  <tr>
	<td align="left" valign="top">
	   <table width="" border="0" cellspacing="0" cellpadding="0" id="search">
	   	<tr>
		   <td><form action="#" method="post">
		   <span><a href="showClubOfWho?uid=${login.id }"><font color="white">我的社团</font></a></span>
		   <span><a href="queryAllClubsAsUser?uid=${login.id }"><font color="white">全部社团</font></a>
		   </span>
		   </form>
		   </td>
	   	</tr>
	   </table>
	</td>
  </tr>
  <!-- 社团列表 -->
  <tr>
	<td align="left" valign="top">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
	      <tr>
	        <th align="center" valign="middle" class="borderright">序号</th>
	        <th align="center" valign="middle" class="borderright">社团ID</th>
	        <th align="center" valign="middle" class="borderright">社团名称</th>
	        <th align="center" valign="middle" class="borderright">会长/负责人</th>
	        <th align="center" valign="middle" class="borderright">团支书</th>
	        <th align="center" valign="middle" class="borderright">社团人数</th>
	        <th align="center" valign="middle" class="borderright">社团类型</th>
	        <th align="center" valign="middle" class="borderright">指导老师</th>
	        <th align="center" valign="middle" class="borderright">成立日期</th>
	        <th align="center" valign="middle">状态</th>
	      </tr>
	      <c:forEach items="${clubs_ofWho }" var="club" varStatus="status">
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="center" valign="middle" class="borderright borderbottom">${status.index+1 }</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${club.id}</td>
	        <td align="center" valign="middle" class="borderright borderbottom">
	        <a href="showClubMember_user?cid=${club.id}" style="text-decoration: none;" title="${club.clubName}">${club.clubName}</a></td>
	        <td align="center" valign="middle" class="borderright borderbottom">${club.president}</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${club.secretary}</td>
			<td align="center" valign="middle" class="borderright borderbottom">${club.number}</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${club.type }</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${club.instructor }</td>
	        <!-- 日期格式化处理 -->
	        <td align="center" valign="middle" class="borderright borderbottom"><fmt:formatDate value="${club.createDate }" pattern='yyyy-MM-dd'/></td>
	        <td align="center" valign="middle" class="borderbottom">
		        <c:choose>
		        	<c:when test="${club_status[status.index] eq 1 }"><font color="green">已入团</font></c:when>
		        	<c:when test="${club_status[status.index] eq 0 }"><font color="orange">申请中</font></c:when>
		        	<c:otherwise>未知</c:otherwise>
		        </c:choose>
	        </td>
	      </tr>
	      </c:forEach>	      
	    </table></td>
  </tr>
</table>
</body>
</html>