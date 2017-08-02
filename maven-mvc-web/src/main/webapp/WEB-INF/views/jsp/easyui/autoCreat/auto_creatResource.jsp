<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../common/base/taglibs.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="${ contextPath }"></base>
	<script src="${ contextPath }static/base/js/jquery/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script src="${ contextPath }static/plugin/easyui-1.5.1/js/jquery.easyui.min.js" type="text/javascript"></script>
	<link href="${ contextPath }static/plugin/easyui-1.5.1/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<link href="${ contextPath }static/plugin/easyui-1.5.1/themes/icon.css" rel="stylesheet" type="text/css" />
	<title>后台管理</title>
	 <script type="text/javascript">
       $(function () {
       		$('#table_schema').combobox({
				url:'AuthCreat/selectBoxDateBase',
				valueField:'SCHEMA_NAME',
				textField:'SCHEMA_CODE',
				onLoadSuccess: function(param) {
				},
				onLoadError:function(param){
				}
			});
            $("#tableInfoList").datagrid({
//                 width: 600, //宽度
//                 height: 400, //高度
                singleSelect: true, //选中一行的设置
                rownumbers: true, //行号
                url: "AuthCreat/querySysDateBaseTable", //请求路径
                title: "数据字典从表信息管理", //标题
                iconCls: "icon-save", //图标
                collapsible: true, //隐藏按钮
                //冻结列
//                 frozenColumns: [[{ field: "TABLE_CODE", "checkbox": true}]],
                //列
                columns: [[
                { field: "TABLE_CODE",checkbox:true},
                { field: "TABLE_NAME", title: "表名", width:fixWidth(0.3)  },
                { field: "ENGINE", title: "引擎类型", width:fixWidth(0.2)  },
                { field: "TABLE_ROWS", title: "数据量", width:fixWidth(0.1)  }
                ]],
                //传输参数
                queryParams: { "action": "query" },
                pagination: true,
                toolbar: "#detailtb"
            });
            $("#tableInfoList").datagrid('getPager').pagination({
                beforePageText: "第",
                afterPageText: "页",
                displayMsg: "当前 {from} - {to}条数据   共{total} 条数据",
                pageSize: 10,
                pageList: [10, 15, 20, 30]

            });
        })
        function clearQueryParamForm() {
			$("#table_schema").combobox('setValue','');
		}
		
		function submitQueryParamForm() {
			var table_schema = $("#table_schema").combobox("getValue");
			$('#tableInfoList').datagrid('load',{
				SCHEMA_CODE:table_schema
			});
		}
    </script>
    <style>
       #dd_dg tr{height: 70px;}
    </style>
</head>
<body>   
	<div class="easyui-layout" style="width:100%;">
		<div>
			<form id="detailff" method="post" action = "${ contextPath }logistics/queryLogisticsDetailList">
		    <table class="easyui-datagrid" id="tableInfoList" title=""></table>
			<div id="detailtb" style="padding:5px;height:auto">
				<div>
					所属库: <select class="easyui-combobox" id="table_schema" name="security_id" panelHeight="auto" style="width:150px"></select>
					<a href="javascript:void(0)" title="清空搜索项" class="easyui-linkbutton" iconCls="icon-remove"  onclick="clearQueryParamForm()">清空</a>
					<a href="javascript:void(0)" title="清空搜索项" class="easyui-linkbutton" iconCls="icon-search" onclick="submitQueryParamForm()">搜索</a>
					<a href="javascript:void(0)" title="修改管理员" class="easyui-linkbutton" iconCls="icon-edit" onclick="dictUpdate();return false;">生成</a>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>