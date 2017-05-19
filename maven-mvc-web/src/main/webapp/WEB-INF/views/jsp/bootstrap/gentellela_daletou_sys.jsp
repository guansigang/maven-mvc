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
				<div id="main1">
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
			jQuery(function($) {
				loadItemTable([]);
				var myChart = echarts.init(document.getElementById('main1'));
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
			console.log(data.rows);
			 
			 $('#sample-table-3').DataTable({
			 	bPaginate: true, //翻页功能
				bAutoWidth:false,
				data:data.rows,
				searching: false,// 是否禁用原生搜索
				fnCreatedRow :  function ( nRow, aData, iDataIndex ) {
			     },
			     fnDrawCallback :  function ( oSettings ) {
			       setIframeHeight(window.parent.document.getElementById('mainFrame'));
			     },
        
				columns:[
					       {data:'daletou_id',title:'采购单编号',visible: false},
					       {data:'daletou_no',title:'期号',visible: false},
					       {data:'open_date',title:'开奖日期',visible: false},
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
			
			
		</script>
</body>

</html>