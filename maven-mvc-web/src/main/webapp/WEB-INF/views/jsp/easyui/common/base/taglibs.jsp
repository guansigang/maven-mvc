<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/" />
<!-- 公用的一些js方法 -->
<script type="text/javascript">
	//easyui-datagrid时间戳转换成年月日
	function formatterSTAT_DATE(value, row, index) {
		if (!value) {
			return "";
		}
		var date = new Date(parseInt(value));
		var newDate = date.getFullYear() + "-" + //年份
		(date.getMonth() + 1) + "-" + //月份
		date.getDate() + " " + //日
		date.getHours() + ":" + //小时     
		date.getMinutes() + ":" + //分   
		date.getSeconds(); //秒 
		//console.log(date.getDate()+" "+date.getHours());
		return newDate;
	}
	
	//easyui-datagrid是否在用状态
	function formatteris_used(value, row, index) {
		if (!value) {
			return "";
		}
		if(value==1){
		return "在用";
		}else{
		return "停用";
		}
	}

	//easyui-datagrid单元格调整宽度
	function fixWidth(percent) {
		return document.body.clientWidth * percent; //这里你可以自己做调整  
	}
</script>