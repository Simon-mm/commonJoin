<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>活力社团-湖北汽车工业学院学生社团工作网站</title>
<META Name="SiteName" Content="湖北汽车工业学院学生社团工作网站" />
<META Name="SiteDomain" Content="sau.scu.edu.cn" />
<META Name="ColumnName" Content="活力社团" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css_other/base.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css_other/layouts.css" />
<!--Announced by Visual SiteBuilder 9-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_sitegray/_sitegray_d.css" />
<script language="javascript" src="${pageContext.request.contextPath}/_sitegray/_sitegray.js"></script>
<!-- CustomerNO:7765626265723230747647545350574703090000 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/list.vsb.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js_other/counter.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css_other/sys.css">
<script language="javascript" src="${pageContext.request.contextPath}/js_other/base64.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/js_other/formfunc.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/js_other/news/mp4video.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/js_other/dynclicks.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/js_other/openlink.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/js_other/centerCutImg.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/js_other/ajax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.3.js"></script>
<script type="text/javascript">
	// 报名活动时判断是否登录过？	
	function isLogin(){
		var login = "${login}" //1.这里是获取session域中的对象；2.需要用双引号将获取的值包含起来，否则会报错；
		/* alert(login); */
		if(login == "" ){
		    var is = confirm("请先登录，再报名活动！\n\n点击“确定”，您将跳转至登录界面.");
		    if(is == true){
		    	/* $('#sign').attr('href',"javascript:void(0);"); */
				window.parent.location.href="${pageContext.request.contextPath}/login.jsp";
				return false;
		    }else
		    	return false;
		}else
		    return true;
	}	
	/* _jsq_(1040,'/list.jsp',-1,1615781732); */		
	function _nl_ys_check() {
	    var keyword = document.getElementById('showkeycode260997').value;
	    if (keyword == null || keyword == "") {
	        alert("请输入你要检索的内容！");
	        return false;
	    }
	    if (window.toFF == 1) {
	        document.getElementById("lucenenewssearchkey260997").value = Simplized(keyword);
	    } else {
	        document.getElementById("lucenenewssearchkey260997").value = keyword;
	    }
	    var base64 = new Base64();
	    document.getElementById("lucenenewssearchkey260997").value = base64.encode(document.getElementById("lucenenewssearchkey260997").value);
	    new VsbFormFunc().disableAutoEnable(document.getElementById("showkeycode260997"));
	    return true;
	}		
</script>
</head>
<body>
	<!--头部-->
	<div class="head">
		<div class="head-top">
			<div class="wrap">
				<div class="top-link fr">					
					<!-- 登录模块 -->
					<c:if test="${empty login }">
						<a href="login.jsp" target="_blank" title="登录">社团登录入口</a>
						<span>/</span>
						<a href="register.jsp" title="注册">注册</a>
					</c:if>
					<c:if test="${not empty login }">
						<a href="login?status=${login.status }" target="_blank" title="">欢迎你，${login.id }用户</a>
						<span>/</span>
						<a href="loginOut" title="注销">注销</a>
					</c:if>					
				</div>
				<span><p>湖北汽车工业学院学生社团网站！</p></span>
			</div>
		</div>
		<div class="head-bottom wrap">
			<div class="search fr">
				
				<form action="search.jsp?wbtreeid=1001" method="post" id="au2a"
					name="au2a" onsubmit="return _nl_ys_check()">
					<input type="hidden" id="lucenenewssearchkey260997"
						name="lucenenewssearchkey" value=""><input type="hidden"
						id="_lucenesearchtype260997" name="_lucenesearchtype" value="1"><input
						type="hidden" id="searchScope260997" name="searchScope" value="0">
					<input name="showkeycode" id="showkeycode260997" type="text"
						value="输入您要查找的关键字" class="text"> <input type="submit"
						value="" class="submit">
				</form>				
			</div>
			<!-- 网站logo图片地址请在本组件"内容配置-网站logo"处填写 -->
			<a href="../index.jsp">
			<img src="${pageContext.request.contextPath}/images/xiaohui.png" width="74" height="74">
			<font style="font-style: italic;">汽院大学生社团网站</font>
			</a>
		</div>
	</div>
	<!--导航-->
	<div class="nav">
		<div class="wrap">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li><a href="#" class="hover">活力社团</a></li>
				<li><a href="getClubNotice">社团快讯</a></li>
			</ul>
		</div>
	</div>
	<!--内页banner-->
	<div class="nybanner">
		<img src="${pageContext.request.contextPath}/images/guanwangtoutujiabianban.jpg" border="0">
	</div>
	<div class="padding-40 cleafix">
		<div class="wrap cleafix">
			<div class="nrfl fl">
				<h3>活力社团</h3>
				<ul class="cleafix">
					<li class="hoverl"><a href="getClubList" title="活力社团" class="hover">活力社团</a></li>
				</ul>
			</div>
			<div class="nrfr fr cleafix">
				<div class="dpdq">
					<ul class="cleafix fr">
						<li><a href="#">当前位置:</a></li>
						<li><a href="index.jsp">首页</a></li>
						<li><a href="getClubList">活力社团</a></li>
						<li><a href="#">活动信息</a></li>
					</ul>
					<h2>活力社团</h2>
				</div>				
				<ul class="list cleafix">
					<c:if test="${not empty actInfo }">
						<!-- 显示社团活动的详细信息 -->
						<li id="line_u10_0">
							<span class="fr gay"><font color="green"><fmt:formatDate value="${actInfo.actStart }" pattern='yyyy-MM-dd'/></font></span>
							<a href="#">活动名称：${actInfo.actName }</a>
						</li>
						<li id="line_u10_0">
							<a href="#">人数：${actInfo.actNum }</a>
						</li>
						<li id="line_u10_0">
							<a href="#">地点：${actInfo.actPlace }</a>
						</li>
						<li id="line_u10_0">
							<a href="#">简介：${actInfo.actAttempt }</a>
						</li>
						<li id="line_u10_0">							
							<a id="sign" href="login?status=${login.status }" onclick="return isLogin();" title="点击进入个人页面">报名活动</a>							
						</li>
					</c:if>
					<c:if test="${empty actInfo }">
						<li id="line_u10_0">
							<span class="fr gay"></span><font color="red" style="font-size: 15px;">暂无数据</font>
						</li>
					</c:if>
				</ul>
				<script>_showDynClickBatch(['dynclicks_u10_22262','dynclicks_u10_22236','dynclicks_u10_22238','dynclicks_u10_22237','dynclicks_u10_22233','dynclicks_u10_22232','dynclicks_u10_22241','dynclicks_u10_22234','dynclicks_u10_22240','dynclicks_u10_22235'],[22262,22236,22238,22237,22233,22232,22241,22234,22240,22235],"wbnews", 1615781732)</script>
			</div>
		</div>
	</div>
	<!--版权-->
	<div class="foot">
		<div class="wrap cleafix">
			<div class="p_list fl">
				<!-- 版权内容请在本组件"内容配置-版权"处填写 -->
				<p>Copyright © 2020湖北汽车工业学院社团联合会 版权所有.</p>
				<p>地址：湖北省十堰市湖北汽车工业学院校团委办公室</p>
				<p>邮编：610225</p>
			</div>
			<div class="img_li fl">
				<a href="http://www.scu.edu.cn/" title=""
					onclick="_addDynClicks(&#34;wbimage&#34;, 1615781732, 55396)"
					target="_blank"> <img src="images/wb-logo_03.png" border="0">
				</a>
			</div>
			<!--友情链接-->
			<div class="box-search fr cleafix">
				<select onchange="_openSelectLink(this, 'value', 'addclicks')"
					class="box_1">
					<option>--校内链接--</option>
					<option value="http://lib.scu.edu.cn/" title=""
						addclicks="_addDynClicks(&#34;wburl&#34;, 1615781732, 63012)">湖北汽车工业学院图书馆</option>
					<option value="http://xsc.scu.edu.cn/" title=""
						addclicks="_addDynClicks(&#34;wburl&#34;, 1615781732, 63013)">湖北汽车工业学院党委学生工作部</option>
					<option value="http://jwc.scu.edu.cn/" title=""
						addclicks="_addDynClicks(&#34;wburl&#34;, 1615781732, 63011)">湖北汽车工业学院教务处</option>
					<option value="http://tuanwei.scu.edu.cn/" title=""
						addclicks="_addDynClicks(&#34;wburl&#34;, 1615781732, 63650)">湖北汽车工业学院校团委</option>
				</select> <select onchange="_openSelectLink(this, 'value', 'addclicks')"
					class="box_1" style="margin-top: 0;">
					<option>--校外链接--</option>
					<option value="http://www.ccyl.org.cn/" title=""
						addclicks="_addDynClicks(&#34;wburl&#34;, 1615781732, 63014)">中国共青团网</option>
					<option value="https://www.cdcyl.com.cn/" title=""
						addclicks="_addDynClicks(&#34;wburl&#34;, 1615781732, 63640)">湖北共青团网</option>
				</select>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js_other/gy.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js_other/same.js"></script>
	<script>
		$(function() {
			$(".list li:nth-child(odd)").css("background-color", "#f7f7f7")
		})
	</script>
</body>
</html>
