<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="common/base/taglibs.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="${ contextPath }"></base>
	<script src="${ contextPath }static/base/js/jquery/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script src="${ contextPath }static/easyui-1.5.1/js/jquery.easyui.min.js" type="text/javascript"></script>
	<link href="${ contextPath }static/easyui-1.5.1/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<link href="${ contextPath }static/easyui-1.5.1/themes/icon.css" rel="stylesheet" type="text/css" />
	<title>后台管理</title>
    <style>
    </style>
</head>
<body>   
	<div class="easyui-layout" style="width:100%;">
		<div>
			<form id="detailff" method="post" action = "${ contextPath }logistics/queryLogisticsDetailList">
		    <table class="easyui-datagrid" id="manageUserInfoTable" title="销售订单结果">
			</table>
			<div id="detailtb" style="padding:5px;height:auto">
				<div>
					登录名称: <input class="easyui-validatebox" validType="" id="express_no" name ="express_no"  style="width:110px"></input>
					最后登录日期: <input class="easyui-datebox" id="lastLoginDate" name ="lastLoginDate" data-options="sharedCalendar:'#cc',formatter:myformatter,parser:myparser" style="width:110px"></input>
					在用状态:<select class="easyui-combobox" id="user_state" panelHeight="auto" name="user_state" style="width:100px"></select>
					所属模块:<select class="easyui-combobox" id="module_id" name="module_id" panelHeight="auto"></select>
					<a href="javascript:void(0)" title="清空搜索项" class="easyui-linkbutton" iconCls="icon-remove"  onclick="clearDetailForm()">清空</a>
					<a href="javascript:void(0)" title="清空搜索项" class="easyui-linkbutton" iconCls="icon-search" onclick="submitDetailForm()">搜索</a>
					<a href="javascript:void(0)" title="添加管理员" class="easyui-linkbutton" iconCls="icon-add" onclick="logisUpdate();return false;">添加</a>
					<a href="javascript:void(0)" title="修改管理员" class="easyui-linkbutton" iconCls="icon-edit" onclick="logisUpdate();return false;">修改</a>
					<a href="javascript:void(0)" title="修改管理员" class="easyui-linkbutton" iconCls="icon-edit" onclick="logisUpdate();return false;">密码重置</a>
					<a href="javascript:void(0)" title="删除管理员" class="easyui-linkbutton" iconCls="icon-cut" onclick="logisUpdate();return false;">删除</a>
					<a href="javascript:void(0)" title="导出管理员" class="easyui-linkbutton" iconCls="icon-print"  onclick="exportMode();return false;">导出</a>
				</div>
				<div id="cc" class="easyui-calendar"></div>
			</div>
			</form>
		</div>
		<div id="logisUpdateDataWin">
			<form id="logisticDataForm" style="margin-top: 50px;" method="post">
	    	<table cellpadding="5" style="padding: 20px;">
	    		<tr>
	    		<input type="text" id="DELIVERY_BN" name="DELIVERY_BN" style="display: none"/>
	    			<td>重量(KG）:</td>
		    			<td>
		    				<input type="text" id="DELIVERY_WEIG" name="DELIVERY_WEIG" class="easyui-numberbox" precision="2" required="true" />
		    			</td>
	    			<td>
	    			<td>快递费用（元）:</td>
		    			<td >
		    				<input type="text" id="EXPRESS_COST" name="EXPRESS_COST" class="easyui-numberbox" precision="2" required="true" />
		    			</td>
	    			<td>
	    		</tr>
	    			<a style="position: absolute;right: 45px;top: 50px;" href="javascript:void(0)" title="保存" class="easyui-linkbutton" iconCls="icon-save"  onclick="saveLogisticsb2c();return false;">保存</a>
	    	</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		var basePath = "${ contextPath }";
		var layermsg;
		var statuesRefresh;
		var stu = "0";
		//调整宽度
		function fixWidth(percent)  
		{  
		    return document.body.clientWidth * percent ; //这里你可以自己做调整  
		} 
		
		
		function formatterSTAT_DATE(value,row,index){
			 if(!value){
				 return "";
			 }
				var date = new Date(value);
// 				debugger;
				var newDate = date.getFullYear() + "-" +//年份
					(date.getMonth()+1) + "-" + //月份
					date.getDate() + " " +//日
			    	date.getHours() + ":" + //小时     
			    	date.getMinutes() + ":" + //分   
			    	date.getSeconds(); //秒 
			    	//console.log(date.getDate()+" "+date.getHours());
			   return newDate;
	       }
	       
		
		$(document).ready(function(){
			$('#logisUpdateDataWin').window({
				width:700,
				height:300,
				closed:true,
				modal:true,
				minimizable:false,
				resizable:false,
				draggable:false,
				maximizable:false,
				collapsible:false,
				title:'对账单表',
			});
			
			
			$('#user_state').combobox({
				url:'selectBoxQuery?dict_code=BU01',
				valueField:'item_code',
				textField:'item_name',
				onLoadSuccess: function(param) {
				},
				onLoadError:function(param){
				}
			});
			
			
			$('#manageUserInfoTable').datagrid({
					title: '管理员信息管理',
					url: 'userCenter/queryUserInfo',
					rownumbers: true,
					toolbar:'#detailtb',
					pagination : true,
					idField:'user_id',
					singleSelect: true,
					selectOnCheck: true,
					checkOnSelect: false,
					columns:[[
								{ field:'user_id',checkbox:true},
								{ field: 'login_name', title: '登录名称',width:fixWidth(0.1) },
								{ field: 'user_state_cn', title: '在用状态',width:fixWidth(0.1) },
								{ field: 'user_status', title: '用户状态',width:fixWidth(0.1),formatter:formatterSTAT_DATE },
								{ field: 'user_type', title: '用户类型',width:fixWidth(0.1) },
								{ field: 'module_id', title: '所属模块',width:fixWidth(0.1) },
								{ field: 'user_position', title: '用户职位',width:fixWidth(0.1) },
								{ field: 'user_level', title: '用户等级',width:fixWidth(0.1) },
								{ field: 'user_role', title: '用户角色',width:fixWidth(0.1) },
								{ field: 'lastlogin_time', title: '最后一次登录时间',width:fixWidth(0.1) },
							]],
					onLoadSuccess: function(data){
				       
				    }
			});
				
			var pl = $('#manageUserInfoTable').datagrid('getPager');
			$(pl).pagination({
				pageSize: 10,			//每页显示的记录条数，默认为10
				pageList: [10,20,50,100,1000],	//可以设置每页记录条数的列表
				beforePageText: '第',	//页数文本框前显示的汉字
				afterPageText: '页    共 {pages} 页',
				displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
				onBeforeRefresh:function() {
					$(this).pagination('loading');
					$(this).pagination('loaded');
				}
			}); 
		});
		
		 function myformatter(date) {
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			var d = date.getDate();
			return y + '-' + (m < 10 ? ('0' + m) : m) + '-'
					+ (d < 10 ? ('0' + d) : d);
		} 
		function myparser(s) {
			if (!s)
				return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0], 10);
			var m = parseInt(ss[1], 10);
			var d = parseInt(ss[2], 10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
				return new Date(y, m - 1, d);
			} else {
				return new Date();
			}
		}

		function submitDetailForm() {
			var startDate = $("#detailStartDate").datebox('getValue');
			var endDate = $("#detailEndDate").datebox('getValue');
			var express_no = $("#express_no").val();
			var company_no = $("#company_no").combobox("getValue");
			var detailStatus = $("#detailStatus").combobox("getValue");
			$('#manageUserInfoTable').datagrid('load',{
				detailStartDate:startDate,
				detailEndDate:endDate,
				express_no:express_no,
				company_no:company_no,
				detailStatus:detailStatus
			});
		}
		
		
		
		function exportFormForSelect(){
			
			var rows = $('#manageUserInfoTable').datagrid('getSelections');
			
			if(rows==null){
				$.messager.alert('提示', '请先选择您要修改的记录！', 'warning');
				return false;
			}
			var flag = 0;
			var ids = "";
			$.each(rows,function(i){
				console.log(rows[i].detail_status_real);
				if(rows[i].detail_status_real!="2"){
					layer.msg("只能选择对账不一致的对账单", { icon: 5 });
					flag=1;
					return false;
				}else{
					ids=ids+"__"+rows[i].csv_id;
				}
			});
			
			if(flag==1){
				return false;
			}
			
			$("#detailff").attr("action", "logistics/creatExcelBySelect?ids="+ids).submit();
			
			
			
		}
		
		function exportMsg(arg) {
			var url = basePath + "ordercompara/reportexportstatues";
			$.ajax({
			url : url,
			type : "post",
			async : true,
			data : "1",
			success : function(data) {
				if (stu != data) {
					if (data == "1") {
						layer.close(layermsg);
						stu = data;
						layermsg = layer.msg("查询报表数据...", {time : 0, icon : 16});
					} else if (data == "2") {
						layer.close(layermsg);
						stu = data;
						layermsg = layer.msg("开始生成报表...", {time : 0, icon : 16});
					} else if (data == "3") {
						layer.close(layermsg);
						stu = "0";
						layermsg = layer.msg("开始导出报表...", {time : 2, icon : 16});
						window.clearInterval(statuesRefresh);
					} else {
						layer.close(layermsg);
						window.clearInterval(statuesRefresh);
						layer.msg("登陆状态失效, 请重新登陆...", { icon: 5 });
					}
				}
			},
			error:function(data){
				layer.close(layermsg);
				window.clearInterval(statuesRefresh);
				layer.msg("网络繁忙,请稍后再试...", { icon: 5 });
			}
		});
		}
		function clearDetailForm() {
			
			$("#detailStartDate").textbox('setValue','');
			$("#detailEndDate").textbox('setValue','');
			$("#express_no").val('');
			$("#company_no").combobox('setValue','');
			$("#detailStatus").combobox('setValue','');
		}
		function exportMode() {
			var url = "logistics/creatB2CDataExcel";
// 			debugger;
			$("#detailff").attr("action", url).submit();
			/* layermsg = layer.msg("报表导出中..请稍等...", {time : 0, icon : 16});
			 window.setTimeout(function() {
				statuesRefresh = window.setInterval(function() {
// 					exportMsg(1);
				}, 500);
				
			}, 500); */ 
		}

		// 关闭弹出页面
		function goback(){
			$.unblockUI();
		}
		
		/*打开修改页面*/
		function logisUpdate(){
	        var selectedRows = $("#manageUserInfoTable").datagrid("getSelections");
	        if (selectedRows.length != 1) {
	            $.messager.alert("系统提示", "请选择一条要编辑的数据！");
	            return;
	        }
	        var row = selectedRows[0];
			$('#logisUpdateDataWin').window('open');
	        $("#logisticDataForm").form("load", row);
	        url = "${pageContext.request.contextPath}/logistics/updateLogisticsdetail2cInfo";
		}
		
		
		/*修改保存*/
		function saveLogisticsb2c(){
			$("#logisticDataForm").form("submit", {
	            url : url,
	            onSubmit : function() {
	                return $(this).form("validate");
	            },
	            success : function(result) {
	            	console.log(result);
	                if (result) {
	                    $.messager.alert("系统提示", "保存成功！");
	                    $("#logisUpdateDataWin").window("close");
	                    $("#manageUserInfoTable").datagrid("reload");
	                } else {
	                    $.messager.alert("系统提示", "保存失败！");
	                    return;
	                }
	            }
	        });
		}
		
		
	</script>

</body>
</html>