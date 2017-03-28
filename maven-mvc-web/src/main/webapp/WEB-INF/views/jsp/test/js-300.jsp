<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--****1****每隔五秒自动刷新 -->
<!-- 	<meta http-equiv="refresh" content="5"> -->
	
	<base href="${ contextPath }"></base>
	<title>销售订单查询</title>
    <style>
        html{height:100%; }
		body {
			font-family: "Helvetica Neue", "Hiragino Sans GB", "Microsoft YaHei","\9ED1\4F53", Arial, sans-serif;
			color: #222;
			font-size: 12px;
			height:100%;
			width:100%;
		}
		* {
			padding: 0px;
			margin: 0px;
		}
		.container-wap{height:100%;}
		.con-tab{
		   font-size:20px;
		   width:90%;
		   min-width:800px;
		   margin:0  auto;
		   margin-top:20px;
		}
		.con-tab tr{height:40px; line-height: 40px;}
		.btn-wap{text-align: center;}
		.date-wap{height:700px;padding:0;margin:0;}
		.easyui-linkbutton{margin-left:10px;}
		
    </style>
</head>
<body>   
	<div class="easyui-layout" style="width:100%;height:700px;">
		
	</div>
	<script type="text/javascript">
	
// 		****1****每隔五秒自动刷新
		function fresh(){
			console.log("aaaaaaaaaa");
			window.location.reload();
		}
		setTimeout('fresh()', 5000); 
	

	</script>

</body>
</html>