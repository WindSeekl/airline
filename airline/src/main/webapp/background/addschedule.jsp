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
<link rel="stylesheet" href="<%=basePath %>background/css/style.default.css" type="text/css" />

<link rel="stylesheet" href="<%=basePath %>background/css/responsive-tables.css">
<script type="text/javascript" src="<%=basePath %>background/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/jquery-ui-1.9.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/modernizr.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/jquery.uniform.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/flot/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/responsive-tables.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/custom.js"></script>
<script type="text/javascript" src="<%=basePath %>Script/My97DatePicker/WdatePicker.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
<script type="text/javascript">
	jQuery(document).ready(function() {
		// dynamic table
		jQuery('#dyntable').dataTable({
			"sPaginationType" : "full_numbers",
			"aaSortingFixed" : [ [ 0, 'asc' ] ],
			"fnDrawCallback" : function(oSettings) {
				jQuery.uniform.update();
			}
		});
		jQuery('#dyntable1').dataTable({
			"sPaginationType" : "full_numbers",
			"aaSortingFixed" : [ [ 0, 'asc' ] ],
			"fnDrawCallback" : function(oSettings) {
				jQuery.uniform.update();
			}
		});

	});
</script>
</head>

<body>

	<div class="mainwrapper">

		<div class="header">
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
					<li class="active"><a href="../countOrderAction.action"><span
							class="iconfa-laptop"></span> 首页</a></li>
					<li class="dropdown"><a href=""><span class="iconfa-group"></span>
							订票客户管理</a>
						<ul>
							<li><a href="<%=basePath%>background/addcustomer.jsp">增加客户信息</a></li>
							<li><a href="<%=basePath%>queryCustomers">查询客户信息</a></li>
						</ul></li>
					<li class="dropdown"><a href=""><span
							class="iconfa-pencil"></span> 航班机票管理</a>
						<ul>
							<li><a href="../findwaiteOrderAction.action">订票审核</a></li>
							<li><a href="../findbounceOrderAction.action">退票管理</a></li>
							<li><a href="../findAllUserAllOrderAction.action">其他订单信息管理</a></li>
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
							<li><a href="<%=basePath %>getCompanyInfo">修改航空公司信息</a></li>
						</ul></li>
							<li class="dropdown"><a href=""><span
							class="iconfa-plane"></span> 机型管理</a>
						<ul>
							<li><a href="<%=basePath %>background/addplanemodel.jsp">增加机型</a></li>
							<li><a href="<%=basePath %>queryList">查询机型</a></li>
							<li><a href="<%=basePath %>queryPlanemodel">修改机型信息</a></li>
						</ul></li>	
					<li><a href="printtable.jsp"><span class="iconfa-th-list"></span>
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
				<li>增加航空公司</li>
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
				<div class="pageicon">
					<span class="iconfa-laptop"></span>
				</div>
				<div class="pagetitle">
					<h1>
						<form action="<%=basePath %>setScheduleInfo" method="get">
							<div style="float: left;">
								<p>
									<label>出发地：</label> <input id="deptCd" style="width:200px"
										name="beginSite" type="text" onKeyUp="input_keyup();"
										onClick="append_city(this.id);" onBlur="input_blur()">
								</p style="float: left;"/>
							</div>
							<div style="float: left;">
								<p>
									<label>目的地：</label> <input id="arrDd" style="width:200px"
										name="endSite" type="text" onKeyUp="input_keyup();"
										onClick="append_city(this.id);" onBlur="input_blur()"/>
								</p>
							</div>
							<div style="float: left;">
								<p style="float: left;">
									<label>时间:</label> <input type="text" id="d241" name="fsDate"
										onfocus="WdatePicker({minDate:'%y-%M-{%d}',dateFmt:'yyyy-MM-dd'})"
										class="Wdate" style="width:200px"  format="yyyy-MM-dd"/>
								</p>
							</div>
							<div style="float: left; padding-top: 22px;">
								<p>
									<input type="submit" value="提交">
								</p>
							</div>
						</form>
					</h1>

				</div>
			</div>
			<!--pageheader-->
			<div class="maincontent">
				<div class="maincontentinner">
					<h4 class="widgettitle">已经添加的航班</h4>
					<c:if test="${empty accordFlightList}">
						<center><h4>未获取到已添加的航班信息</h4></center>
					</c:if>
					<c:if test="${not empty accordFlightList}">
					<table class="table table-bordered responsive" id="dyntable">
						<thead>
							<tr>
								<th class="centeralign"></th>
								<th>航班号</th>
								<th>出发地</th>
								<th>目的地</th>
								<th>出发时间</th>
								<th>到达时间</th>
								<th>航空公司</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach var="flight" items="${accordFlightList}">
								<tr>
									<td class="centeralign"></td>
									<td>${flight.flightNo}</td>
									<td>${flight.beginSite}</td>
									<td>${flight.endSite}</td>
									<td>${flight.beginTime}</td>
									<td>${flight.endTime}</td>
									<td>${flight.companyName}</td>
									<td>
										<a href="<%=basePath%>deleteScheduleInfo?flightNo=${flight.flightNo}">移除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</c:if>
				</div>
			</div>
			<div class="maincontent">
				<div class="maincontentinner">
					<h4 class="widgettitle">可以添加的航班</h4>
					<c:if test="${empty notAccordFlightList}">
						<center><h4>未获取到可添加的航班信息</h4></center>
					</c:if>
					<c:if test="${not empty notAccordFlightList}">
					<table class="table table-bordered responsive" id="dyntable1">
						<thead>
							<tr>
								<th class="centeralign"></th>
								<th>航班号</th>
								<th>出发地</th>
								<th>目的地</th>
								<th>出发时间</th>
								<th>到达时间</th>
								<th>航空公司</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="flight" items="${notAccordFlightList}">
								<tr>
									<td class="centeralign"></td>
									<td>${flight.flightNo}</td>
									<td>${flight.beginSite}</td>
									<td>${flight.endSite}</td>
									<td>${flight.beginTime}</td>
									<td>${flight.endTime}</td>
									<td>${flight.companyName}</td>
									<td>
										<a href="<%=basePath%>insertScheduleInfo?flightscheduleId=${flightscheduleId}&flightNo=${flight.flightNo}">添加</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</c:if>
				</div>
			</div>
			<!--maincontent-->

		</div>
		<!--rightpanel-->
	</div>
</body>
</html>

