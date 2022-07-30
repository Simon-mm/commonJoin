<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>全体用户列表</title>
<link rel="icon" href="images/pande.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/css.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/main.css" />
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
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：用户管理&nbsp;&nbsp;>&nbsp;&nbsp;用户列表</td>
  </tr>
  <!-- 显示按条件查询出来的用户信息 -->
  <c:if test="${find_ones eq 'yes' }">
  	<tr><td>okok</td></tr>
  </c:if>
  <c:if test="${find_ones eq 'no' }">
  	<tr><td>失败</td></tr>
  </c:if>
  <!-- 显示所有的用户信息列表 -->
  <c:if test="${msg eq 'success' }">
	  <tr>
	    <td align="left" valign="top">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
	  		<tr>
	   		 <td width="90%" align="left" valign="middle">
		         <form method="post" action="display?flag=not_all">
			         <span>成员：</span>
			         <input type="text" name="keyword" value="" class="text-word" placeholder="请输入姓名进行查找" required>
			         <input type="hidden" name="search" value="member"/>
			         <input name="" type="submit" value="查询" class="text-but">
		         </form>
	         </td>
	  		  <td width="10%" align="center" valign="middle" style="text-align:right; width:150px;"><a href="manager_add.jsp" target="mainFrame" onFocus="this.blur()" class="add">新增成员</a></td>
	  		</tr>
		</table>
	    </td>
	  </tr>
	  
	  <tr>
	    <td align="left" valign="top">
	    
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
	      <tr>
	        <th align="center" valign="middle" class="borderright">序号</th>
	        <th align="center" valign="middle" class="borderright">ID</th>
	        <th align="center" valign="middle" class="borderright">姓名</th>
	        <th align="center" valign="middle" class="borderright">性别</th>
	        <!-- <th align="center" valign="middle" class="borderright">权限</th> -->
	        <th align="center" valign="middle" class="borderright">年级</th>
	        <th align="center" valign="middle" class="borderright">学院</th>
	        <th align="center" valign="middle" class="borderright">专业</th>
	        <th align="center" valign="middle" class="borderright">电话</th>
	        <th align="center" valign="middle" class="borderright">邮箱</th>
	        <!-- <th align="center" valign="middle" class="borderright">所属社团</th> -->
	        <th align="center" valign="middle">操作</th>
	      </tr>
	     
	      <c:forEach items="${members }" var="member" varStatus="status">
	      <tr class="bggray" onMouseOut="this.style.backgroundColor='#f9f9f9'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="center" valign="middle" class="borderright borderbottom">${status.index+1 }</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${member.id }</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${member.name }</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${member.gender eq 1?'男':'女'}</td>
	        <%-- <td align="center" valign="middle" class="borderright borderbottom">
	        <c:choose>
	        	<c:when test="${member.limit eq 1}">社团管理员</c:when>
	        	<c:when test="${member.limit eq 2}">系统管理员</c:when>
	         	<c:otherwise>普通会员</c:otherwise>
	        </c:choose>
	        </td> --%>
	        <td align="center" valign="middle" class="borderright borderbottom">${member.year}</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${member.institute}</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${member.major}</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${member.tel}</td>
			<td align="center" valign="middle" class="borderright borderbottom">${member.email}</td>
	        <td align="center" valign="middle" class="borderbottom">
	        <a href="toModify?id=${member.id }" target="mainFrame" onFocus="this.blur()" class="add">编辑</a>
	        <span class="gray">&nbsp;|&nbsp;</span>
	        <a href="deleteUser?id=${member.id }"  target="mainFrame" onFocus="this.blur()" class="add" onclick="return confirm('确定删除吗？')">删除</a>
	        </td>
	      </tr>
	      </c:forEach>
	     
	    </table>
	    
	    </td>
	  </tr>
	  <!--  分页处理 -->
	  <tr>
	    <td align="left" valign="top" class="fenye" style="size: 30px;">共有${user_page.total} 条记录，当前${user_page.pageNum}/${user_page.pages}页
	        &nbsp; &nbsp; &nbsp;
	        <a href="display?pn=1">首页</a>
	        <a href="display?pn=${user_page.prePage }">上一页</a>
	        <c:forEach items="${user_page.navigatepageNums }" var="num">
	        	<c:if test="${num eq user_page.pageNum }"><a style="text-decoration: underline;">${num}</a></c:if>
	        	<c:if test="${num ne user_page.pageNum }"><a href="display?pn=${num }" style="text-decoration: none;">${num}</a></c:if>
	        </c:forEach>
	        <a href="display?pn=${user_page.nextPage }">下一页</a>
	        <a href="display?pn=${user_page.pages }">尾页</a>
	     </td>
	   </tr>
	</c:if>
	<c:if test="${isNull eq 'yes' }">
   <tr><th style="align-content: center; color: red; size: 20px">社团信息为空，请添加社团信息后再次查看！</th></tr>
   </c:if>
</table>
</body>
</html>