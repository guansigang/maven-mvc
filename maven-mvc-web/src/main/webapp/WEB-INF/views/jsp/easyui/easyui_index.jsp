<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="common/base/taglibs.jsp"%>
<%@ include file="common/base/base.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="${ contextPath }"></base>
	<script src="${ contextPath }static/easyui-1.5.1/js/jquery.easyui.min.js" type="text/javascript"></script>
	<link href="${ contextPath }static/easyui-1.5.1/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<link href="${ contextPath }static/easyui-1.5.1/themes/icon.css" rel="stylesheet" type="text/css" />
	<title>后台管理</title>
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
		<div data-options="region:'west',split:true" title="导航栏" style="width:200px;">
			<div data-options="region:'west',split:true,title:'导航菜单'" style="width: 200px;">
		        <div class="easyui-accordion" data-options="fit:true,border:false">
                    <ul id="mainTree" class="tree easyui-tree" data-options="animate:true,lines:true">
                        <li data-options="id:12,iconCls:'icon-joystick'">
                            <span>用户管理</span>
                            <ul>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('1')"><span>用户信息列表</span></a>
                                </li>
                            </ul>
                        </li>
                          <li data-options="iconCls:'icon-joystick'">
                            <span>数据字典管理</span>
                            <ul>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('2')"><span>数据字典列表</span></a>
                                </li>
                            </ul>
                        </li>
                        <li data-options="iconCls:'icon-joystick',id:'testId'">
                            <span>模块管理</span>
                            <ul>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('3')"><span>模块信息列表</span></a>
                                </li>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('4')"><span>权限信息列表</span></a>
                                </li>
                            </ul>
                        </li>
	                       <!--<li data-options="iconCls:'icon-joystick'">
	                            <span>采购计划</span>
	                            <ul>
	                                <li data-options="iconCls:'icon-user'">
	                                    <a onclick="addTab('8')"><span>月计划提报数据</span></a>
	                                </li>
	                                <li data-options="iconCls:'icon-user'">
	                                    <a onclick="addTab('9')"><span>月计划执行报表</span></a>
	                                </li>
	                                <li data-options="iconCls:'icon-user'">
	                                    <a onclick="addTab('10')"><span>采购计划表</span></a>
	                                </li>
	                            </ul>
	                        </li> 
                        <li data-options="iconCls:'icon-joystick'">
                            <span>质量模块</span>
                            <ul>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('12')"><span>食品质检-国家/省级情况报表</span></a>
                                </li>
                            </ul>
                        </li>
                        <li data-options="iconCls:'icon-joystick'">
                            <span>财务对账</span>
                            <ul>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('13')"><span>财务对账</span></a>
                                </li>
                            </ul>
                        </li>-->
                    </ul>
		        </div>
		    </div>
		</div>
		 <div id="rightMain" data-options="region:'center',title:'主要内容',iconCls:'icon-ok'">
		 	<div class="wrapper" style="height:100%">
		      <iframe src="userCenter/userCenterToPage?pageFlag=main_authority" scrolling="no" id="mainFrame" name="mainFrame" frameborder="0" marginheight="0" marginwidth="0" height="100%" width="100%"></iframe>
		   </div>
		</div>
	</div>
	<script type="text/javascript">
	
	$(function(){
	
	});
		 function addTab(flag){
			if(flag==1){
				$("#mainFrame").attr("src","userCenter/userCenterToPage?pageFlag=main_authority");
			}else if(flag==2){
				$("#mainFrame").attr("src","userCenter/userCenterToPage?pageFlag=main_dict");
			}else if(flag==3){
				$("#mainFrame").attr("src","userCenter/userCenterToPage?pageFlag=main_module");
			}else if(flag==4){
				$("#mainFrame").attr("src","userCenter/userCenterToPage?pageFlag=main_security");
			}
		} 
		

	</script>

</body>
</html>
