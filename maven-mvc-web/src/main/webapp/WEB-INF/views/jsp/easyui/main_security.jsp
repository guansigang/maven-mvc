<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="common/base/taglibs.jsp"%>
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
	
	  /////////////////////////删除/////////////////
        function delete_security() {
             var selected = $("#tab").datagrid('getSelected');
             var item_code = selected.item_code;
             
            if (selected != null) {
                $.messager.confirm('提示', '是否确定要删除？', function (y) {
                    if (y) {
                        var v = "";
                        var checked = $("#tab").datagrid('getChecked');
                        $.post("userCenter/deleteSysBaseDictItem", {item_code:item_code}, function (data) {
                            $.messager.alert('提示', "删除数据成功！");
                            $("#tab").datagrid('reload');
                        });
                    }
                })
            } else {
            $.messager.alert('提示','您还没有选中一行数，请选中在删除！');
           } 
    }
    /////////////////////添加///////////////////
    function add_security() {
    //表单清空
        $("#editSecurityForm")[0].reset();
        //显示
        $("#editSecurityWin").show();
        //以窗体的形式展示
        $("#editSecurityWin").dialog({
            title: "添加从字典信息",//标题
            iconCls: "icon-add",//图标
            width: 350,//窗体的宽度
            height: 400,//窗体的高度
            modal: true, //遮罩层
            //按钮集合
            buttons: [
            {
                text: "添加",//添加按钮的文本值
                iconCls: "icon-ok", //添加按钮的图标
                handler: function () {
                    //将数据序列化
                    var parm = $("#editSecurityForm").serialize();
                    //中文格式转换
                    var pp = decodeURIComponent(parm, true);
                    var itemAddUrl = "userCenter/addSysBaseSecurity";
                    saveSecurity(itemAddUrl);
                }
            },
              {
                  text: "取消",
                  iconCls: "icon-cancel",
                  handler: function () {
                      $("#editSecurityWin").window("close");
                  }
              }
            ]
        });
      }
      //////////////////修改//////////////////
      function edit_security() {
          
      //选中一行，获取这一行的属性的值
          var selected = $("#mainSecurityInfoTable").datagrid('getSelected');
          //判断是否选中
          if (selected != null) {
			$("#editSecurityWin").show();
	        $("#editSecurityForm").form("load", selected);
              $("#editSecurityWin").dialog({
                  title: "编辑信息",
                  iconCls: "icon-edit",
                  modal: true,//遮罩层
                  width: 350,
                  height: 400,
                  buttons: [
                  {
                      text: "保存",
                      iconCls: "icon-edit",
                      handler: function () {
                          var parm = $("#editSecurityForm").serialize();
                          var pp = decodeURIComponent(parm, true);
                  		  var itemUpdateUrl = "userCenter/updateSysBaseSecurity";
                   		  saveSecurity(itemUpdateUrl);
                      }

                  },
                   {
                       text: "取消",
                       iconCls: "icon-cancel",
                       handler: function () {
                           $("#editSecurityWin").window('close');
                       }
                   }
                  ]


              });
          } else {
              $.messager.alert('提示','请选中一行在进行编辑');
          }

      }
      /*修改保存*/
		function saveSecurity(itemUrl){
			$("#editSecurityForm").form("submit", {
	            url : itemUrl,
	            onSubmit : function() {
	                return $(this).form("validate");
	            },
	            success : function(result) {
	                if (result) {
	                    $.messager.alert("系统提示", "保存成功！");
	                    $("#editSecurityWin").window("close");
	                    $("#mainSecurityInfoTable").datagrid("reload");
	                } else {
	                    $.messager.alert("系统提示", "保存失败！");
	                    return;
	                }
	            }
	        });
		}
    </script>
    <style>
       #editSecurityWin tr{height: 50px;}
    </style>
</head>
<body>   
	<div class="easyui-layout" style="width:100%;">
		<div>
			<form id="detailff" method="post" action = "${ contextPath }logistics/querySysBaseSecurity">
		    <table class="easyui-datagrid" id="mainSecurityInfoTable" title=""></table>
			<div id="detailtb" style="padding:5px;height:auto">
				<div>
					权限英文查询: <input class="easyui-validatebox" validType="" id="security_en" name ="security_en"  style="width:110px"></input>
					权限中文查询: <input class="easyui-validatebox" validType="" id="security_cn" name ="security_cn"  style="width:110px"></input>
					<a href="javascript:void(0)" title="清空搜索项" class="easyui-linkbutton" iconCls="icon-remove"  onclick="clearDetailForm()">清空</a>
					<a href="javascript:void(0)" title="清空搜索项" class="easyui-linkbutton" iconCls="icon-search" onclick="submitDetailForm()">搜索</a>
					<a href="javascript:void(0)" title="添加模块" class="easyui-linkbutton" iconCls="icon-add" onclick="add_security();return false;">添加</a>
					<a href="javascript:void(0)" title="修改模块" class="easyui-linkbutton" iconCls="icon-edit" onclick="edit_security();return false;">修改</a>
					<a href="javascript:void(0)" title="删除模块" class="easyui-linkbutton" iconCls="icon-cancel" onclick="deleteSecurity();return false;">删除</a>
				</div>
			</div>
			</form>
		</div>
		<div id="editSecurityWin">
			<form id="editSecurityForm" style="margin-top: 50px;" method="post">
	    	<table  style="padding: 20px;margin: 0 auto;">
  				<input type="hidden" id="security_id_fix" name="security_id" class="easyui-textbox"/>
	    		<tr>
	    			<td>所属模块:</td>
		    			<td>
		    				<input type="text" id="module_id_fix" name="module_id" class="easyui-combobox"/>
		    			</td>
	    			<td>
    			</tr>
	    		<tr>
	    			<td>shiro权限:</td>
		    			<td >
		    				<input type="text" id="security_en_fix" name="security_en" class="easyui-textbox"/>
		    			</td>
	    			<td>
	    		</tr>
	    		<tr>
	    			<td>中文名称:</td>
		    			<td >
		    				<input type="text" id="security_cn_fix" name="security_cn" class="easyui-textbox"/>
		    			</td>
	    			<td>
	    		</tr>
	    		<tr>
	    			<td>详细说明:</td>
		    			<td colspan=4>
		    				<input class="easyui-textbox" id="security_desc_fix" name="security_desc" data-options="multiline:true" value="" style="width:100%;height:50px">
		    			</td>
	    			<td>
	    		</tr>
<!-- 	    			<a style="position: absolute;right: 45px;top: 50px;" href="javascript:void(0)" title="保存" class="easyui-linkbutton" iconCls="icon-save"  onclick="saveSecurity();return false;">保存</a> -->
	    	</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		var basePath = "${ contextPath }";
		var layermsg;
		var statuesRefresh;
		var stu = "0";
		
		$(document).ready(function(){
			$('#module_id_fix').combobox({
				url:'userCenter/selectModuleSelectBox',
				valueField:'module_id',
				textField:'module_cn',
				onLoadSuccess: function(param) {
				},
				onLoadError:function(param){
				}
			});
			
			$('#editSecurityWin').window({
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
			$('#mainSecurityInfoTable').datagrid({
					title: '数据字典主表管理',
					url: 'userCenter/querySysBaseSecurity',
					rownumbers: true,
					toolbar:'#detailtb',
					pagination : true,
					idField:'user_id',
					singleSelect: true,
					selectOnCheck: true,
					collapsible: true, //隐藏按钮
					columns:[[
								{ field: 'security_id',checkbox:true},
								{ field: 'module_cn', title: '所属模块',width:fixWidth(0.1) },
								{ field: 'security_en', title: 'shiro权限',width:fixWidth(0.1) },
								{ field: 'security_cn', title: '权限中文',width:fixWidth(0.1) },
								{ field: 'security_desc', title: '模块说明',width:fixWidth(0.3) },
								{ field: 'add_time', title: '添加时间',width:fixWidth(0.1),formatter:formatterSTAT_DATE },
							]],
					onLoadSuccess: function(data){
				       
				    },
				    onClickRow:function(rowIndex, rowData){
				    }
			});
				
			var pl = $('#mainSecurityInfoTable').datagrid('getPager');
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
			var security_en = $("#security_en").val();
			var security_cn = $("#security_cn").val();
			$('#mainSecurityInfoTable').datagrid('load',{
				security_en:security_en,
				security_cn:security_cn
			});
		}
		
		function clearDetailForm() {
			$("#security_en").val("");
			$("#security_cn").val("");
		}
		
	
		
		
		 function deleteSecurity() {
             var selected = $("#mainSecurityInfoTable").datagrid('getSelected');
             var Security_id = selected.Security_id;
             
            if (selected != null) {
                $.messager.confirm('提示', '是否确定要删除？', function (y) {
                    if (y) {
                        var v = "";
                        var checked = $("#mainSecurityInfoTable").datagrid('getChecked');
                        $.post("userCenter/deleteSysBaseSecurity", {Security_id:Security_id}, function (data) {
                            $.messager.alert('提示', "删除数据成功！");
                            $("#mainSecurityInfoTable").datagrid('reload');
                        });
                    }
                })
            } else {
            	$.messager.alert('提示','您还没有选中一行数，请选中在删除！');
           } 
    }
	</script>

</body>
</html>