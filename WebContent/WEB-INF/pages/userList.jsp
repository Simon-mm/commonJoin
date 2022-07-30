<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>UserList</title>
</head>
<body>
	<c:if test="${del eq 'success' }">
		<div class="alert alert-inline">
			<i class="icon-times" data-dismiss="alert"></i> <i
				class="icon-success text-success"></i>
			<div class="alert-body">
				<strong>恭喜</strong>
				<p>操作成功，请继续!</p>
			</div>
		</div>
	</c:if>

	<c:if test="${msg eq 'success' }">
		<table cellpadding="5" cellspacing="0" border="1">

			<tr align="center">
				<th>ID</th>
				<th>身份</th>
				<th>姓名</th>
				<th>性别</th>
				<th>年级</th>
				<th>学院</th>
				<th>专业</th>
				<th>社团职位</th>
				<th>所属社团</th>
				<th>电话</th>
				<th>邮箱</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${list}" var="user">
				<tr align="center">
					<td>${user.id}</td>
					<c:if test="${user.limit eq 1}">
						<td>普通用户</td>
					</c:if>
					<c:if test="${user.limit gt 1}">
						<td>管理员</td>
					</c:if>
					<td>${user.name }</td>
					<td>${user.gender eq 1?"男":"女" }</td>
					<td>${user.year }</td>
					<td>${user.institute }</td>
					<td>${user.major }</td>
					<td>${user.role }</td>
					<td>${user.club }</td>
					<td>${user.tel }</td>
					<td>${user.email }</td>
					
					<td><a href="deleteUser?id=${user.id }" onclick="return delOpe()">删除</a>
						<a href="toModify?id=${user.id }">修改</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${msg ne 'success' }">
		<h1>用户信息列表为空！</h1>
	</c:if>
</body>
<script type="text/javascript">
	function delOpe() {
		undefined
		var msg = "您真的确定要删除吗?\n请确认！";
		if (confirm(msg) == true) {
			undefined			
			return true;
		} else {
			undefined
			return false;
		}
	}
</script>
</html>
