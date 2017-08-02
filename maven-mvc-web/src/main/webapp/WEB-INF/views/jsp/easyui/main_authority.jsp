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
					登录名称: <input class="easyui-textbox" id="login_name" name ="login_name"  style="width:110px"></input>
					最后登录日期: <input class="easyui-datebox" id="lastLoginDate" name ="lastLoginDate" data-options="sharedCalendar:'#cc',formatter:myformatter,parser:myparser" style="width:110px"></input>
					在用状态:<select class="easyui-combobox" id="user_state" panelHeight="auto" name="user_state" style="width:100px"></select>
					所属权限:<select class="easyui-combobox" id="security_id" name="security_id" panelHeight="auto" style="width:100px"></select>
					<a href="javascript:void(0)" title="清空搜索项" class="easyui-linkbutton" iconCls="icon-remove"  onclick="clearDetailForm()">清空</a>
					<a href="javascript:void(0)" title="清空搜索项" class="easyui-linkbutton" iconCls="icon-search" onclick="submitDetailForm()">搜索</a>
					<a href="javascript:void(0)" title="添加管理员" class="easyui-linkbutton" iconCls="icon-add" onclick="add_user();return false;">添加</a>
					<a href="javascript:void(0)" title="修改管理员" class="easyui-linkbutton" iconCls="icon-edit" onclick="update_user();return false;">修改</a>
					<a href="javascript:void(0)" title="修改管理员" class="easyui-linkbutton" iconCls="icon-edit" onclick="reset_secret();return false;">密码重置</a>
					<a href="javascript:void(0)" title="删除管理员" class="easyui-linkbutton" iconCls="icon-cut" onclick="logisUpdate();return false;">删除</a>
					<a href="javascript:void(0)" title="导出管理员" class="easyui-linkbutton" iconCls="icon-print"  onclick="exportMode();return false;">导出</a>
				</div>
				<div id="cc" class="easyui-calendar"></div>
			</div>
			</form>
		</div>
		<div id="editUserDataWin">
			<form id="editUserDataForm" style="margin-top: 50px;" method="post">
	    	<table cellpadding="5" style="padding: 20px;">
	    		<tr>
	    		<input type="text" id="user_id_fix" name="user_id" style="display: none"/>
	    			<td>登录名:</td>
		    			<td>
		    				<input type="text" id="login_name_fix" name="login_name" class="easyui-textbox" required="true" />
		    			</td>
	    			<td>
	    			<td>所属权限:</td>
		    			<td >
		    				<input type="text" id="security_id_fix" name="security_id" class="easyui-textbox" required="true" />
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
	       
	       /////////////////////添加///////////////////
    function add_user() {
    //表单清空
        $("#editUserDataForm")[0].reset();
        //显示
        $("#editUserDataWin").show();
        //以窗体的形式展示
        $("#editUserDataWin").dialog({
            title: "添加从字典信息",//标题
            iconCls: "icon-add",//图标
            width: 600,//窗体的宽度
            height: 300,//窗体的高度
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
                    var itemAddUrl = "userCenter/addSysShiroUser";
                    saveUser(itemAddUrl);
                }
            },
              {
                  text: "取消",
                  iconCls: "icon-cancel",
                  handler: function () {
                      $("#editUserDataWin").window("close");
                  }
              }
            ]
        });
      }
      
      
      
      
	       /////////////////////修改///////////////////
    function update_user() {
    //表单清空
        $("#editUserDataForm")[0].reset();
      //选中一行，获取这一行的属性的值
          var selected = $("#manageUserInfoTable").datagrid('getSelected');
          //判断是否选中
          if (selected != null) {
			$("#editUserDataWin").show();
	        $("#editUserDataForm").form("load", selected);
              $("#editUserDataWin").dialog({
                  title: "编辑信息",
                  iconCls: "icon-edit",
                  modal: true,//遮罩层
                  width: 600,
                  height: 300,
                  buttons: [
                  {
                      text: "保存",
                      iconCls: "icon-edit",
                      handler: function () {
                          var parm = $("#editUserDataForm").serialize();
                          var pp = decodeURIComponent(parm, true);
                  		  var itemUpdateUrl = "userCenter/updateSysShiroUser";
                   		  saveUser(itemUpdateUrl);
                      }

                  },
                   {
                       text: "取消",
                       iconCls: "icon-cancel",
                       handler: function () {
                           $("#editUserDataWin").window('close');
                       }
                   }
                  ]


              });
          } else {
              $.messager.alert('提示','请选中一行在进行编辑');
          }
      }
      
      /*修改保存*/
		function saveUser(itemUrl){
			$("#editUserDataForm").form("submit", {
	            url : itemUrl,
	            onSubmit : function() {
	                return $(this).form("validate");
	            },
	            success : function(result) {
	                if (result) {
	                    $.messager.alert("系统提示", "保存成功！");
	                    $("#editUserDataWin").window("close");
	                    $("#manageUserInfoTable").datagrid("reload");
	                } else {
	                    $.messager.alert("系统提示", "保存失败！");
	                    return;
	                }
	            }
	        });
		}
		
		function reset_secret(){
      //选中一行，获取这一行的属性的值
          var selected = $("#manageUserInfoTable").datagrid('getSelected');
          //判断是否选中
          if (selected != null) {
          $.messager.confirm('提示', '确定要重置密码？', function (y) {
                    if (y) {
                        $.ajax({
							url : "userCenter/updateUserSecret",
							type : "post",
							async : true,
							data : {user_id:selected.user_id},
							success : function(d) {
								if(JSON.parse(d).resultCode==1){
								$.messager.alert("系统提示", "密码已成功重置为admin123！");
								}
							},
							error:function(data){
							$.messager.alert("系统提示", "密码重置失败！");
							}
						});
                    }
                })
          } else {
              $.messager.alert('提示','请选中一行重置密码');
          }
		}
		$(document).ready(function(){
			$('#security_id').combobox({
				url:'userCenter/selectSecuritySelectBox',
				valueField:'security_id',
				textField:'security_cn',
				onLoadSuccess: function(param) {
				},
				onLoadError:function(param){
				}
			});
			
			$('#security_id_fix').combobox({
				url:'userCenter/selectSecuritySelectBox',
				valueField:'security_id',
				textField:'security_cn',
				onLoadSuccess: function(param) {
				},
				onLoadError:function(param){
				}
			});
		
			$('#editUserDataWin').window({
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
								{ field: 'item_name', title: '在用状态',width:fixWidth(0.1) },
								{ field: 'user_status', title: '用户状态',width:fixWidth(0.1),formatter:formatterSTAT_DATE },
								{ field: 'user_type', title: '用户类型',width:fixWidth(0.1) },
								{ field: 'security_cn', title: '角色',width:fixWidth(0.1) },
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
		
		function submitDetailForm() {
			var lastLoginDate = $("#lastLoginDate").datebox('getValue');
			var login_name = $("#login_name").val();
			var user_state = $("#user_state").combobox("getValue");
			var security_id = $("#security_id").combobox("getValue");
			$('#manageUserInfoTable').datagrid('load',{
				login_name:login_name,
				lastlogin_time:lastLoginDate,
				user_state:user_state,
				security_id:security_id
			});
		}
		
		function clearDetailForm() {
			$("#lastLoginDate").textbox('setValue','');
			$("#login_name").textbox('setValue','');
			$("#user_state").combobox('setValue','');
			$("#security_id").combobox('setValue','');
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