<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Shamcey - Metro Style Admin Template</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />

<link rel="stylesheet" href="css/responsive-tables.css">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.9.2.min.js"></script>
<script type="text/javascript" src="js/modernizr.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery.uniform.min.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="js/responsive-tables.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
</head>

<body>

	<div class="mainwrapper">

		<div class="header">>
			<div class="headerinner">
				<ul class="headmenu">
					<li class="right">
						<div class="userloggedinfo">
												<div class="userinfo">
								<h5>
								<c:if test="${admin.permission == 1}">
									普通管理员
								</c:if>
								<c:if test="${admin.permission == 0}">
									高级管理员
								</c:if>	
								</h5>
								<ul>
									<c:if test="${not empty admin}">
										<li><a href="<%=basePath %>logoutAdmin">注销</a></li>
									</c:if>
									<c:if test="${empty admin}">
										<li><a href="login.jsp">登录</a></li>
									</c:if>
								</ul>
							</div>
							</div>
					</li>
				</ul>
				<!--headmenu-->
			</div>
		</div>

		<div class="leftpanel">

			<div class="leftmenu">
				<ul class="nav nav-tabs nav-stacked">
					<li class="nav-header">Navigation</li>
					<li class="active"><a href="<%=basePath%>background/index.jsp"><span
							class="iconfa-laptop"></span> 首页</a></li>
					<li class="dropdown"><a href=""><span class="iconfa-group"></span>
							订票客户管理</a>
						<ul>
							<li><a href="<%=basePath%>background/addcustomer.jsp">增加客户信息</a></li>
							<li><a href="<%=basePath%>queryCustomers">查询客户信息</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href=""><span
							class="iconfa-pencil"></span> 航班机票管理</a>
						<ul>
							<li><a href="<%=basePath%>queryAllReserve">订票审核</a></li>
							<li><a href="<%=basePath%>RefundAudit">退票管理</a></li>
						</ul></li>
					<li class="dropdown"><a href=""><span class="iconfa-plane"></span>
							航班信息管理</a>
						<ul>
							<li><a href="<%=basePath%>queryCompanyPlanemodel">增加航班信息</a></li>
							<li><a href="<%=basePath%>background/addflightschedule.jsp">增加航班计划</a></li>
							<li><a href="<%=basePath%>background/addschedule.jsp">安排航班计划</a></li>
							<li><a href="<%=basePath%>background/findschedule.jsp">以往航班计划</a></li>
							<li><a href="<%=basePath%>queryFlight">查询航班信息</a></li>
						</ul></li>
					<li class="dropdown"><a href=""><span
							class=" iconfa-group"></span> 航空公司管理</a>
						<ul>
							<li><a href="<%=basePath %>background/addcompany.jsp">增加航空公司</a></li>
							<li><a href="<%=basePath %>queryCnamePname">添加公司机型</a>
							<li><a href="<%=basePath %>queryCompanys">查询航空公司</a></li>
						</ul></li>
					<li class="dropdown"><a href=""><span class="iconfa-plane"></span>
							机型管理</a>
						<ul>
							<li><a href="<%=basePath %>background/addplanemodel.jsp">增加机型</a></li>
							<li><a href="<%=basePath %>queryList">查询机型</a></li>
							<li><a href="<%=basePath %>queryPlanemodel">修改机型信息</a></li>
						</ul></li>
					<li><a href="<%=basePath%>background/printtable.jsp"><span class="iconfa-th-list"></span>
							报表打印管理</a></li>
					<c:if test="${admin.permission == 0}">
						<li class="dropdown"><a href=""><span class="iconfa-user"></span>
								人员用户管理</a>
							<ul>
								<li><a href="addnormaladmin.jsp">增加普通管理员</a></li>
								<li><a href="<%=basePath %>findAllAdmin">查询普通管理员</a></li>
							</ul>
						</li>
					</c:if>
				</ul>
			</div>
			<!--leftmenu-->

		</div>
		<!-- leftpanel -->

		<div class="rightpanel">

			<ul class="breadcrumbs">
				<li><a href="index.jsp"><i class="iconfa-home"></i></a> <span
					class="separator"></span></li>
				<li>订票客户管理</li>
				<li class="right"><a href="" data-toggle="dropdown"
					class="dropdown-toggle"><i class="icon-tint"></i> Color Skins</a>
					<ul class="dropdown-menu pull-right skin-color">
						<li><a href="default">Default</a></li>
						<li><a href="navyblue">Navy Blue</a></li>
						<li><a href="palegreen">Pale Green</a></li>
						<li><a href="red">Red</a></li>
						<li><a href="green">Green</a></li>
						<li><a href="brown">Brown</a></li>
					</ul></li>
			</ul>

			<div class="pageheader">
				<form action="results.jsp" method="post" class="searchbar">
					<input type="text" name="keyword"
						placeholder="To search type and hit enter..." />
				</form>
				<div class="pageicon">
					<span class="iconfa-laptop"></span>
				</div>
				<div class="pagetitle">
					<h5>All Features Summary</h5>
					<h1>Dashboard</h1>
				</div>
			</div>
			<!--pageheader-->

			<div class="maincontent">
				<div class="maincontentinner">
					<div class="row-fluid">
						<div id="dashboard-left" class="span8">

							<h5 class="subtitle">Recently Viewed Pages</h5>
							<ul class="shortcuts">
								<li class="events"><a href=""> <span
										class="shortcuts-icon iconsi-event"></span> <span
										class="shortcuts-label">Events</span>
								</a></li>
								<li class="products"><a href=""> <span
										class="shortcuts-icon iconsi-cart"></span> <span
										class="shortcuts-label">Products</span>
								</a></li>
								<li class="archive"><a href=""> <span
										class="shortcuts-icon iconsi-archive"></span> <span
										class="shortcuts-label">Archives</span>
								</a></li>
								<li class="help"><a href=""> <span
										class="shortcuts-icon iconsi-help"></span> <span
										class="shortcuts-label">Help</span>
								</a></li>
								<li class="last images"><a href=""> <span
										class="shortcuts-icon iconsi-images"></span> <span
										class="shortcuts-label">Images</span>
								</a></li>
							</ul>

							<br />

							<h5 class="subtitle">Daily Statistics</h5>
							<br />
							<div id="chartplace" style="height:300px;"></div>

							<div class="divider30"></div>

							<table class="table table-bordered responsive">
								<thead>
									<tr>
										<th class="head1">Rendering engine</th>
										<th class="head0">Browser</th>
										<th class="head1">Platform(s)</th>
										<th class="head0">Engine version</th>
										<th class="head1">CSS grade</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Trident</td>
										<td>Internet Explorer 5.5</td>
										<td>Win 95+</td>
										<td class="center">5.5</td>
										<td class="center">A</td>
									</tr>
									<tr>
										<td>Trident</td>
										<td>Internet Explorer 6</td>
										<td>Win 98+</td>
										<td class="center">6</td>
										<td class="center">A</td>
									</tr>
									<tr>
										<td>Trident</td>
										<td>Internet Explorer 7</td>
										<td>Win XP SP2+</td>
										<td class="center">7</td>
										<td class="center">A</td>
									</tr>
								</tbody>
							</table>

							<br />

							<h4 class="widgettitle">
								<span class="icon-comment icon-white"></span> Recent Comments
							</h4>
							<div class="widgetcontent nopadding">
								<ul class="commentlist">
									<li><img src="images/photos/thumb2.png" alt=""
										class="pull-left" />
										<div class="comment-info">
											<h4>
												<a href="">Sed ut perspiciatis unde omnis iste natus
													error sit voluptatem</a>
											</h4>
											<h5>
												in <a href="">Sit Voluptatem</a>
											</h5>
											<p>Nemo enim ipsam voluptatem quia voluptas sit
												aspernatur aut odit aut fugit, sed quia consequuntur magni
												dolores eos qui ratione voluptatem sequi nesciunt.</p>
											<p>
												<a href="" class="btn btn-success btn-small"><span
													class="icon-thumbs-up icon-white"></span> Approve</a> <a
													href="" class="btn btn-small"><span
													class="icon-thumbs-down"></span> Reject</a>
											</p>
										</div></li>
									<li><img src="images/photos/thumb1.png" alt=""
										class="pull-left" />
										<div class="comment-info">
											<h4>
												<a href="">But I must explain to you how all this
													mistaken</a>
											</h4>
											<h5>
												in <a href="">At vero eos et accusamus et iusto odio
													dignissimos</a>
											</h5>
											<p>Temporibus autem quibusdam et aut officiis debitis aut
												rerum necessitatibus saepe eveniet ut et voluptates
												repudiandae sint et molestiae non recusandae.</p>
											<p>
												<a href="" class="btn btn-success btn-small"><span
													class="icon-thumbs-up icon-white"></span> Approve</a> <a
													href="" class="btn btn-small"><span
													class="icon-thumbs-down"></span> Reject</a>
											</p>
										</div></li>
									<li><img src="images/photos/thumb10.png" alt=""
										class="pull-left" />
										<div class="comment-info">
											<h4>
												<a href="">On the other hand, we denounce with righteous
													indignation</a>
											</h4>
											<h5>
												in <a href="">These cases are perfectly simple and easy
													to distinguish</a>
											</h5>
											<p>Nemo enim ipsam voluptatem quia voluptas sit
												aspernatur aut odit aut fugit, sed quia.</p>
											<p>
												<a href="" class="btn btn-success btn-small"><span
													class="icon-thumbs-up icon-white"></span> Approve</a> <a
													href="" class="btn btn-small"><span
													class="icon-thumbs-down"></span> Reject</a>
											</p>
										</div></li>
									<li><a href="">View More Comments</a></li>
								</ul>
							</div>

							<br />


						</div>
						<!--span8-->

						<div id="dashboard-right" class="span4">

							<h5 class="subtitle">Announcements</h5>

							<div class="divider15"></div>

							<div class="alert alert-block">
								<button data-dismiss="alert" class="close" type="button">&times;</button>
								<h4>Warning!</h4>
								<p style="margin: 8px 0">Best check yo self, you're not
									looking too good. Nulla vitae elit libero, a pharetra augue.
									Praesent commodo cursus magna.</p>
							</div>
							<!--alert-->

							<br />

							<h5 class="subtitle">Summaries</h5>

							<div class="divider15"></div>

							<div class="widgetbox">
								<div class="headtitle">
									<div class="btn-group">
										<button data-toggle="dropdown" class="btn dropdown-toggle">
											Action <span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="#">Action</a></li>
											<li><a href="#">Another action</a></li>
											<li><a href="#">Something else here</a></li>
											<li class="divider"></li>
											<li><a href="#">Separated link</a></li>
										</ul>
									</div>
									<h4 class="widgettitle">Widget Box</h4>
								</div>
								<div class="widgetcontent">Lorem ipsum dolor sit amet,
									consectetur adipisicing elit, sed do eiusmod tempor incididunt
									ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
									nostrud exercitation ullamco laboris nisi ut aliquip ex ea
									commodo consequat.</div>
								<!--widgetcontent-->
							</div>
							<!--widgetbox-->

							<h4 class="widgettitle">Event Calendar</h4>
							<div class="widgetcontent nopadding">
								<div id="datepicker"></div>
							</div>

							<div class="tabbedwidget tab-primary">
								<ul>
									<li><a href="#tabs-1"><span class="iconfa-user"></span></a></li>
									<li><a href="#tabs-2"><span class="iconfa-star"></span></a></li>
									<li><a href="#tabs-3"><span class="iconfa-comments"></span></a></li>
								</ul>
								<div id="tabs-1" class="nopadding">
									<h5 class="tabtitle">Last Logged In Users</h5>
									<ul class="userlist">
										<li>
											<div>
												<img src="images/photos/thumb1.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Draniem Daamul</h5>
													<span class="pos">Software Engineer</span> <span>Last
														Logged In: 04/20/2013 8:40PM</span>
												</div>
											</div>
										</li>
										<li>
											<div>
												<img src="images/photos/thumb2.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Therineka Chonpe</h5>
													<span class="pos">Regional Manager</span> <span>Last
														Logged In: 04/20/2013 3:30PM</span>
												</div>
											</div>
										</li>
										<li>
											<div>
												<img src="images/photos/thumb3.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Zaham Sindilmaca</h5>
													<span class="pos">Chief Technical Officer</span> <span>Last
														Logged In: 04/19/2013 1:30AM</span>
												</div>
											</div>
										</li>
										<li>
											<div>
												<img src="images/photos/thumb4.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Annie Cerona</h5>
													<span class="pos">Engineering Manager</span> <span>Last
														Logged In: 04/19/2013 11:30AM</span>
												</div>
											</div>
										</li>
										<li>
											<div>
												<img src="images/photos/thumb5.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Delher Carasbong</h5>
													<span class="pos">Software Engineer</span> <span>Last
														Logged In: 04/19/2013 11:00AM</span>
												</div>
											</div>
										</li>
									</ul>
								</div>
								<div id="tabs-2" class="nopadding">
									<h5 class="tabtitle">Favorites</h5>
									<ul class="userlist userlist-favorites">
										<li>
											<div>
												<img src="images/photos/thumb3.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Zaham Sindilmaca</h5>
													<p class="link">
														<a href=""><i class="iconfa-envelope"></i> Message</a> <a
															href=""><i class="iconfa-phone"></i> Call</a>
													</p>
												</div>
											</div>
										</li>
										<li>
											<div>
												<img src="images/photos/thumb4.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Annie Cerona</h5>
													<p class="link">
														<a href=""><i class="iconfa-envelope"></i> Message</a> <a
															href=""><i class="iconfa-phone"></i> Call</a>
													</p>
												</div>
											</div>
										</li>
										<li>
											<div>
												<img src="images/photos/thumb5.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Delher Carasbong</h5>
													<p class="link">
														<a href=""><i class="iconfa-envelope"></i> Message</a> <a
															href=""><i class="iconfa-phone"></i> Call</a>
													</p>
												</div>
											</div>
										</li>
										<li>
											<div>
												<img src="images/photos/thumb1.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Draniem Daamul</h5>
													<p class="link">
														<a href=""><i class="iconfa-envelope"></i> Message</a> <a
															href=""><i class="iconfa-phone"></i> Call</a>
													</p>
												</div>
											</div>
										</li>
										<li>
											<div>
												<img src="images/photos/thumb2.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Therineka Chonpe</h5>
													<p class="link">
														<a href=""><i class="iconfa-envelope"></i> Message</a> <a
															href=""><i class="iconfa-phone"></i> Call</a>
													</p>
												</div>
											</div>
										</li>
									</ul>
								</div>
								<div id="tabs-3" class="nopadding">
									<h5 class="tabtitle">Top Comments</h5>
									<ul class="userlist">
										<li>
											<div>
												<img src="images/photos/thumb4.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Annie Cerona</h5>
													<p class="par">Lorem ipsum dolor sit amet, consectetur
														adipisicing elit, sed do eiusmod tempor incididun</p>
												</div>
											</div>
										</li>
										<li>
											<div>
												<img src="images/photos/thumb5.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Delher Carasbong</h5>
													<p class="par">Lorem ipsum dolor sit amet, consectetur
														adipisicing elit, sed do eiusmod tempor incididun</p>
												</div>
											</div>
										</li>
										<li>
											<div>
												<img src="images/photos/thumb1.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Draniem Daamul</h5>
													<p class="par">Lorem ipsum dolor sit amet, consectetur
														adipisicing elit, sed do eiusmod tempor incididun</p>
												</div>
											</div>
										</li>
										<li>
											<div>
												<img src="images/photos/thumb2.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Therineka Chonpe</h5>
													<p class="par">Lorem ipsum dolor sit amet, consectetur
														adipisicing elit, sed do eiusmod tempor incididun</p>
												</div>
											</div>
										</li>
										<li>
											<div>
												<img src="images/photos/thumb3.png" alt="" class="pull-left" />
												<div class="uinfo">
													<h5>Zaham Sindilmaca</h5>
													<p class="par">Lorem ipsum dolor sit amet, consectetur
														adipisicing elit, sed do eiusmod tempor incididun</p>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<!--tabbedwidget-->

							<br />

						</div>
						<!--span4-->
					</div>
					<!--row-fluid-->

					<div class="footer">
						<div class="footer-left">
							<span>&copy; 2013. Shamcey Admin Template. All Rights
								Reserved.</span>
						</div>
						<div class="footer-right">
							<span>Designed by: <a href="http://themepixels.com/">ThemePixels</a></span>
						</div>
					</div>
					<!--footer-->

				</div>
				<!--maincontentinner-->
			</div>
			<!--maincontent-->

		</div>
		<!--rightpanel-->

	</div>
	<!--mainwrapper-->
	<script type="text/javascript">
		jQuery(document)
				.ready(
						function() {

							// simple chart
							var flash = [ [ 0, 11 ], [ 1, 9 ], [ 2, 12 ],
									[ 3, 8 ], [ 4, 7 ], [ 5, 3 ], [ 6, 1 ] ];
							var html5 = [ [ 0, 5 ], [ 1, 4 ], [ 2, 4 ],
									[ 3, 1 ], [ 4, 9 ], [ 5, 10 ], [ 6, 13 ] ];
							var css3 = [ [ 0, 6 ], [ 1, 1 ], [ 2, 9 ],
									[ 3, 12 ], [ 4, 10 ], [ 5, 12 ], [ 6, 11 ] ];

							function showTooltip(x, y, contents) {
								jQuery(
										'<div id="tooltip" class="tooltipflot">'
												+ contents + '</div>').css({
									position : 'absolute',
									display : 'none',
									top : y + 5,
									left : x + 5
								}).appendTo("body").fadeIn(200);
							}

							var plot = jQuery.plot(jQuery("#chartplace"), [ {
								data : flash,
								label : "Flash(x)",
								color : "#6fad04"
							}, {
								data : html5,
								label : "HTML5(x)",
								color : "#06c"
							}, {
								data : css3,
								label : "CSS3",
								color : "#666"
							} ], {
								series : {
									lines : {
										show : true,
										fill : true,
										fillColor : {
											colors : [ {
												opacity : 0.05
											}, {
												opacity : 0.15
											} ]
										}
									},
									points : {
										show : true
									}
								},
								legend : {
									position : 'nw'
								},
								grid : {
									hoverable : true,
									clickable : true,
									borderColor : '#666',
									borderWidth : 2,
									labelMargin : 10
								},
								yaxis : {
									min : 0,
									max : 15
								}
							});

							var previousPoint = null;
							jQuery("#chartplace")
									.bind(
											"plothover",
											function(event, pos, item) {
												jQuery("#x").text(
														pos.x.toFixed(2));
												jQuery("#y").text(
														pos.y.toFixed(2));

												if (item) {
													if (previousPoint != item.dataIndex) {
														previousPoint = item.dataIndex;

														jQuery("#tooltip")
																.remove();
														var x = item.datapoint[0]
																.toFixed(2), y = item.datapoint[1]
																.toFixed(2);

														showTooltip(
																item.pageX,
																item.pageY,
																item.series.label
																		+ " of "
																		+ x
																		+ " = "
																		+ y);
													}

												} else {
													jQuery("#tooltip").remove();
													previousPoint = null;
												}

											});

							jQuery("#chartplace").bind(
									"plotclick",
									function(event, pos, item) {
										if (item) {
											jQuery("#clickdata").text(
													"You clicked point "
															+ item.dataIndex
															+ " in "
															+ item.series.label
															+ ".");
											plot.highlight(item.series,
													item.datapoint);
										}
									});

							//datepicker
							jQuery('#datepicker').datepicker();

							// tabbed widget
							jQuery('.tabbedwidget').tabs();

						});
	</script>
</body>
</html>

