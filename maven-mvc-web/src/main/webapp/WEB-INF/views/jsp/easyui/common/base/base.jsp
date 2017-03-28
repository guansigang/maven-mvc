<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="taglibs.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="${ contextPath }" />
	<script src="${ contextPath }static/base/js/jquery/jquery-3.1.1.min.js" type="text/javascript"></script>
</head>
<body>   
	<div class="easyui-layout" style="width:100%;height:80px;">
		<div data-options="region:'north'" style="height:80px">
			<div class ="header"  style="height:50px;line-height: 50px;background:#f3f1f2; width:100%;font-size:15px;font-family:"微软雅黑", "Helvetica Neue", "Hiragino Sans GB", "Microsoft YaHei","\9ED1\4F53", Arial, sans-serif;">
		       <img alt=""  src="${ contextPath }static/image/easyui/logo.jpg" height="50"  style="float: left;display: block;">
		       <span  style="padding-left: 10px;">信息管理系统</span> 
		       <div style="float: right; margin-right: 50px;float:right;font-size:20px;">
		       		当前用户: ${user} 
			       <a href="${ contextPath }logout"   style="text-decoration: none;padding-left:10px;color:red;">
			       		注销
			       </a>
		       </div>
		    </div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(function(){
	
	});
</script>
</html>