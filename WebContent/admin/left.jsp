<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%pageContext.setAttribute("ctp", request.getContextPath());  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧导航menu</title>
<link rel="stylesheet" type="text/css" href="${ctp}/admin/css/css.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/sdmenu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.3.js"></script>
<script type="text/javascript">
	var myMenu;
	window.onload = function() {
		myMenu = new SDMenu("my_menu");
		myMenu.init();
		
		var id = "${login.id}";
		console.log(id);
		$.ajax({
			url:"${pageContext.request.contextPath}/getClubNameByUserid",
			type:"POST",
			async:true,
			data:{"uid":id},
			dataType:"json",
			success:function(result){
				$("#selectClub").append("<option value='0'>请选择</option>");
				for(var i=0;i<result.length;i++){
					$("#selectClub").append("<option>"+result[i]+"</option>");
				}
			},
			error:function(e){
				alert(e);
			}
		});
		
		var links = $("#admin_club a");	/*获取id为admin_club的标签下的所有a标签*/
		var prelinks=[10];
		for(var i=0;i<links.length-1;i++){/*循环保存每个超链接最初的请求路径，每次触发选择事件时，都保证前缀是原始的路径*/
			prelinks[i] = $(links[i]).attr('href');
		}
		for(var i=0;i<links.length-1;i++){	/*通过循环为每一个a标签修改其对应的href属性值*/
			$(links[i]).attr('href', "javascript:;" );
		}		
		$("#selectClub").bind("change",function(){
			var name = $("#selectClub option:selected").text();
			if(name=="请选择" || name==''){				
				for(var i=0;i<links.length-1;i++){	/*通过循环为每一个a标签修改其对应的href属性值*/
					$(links[i]).attr('href', "javascript:;" );
				}				
				$("#actsign").attr('href',"javascript:;");
				$("#clubsign").attr('href',"javascript:;");
			}				
			else{
				/*当选择要管理的社团发生改变时，批量修改a标签的href属性值*/				
				for(var i=0;i<links.length-1;i++){	/*通过循环为每一个a标签修改其对应的href属性值*/
					if(i==2){
						$(links[i]).attr('href', prelinks[i] + "?name=" + name + "&identify=club");
						continue;
					}
					$(links[i]).attr('href', prelinks[i] + "?name=" + name + "&uid=" + id);
					/*alert( $(links[i]).attr('href') );*/	/*打印a标签的href属性值*/
				}
				$("#clubsign").attr('href',"../unsolveClubSign?name=" + name);
				$("#actsign").attr('href',"../unsolveActSign?name=" + name);/* 选择不同的社团，触发函数方法以改变超链接标签的href的值 */
			}				
		});	
	};
</script>
<style type="text/css">
html{ SCROLLBAR-FACE-COLOR: #538ec6; SCROLLBAR-HIGHLIGHT-COLOR: #dce5f0; SCROLLBAR-SHADOW-COLOR: #2c6daa; SCROLLBAR-3DLIGHT-COLOR: #dce5f0; SCROLLBAR-ARROW-COLOR: #2c6daa;  SCROLLBAR-TRACK-COLOR: #dce5f0;  SCROLLBAR-DARKSHADOW-COLOR: #dce5f0; overflow-x:hidden;}
body{overflow-x:hidden; background:url(images/main/leftbg.jpg) left top repeat-y #f2f0f5; width:194px;}
</style>
</head>
<body onselectstart="return false;" ondragstart="return false;" oncontextmenu="return false;">
	<!-- 系统管理员左侧导航显示 -->
	<c:choose><c:when test="${login.status eq 3}">
	<div id="left-top">
		<div><img src="${ctp}/header/head.jpg" width="44" height="44" /></div>
	    <span>用户：${login.id }<br/>角色：&nbsp;系统管理员</span>
	</div>
    <div style="float: left" id="my_menu" class="sdmenu">
      <div class="collapsed">
        <span>社团管理</span>
        <a href="../queryAllClubs" target="mainFrame" onFocus="this.blur()">展示社团列表</a>
        <a href="../display" target="mainFrame" onFocus="this.blur()">展示用户列表</a>
      </div>
      <div>
        <span>公告管理</span>
        <a href="../toEditNotice?identify=sys" target="mainFrame" onFocus="this.blur()">发布公告</a>
        <a href="../selectAllNotices" target="mainFrame" onFocus="this.blur()">查看公告</a>
      </div>
      <!-- <div>
        <span>社联新闻</span>
        <a href="../toEditNews" target="mainFrame" onFocus="this.blur()">发布社联动态</a>
        <a href="../selectAllNews" target="mainFrame" onFocus="this.blur()">查看社联新闻</a>
      </div> -->
      <div>
        <span>审核处理</span>
        <a href="../unsolvedActApply" target="mainFrame" onFocus="this.blur()">社团活动审核处理</a>
        <a href="../unsolvedClubRegister" target="mainFrame" onFocus="this.blur()">社团注册审核处理</a>
      </div>
    </div>
    </c:when>    
    <c:otherwise>
    <!-- 社团管理员左侧导航显示 -->
    <div id="left-top">
		<div><img src="${ctp}/header/head.jpg" width="44" height="44" />
		</div>
	    <span>用户：${login.id }<br/>角色：&nbsp;社团管理员</span>
	    <span >我管理的社团：<select id="selectClub"><option></option></select></span>
	</div>	
    <div style="float: left" id="my_menu" class="sdmenu">
      <div class="collapsed">
      <span>我的管理</span>
      <a href="../showClubOfWho?uid=${login.id }" target="mainFrame" onFocus="this.blur()">我的社团</a>
      </div>
      <div class="collapsed" id="admin_club">
        <span>社团管理</span>
        <a href="../toEditClubInfo" target="mainFrame" onFocus="this.blur()">社团信息</a>
        <a href="../showClubAct" target="mainFrame" onFocus="this.blur()">社团活动</a>
        <a href="../selectAllNoticesAsAdmin_club" target="mainFrame" onFocus="this.blur()">社团动态</a>
        <a href="../showClubMember" target="mainFrame" onFocus="this.blur()">社团成员</a>
        <a href="../toRegisterClub?uid=${login.id }&flag=0" target="mainFrame" onFocus="this.blur()">注册社团</a>
      </div>
      <div class="collapsed">
      	<span>通知管理</span>
      	<a id="actsign" href="javascript:;" target="mainFrame" onFocus="this.blur()">用户报名活动申请处理</a>
      	<a id="clubsign" href="javascript:;" target="mainFrame" onFocus="this.blur()">用户加入社团申请处理</a>
      	<a href="../showClubSignResult?uid=${login.id }" target="mainFrame" onFocus="this.blur()">加入社团处理结果</a>
      	<a href="../showActSignResult?uid=${login.id }" target="mainFrame" onFocus="this.blur()">活动报名处理结果</a>
      	<a href="../showActPublishResult?uid=${login.id }" target="mainFrame" onFocus="this.blur()">活动发布处理结果</a>
      	<a href="../showClubRegisterResult?uid=${login.id }" target="mainFrame" onFocus="this.blur()">注册社团申请结果</a>
      </div>
    </div>      
    </c:otherwise></c:choose>
</body>

</html>