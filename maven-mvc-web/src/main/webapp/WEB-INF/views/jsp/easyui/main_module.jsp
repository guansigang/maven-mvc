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
        function delete_DictItem() {
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
    function add_dg() {
      $('#item_code').attr('readonly',false);
		$("#item_dict_code_fix").combobox({disabled: false}); 
    //表单清空
        $("#fm_dg")[0].reset();
        //显示
        $("#dd_dg").show();
        //以窗体的形式展示
        $("#dd_dg").dialog({
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
                    var parm = $("#fm_dg").serialize();
                    //中文格式转换
                    var pp = decodeURIComponent(parm, true);
                    var itemUrl = "userCenter/addSysBaseDictItem";
                   	saveDictItem(itemUrl);
                }
            },
              {
                  text: "取消",
                  iconCls: "icon-cancel",
                  handler: function () {
                      $("#dd_dg").window("close");
                  }
              }
            ]
        });
      }
      //////////////////修改//////////////////
      function edit_dg() {
//             $('#item_code').attr('disabled','disabled');
             $('#item_code').attr('readonly',true);
			$("#item_dict_code_fix").combobox({disabled: true}); 
          
          $('#item_dict_code_fix').combobox({ 
     		 editable:false,//不可编辑
      		}); 
          
          
          
          
      //选中一行，获取这一行的属性的值
          var selected = $("#tab").datagrid('getSelected');
          //判断是否选中
          if (selected != null) {
          
			$("#dd_dg").show();
	        $("#fm_dg").form("load", selected);
              $("#dd_dg").dialog({
                  title: "编辑信息",
                  iconCls: "icon-edit",
                  modal: true,//遮罩层
                  width: 350,
                  height: 400,
                  buttons: [
                  {
                      text: "编辑",
                      iconCls: "icon-edit",
                      handler: function () {
                          var parm = $("#fm_dg").serialize();
                          var pp = decodeURIComponent(parm, true);
                  		  var itemUpdateUrl = "userCenter/updateSysBaseDict";
                   		  saveDictItem(itemUpdateUrl);
                      }

                  },
                   {
                       text: "取消",
                       iconCls: "icon-cancel",
                       handler: function () {
                           $("#dd_dg").window('close');
                       }
                   }
                  ]


              });
          } else {
              $.messager.alert('提示','请选中一行在进行编辑');
          }

      }
      
      
      /*修改保存*/
		function saveDictItem(itemUrl){
			$("#fm_dg").form("submit", {
	            url : itemUrl,
	            onSubmit : function() {
	                return $(this).form("validate");
	            },
	            success : function(result) {
	                if (result) {
	                    $.messager.alert("系统提示", "保存成功！");
	                    $("#dd_dg").window("close");
	                    $("#tab").datagrid("reload");
	                } else {
	                    $.messager.alert("系统提示", "保存失败！");
	                    return;
	                }
	            }
	        });
		}
		
		/*数据字典子表查询*/
		function submitDictItemForm() {
			var item_code = $("#item_item_code").val();
			var dict_code = $("#item_dict_code").val();
			var item_name = $("#item_item_name").val();
			$('#tab').datagrid('load',{
				dict_code:dict_code,
				item_code:item_code,
				item_name:item_name
			});
		}
		
		/*数据字典子表清空查询条件*/
		function clearDictItemForm() {
			$("#detailItem")[0].reset();
		}
		
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
					模块查询: <input class="easyui-validatebox" validType="" id="module_simp" name ="module_simp"  style="width:110px"></input>
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
		    				<input type="text" id="module_simp_fix" name="module_simp" class="easyui-textbox"/>
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
		function fixWidth(percent)  
		{  
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
								{ field: 'module_simp', title: '模块名称',width:fixWidth(0.3) },
								{ field: 'module_index', title: '模块首页',width:fixWidth(0.3) },
								{ field: 'module_path', title: '模块权限路径',width:fixWidth(0.3) },
								{ field: 'is_used', title: '是否在用',width:fixWidth(0.3)},
								{ field: 'module_desc', title: '模块说明',width:fixWidth(0.1) },
								{ field: 'add_time', title: '添加时间',width:fixWidth(0.1) },
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
		
		
		
		function exportFormForSelect(){
			
			var rows = $('#mainModuleInfoTable').datagrid('getSelections');
			
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
		
		
	</script>

</body>
</html>