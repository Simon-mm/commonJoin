<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>湖北汽车工业学院学生社团网站</title>
<META Name="SiteName" Content="湖北汽车工业学院学生社团网站" />
<META Name="SiteDomain" Content="sau.scu.edu.cn" />
<link href="css_other/base.css" rel="stylesheet">
<link href="css_other/style.css" rel="stylesheet">
<!--Announced by Visual SiteBuilder 9-->
<link rel="stylesheet" type="text/css" href="_sitegray/_sitegray_d.css" />
<script language="javascript" src="_sitegray/_sitegray.js"></script>
<!-- CustomerNO:7765626265723230747647545350574703090000 -->
<link rel="stylesheet" type="text/css" href="css_other/index.vsb.css" />
<script type="text/javascript" src="js_other/counter.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js_other/gy.js"></script>
<script type="text/javascript" src="js_other/gy1.js"></script>
<script type="text/javascript" src="js_other/same.js"></script>
<script type="text/javascript" src="js/jquery-1.4.3.js"></script>
<script type="text/javascript" src="js/jquery.serializejson.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js_other/gy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js_other/gy1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js_other/same.js"></script>
<script type="text/javascript">_jsq_(1001, '/index.jsp', -1, 1615781732)</script>
<script language="javascript" src="js_other/dynclicks.js"></script>
<script language="javascript" src="js_other/openlink.js"></script>
<script language="javascript" src="js_other/base64.js"></script>
<script language="javascript" src="js_other/formfunc.js"></script>
<script language="javascript" src="js_other/news/mp4video.js"></script>
<script language="javascript" src="js/centerCutImg.js"></script>
<script language="javascript" src="js/ajax.js"></script>
<style type="text/css">
ul, li {
	padding: 0;
	margin: 0;
	list-style: none;
}

#flashBoxu_u9_ {
	width: 250px;
	height: 255px;
	border: 0px solid #EEE;
	position: relative;
	margin-left: auto;
	margin-right: auto;
}

#flashBoxu_u9_ img {
	/*初始不要显示*/
	display: none;
	/*用边框来实现空位，因为margin和paading有时会引起些麻烦*/
	border: 0px solid #FFF;
}

#flashBoxu_u9_ ul {
	position: absolute;
	right: 7px;
	bottom: 3px;
	font: 9px tahoma;
}

#flashBoxu_u9_ ul li {
	display: block;
	float: left;
	width: 12px;
	height: 12px;
	line-height: 12px;
	margin-right: 3px;
	border: 0px solid #999;
	background: #F0F0F0;
	text-align: center;
	cursor: pointer;
}

#flashBoxu_u9_ ul li.hover {
	border-color: red;
	background: #FFE1E1;
	color: red;
}

ul, li {
	padding: 0;
	margin: 0;
	list-style: none;
}

#flashBoxu_u11_ {
	width: 250px;
	height: 255px;
	border: 0px solid #EEE;
	position: relative;
	margin-left: auto;
	margin-right: auto;
}

#flashBoxu_u11_ img {
	/*初始不要显示*/
	display: none;
	/*用边框来实现空位，因为margin和paading有时会引起些麻烦*/
	border: 0px solid #FFF;
}

#flashBoxu_u11_ ul {
	position: absolute;
	right: 7px;
	bottom: 3px;
	font: 9px tahoma;
}

#flashBoxu_u11_ ul li {
	display: block;
	float: left;
	width: 12px;
	height: 12px;
	line-height: 12px;
	margin-right: 3px;
	border: 0px solid #999;
	background: #F0F0F0;
	text-align: center;
	cursor: pointer;
}

#flashBoxu_u11_ ul li.hover {
	border-color: red;
	background: #FFE1E1;
	color: red;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".header").load("html/header.html");
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
		function flashBoxCtrl(o) {
	      	this.obj = document.getElementById(o);
		    //这个私有方法虽然写了，但暂时没用到
		    function addListener(ele, eventName, functionBody) {
		    	if (ele.attachEvent) {
					ele.attachEvent("on" + eventName, functionBody);
	          	} else if (ele.addEventListener) {
	              ele.addEventListener("on" + eventName, functionBody, false);
	          	} else {
	              return false;
	          	}
		    }
		    //初始化
	      	this.init = function () {
				var objImg = this.obj.getElementsByTagName("img");
				var tagLength = objImg.length;
		        if (tagLength > 0) {
		            var oUl = document.createElement("ul");
		            oUl.setAttribute("id", o + "numTag");
		            for (var i = 0; i < tagLength; i++) {
		                var oLi = oUl.appendChild(document.createElement("li"));
		                if (i == 0) {
		                    oLi.setAttribute("class", "hover"); //初始化时把第一个设置为高亮
		                    oLi.setAttribute("className", "hover");
		                }
		                //设置标签的数字
		                oLi.appendChild(document.createTextNode((i + 1)));
		            }
		            this.obj.appendChild(oUl);
					objImg[0].style.display = "block";
					//设置标签事件
					var oTag = this.obj.getElementsByTagName("li");
					for (var i = 0; i < oTag.length; i++) {
						var flag = 0;
						var temp = 0;
						var timeout = null;
						var step = function () {
						    for (j = 0; j < oTag.length; j++) {
						        oTag[j].className = "";
						        objImg[j].style.display = "none";
					    	}
						    this.className = "hover";
						    flag = flag >= oTag.length - 1 ? 0 : flag + 1;
						    objImg[flag].style.display = "block";
						    oTag[flag].className = "hover";
						    timeout = setTimeout(step, 4000);
						};
						oTag[i].onmouseover = function () {
						    for (j = 0; j < oTag.length; j++) {
						        oTag[j].className = "";
						        objImg[j].style.display = "none";
						        temp = j;
						    }
						    this.className = "hover";
						    objImg[this.innerHTML - 1].style.display = "block";
						    temp = this.innerHTML - 1;
						    flag = i;
						    clearInterval(timeout);
						}
						oTag[i].onmouseout = function () {
						    for (j = 0; j < oTag.length; j++) {
						        oTag[j].className = "";
						        objImg[j].style.display = "none";
						    }
						    flag = temp;
						    objImg[temp].style.display = "block";
						    oTag[temp].className = "hover";
						    timeout = setTimeout(step, 4000);
						}
						if (i == 0) {
						    timeout = setTimeout(step, 4000);
						}
					}
		          }
		      };
		      //自动滚动的方法还没写
		      this.imgRoll = function () { };
		      //生成对象时自动加载init()方法以初始化对象
		      this.init();
			}
		
		function flashBoxCtrl(o) {
            this.obj = document.getElementById(o);
            //这个私有方法虽然写了，但暂时没用到
            function addListener(ele, eventName, functionBody) {
                if (ele.attachEvent) {
                    ele.attachEvent("on" + eventName, functionBody);
                } else if (ele.addEventListener) {
                    ele.addEventListener("on" + eventName, functionBody, false);
                } else {
                    return false;
                }
            }
            //初始化
            this.init = function () {
                var objImg = this.obj.getElementsByTagName("img");
                var tagLength = objImg.length;
                if (tagLength > 0) {
                    var oUl = document.createElement("ul");
                    oUl.setAttribute("id", o + "numTag");
                    for (var i = 0; i < tagLength; i++) {
                        var oLi = oUl.appendChild(document.createElement("li"));
                        if (i == 0) {
                            oLi.setAttribute("class", "hover"); //初始化时把第一个设置为高亮
                            oLi.setAttribute("className", "hover");
                        }
                        //设置标签的数字
                        oLi.appendChild(document.createTextNode((i + 1)));
                    }
                    this.obj.appendChild(oUl);
                    objImg[0].style.display = "block";
                    //设置标签事件
                    var oTag = this.obj.getElementsByTagName("li");
                    for (var i = 0; i < oTag.length; i++) {
                        var flag = 0;
                        var temp = 0;
                        var timeout = null;
                        var step = function () {
                            for (j = 0; j < oTag.length; j++) {
                                oTag[j].className = "";
                                objImg[j].style.display = "none";
                            }
                            this.className = "hover";
                            flag = flag >= oTag.length - 1 ? 0 : flag + 1;
                            objImg[flag].style.display = "block";
                            oTag[flag].className = "hover";
                            timeout = setTimeout(step, 4000);
                        };
                        oTag[i].onmouseover = function () {
                            for (j = 0; j < oTag.length; j++) {
                                oTag[j].className = "";
                                objImg[j].style.display = "none";
                                temp = j;
                            }
                            this.className = "hover";
                            objImg[this.innerHTML - 1].style.display = "block";
                            temp = this.innerHTML - 1;
                            flag = i;
                            clearInterval(timeout);
                        }
                        oTag[i].onmouseout = function () {
                            for (j = 0; j < oTag.length; j++) {
                                oTag[j].className = "";
                                objImg[j].style.display = "none";
                            }
                            flag = temp;
                            objImg[temp].style.display = "block";
                            oTag[temp].className = "hover";
                            timeout = setTimeout(step, 4000);
                        }
                        if (i == 0) {
                            timeout = setTimeout(step, 4000);
                        }
                    }
                }
            };
            //自动滚动的方法还没写
            this.imgRoll = function () { };
            //生成对象时自动加载init()方法以初始化对象
            this.init();
        }
	});	
</script>
</head>

<body>
	<!--头部-->
	<div class="head">
		<div class="head-top">
			<div class="wrap">
				<div class="top-link fr">
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
			<div class="search fr"></div>
			<!-- 网站logo图片地址请在本组件"内容配置-网站logo"处填写 -->
			<a href="index.jsp"><img src="images/xiaohui.png" width="74"
				height="74"><font style="font-style: italic;">汽院大学生社团网站</font></a>
		</div>
	</div>
	<!--导航-->
	<div class="nav">
		<div class="wrap">
			<ul>
				<li><a href="index.jsp" class="hover">首页</a></li>
				<li><a href="getClubList">活力社团</a>
				<li><a href="getClubNotice">社团快讯</a></li>
			</ul>
		</div>
	</div>
	<!--banner-->
	<div class="focus same">
		<ul class="focuspic">
			<li><img src="images/baituantoutu.jpg" border="0"></li>
			<li><img src="images/lvshutoutu.jpg" border="0"></li>
			<li><img src="images/xiyangtoutu.jpg" border="0"></li>
		</ul>
		<div class="num">
			<ul></ul>
		</div>
	</div>
	<!--内容1-->
	<div class="con-1 wrap cleafix">
		<div class="stkx fl">
			<div class="col-title">
				<i class="icon icon-jdxw"></i> <span class="cn">社团快讯</span>
				<!-- <a class="more" href="stkx.htm">MORE+</a> -->
			</div>
			<div class="card fl cleafix">				
				<a href="info/1002/22320.htm" target="_blank"
					title="湖北汽车工业学院2020–2021年度十佳社团答辩评选会顺利结束"> <img class="lazy"
					src="/__local/5/CB/32/52BF3F5CA074D597A7796D66A95_50CE8C95_21B9D.png">
					<div class="index-boxn">
						<h2>湖北汽车工业学院2020–2021年度十佳社团答...</h2>
						<div class="index-new">
							<span class="time">2021年05月26日</span><span>点击次数:<span>
							<span id="dynclicks_u6_22320" name="dynclicks_u6_22320"></span></span></span>
						</div>
						<p>2021年5月21日13时至17时，湖北汽车工业学院2020-2021年度十佳社团评选答辩会在江安校区水上报告厅举行。此次答辩会由学工部、研工部、教务处、校团委、学...</p>
					</div>
				</a>
				<script>_showDynClickBatch(['dynclicks_u6_22320'], [22320], "wbnews", 1615781732)</script>
			</div>
			<div class="cleafix xw-time-y fl">
				<ul id="stkx_ul" class="cleafix">
					<c:if test="${not empty stkx }">
						<c:forEach items="${stkx }" var="stkx" varStatus="status">
							<li><a href="activityDetail?actid=${stkx.actID }" target="_blank" title="${stkx.actAttempt }">${stkx.actName }
							<span class="fr gay"><fmt:formatDate value="${stkx.actStart }" pattern='yyyy-MM-dd' /></span></a></li>
						</c:forEach>
					</c:if>
					<c:if test="${empty stkx }">
						<li><a href="#" target="_blank"
							title="冬去春来，社团活动蓬勃发展">冬去春来，社团活动蓬勃发展<span class="fr gay">2022-03-22</span></a>
						</li>
					</c:if>
				</ul>
				<script>_showDynClickBatch(['dynclicks_u7_22376', 'dynclicks_u7_22366', 'dynclicks_u7_22356', 'dynclicks_u7_22320'], [22376, 22366, 22356, 22320], "wbnews", 1615781732)</script>
			</div>
		</div>
		<!--社团工作-->
		<div class="stgz fr">
			<div class="col-title">
				<i class="icon icon-jdxw1"></i> <span class="cn">通知公告</span>
				<!-- <a href="tzgg.htm" class="more">MORE+</a> -->
			</div>
			<ul class="cleafix">
				<li><a href="#" target="_blank"
					title="关于湖北汽车工业学院2021-2022学年秋季学期学生社团精品活动初评结果的公示">
						<div class="st-time fl">
							<span class="day">22</span> <span class="time">2021.10</span>
						</div>
						<div class="st-wz fr">关于湖北汽车工业学院2021-2022学年秋季学期学生社团精品活动初评...</div>
				</a></li>
				<li><a href="info/1003/22346.htm" target="_blank"
					title="关于启动湖北汽车工业学院2021-2022学年学生社团第四批精品项目申报的通知">
						<div class="st-time fl">
							<span class="day">08</span> <span class="time">2021.10</span>
						</div>
						<div class="st-wz fr">关于启动湖北汽车工业学院2021-2022学年学生社团第四批精品项目申...</div>
				</a></li>
			</ul>
			<script>_showDynClickBatch(['dynclicks_u8_22347', 'dynclicks_u8_22346', 'dynclicks_u8_22338', 'dynclicks_u8_22326'], [22347, 22346, 22338, 22326], "wbnews", 1615781732)</script>
		</div>
	</div>
	<!--内容2-->
	<div class="main-index2 cleafix">
		<div class="wrap cleafix">
		</div>
	</div>
	<!--活动风采-->
	<div class="hdfc cleafix wrap" style="display: none;">
		<h2>
			<p>
				活动风采<a href="">&nbsp;/&nbsp;MORE+</a>
			</p>
		</h2>
		<ul class="cleafix">
		</ul>
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
				<a href="#" onclick="_addDynClicks(&#34;wbimage&#34;, 1615781732, 55396)"
					target="_blank"><img src="images/xiaohui.png" width="74" height="74">
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
	<script>
        $(function () {
            /*鼠标移过某个按钮 高亮显示*/
            $(".focus").slide({
                titCell: ".num ul",
                mainCell: ".focuspic",
                effect: "fold", //fade：渐显；|| left：左滚动；|| fold：淡入淡出
                autoPlay: true,
                delayTime: 700,
                autoPage: "<li><a></a></li>"
            });
        });
    </script>
</body>
</html>