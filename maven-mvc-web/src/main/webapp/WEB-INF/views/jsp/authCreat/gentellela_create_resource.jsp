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
								<a class="collapse-link"> <i class="fa fa-wrench"
									id="shoujisf2"></i>
								</a>
							</div>
						</div>
						<div class="ibox-content"
							style="padding-left: 0px; padding-right: 0px; display: block;"
							id="shoujisf3">
							<div class="roww">
								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">数据库类型</font></span>
										<select class="form-control" name="yy_ID" id="register0">
											<option value="">所有数据库</option>
											<option value="1">mysql</option>
											<option value="2">orcale</option>
											<option value="3">DB2</option>
											<option value="4">SQL Server</option>
										</select>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">咨询客服</font></span>
										<select class="form-control" name="userID" id="userinfoZxy">
											<option value="">所有咨询员</option>
											<option value="36">李璐</option>
											<option value="46">康霭黎</option>
											<option value="47">张燕</option>
											<option value="48">周璐</option>
											<option value="49">许丽芳</option>
											<option value="51">刘伟</option>
											<option value="66">admin1</option>
											<option value="50">许巍</option>
											<option value="64">王强栋</option>
											<option value="60">张强</option>
										</select>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">所属病种</font></span>
										<select name="bz_ID" id="userinfoBZ" class="form-control">
											<option value="">所有</option>
										</select>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">咨询方式</font></span>
										<select name="zxfs_ID" id="userinfo0"
											class="form-control zxfspdxj">
											<option value="">所有</option>
										</select>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="red">到诊状态</font></span>
										<select name="shifoudaozhen" class="form-control">
											<option value="0">所有咨询</option>
											<option value="1">仅咨询</option>
											<option value="2" selected="">已预约</option>
											<option value="3">已到诊</option>
											<option value="4">未到诊</option>
										</select>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">信息来源</font></span>
										<select name="xx_ID" id="userinfoXxly" class="form-control">
											<option value="">请选择信息来源</option>

										</select>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">预约号</font></span>
										<input name="yuyuehao" type="text" value=""
											class="form-control">
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">手机号/姓名</font></span>
										<input name="shouji" type="text" value="" class="form-control">
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">来源网站</font></span>
										<select name="laiyuanwangzhan" id="userinfoWz"
											class="form-control">
											<option value="">请选择网站</option>

										</select>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">预约医生</font></span>
										<select name="yuyueyishengID" id="userinfoYuyueys"
											class="form-control">
											<option value="">请选择医生</option>

										</select>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">QQ/微信</font></span>
										<input name="QQhaoma" type="text" value=""
											class="form-control">

									</div>
								</div>

								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">IP/永久身份</font></span>
										<input name="IPdizhi" type="text" value=""
											class="form-control">

									</div>
								</div>

								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">是否住院</font></span>
										<select name="shifouzhuyuan" id="userinfoYuyueys"
											class="form-control">
											<option value="">请选择状态</option>
											<option value="1">门诊</option>
											<option value="2">有住院</option>
										</select>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">消费状态</font></span>
										<select name="xiaofei" id="userinfoYuyueys"
											class="form-control">
											<option value="">请选择消费</option>
											<option value="1">有消费</option>
											<option value="2">未消费</option>
										</select>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="input-group m-b">
										<span class="input-group-addon"><font color="">搜索/匹配词</font></span>
										<input name="guanjianci" type="text" value=""
											class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div class="row" style="margin:0;">
							<div class="col-sm-3">
								<button class="btn btn-primary" type="submit">确定筛选</button>
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
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
		});
	</script>

	<script src="${pageContext.request.contextPath}/static/plugin/easyui-1.5.1/js/jquery.easyui.min.js"></script>
	
	
	<script type="text/javascript">
			jQuery(function($) {
				/* var oTable1 = $('#sample-table-2').dataTable({
				"aoColumns": [
			      { "bSortable": false },
			      null, null,null, null, null,
				  { "bSortable": false }
				],
				"aLengthMenu" : [20, 40, 60],
				"bInfo" : true, } ); */
				loadItemTable([]);
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			})
			
			
			
			
			
			
function loadItemTable(itemParam){
	$.ajax({
		url: 'queryDataBase',
		type: 'post',
		async: false,
		data: itemParam,
	  	dataType: "json",
		success: function (data) {
			var str = JSON.stringify(data.rows);
			console.log(str); 
			 $('#sample-table-3').DataTable({
			 	bPaginate: true, //翻页功能
				bAutoWidth:false,
				data:data.rows,
				oLanguage: {
					"sSearch": "搜索:",
					"sLengthMenu": "每页显示 _MENU_ 条记录",
				        "sZeroRecords": "Nothing found - 没有记录",
					"sInfo": "显示第  _START_ 条到第  _END_ 条记录,一共  _TOTAL_ 条记录",
					"sInfoEmpty": "显示0条记录",
					"oPaginate": {
						"sPrevious": " 上一页 ",
						"sNext":     " 下一页 ",
						}
					},
				searching: false,// 是否禁用原生搜索
				fnCreatedRow :  function ( nRow, aData, iDataIndex ) {
			     },
			     fnDrawCallback :  function ( oSettings ) {
			       setIframeHeight(window.parent.document.getElementById('mainFrame'));
			     },
        
				columns:[
					       {data:'SCHEMA_CODE',title:'周几'},
					       {data:'SCHEMA_NAME',title:'第一位'}
					    ]
			});
		},
		error: function (data) {
		}
	});
}
			
			
		</script>
	<!-- /easyui.js -->
</body>

</html>