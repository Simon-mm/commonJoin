<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑通告</title>
<link rel="icon" href="images/pander.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/css.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/main.css"/>
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
    <td width="99%" align="left" valign="top">您的位置：公告管理&nbsp;&nbsp;>&nbsp;&nbsp;发布公告</td>
  </tr>  
  <tr>
    <td align="left" valign="top">
    <form method="post" action="" id="editNotice">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
    
      <!-- 隐藏域：发布者 -->
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="top" class="borderright borderbottom bggray">发布者：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        	<input type="text" readonly="readonly" value="${publisher eq 'all' ? '全体社团' : publisher}">
        	
        </td>
        <td><input name="cid" type="text" value="${non.cid }"></td>
      </tr>
      
      <!-- 隐藏域：公告id -->
      <tr><td><input name="noticeid" type="hidden" readonly="readonly" value="${non.noticeid }"></td></tr>
    
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="top" class="borderright borderbottom bggray">标题：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        	<input type="text" name="title" placeholder="请输入标题……" value="${non.title }" required/>
        </td>
      </tr>
    
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="top" class="borderright borderbottom bggray">公告内容：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        	<textarea name="content" rows="10" cols="50" placeholder="请输入文本内容……" style="resize: none;" required>${non.content }</textarea>
        </td>
      </tr>
      <!-- 隐藏域：点赞 -->
      <tr><td><input name="likes" type="hidden" value="${non.likes }"></td></tr>
      <!-- 隐藏域：浏览量 -->
      <tr><td><input name="browser" type="hidden" value="${non.browser }"></td></tr>
      
      <!-- 隐藏域：发布日期 -->
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="top" class="borderright borderbottom bggray">发布时间：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        	<input name="launch" type="hidden" value="<fmt:formatDate value="${non.launch}" pattern='yyyy-MM-dd HH:mm'/>">
        </td>
      </tr>
      
      <!-- 隐藏域：发布状态-->
      <tr><td><input name="status" type="hidden" value="${non.status }"></td></tr>
      
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input id="savebtn" type="button" value="保存" class="text-but">
        <input id="sendbtn" type="button" value="发送" class="text-but">
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
		$("#sendbtn").click(function(){
			alert('公告发送中……');
			var notice = $("#editNotice").serializeJSON();
			console.log(JSON.stringify(notice));
			$.ajax({
				url:"${pageContext.request.contextPath}/sendNotice?flag=send",
				type:"post",
				async:true,
				contentType:'application/json',
				data:JSON.stringify(notice),
				success:function(data){
					console.log(data);
					if(data){
						alert('发布成功！');
					}else{
						alert('发布失败！请重试！');
					}					
				},
				error:function(e){
					alert('请求出错！' + e);
				}
			});
		});
		
		$("#savebtn").click(function(){
			alert('保存草稿……');
			var notice = $("#editNotice").serializeJSON();
			console.log(JSON.stringify(notice));
			$.ajax({
				url:"${pageContext.request.contextPath}/sendNotice?flag=save",
				type:"post",
				async:true,
				contentType:'application/json',
				data:JSON.stringify(notice),
				success:function(data){
					console.log(data);
					if(data){
						alert('保存成功！');
					}else{
						alert('保存失败！请重试！');
					}					
				},
				error:function(e){
					alert('请求出错！' + e);
				}
			});
		});
		
	});
</script>

</html>