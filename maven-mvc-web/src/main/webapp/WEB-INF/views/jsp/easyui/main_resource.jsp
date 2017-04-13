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
	/////////////////////////删除/////////////////
        function delete_shiro() {
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
    function add_shiro() {
    //表单清空
        $("#editShiroForm")[0].reset();
        //显示
        $("#editShiroWin").show();
        //以窗体的形式展示
        $("#editShiroWin").dialog({
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
                    var parm = $("#editShiroForm").serialize();
                    //中文格式转换
                    var pp = decodeURIComponent(parm, true);
                    var itemAddUrl = "userCenter/addSysBaseShiro";
                    saveShiro(itemAddUrl);
                }
            },
              {
                  text: "取消",
                  iconCls: "icon-cancel",
                  handler: function () {
                      $("#editShiroWin").window("close");
                  }
              }
            ]
        });
      }
      //////////////////修改//////////////////
      function edit_shiro() {
          
      //选中一行，获取这一行的属性的值
          var selected = $("#mainShiroInfoTable").datagrid('getSelected');
          //判断是否选中
          if (selected != null) {
			$("#editShiroWin").show();
	        $("#editShiroForm").form("load", selected);
              $("#editShiroWin").dialog({
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
                          var parm = $("#editShiroForm").serialize();
                          var pp = decodeURIComponent(parm, true);
                  		  var itemUpdateUrl = "userCenter/updateSysBaseShiro";
                   		  saveShiro(itemUpdateUrl);
                      }

                  },
                   {
                       text: "取消",
                       iconCls: "icon-cancel",
                       handler: function () {
                           $("#editShiroWin").window('close');
                       }
                   }
                  ]


              });
          } else {
              $.messager.alert('提示','请选中一行在进行编辑');
          }
      }
      /*修改保存*/
		function saveShiro(itemUrl){
			$("#editShiroForm").form("submit", {
	            url : itemUrl,
	            onSubmit : function() {
	                return $(this).form("validate");
	            },
	            success : function(result) {
	                if (result) {
	                    $.messager.alert("系统提示", "保存成功！");
	                    $("#editShiroWin").window("close");
	                    $("#mainShiroInfoTable").datagrid("reload");
	                } else {
	                    $.messager.alert("系统提示", "保存失败！");
	                    return;
	                }
	            }
	        });
		}
    </script>
    <style>
       #editShiroWin tr{height: 50px;}
    </style>
</head>
<body>   
	<div class="easyui-layout" style="width:100%;">
		<div>
			<form id="detailff" method="post" action = "${ contextPath }logistics/querySysBaseShiro">
		    <table class="easyui-datagrid" id="mainShiroInfoTable" title=""></table>
			<div id="detailtb" style="padding:5px;height:auto">
				<div>
					模块查询: <input class="easyui-validatebox" validType="" id="shiro_en" name ="shiro_en"  style="width:110px"></input>
					<a href="javascript:void(0)" title="清空搜索项" class="easyui-linkbutton" iconCls="icon-remove"  onclick="clearDetailForm()">清空</a>
					<a href="javascript:void(0)" title="清空搜索项" class="easyui-linkbutton" iconCls="icon-search" onclick="submitDetailForm()">搜索</a>
					<a href="javascript:void(0)" title="添加模块" class="easyui-linkbutton" iconCls="icon-add" onclick="add_shiro();return false;">添加</a>
					<a href="javascript:void(0)" title="修改模块" class="easyui-linkbutton" iconCls="icon-edit" onclick="edit_shiro();return false;">修改</a>
					<a href="javascript:void(0)" title="删除模块" class="easyui-linkbutton" iconCls="icon-cancel" onclick="deleteShiro();return false;">删除</a>
				</div>
			</div>
			</form>
		</div>
		<div id="editShiroWin">
			<form id="editShiroForm" style="margin-top: 50px;" method="post">
	    	<table  style="padding: 20px;margin: 0 auto;">
  				<input type="hidden" id="shiro_id_fix" name="shiro_id" class="easyui-textbox"/>
	    		<tr>
	    			<td>首页路径:</td>
		    			<td>
		    				<input type="text" id="security_id_fix" name="security_id" class="easyui-textbox"/>
		    			</td>
	    			<td>
    			</tr>
	    		<tr>
	    			<td>权限路径:</td>
		    			<td >
		    				<input type="text" id="shiro_path_fix" name="shiro_path" class="easyui-textbox"/>
		    			</td>
	    			<td>
	    		</tr>
	    		<tr>
	    			<td>详细说明:</td>
		    			<td colspan=4>
		    				<input class="easyui-textbox" id="path_desc_fix" name="path_desc" data-options="multiline:true" value="" style="width:100%;height:50px">
		    			</td>
	    			<td>
	    		</tr>
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
			$('#security_id_fix').combobox({
				url:'userCenter/selectSecuritySelectBox',
				valueField:'security_id',
				textField:'security_cn',
				onLoadSuccess: function(param) {
				},
				onLoadError:function(param){
				}
			});
		
		
			$('#editShiroWin').window({
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
			$('#mainShiroInfoTable').datagrid({
					title: '数据字典主表管理',
					url: 'userCenter/querySysBaseShiro',
					rownumbers: true,
					toolbar:'#detailtb',
					pagination : true,
					idField:'user_id',
					singleSelect: true,
					selectOnCheck: true,
					collapsible: true, //隐藏按钮
					columns:[[
								{ field: 'shiro_id',checkbox:true},
								{ field: 'security_cn', title: 'shiro权限',width:fixWidth(0.1) },
								{ field: 'shiro_path', title: '权限路径',width:fixWidth(0.2) },
								{ field: 'is_used', title: '是否在用',width:fixWidth(0.1)},
								{ field: 'path_desc', title: '路径说明',width:fixWidth(0.3) },
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
				
			var pl = $('#mainShiroInfoTable').datagrid('getPager');
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
			$('#mainShiroInfoTable').datagrid('load',{
				dict_code:dict_code,
				dict_name:dict_name
			});
		}
		
		function clearDetailForm() {
			$("#dict_code").val("");
			$("#dict_name").val("");
		}
		
		 function deleteShiro() {
             var selected = $("#mainShiroInfoTable").datagrid('getSelected');
             var shiro_id = selected.shiro_id;
             
            if (selected != null) {
                $.messager.confirm('提示', '是否确定要删除？', function (y) {
                    if (y) {
                        var v = "";
                        var checked = $("#mainShiroInfoTable").datagrid('getChecked');
                        $.post("userCenter/deleteSysBaseShiro", {shiro_id:shiro_id}, function (data) {
                            $.messager.alert('提示', "删除数据成功！");
                            $("#mainShiroInfoTable").datagrid('reload');
                        });
                    }
                })
            } else {
            	$.messager.alert('提示','您还没有选中一行数，请选中再删除！');
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