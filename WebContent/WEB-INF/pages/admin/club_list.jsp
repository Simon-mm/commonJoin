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
<script type="text/javascript">
	$(function(){
		var msg = "${delMsg}";
		if(msg == "success")
			alert('社团注销成功！');
	});
</script>
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
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
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：社团管理&nbsp;&nbsp;>&nbsp;&nbsp;社团列表</td>
  </tr>  
	  <tr>
	    <td align="left" valign="top">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
	  		<tr>
	   		 <td width="90%" align="left" valign="middle">
		         <form method="post" action="queryAllClubs?flag=not_all">
			         <span>社团：</span>
			         <input type="text" name="keyword" class="text-word" required  placeholder="请输入社团名称进行查找">
			         <input type="hidden" name="search" value="com">
			         <input name="" type="submit" value="查询" class="text-but">
		         </form>
	         </td>
	  		  <td width="10%" align="center" valign="middle" style="text-align:right; width:150px;">
	  		  	<a href="toRegisterClub" style="text-decoration: none;" target="mainFrame" onFocus="this.blur()" class="add">注册社团</a>
	  		  </td>
	  		</tr>
		</table>
	    </td>
	  </tr>
  <!-- 显示按条件查询出来的社团信息 -->  
  <c:if test="${find_ones eq 'no' }">
  	<tr><td>失败</td></tr>
  </c:if>
  <!-- 显示所有的社团信息列表 -->
  <c:if test="${isNull eq 'no' || find_ones eq 'yes'}">
	  <tr>
	    <td align="left" valign="top">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
	      <tr>
	        <th align="center" valign="middle" class="borderright">序号</th>
	        <th align="center" valign="middle" class="borderright">社团ID编号</th>
	        <th align="center" valign="middle" class="borderright">社团名称</th>
	        <th align="center" valign="middle" class="borderright">会长/负责人</th>
	        <th align="center" valign="middle" class="borderright">团支书</th>
	        <th align="center" valign="middle" class="borderright">社团人数</th>
	        <th align="center" valign="middle" class="borderright">社团类型</th>
	        <th align="center" valign="middle" class="borderright">指导老师</th>
	        <th align="center" valign="middle" class="borderright">成立日期</th>
	        <th align="center" valign="middle" class="borderright">注册状态</th>
	        <th align="center" valign="middle">操作</th>
	      </tr>
	      <c:forEach items="${clubs }" var="club" varStatus="status">
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="center" valign="middle" class="borderright borderbottom">${status.index+1 }</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${club.id}</td>
	        <td align="center" valign="middle" class="borderright borderbottom"><a href="queryClubInfo?flag=club_id&keyword=${club.id}" style="text-decoration: none;" title="${club.clubName}">${club.clubName}</a></td>
	        <td align="center" valign="middle" class="borderright borderbottom">${club.president}</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${club.secretary}</td>
			<td align="center" valign="middle" class="borderright borderbottom">${club.number}</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${club.type }</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${club.instructor }</td>
	        <!-- 日期格式化处理 -->
	        <td align="center" valign="middle" class="borderright borderbottom"><fmt:formatDate value="${club.createDate }" pattern='yyyy-MM-dd'/></td>
	        <!-- 注冊状态 -->
	        <td align="center" valign="middle" class="borderright borderbottom">
			<c:choose>
				<c:when test="${club.status eq 1 }"><font color="green">已注册</font></c:when>
				<c:when test="${club.status eq 2 }"><font color="red">未注册</font></c:when>
	        	<c:when test="${club.status eq 3 }"><font color="orange">注册申请中</font></c:when>
			</c:choose>	        	
			</td>
	        <td align="center" valign="middle" class="borderbottom">
		        <a href="toEditClubInfo?cid=${club.id}" style="text-decoration: none;" target="mainFrame" onFocus="this.blur()" class="add">编辑</a>
		        <span class="gray">&nbsp;|&nbsp;</span>
		        <a href="delClubInfo?cid=${club.id}" style="text-decoration: none;" target="mainFrame" onFocus="this.blur()" class="add">注销</a>
	        </td>
	      </tr>
	      </c:forEach>
	      
	    </table></td>
	  </tr>
	  <!-- 分页处理 -->
	  <tr>
	    <td align="left" valign="top" class="fenye" style="size: 30px;">共有${page.total} 条记录，当前${page.pageNum}/${page.pages}页
	        &nbsp; &nbsp; &nbsp;
	        <a href="queryAllClubs?pn=1">首页</a>
	        <a href="queryAllClubs?pn=${page.prePage }">上一页</a>
	        <c:forEach items="${page.navigatepageNums }" var="num">
	        	<c:if test="${num eq page.pageNum }"><a style="text-decoration: underline;">${num}</a></c:if>
	        	<c:if test="${num ne page.pageNum }"><a href="queryAllClubs?pn=${num }" style="text-decoration: none;">${num}</a></c:if>
	        </c:forEach>
	        <a href="queryAllClubs?pn=${page.nextPage }">下一页</a>
	        <a href="queryAllClubs?pn=${page.pages }">尾页</a>
	    </td>
	  </tr>
   </c:if>
   <c:if test="${isNull eq 'yes' }">
   <tr><th style="align-content: center; color: red; size: 20px">社团信息为空，请添加社团信息后再次查看！</th></tr>
   </c:if>   
</table>
</body>
</html>