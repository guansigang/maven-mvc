<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

<title>后台登录</title> 
<link href="${pageContext.request.contextPath}/static/login/css/login.css" type="text/css" rel="stylesheet"> 
</head> 
<body> 

<div class="login">
    <div class="message">品牌名称-管理登录</div>
    <div id="darkbannerwrap"></div>
    
    <form method="post" action="checklogin?loginUrl=backlogin">
		<input name="action" value="login" type="hidden">
		<input name="username" placeholder="用户名" required="" type="text">
		<hr class="hr15">
		<input name="password" placeholder="密码" required="" type="password">
		<hr class="hr15">
		<input value="登录" style="width:100%;" type="submit">
		<hr class="hr20">
		<!-- 帮助 <a onClick="alert('请联系管理员')">忘记密码</a> -->
	</form>

	
</div>
</body>
</html>