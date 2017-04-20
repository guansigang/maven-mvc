<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="base/gentellela_base.jsp" flush="true"/>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gentellela Alela! | </title>
</head>
<body>
    <div class="container body">
      <div class="col-sm-12">
		<form action="/index.php/manage_zx/manage" method="post" id="contact-form">
		<div class="col-sm-12" style="padding:0px;">
		    <div class="ibox float-e-margins" id="shoujisf1">
		        <div class="ibox-title">
		            <h5><a class="collapse-link">筛查选项</a></h5>
		            <div class="ibox-tools">
		                <a class="collapse-link">
		                    <i class="fa fa-wrench" id="shoujisf2"></i>
		                </a>
		            </div>
		        </div>
		        <div class="ibox-content" style="padding-left: 0px; padding-right: 0px; display: block;" id="shoujisf3">
		         <div class="roww">
		                <div class="col-sm-3">
		                    <div class="input-group m-b">
		                    <span class="input-group-addon"><font color="">所属医院</font></span>
		                    <select class="form-control" name="yy_ID" id="register0">
		                    <option value="">所有医院</option>                                            <option value="1">徐州新华精神病医院</option>                      <option value="2">株洲妇科精神病医院</option>                      <option value="3">怀化骨科医院</option>                      <option value="167">南昌不孕不育医院</option>                      <option value="186">北京骨科医院</option>                      <option value="190">广州不孕不育</option>                    </select>
		                    </div>
		                </div>
		                <div class="col-sm-3">
		                    <div class="input-group m-b">
		                    <span class="input-group-addon"><font color="">咨询客服</font></span>
		                    <select class="form-control" name="userID" id="userinfoZxy">
		                      <option value="">所有咨询员</option>
		                                              <option value="36">李璐</option>                        <option value="46">康霭黎</option>                        <option value="47">张燕</option>                        <option value="48">周璐</option>                        <option value="49">许丽芳</option>                        <option value="51">刘伟</option>                        <option value="66">admin1</option>                        <option value="50">许巍</option>                        <option value="64">王强栋</option>                        <option value="60">张强</option>                    </select>
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
		                    <select name="zxfs_ID" id="userinfo0" class="form-control zxfspdxj">
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
		                     <input name="yuyuehao" type="text" value="" class="form-control">
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
		                    <select name="laiyuanwangzhan" id="userinfoWz" class="form-control">
		                      <option value="">请选择网站</option>
		                         
		                    </select>
		                    </div>
		                </div>
		                <div class="col-sm-3">
		                    <div class="input-group m-b">
		                    <span class="input-group-addon"><font color="">预约医生</font></span>
		                      <select name="yuyueyishengID" id="userinfoYuyueys" class="form-control">
		                            <option value="">请选择医生</option>
		                         
		                      </select>
		                    </div>
		                </div>
		                 <div class="col-sm-3">
		                    <div class="input-group m-b">
		                    <span class="input-group-addon"><font color="">QQ/微信</font></span>
		                      <input name="QQhaoma" type="text" value="" class="form-control">
		                    
		                    </div>
		                </div>
		
		                <div class="col-sm-3">
		                    <div class="input-group m-b">
		                    <span class="input-group-addon"><font color="">IP/永久身份</font></span>
		                      <input name="IPdizhi" type="text" value="" class="form-control">
		                    
		                    </div>
		                </div>
		                
		                <div class="col-sm-3">
		                    <div class="input-group m-b">
		                    <span class="input-group-addon"><font color="">是否住院</font></span>
		                      <select name="shifouzhuyuan" id="userinfoYuyueys" class="form-control">
		                            <option value="">请选择状态</option>
		                            <option value="1">门诊</option>
		                            <option value="2">有住院</option>
		                      </select>
		                    </div>
		                </div>
		                  <div class="col-sm-3">
		                    <div class="input-group m-b">
		                    <span class="input-group-addon"><font color="">消费状态</font></span>
		                      <select name="xiaofei" id="userinfoYuyueys" class="form-control">
		                            <option value="">请选择消费</option>
		                            <option value="1">有消费</option>
		                            <option value="2">未消费</option>
		                      </select>
		                    </div>
		                </div>
		                
		                <div class="col-sm-3">
		                    <div class="input-group m-b">
		                    <span class="input-group-addon"><font color="">搜索/匹配词</font></span>
		                     <input name="guanjianci" type="text" value="" class="form-control">
		                    </div>
		                </div>
		                
		                <div class="col-sm-3">
		                    <div class="input-group m-b">
		                    <span class="input-group-addon"><font color="red">排序方式</font></span>
		                      <select name="paixu" id="paixufanshi" class="form-control">
		                            <option value="zx_time" selected="">咨询时间</option>
		                            <option value="yuyueTime">预约日期</option>                   
		                            <option value="userID">咨询员</option>
		                            <option value="huifangcishu">回访次数</option>
		                            <option value="guanjianci">搜索关键词</option>
		                            <option value="bz_ID">病种</option>
		                            <option value="zxfs_ID">咨询方式</option>
		                            <option value="xx_ID">信息来源</option>
		                            <option value="xiaofei">消费</option>
		                            <option value="daozhen_time">就诊时间</option>
		                      </select>
		                    </div>
		                </div>
		         </div>
		         <div class="row" style="margin:0;">
		                <div class="col-sm-3" style="padding:0px;">
		                            <div class="form-group">
		                                        <label class="col-sm-12 control-label">咨询时间</label>
		                                        <div class="col-md-6">
		                                            <input name="zx_timeStart" type="text" class="form-control layer-date" placeholder="YYYY-MM-DD" value="2016-04-20" id="shijian11">
		                                        </div>
		                                        <div class="col-md-6">
		                                           <input name="zx_timeEnd" type="text" class="form-control layer-date" placeholder="YYYY-MM-DD" value="2017-04-20" id="shijian12">
		                                        </div>
		                            </div>
		                </div>
		                <div class="col-sm-3" style="padding:0px;">
		                            <div class="form-group">
		                                        <label class="col-sm-12 control-label">预约时间</label>
		                                        <div class="col-md-6">
		          <input name="yuyueTimeStart" type="text" class="form-control layer-date" placeholder="YYYY-MM-DD" value="2017-04-21" id="shijian21">
		                                        </div>
		                                        <div class="col-md-6">
		          <input name="yuyueTimeEnd" type="text" class="form-control layer-date" placeholder="YYYY-MM-DD" value="2017-04-21" id="shijian22">
		                                        </div>
		                            </div>
		                </div>
		                <div class="col-sm-3" style="padding:0px;">
		                            <div class="form-group">
		                                        <label class="col-sm-12 control-label">到诊时间</label>
		                                        <div class="col-md-6">
		          <input name="daozhen_timeStart" type="text" class="form-control layer-date" placeholder="YYYY-MM-DD" value="" id="shijian31">
		                                        </div>
		                                        <div class="col-md-6">
		          <input name="daozhen_timeEnd" type="text" class="form-control layer-date" placeholder="YYYY-MM-DD" value="" id="shijian32">
		                                        </div>
		                            </div>
		                </div>
		                <div class="col-sm-3">
		                <label class="col-sm-12 control-label">&nbsp;</label>
		                <button class="btn btn-primary" type="submit">确定筛选</button>
		                </div>
		         </div>
		        </div>
		    </div>
		</div>
		</form>
		</div>
    </div>
    <script>
      $(document).ready(function() {
      });
    </script>
    
    <script src="${pageContext.request.contextPath}/static/easyui-1.5.1/js/jquery.easyui.min.js"></script>
    <script>
    


function _add_daletou_data(){
	$.ajax({
		url : 'easyui/batchAddDaletouData',
		type : "post",
		async : true,
		data : {},
		success : function(d) {
			if(d==1){
				$('#detail2cStatusWin').window('close',true);
				layer.msg("保存成功！", { icon: 6 });
				addTab(5);
			}
		},
		error:function(data){
			//layer.close(laymsg);
			layer.msg("网络繁忙,请稍后重新登陆", { icon: 5 });
		}
	});

}
    
    
    </script>
    <!-- /easyui.js -->
  </body>
  
  </html>