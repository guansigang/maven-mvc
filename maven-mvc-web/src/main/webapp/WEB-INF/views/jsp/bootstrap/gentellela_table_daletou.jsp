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
										<span class="input-group-addon"><font color="">所属医院</font></span>
										<select class="form-control" name="yy_ID" id="register0">
											<option value="">所有医院</option>
											<option value="1">徐州新华精神病医院</option>
											<option value="2">株洲妇科精神病医院</option>
											<option value="3">怀化骨科医院</option>
											<option value="167">南昌不孕不育医院</option>
											<option value="186">北京骨科医院</option>
											<option value="190">广州不孕不育</option>
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
								<button class="btn btn-primary" onclick="_add_daletou_data();return false;" type="submit">获取数据</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>




















		<div class="row">
			<div class="col-xs-12">
				<div class="table-header">Results for "Latest Registered
					Domains"</div>

				<div class="table-responsive">
					<table id="sample-table-2" class="table table-striped table-bordered table-hover">
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
		});
	</script>

	<script
		src="${pageContext.request.contextPath}/static/easyui-1.5.1/js/jquery.easyui.min.js"></script>
	<script>
		function _add_daletou_data() {
		console.log("asdasdadad");
			$.ajax({
				url : 'batchAddDaletouData',
				type : "post",
				async : true,
				data : {},
				success : function(d) {
					console.log(d);
				},
				error : function(data) {
				}
			});

		}
	</script>
	
	
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
		url: 'queryDaletouData',
		type: 'post',
		async: false,
		data: itemParam,
	  	dataType: "json",
		success: function (data) {
			console.log(data.rows);
			var str = JSON.stringify(data.rows); 
			 $('#sample-table-2').DataTable({
			 	bPaginate: true, //翻页功能
				bAutoWidth:false,
				data:data.rows,
				searching: false,// 是否禁用原生搜索
				fnCreatedRow :  function ( nRow, aData, iDataIndex ) {
// 					console.log("************");
// 					console.log(nRow);
// 					console.log(aData);
			     },
			     fnDrawCallback :  function ( oSettings ) {
			       setIframeHeight(window.parent.document.getElementById('mainFrame'));
			     },
				
				
				
				
				
				
			 	/* aoColumns:[
				null,null,null,null,null,null,null,null,null,null,null,null,null,
				{ "asSorting": [ "asc" ] },
				{ "asSorting": [ "desc", "asc", "asc" ] },
				{ "asSorting": [ ] },
				{ "asSorting": [ ] }
				], */
			/* 	 columnDefs: [
            {
                // The `data` parameter refers to the data for the cell (defined by the
                // `data` option, which defaults to the column being worked with, in
                // this case `data: 0`.
                "render": function ( data, type, row ) {
                    return data +' ('+ row[3]+')';
                },
                "targets": 0
            },
            { "visible": false,  "targets": [ 3 ] }
        ],  */
        
         columnDefs: [  
            {  
                "targets": 0,  
                "searchable": false  
            },  
            {  
                "targets": [1,2,3],  
                "orderData": [ 2, 3, 4 ],  
                "searchable": false  
            },  
            {  
                "targets": [-3,-4],  
                "orderable": false,  
                "searchable": false  
            }  
        ], 
				columns:[
// 					      {data:'daletou_id',title:'采购单编号'},
					       {data:'daletou_no',title:'期号'},
					       {data:'open_date',title:'开奖日期'},
					       {data:'week_date',title:'周几'},
					       {data:'front_one',title:'第一位'},
					       {data:'front_sec',title:'第二位'},
					       {data:'front_third',title:'第三位'},
					       {data:'front_four',title:'第四位'},
					       {data:'front_five',title:'第五位'},
					       {data:'back_one',title:'后一位'},
					       {data:'back_sec',title:'后二位'},
					       {data:'in_all_money',title:'投注金额'},
					       {data:'first_num',title:'一等奖注数'},
					       {data:'first_money',title:'一等奖奖金'},
					       {data:'sec_num',title:'二等奖注数'},
					       {data:'sec_money',title:'二等奖奖金'},
					       {data:'all_money',title:'奖池'}
					    ]
			});
			
			
			/* $('#sample-table-2').dataTable(  
    {  
        data: [  
                {  
                    "name":    "Tiger Nixon1",  
                    "position":   "System Architect1",  
                    "phone": { "plain": 5552368, "filter": "5552368 555-2368", "display": "555-2368" },  
                    "salary":    "$3,1201",  
                    "start_date": "2011/04/25",  
                    "office":    "Edinburgh1",  
                    "extn":    "54211"  
                },  
                {  
                    "name":    "Tiger Nixon2",  
                    "position":   "System Architect2",  
                    "phone": { "plain": 5552368, "filter": "5552368 555-2368", "display": "555-2368" },  
                    "salary":    "$3,1202",  
                    "start_date": "2011/04/25",  
                    "office":    "Edinburgh2",  
                    "extn":    "54212"  
                },  
                {  
                    "name":    "Tiger Nixon3",  
                    "position":   "System Architect3",  
                    "phone": { "plain": 5552368, "filter": "5552368 555-2368", "display": "555-2368" },  
                    "salary":    "$3,1203",  
                    "start_date": "2011/04/25",  
                    "office":    "Edinburgh3",  
                    "extn":    "54213"  
                }  
                  
        ],  
          
        columnDefs: [  
            {  
                "targets": 0,  
                "searchable": false  
            },  
            {  
                "targets": [1,2,3],  
                "orderData": [ 2, 3, 4 ],  
                "searchable": false  
            },  
            {  
                "targets": [-3,-4],  
                "orderable": false,  
                "searchable": false  
            }  
        ],  
          
        columns: [  
            { "name": "name",   
              "cellType": "th",  
              "orderDataType": "dom-text",  
              "orderSequence": [ "desc","asc", "asc" ],  
              "className": "my_class",  
              "contentPadding": "mmm",  
              "createdCell": function (td, cellData, rowData, row, col) {  
                  if ( row < 1 ) {  
                    $(td).css('color', 'red');  
                  }  
                },  
              "data": "name",   
              "searchable": true,   
              "title": "My Name"  
            },  
            {   
                "data": "position",  
                "render": function ( data, type, full, meta ) {  
                    return '<a href="'+data+'">' + data + '</a>';  
                }  
            },  
            {  
                "data": 'phone',  
                "render": {  
                  "_": "plain",  
                  "filter": "filter",  
                  "display": "display"  
                }  
            },  
            { "data": "office" },  
            { "data": "start_date", "type": "date" },  
            { "data": "extn", "visible": false},  
            { "data": "salary", "width": "20px"  },  
            {  
                "data": null,  
                "orderable": false,  
                "defaultContent": "<button>Edit</button>"  
            }  
  
        ]  
    }  
);   */
		
		
		
		
		
		
		
			/* var table2=$('#sample-table-2').DataTable({
				data:data.rows,
				bAutoWidth:false,
		        searching: false,// 是否禁用原生搜索  
//				serverSide:true,//true代表后台处理分页，false代表前台处理分页
				bProcessing:true, //开启读取服务器数据时显示正在加载中……特别是大数据量的时候，开启此功能比较好
				columns:[
			      {data:'daletou_id',title:'采购单编号'},
			       {data:'daletou_no',title:'商品编码'},
			       {data:'open_date',title:'商品名称'},
			       {data:'week_date',title:'包装规格'},
			       {data:'front_one',title:'商品条码'},
			       {data:'front_sec',title:'采购数量'},
			       {data:'front_third',title:'实际到货数量'},
			       {data:'front_four',title:'实际到货数量'},
			       {data:'front_five',title:'实际到货数量'},
			       {data:'back_one',title:'实际到货数量'},
			       {data:'back_sec',title:'实际到货数量'},
			       {data:'in_all_money',title:'实际到货数量'},
			       {data:'first_num',title:'实际到货数量'},
			       {data:'first_money',title:'实际到货数量'},
			       {data:'sec_num',title:'实际到货数量'},
			       {data:'sec_money',title:'实际到货数量'},
			       {data:'all_money',title:'实际到货数量'},
			       {data:null,title:'操作'}
			    ],
			     columnDefs:[//设置操作按钮 
			                
			                {
					             "targets":-1,
					             "render":function(data,type,row,meta){
					            		 return '<a title="编辑" onclick="Competence_modify_detail(this)" href="javascript:void(0)" class="btn btn-xs btn-info"><i class="fa fa-edit bigger-120"></i></a>';
					             }
					         }
			     ]
			});
			$("#page2").pagination(data.total,{
				items_per_page:PAGE_SIZE,
				current_page:CURRENT_PAGE-1,
				num_edge_entries: 2,
			    num_display_entries: 4,
				callback:function(n){
					var index = layer.load(2,{time:2000});
					CURRENT_PAGE=(n+1);
					table2.destroy();
				    $('#sample-table2').empty();
				    init(createPageResult({Method:'delivers',batch_treatment:"true"},CURRENT_PAGE,PAGE_SIZE));
				}
			}); */
		},
		error: function (data) {
		}
	});
}
			
			
		</script>
	<!-- /easyui.js -->
</body>

</html>