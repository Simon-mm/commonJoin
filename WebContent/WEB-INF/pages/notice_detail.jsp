<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>公告详细</title>
<link rel="icon" href="images/pander.png">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/css/css.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/css/main.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.serializejson.js"></script>
</head>
<body>
	<!--main_top-->
	********************${notice.title }******************************
	<table style="border: 1px solid #00F;">
		<tbody>
			<tr>
				<td colspan="2" align="center">
					<h3>————${notice.title }————</h3>
				</td>
			</tr>
			<tr>
				<td width="500px" height="300px"
					style="border: 1px solid #00F; vertical-align: top;" id="content"
					name="content">
					<div style="background-color: white;">
						<table id="tbRecord">
							<tbody id="record"
								style="display: block; height: 300px; width: 500px; overflow: auto;" />
								${notice.content }
						</table>
					</div>
				</td>
			</tr>
		</tbody>
		<tfoot>			
			<tr>
				<td colspan="2" align="right">
				<img id="likes" src="images/zan.png" height="24px" width="24px" alt="点赞">
                <span id="good">${empty notice.likes ? 0 :notice.likes}</span>个赞
				</td>
			</tr>
			<tr>
				<td colspan="2" align="left">
				<input id="msg" style="width: 80%;" placeholder="输入评论内容……" />
				<button style="margin: 0 10px 0 10px" id="send">发送评论</button>
				</td>
			</tr>

			<c:if test="${not empty comments }">
				<c:forEach items="${comments }" var="comment" varStatus="status">
				<c:if test="${status.index + 1 lt c_size }">
					<tr><td>[${comment.uid }]&nbsp;：${comment.content }</td></tr></c:if>
				<c:if test="${status.index +1 eq c_size }">
					<tr id="comment"><td>[${comment.uid }]&nbsp;：${comment.content }</td></tr></c:if>
				</c:forEach>
			</c:if>
			<c:if test="${empty comments }"><tr>
				<td id="comment">19999： 柯南</td></tr>
				<tr><td id="comment">19999： 柯南</td></tr>
			</c:if>			
		</tfoot>
	</table>
</body>
<script type="text/javascript">
	$(function(){
		/* 点赞异步请求 */
		$("#likes").click(function(){
			/* alert('like'); */
			var msg = document.getElementById('good');//获取span标签里的文本内容
			var good = parseInt(msg.textContent);//将获取到的内容转为int型数据
			/* alert(good+1 + '||' + '${notice.noticeid }'); */
			msg.textContent = good+1;//每点赞一次，赞数加一，同时需要异步请求，更新数据库中的数据
			/* alert(msg.textContent); */
			$.ajax({
				url:"${pageContext.request.contextPath}/refreshLikesNumber",
				type:"post",
				data:{"likes":msg.textContent,"nid":'${notice.noticeid }'},
				success:function(result){
					if(result){
						alert('已赞');
					} else {
						alert('赞失败');
					}
				},
				error:function(e){
					alert('请求出错！' + e);
				}
			})
		})
		
		/* Ajax异步实时保存评论信息 */
		$("#send").click(function(){			
			/* var id = '${login.id }';
			alert(id); */
			var info = $('#msg').val();//获取到input标签里的文本内容
			if(info == ""){
				alert('发送内容不能为空！');
				return false;
			} else {
				/* alert(info); */
				$('#comment').append("<br><tr><td>" + '[${login.id}]' +"&nbsp;：" + 
						info + "</td></tr>");//每次先换行后，继续追加留言内容
				$('#msg').val("");//留言成功后，清空输入框
				/* ajax异步请求，保存评论内容，当下次，打开的时候直接可以加载出来 */
				$.ajax({
					url:"${pageContext.request.contextPath}/saveComments",
					type:"post",
					data:{"uid":'${login.id}',"nid":'${notice.noticeid }',"comment":info},
					success:function(result){
						if(result){
							alert('评论已保存');
						} else {
							alert('评论保存失败');
						}
					},
					error:function(e){
						alert('请求出错！' + e);
					}
				})
			}			
		})		
	})
</script>
</html>