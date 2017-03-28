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
		<div data-options="region:'west',split:true" title="West" style="width:200px;">
			<div data-options="region:'west',split:true,title:'导航菜单'" style="width: 200px;">
		        <div class="easyui-accordion" data-options="fit:true,border:false">
                    <ul id="mainTree" class="tree easyui-tree" data-options="animate:true,lines:true">
                        <li data-options="id:12,iconCls:'icon-joystick'">
                            <span>B2C对账信息</span>
                            <ul>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('1')"><span>WMS数据</span></a>
                                </li>
                            </ul>
                            <ul>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('2')"><span>导入数据</span></a>
                                </li>
                            </ul>
                            <ul>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('3')"><span>对账单列表</span></a>
                                </li>
                            </ul>
                            <ul>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('4')"><span>结算单信息</span></a>
                                </li>
                            </ul>
                        </li>
                        <li data-options="iconCls:'icon-joystick'">
                            <span>B2B对账信息</span>
                            <ul>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('5')"><span>对账单列表</span></a>
                                </li>
                            </ul>
                            <ul>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('6')"><span>结算单信息</span></a>
                                </li>
                            </ul>
                        </li>
                        <li data-options="iconCls:'icon-joystick',id:'testId'">
                            <span>基础信息维护</span>
                            <ul>
                                <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('7')"><span>物流对账基础信息维护</span></a>
                                </li>
                                <!-- <li data-options="iconCls:'icon-user'">
                                    <a onclick="addTab('11')"><span>采购计划基础信息维护</span></a>
                                </li> -->
                            </ul>
                        </li>
	                        <!-- <li data-options="iconCls:'icon-joystick'">
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
		 <div id="rightMain" data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
		 	<div class="wrapper" style="height:100%">
		      <iframe src="" scrolling="no" id="mainFrame" name="mainFrame" frameborder="0" marginheight="0" marginwidth="0" height="100%" width="100%"></iframe>
		   </div>
		</div>
	</div>
	<script type="text/javascript">
	
	$(function(){
	
	});
		 function addTab(flag){ 
			if(flag==1){
				$("#mainFrame").attr("src","easyui/toJs300Page");
			}else if(flag==2){
				$("#mainFrame").attr("src","logistics/logistics2cImportData");
			}else if(flag==3){
				$("#mainFrame").attr("src","logistics/logistics2cDetailList");
			}else if(flag==4){
				$("#mainFrame").attr("src","logistics/logistics2cBill");
			}else if(flag==5){
				$("#mainFrame").attr("src","logistics/logistics2bDetailList");
			}else if(flag==6){
				$("#mainFrame").attr("src","logistics/logistics2bBill");
			}else if(flag==7){
				$("#mainFrame").attr("src","logistics/queryLogistics");
			}else if(flag==8){
				$("#mainFrame").attr("src","purchase/purchaseMonthPlanInfo");
			}else if(flag==9){
				$("#mainFrame").attr("src","http://192.168.4.48:8001/jsp/complexreport.do?funcIds=QQDS_CGJH&operate=init");
			}else if(flag==10){
				$("#mainFrame").attr("src","http://192.168.4.48:8001/jsp/complexreport.do?funcIds=QQDS_CGJH2&operate=init#");
			}else if(flag==11){
				$("#mainFrame").attr("src","purchase/purchaseBaseInfo");
			}else if(flag==12){
				$("#mainFrame").attr("src","http://192.168.4.48:8001/jsp/complexreport.do?funcIds=FOODQUALITY&operate=init#");
			}else if(flag==13){
				$("#mainFrame").attr("src","ordercompara/query");
			}
		} 
		

	</script>

</body>
</html>