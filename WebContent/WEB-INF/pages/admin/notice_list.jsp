<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>公告列表</title>
<link rel="icon" href="images/pander.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/css.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/main.css" />
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
    <td width="99%" align="left" valign="top">您的位置：公告管理&nbsp;&nbsp;>&nbsp;&nbsp;查看公告</td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
	   	<tr>
		   <td><form action="#" method="post">
		   <span><font color="white">公告列表</font></span>
		   <!-- 如果是以社团管理员身份进入该页面 -->
		   <c:if test="${club eq 'yes' }">
		   <span><a href="toEditNotice?identify=club&name=${cname }"> <font color="white">编辑新公告</font></a></span>
		   </c:if>
		   </form>
		   </td>		   
	   	</tr>
	</table>
    </td>
  </tr>
  
  <tr>
    <td align="left" valign="top">    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">      
     
      <c:if test="${not empty notices }">
      <tr>
        <th align="center" valign="middle" class="borderright">序号</th>
        <th align="center" valign="middle" class="borderright">标题</th>
        <th align="center" valign="middle" class="borderright">发布时间</th>
        <th align="center" valign="middle" class="borderright">发布者</th>
        <th align="center" valign="middle" class="borderright">发布状态</th>
        <th align="center" valign="middle">操作</th>
      </tr>
      <!-- 系统管理员身份下的公告列表 -->
      <c:forEach items="${notices }" var="notice" varStatus="status">
      <c:if test="${notice.status eq 1 }">
      <tr class="bggray" onMouseOut="this.style.backgroundColor='#f9f9f9'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="center" valign="middle" class="borderright borderbottom">${status.index+1 }</td>
        <td align="center" valign="middle" class="borderright borderbottom">
        	<a title="${notice.content }" style="text-decoration: none;">${notice.title }</a>
        </td>
        <td align="center" valign="middle" class="borderright borderbottom">
        <fmt:formatDate value="${notice.launch }" pattern='yyyy-MM-dd HH:mm'/></td>
        <td align="center" valign="middle" class="borderright borderbottom">
        <font color="red">${notice.cid eq 'all' ? '校社团联': notice.cid}</font></td>
        <!-- 发布状态 -->
        <td align="center" valign="middle" class="borderright borderbottom">
        <c:choose>        	
	        <c:when test="${notice.status eq 0 && notice.cid eq 'all'}"><font color="orange">保存为草稿</font></c:when>
	        <c:when test="${notice.status eq 1 }"><font color="green">已发布</font></c:when>
	        <c:otherwise><font color="grey">未知</font></c:otherwise>   
        </c:choose>        	
        </td>
        <td align="center" valign="middle" class="borderbottom">
	        <c:choose>
	        	<c:when test="${notice.cid ne 'all' }"><font color="grey">不在管理范围内</font></c:when>
	        	<c:when test="${notice.status eq 0 }">
	        		<!-- 草稿状态 -->
		        	<a href="toEditNotice?nid=${notice.noticeid }&identify=sys" target="mainFrame" onFocus="this.blur()" style="text-decoration: none;">
		        	<font color="green">编辑</font></a>
		        	<span class="gray">&nbsp;|&nbsp;</span>
		        	<a href="deleteNotice?nid=${notice.noticeid }" target="mainFrame" onFocus="this.blur()" 
		        	onclick="return confirm('确认是否删除此公告？');"><font color="red">删除</font></a>
	        	</c:when>
	        	<c:when test="${notice.status eq 1 }">
	        		<!-- 已发布状态 -->
	        		<a href="toEditNotice?nid=${notice.noticeid }&identify=sys" target="mainFrame" onFocus="this.blur()" style="text-decoration: none;">
	        		<font color="orange">修改</font></a>
	        	</c:when>
	        </c:choose>
        </td>
      </tr></c:if>
      </c:forEach></c:if>
      
      <c:if test="${not empty news }">
      <tr>
        <th align="center" valign="middle" class="borderright">序号</th>
        <th align="center" valign="middle" class="borderright">标题</th>
        <th align="center" valign="middle" class="borderright">发布时间</th>
        <th align="center" valign="middle" class="borderright">发布者</th>
        <th align="center" valign="middle" class="borderright">发布状态</th>
        <th align="center" valign="middle">操作</th>
      </tr>
      <!-- 社团管理员身份下的公告列表 -->
      <c:forEach items="${news }" var="news">
      <c:if test="${news.cid eq cid or news.cid eq 'all' and news.status eq 1}">
      <tr class="bggray" onMouseOut="this.style.backgroundColor='#f9f9f9'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="center" valign="middle" class="borderright borderbottom">${status.index+1 }</td>
        <td align="center" valign="middle" class="borderright borderbottom">
        	<a href="intoNoticeDetail?nid=${news.noticeid }" title="${news.content }" style="text-decoration: none;">${news.title }</a>
        </td>
        <!-- 发布日期 -->
        <td align="center" valign="middle" class="borderright borderbottom">
        <fmt:formatDate value="${news.launch }" pattern='yyyy-MM-dd HH:mm'/></td>
        <!-- 发布者 -->
        <td align="center" valign="middle" class="borderright borderbottom">
        <font color="red">${news.cid eq 'all' ? '校社团联': cname}</font></td>
        <!-- 发布状态  -->
        <td align="center" valign="middle" class="borderright borderbottom">	       
	        <c:if test="${news.status eq 1 }"><font color="green">已发布</font></c:if>
	        <c:if test="${news.status eq 0 }"><font color="orange">已保存为草稿</font></c:if>
        </td>
        <td align="center" valign="middle" class="borderbottom">
	        <c:choose>
	        	<c:when test="${news.cid eq cid and news.status eq 0}">
	        		<!-- 草稿状态 且只能编辑自己社团的公告-->
		        	<a href="toEditNotice?nid=${news.noticeid }&identify=club&name=${cname }" target="mainFrame" onFocus="this.blur()" style="text-decoration: none;">
		        	<font color="green">编辑</font></a>
		        	<span class="gray">&nbsp;|&nbsp;</span>
		        	<a href="deleteNotice?nid=${news.noticeid }" target="mainFrame" onFocus="this.blur()" 
		        	onclick="return confirm('确认是否删除此公告？');"><font color="red">删除</font></a>
	        	</c:when>
	        	<c:when test="${news.status eq 1 and news.cid eq cid}">
	        		<!-- 已发布状态 -->
	        		<a href="toEditNotice?nid=${news.noticeid }&identify=club&name=${cname }" target="mainFrame" onFocus="this.blur()" style="text-decoration: none;">
	        		<font color="orange">修改</font></a>
	        	</c:when>
	        	<c:otherwise><font color="grey">不可操作</font></c:otherwise>
	        </c:choose>
        </td>
      </tr></c:if>
      <%-- <c:if test="${news.cid ne cid and new.status eq 1}"></c:if> --%>
      </c:forEach></c:if>
      
      <c:if test="${not empty news_user }">
      <tr>
        <th align="center" valign="middle" class="borderright">序号</th>
        <th align="center" valign="middle" class="borderright">标题</th>
        <th align="center" valign="middle" class="borderright">发布时间</th>
        <th align="center" valign="middle" class="borderright">发布者</th>
      </tr>
      <!-- 普通用户身份下的公告列表 -->
      <c:forEach items="${news_user }" var="news">
      <c:if test="${news.status eq 1 }">
      <tr class="bggray" onMouseOut="this.style.backgroundColor='#f9f9f9'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="center" valign="middle" class="borderright borderbottom">${status.index+1 }</td>
        <td align="center" valign="middle" class="borderright borderbottom">
        	<a href="intoNoticeDetail?nid=${news.noticeid }" title="${news.content }" target="mainFrame" style="text-decoration: none;">${news.title }</a>
        </td>
        <td align="center" valign="middle" class="borderright borderbottom">
        <fmt:formatDate value="${news.launch }" pattern="yyyy-MM-dd HH:mm"/></td>
        <td align="center" valign="middle" class="borderright borderbottom"><font color="red">${news.cid eq 'all' ? '校社团联':news.cid }</font></td>
      </tr></c:if>
      </c:forEach></c:if>      
    </table>    
    </td>
  </tr>
</table>
</body>
</html>