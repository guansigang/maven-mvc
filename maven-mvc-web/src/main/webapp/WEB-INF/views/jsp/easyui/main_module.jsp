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
	<script type="text/javascript">
    </script>
    <style>
       #editModuleWin tr{height: 50px;}
    </style>
</head>
<body>   
	<div class="easyui-layout" style="width:100%;">
		<div>
			<form id="detailff" method="post" action = "${ contextPath }logistics/querySysBaseModule">
		    <table class="easyui-datagrid" id="mainModuleInfoTable" title=""></table>
			<div id="detailtb" style="padding:5px;height:auto">
				<div>
					模块查询: <input class="easyui-validatebox" validType="" id="module_en" name ="module_en"  style="width:110px"></input>
					<a href="javascript:void(0)" title="清空搜索项" class="easyui-linkbutton" iconCls="icon-remove"  onclick="clearDetailForm()">清空</a>
					<a href="javascript:void(0)" title="清空搜索项" class="easyui-linkbutton" iconCls="icon-search" onclick="submitDetailForm()">搜索</a>
					<a href="javascript:void(0)" title="添加模块" class="easyui-linkbutton" iconCls="icon-add" onclick="moduleAdd();return false;">添加</a>
					<a href="javascript:void(0)" title="修改模块" class="easyui-linkbutton" iconCls="icon-edit" onclick="moduleUpdate();return false;">修改</a>
					<a href="javascript:void(0)" title="删除模块" class="easyui-linkbutton" iconCls="icon-cancel" onclick="deleteModule();return false;">删除</a>
				</div>
			</div>
			</form>
		</div>
		<div id="editModuleWin">
			<form id="editModuleForm" style="margin-top: 50px;" method="post">
	    	<table  style="padding: 20px;margin: 0 auto;">
  				<input type="hidden" id="module_id_fix" name="module_id" class="easyui-textbox"/>
	    		<tr>
	    			<td>首页路径:</td>
		    			<td>
		    				<input type="text" id="module_index_fix" name="module_index" class="easyui-textbox"/>
		    			</td>
	    			<td>
    			</tr>
	    		<tr>
	    			<td>权限路径:</td>
		    			<td >
		    				<input type="text" id="module_path_fix" name="module_path" class="easyui-textbox"/>
		    			</td>
	    			<td>
	    		</tr>
	    		<tr>
	    			<td>模块简述:</td>
		    			<td >
		    				<input type="text" id="module_en_fix" name="module_en" class="easyui-textbox"/>
		    			</td>
	    			<td>
	    		</tr>
	    		<tr>
	    			<td>详细说明:</td>
		    			<td colspan=4>
		    				<input class="easyui-textbox" id="module_desc_fix" name="module_desc" data-options="multiline:true" value="" style="width:100%;height:50px">
		    			</td>
	    			<td>
	    		</tr>
	    			<a style="position: absolute;right: 45px;top: 50px;" href="javascript:void(0)" title="保存" class="easyui-linkbutton" iconCls="icon-save"  onclick="saveModule();return false;">保存</a>
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
		function fixWidth(percent){  
	    	return document.body.clientWidth * percent ; //这里你可以自己做调整  
		} 
		
		$(document).ready(function(){
			$('#item_dict_code_fix').combobox({
				url:'userCenter/selectBoxBaseDict',
				valueField:'dict_code',
				textField:'dict_name',
				onLoadSuccess: function(param) {
				},
				onLoadError:function(param){
				}
			});
		
		
			$('#editModuleWin').window({
				width:400,
				height:400,
				closed:true,
				modal:true,
				minimizable:false,
				resizable:false,
				draggable:false,
				maximizable:false,
				collapsible:false,
				title:'对账单表',
			});
			$('#mainModuleInfoTable').datagrid({
					title: '数据字典主表管理',
					url: 'userCenter/querySysBaseModule',
					rownumbers: true,
					toolbar:'#detailtb',
					pagination : true,
					idField:'user_id',
					singleSelect: true,
					selectOnCheck: true,
					collapsible: true, //隐藏按钮
					columns:[[
								{ field: 'module_id',checkbox:true},
								{ field: 'module_en', title: '模块名称',width:fixWidth(0.1) },
								{ field: 'module_index', title: '模块首页',width:fixWidth(0.1) },
								{ field: 'module_path', title: '模块登录页',width:fixWidth(0.1) },
								{ field: 'is_used', title: '是否在用',width:fixWidth(0.1)},
								{ field: 'module_desc', title: '模块说明',width:fixWidth(0.3) },
								{ field: 'add_time', title: '添加时间',width:fixWidth(0.1),formatter:formatterSTAT_DATE },
							]],
					onLoadSuccess: function(data){
				       
				    },
				    onClickRow:function(rowIndex, rowData){
				    $('#tab').datagrid('load',{
						dict_code:rowData.dict_code,
					});
				    }
			});
				
			var pl = $('#mainModuleInfoTable').datagrid('getPager');
			$(pl).pagination({
				pageSize: 10,			//每页显示的记录条数，默认为10
				pageList: [10,20,50,100],	//可以设置每页记录条数的列表
				beforePageText: '第',	//页数文本框前显示的汉字
				afterPageText: '页    共 {pages} 页',
				displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
				onBeforeRefresh:function() {
					$(this).pagination('loading');
					$(this).pagination('loaded');
				}
			}); 
		});
		function submitDetailForm() {
			var dict_code = $("#dict_code").val();
			var dict_name = $("#dict_name").val();
			$('#mainModuleInfoTable').datagrid('load',{
				dict_code:dict_code,
				dict_name:dict_name
			});
		}
		
		function clearDetailForm() {
			$("#dict_code").val("");
			$("#dict_name").val("");
		}
		
		/*打开修改页面*/
		function moduleUpdate(){
	        var selectedRows = $("#mainModuleInfoTable").datagrid("getSelections");
	        if (selectedRows.length != 1) {
	            $.messager.alert("系统提示", "请选择一条要编辑的数据！");
	            return;
	        }
	        var row = selectedRows[0];
			$('#editModuleWin').window('open');
	        $("#editModuleForm").form("load", row);
	        url = "${pageContext.request.contextPath}/userCenter/updateSysBaseModule";
		}
		
		/*打开修改页面*/
		function moduleAdd(){
			$("#mainModuleInfoTable").datagrid("unselectAll");
	         $("#editModuleForm")[0].reset();
			$('#editModuleWin').window('open');
	        url = "${pageContext.request.contextPath}/userCenter/addSysBaseModule";
		}
		
		
		/*修改保存*/
		function saveModule(){
			$("#editModuleForm").form("submit", {
	            url : url,
	            onSubmit : function() {
	                return $(this).form("validate");
	            },
	            success : function(result) {
	            	console.log(result);
	                if (result) {
	                    $.messager.alert("系统提示", "保存成功！");
	                    $("#editModuleWin").window("close");
	                    $("#mainModuleInfoTable").datagrid("reload");
	                } else {
	                    $.messager.alert("系统提示", "保存失败！");
	                    return;
	                }
	            }
	        });
		}
		 function deleteModule() {
             var selected = $("#mainModuleInfoTable").datagrid('getSelected');
             var module_id = selected.module_id;
             
            if (selected != null) {
                $.messager.confirm('提示', '是否确定要删除？', function (y) {
                    if (y) {
                        var v = "";
                        var checked = $("#mainModuleInfoTable").datagrid('getChecked');
                        $.post("userCenter/deleteSysBaseModule", {module_id:module_id}, function (data) {
                            $.messager.alert('提示', "删除数据成功！");
                            $("#mainModuleInfoTable").datagrid('reload');
                        });
                    }
                })
            } else {
            	$.messager.alert('提示','您还没有选中一行数，请选中在删除！');
           } 
    }
    
    
     function formatterSTAT_DATE(value,row,index){
		 if(!value){
			 return "";
		 }
			var date = new Date(parseInt(value));
			var newDate = date.getFullYear() + "-" +//年份
				(date.getMonth()+1) + "-" + //月份
				date.getDate() + " " +//日
		    	date.getHours() + ":" + //小时     
		    	date.getMinutes() + ":" + //分   
		    	date.getSeconds(); //秒 
		    	//console.log(date.getDate()+" "+date.getHours());
		   return newDate;
      }
		
		
	</script>

</body>
</html>