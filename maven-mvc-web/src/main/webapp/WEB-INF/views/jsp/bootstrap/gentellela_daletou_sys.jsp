<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="base/gentellela_base.jsp" flush="true" />
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Gentellela Alela! |</title>
<style type="text/css">
html, body {
	margin: 0;
	height: 100%;
}
</style>
</head>
<body style="background-color: #e4e9ed">
	<div class="container body">
		<div class="col-sm-12">
			<form action="/index.php/manage_zx/manage" method="post"
				id="contact-form">
				<div class="col-sm-12" style="padding:0px;">
					<div class="ibox float-e-margins" id="shoujisf1">
						<div class="ibox-title">
							<h5>
								<a class="collapse-link">筛查选项</a>
							</h5>
							<div class="ibox-tools">
								<a class="collapse-link">
								</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>

		<div class="row">
			<div class="col-xs-12">
				<div class="table-header">Results for "Latest Registered Domains"</div>
				<div class="table-responsive">
					<table id="sample-table-3" class="table table-striped table-bordered table-hover">
					</table>
				</div>
				<div id="main1" style="width: 900px;height:800px;margin: 0 auto;">
				</div>
			</div>
		</div>

	</div>
	<script>
		$(document).ready(function() {
		});
	</script>

	<script src="${pageContext.request.contextPath}/static/plugin/ECharts/echarts-3.5.4.js"></script>
	
	
	
	<script type="text/javascript">
			var myChart = echarts.init(document.getElementById('main1'));
			jQuery(function($) {
				loadItemTable([]);
			})
			
			
			
			
			
			
function loadItemTable(itemParam){
	$.ajax({
		url: 'queryDaletouData',
		type: 'post',
		async: false,
		data: itemParam,
	  	dataType: "json",
		success: function (data) {
			var str = JSON.stringify(data.rows); 
			var num = $("#sample-table-3_length select").find("option:selected").text();
			if(!num){
			num = 10;
			}
// 			viewEcharts(data,num);
			
			 $('#sample-table-3').DataTable({
			 	bPaginate: true, //翻页功能
				bAutoWidth:false,
// 				bServerSide:true,
				data:data.rows,
				searching: false,// 是否禁用原生搜索
				fnCreatedRow :  function ( nRow, aData, iDataIndex ) {
			     },
			     fnStateLoaded:function(){
			     	console.log("fdgdfgdg");
			     },
			     fnDrawCallback :  function ( oSettings ) {
			       setIframeHeight(window.parent.document.getElementById('mainFrame'));
			       viewEcharts(data,num);
			     },
        
				columns:[
					       {data:'daletou_id',title:'采购单编号',visible: false},
					       {data:'daletou_no',title:'期号',visible: false},
					       {data:'open_date',title:'开奖日期'},
					       {data:'week_date',title:'周几',visible: false},
					       {data:'first_diff',title:'第一位'},
					       {data:'sec_diff',title:'第二位'},
					       {data:'thir_diff',title:'第三位'},
					       {data:'four_diff',title:'第四位'},
					       {data:'five_diff',title:'第五位'}
					    ]
			});
		},
		error: function (data) {
		}
	});
}

function viewEcharts(data,num){
		var titles = [];
		var data1 = [];
		var data2 = [];
		var data3 = [];
		var data4 = [];
		var data5 = [];

		$.each(data.rows, function(idx, obj) {
			if(idx>num){
				return false;
			}
			titles.push(obj.open_date);
			data1.push(obj.first_diff);
			data2.push(obj.sec_diff);
			data3.push(obj.thir_diff);
			data4.push(obj.four_diff);
			data5.push(obj.five_diff);
		});


// 			data.rows.each(function(index){ 
// 			titles.push(data[index].daletou_no);
// 			});
// 			console.log("&&&&&&&&&&&&&&&&"+titles);

	option1 = {
				    title: {
				        text: '数据分析汇总折线图',
				        subtext: '纯属虚构'
				    },
				    tooltip: {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['第一位','第二位','第三位','第四位','第五位']
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    toolbox: {
				    	show : true,
				        feature: {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    xAxis: {
				    	name:'H',
				        type: 'category',
				        boundaryGap: false,
				        data: titles
				    },
				    yAxis: {
				    	name:'差值',
				        type: 'value'
				    },
				    series: [
				        {
				            name:'第一位',
				            type:'line',
				            stack: '一二位差值',
				            data:data1, 
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            }
				        },{
				            name:'第二位',
				            type:'line',
				            stack: '二三位差值',
				            data:data2, 
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            }
				        },{
				            name:'第三位',
				            type:'line',
				            stack: '三四位差值',
				            data:data3, 
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            }
				        },{
				            name:'第四位',
				            type:'line',
				            stack: '四五位差值',
				            data:data4, 
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            }
				        },{
				            name:'第五位',
				            type:'line',
				            stack: '总量',
				            data:data5, 
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            }
				        }
				    ]
				};

			
			myChart.setOption(option1);
}
			
			
		</script>
</body>

</html>