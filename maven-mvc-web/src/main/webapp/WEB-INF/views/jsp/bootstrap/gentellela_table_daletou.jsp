<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<table id="sample-table-2"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></th>
								<th>Domain</th>
								<th>Price</th>
								<th class="hidden-480">Clicks</th>

								<th><i class="icon-time bigger-110 hidden-480"></i> Update
								</th>
								<th class="hidden-480">Status</th>

								<th></th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">app.com</a></td>
								<td>$45</td>
								<td class="hidden-480">3,330</td>
								<td>Feb 12</td>

								<td class="hidden-480"><span
									class="label label-sm label-warning">Expiring</span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">base.com</a></td>
								<td>$35</td>
								<td class="hidden-480">2,595</td>
								<td>Feb 18</td>

								<td class="hidden-480"><span
									class="label label-sm label-success">Registered</span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">max.com</a></td>
								<td>$60</td>
								<td class="hidden-480">4,400</td>
								<td>Mar 11</td>

								<td class="hidden-480"><span
									class="label label-sm label-warning">Expiring</span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">best.com</a></td>
								<td>$75</td>
								<td class="hidden-480">6,500</td>
								<td>Apr 03</td>

								<td class="hidden-480"><span
									class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">pro.com</a></td>
								<td>$55</td>
								<td class="hidden-480">4,250</td>
								<td>Jan 21</td>

								<td class="hidden-480"><span
									class="label label-sm label-success">Registered</span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">team.com</a></td>
								<td>$40</td>
								<td class="hidden-480">3,200</td>
								<td>Feb 09</td>

								<td class="hidden-480"><span
									class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">up.com</a></td>
								<td>$95</td>
								<td class="hidden-480">8,520</td>
								<td>Feb 22</td>

								<td class="hidden-480"><span
									class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">view.com</a></td>
								<td>$45</td>
								<td class="hidden-480">4,100</td>
								<td>Mar 12</td>

								<td class="hidden-480"><span
									class="label label-sm label-success">Registered</span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">nice.com</a></td>
								<td>$38</td>
								<td class="hidden-480">3,940</td>
								<td>Feb 12</td>

								<td class="hidden-480"><span
									class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">fine.com</a></td>
								<td>$25</td>
								<td class="hidden-480">2,983</td>
								<td>Apr 01</td>

								<td class="hidden-480"><span
									class="label label-sm label-warning">Expiring</span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">good.com</a></td>
								<td>$50</td>
								<td class="hidden-480">6,500</td>
								<td>Feb 02</td>

								<td class="hidden-480"><span
									class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">great.com</a></td>
								<td>$55</td>
								<td class="hidden-480">6,400</td>
								<td>Feb 24</td>

								<td class="hidden-480"><span
									class="label label-sm label-success">Registered</span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">shine.com</a></td>
								<td>$25</td>
								<td class="hidden-480">2,200</td>
								<td>Apr 01</td>

								<td class="hidden-480"><span
									class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">rise.com</a></td>
								<td>$42</td>
								<td class="hidden-480">3,900</td>
								<td>Feb 01</td>

								<td class="hidden-480"><span
									class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">above.com</a></td>
								<td>$35</td>
								<td class="hidden-480">3,420</td>
								<td>Mar 12</td>

								<td class="hidden-480"><span
									class="label label-sm label-warning">Expiring</span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">share.com</a></td>
								<td>$30</td>
								<td class="hidden-480">3,200</td>
								<td>Feb 11</td>

								<td class="hidden-480"><span
									class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">fair.com</a></td>
								<td>$35</td>
								<td class="hidden-480">3,900</td>
								<td>Mar 26</td>

								<td class="hidden-480"><span
									class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">year.com</a></td>
								<td>$48</td>
								<td class="hidden-480">3,990</td>
								<td>Feb 15</td>

								<td class="hidden-480"><span
									class="label label-sm label-warning">Expiring</span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">day.com</a></td>
								<td>$55</td>
								<td class="hidden-480">5,600</td>
								<td>Jan 29</td>

								<td class="hidden-480"><span
									class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">light.com</a></td>
								<td>$40</td>
								<td class="hidden-480">3,100</td>
								<td>Feb 17</td>

								<td class="hidden-480"><span
									class="label label-sm label-success">Registered</span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">sight.com</a></td>
								<td>$58</td>
								<td class="hidden-480">6,100</td>
								<td>Feb 19</td>

								<td class="hidden-480"><span
									class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">right.com</a></td>
								<td>$50</td>
								<td class="hidden-480">4,400</td>
								<td>Apr 01</td>

								<td class="hidden-480"><span
									class="label label-sm label-warning">Expiring</span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#">once.com</a></td>
								<td>$20</td>
								<td class="hidden-480">1,400</td>
								<td>Apr 04</td>

								<td class="hidden-480"><span
									class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
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
			$.ajax({
				url : 'easyui/batchAddDaletouData',
				type : "post",
				async : true,
				data : {},
				success : function(d) {
					if (d == 1) {
						$('#detail2cStatusWin').window('close', true);
						layer.msg("保存成功！", {
							icon : 6
						});
						addTab(5);
					}
				},
				error : function(data) {
					//layer.close(laymsg);
					layer.msg("网络繁忙,请稍后重新登陆", {
						icon : 5
					});
				}
			});

		}
	</script>
	
	
	<script type="text/javascript">
			jQuery(function($) {
				var oTable1 = $('#sample-table-2').dataTable( {
				"aoColumns": [
			      { "bSortable": false },
			      null, null,null, null, null,
				  { "bSortable": false }
				] } );
				
				
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
		</script>
	<!-- /easyui.js -->
</body>

</html>