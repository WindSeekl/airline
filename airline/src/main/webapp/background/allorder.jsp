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
<script type="text/javascript" src="../Script/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../Script/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
<style type="text/css">
.checkbox {
	padding-left: 20px;
}

.checkbox .checker {
	float: left;
	padding-left: 10px;
}
</style>
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
			<div class="logo">
			</div>
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
					<li><a href="<%=basePath%>background/index.jsp"><span
							class="iconfa-laptop"></span> 首页</a></li>
					<li class="dropdown"><a href=""><span class="iconfa-group"></span>
							订票客户管理</a>
						<ul>
							<li><a href="<%=basePath%>background/addcustomer.jsp">增加客户信息</a></li>
							<li><a href="<%=basePath%>queryCustomers">查询客户信息</a></li>
						</ul>
					</li>
					<li class="dropdown active"><a href=""><span
							class="iconfa-pencil"></span> 航班机票管理</a>
						<ul style="display:block;">
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
				<li><a href="dashboard.jsp"><i class="iconfa-home"></i></a> <span
					class="separator"></span></li>
				<li>订票审核</li>
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
					<br>
					<h1>以往订单
					</h1>
				</div>
			</div>
			<!--pageheader-->

			<div class="maincontent">
			<div>
					<form action="../findTimeOrderAction.action" method="get">

							<div style="float: left;">
								<p style="float: left; padding-left: 25px;">
									
									<input type="text" id="d241" name="date1"
										onfocus="WdatePicker({maxDate:'%y-%M-{%d}',dateFmt:'yyyy-MM-dd'})"
										class="Wdate" style="width:200px"
										value="<s:date name="#session.flightSchedule.day" format="yyyy-MM-dd"/>" />
								</p>
							</div>
							<div style="float: left;"><p style="padding-top: 2px; padding-left: 20px;">----</p></div>
							<div style="float: left;">
								<p style="float: left; padding-left: 25px;">
									
									<input type="text" id="d241" name="date2"
										onfocus="WdatePicker({maxDate:'%y-%M-{%d}',dateFmt:'yyyy-MM-dd'})"
										class="Wdate" style="width:200px"
										value="<s:date name="#session.flightSchedule.day" format="yyyy-MM-dd"/>" />
								</p>
							</div>
							<div style="float: left; padding-top: 2px;">
								<p>
									<input type="submit" value="提交">
								</p>
							</div>
						</form>
						</div>
						<div style="clear: both;"></div>
				<div class="checkbox">
					<div style="float: left;">
						<input checked="checked" type="checkbox" id="four" name='VoteOption1' value=1>已退票<br>
					</div>
					<div style="float: left;">
						<input checked="checked" type="checkbox" id="five" name='VoteOption1' value=2>已失效<br>
					</div>
					<div style="float: left;">
						<input checked="checked" type="checkbox" id="six" name='VoteOption1' value=3>未通过审核
					</div>
					<div style="float: left;">
						<input checked="checked" type="checkbox" id="seven" name='VoteOption1' value=3>不符合退票规定
					</div>
					<div style="float: left;">
						<input checked="checked" type="checkbox" id="eight" name='VoteOption1' value=3>已完成
					</div>
				</div>
				<div class="maincontentinner">

					<h4 class="widgettitle">待处理订单</h4>
					<table id="dyntable" class="table table-bordered responsive" >

						<thead>
							<tr >
								<th class="head0 nosort"><input type="checkbox"
									class="checkall" /></th>
								<th class="head1 center">订单号</th>
								<th class="head0 center">客户名</th>
								<th class="head1 center">航班号</th>
								<th class="head0 center">起始地</th>
								<th class="head1 center">到达地</th>
								<th class="head0 center">起飞时间</th>
								<th class="head1 center">到达时间</th>
								<th class="head0 center">乘机人</th>
								<th class="head1 center">乘机人电话</th>
								<th class="head0 center">身份证</th>
								<th class="head1 center">价格</th>
								<th class="head0 center">状态</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#session.orderList">
							<s:if test="orderProperty==4">
								<tr class="gradeX orderFour">
									<td class="aligncenter"><span class="center"> <input
											type="checkbox" />
									</span></td>
									<td class="center" ><s:property value="orderId" /></td>
									<td class="center"><s:property value="customer.username" /></td>
									<td class="center"><s:property value="flightNumber" /></td>
									<td class="center"><s:property value="startPoint" /></td>
									<td class="center"><s:property value="endPoint" /></td>
									<td class="center"><s:date format="yyyy-MM-dd HH:mm:ss"
											name="startTime" /></td>
									<td class="center"><s:date format="yyyy-MM-dd HH:mm:ss"
											name="startTime" /></td>
									<td class="center"><s:property value="name" /></td>
									<td class="center"><s:property value="phoneNumber" /></td>
									<td class="center"><s:property value="identificationCard" /></td>
									<td class="center">￥<s:property value="price" /></td>
									<td class="centeralign">
									<s:if test="orderProperty==4">已退票</s:if>
									<s:if test="orderProperty==5">已失效</s:if>
									<s:if test="orderProperty==6">未通过审核</s:if>
									<s:if test="orderProperty==7">不符合退票规定</s:if>
									<s:if test="orderProperty==8">已完成</s:if>
									</td>
								</tr>
								</s:if>
								<s:if test="orderProperty==5">
								<tr class="gradeX orderFive" >
									<td class="aligncenter"><span class="center"> <input
											type="checkbox" />
									</span></td>
									<td class="center"><s:property value="orderId" /></td>
									<td class="center"><s:property value="customer.username" /></td>
									<td class="center"><s:property value="flightNumber" /></td>
									<td class="center"><s:property value="startPoint" /></td>
									<td class="center"><s:property value="endPoint" /></td>
									<td class="center"><s:date format="yyyy-MM-dd HH:mm:ss"
											name="startTime" /></td>
									<td class="center"><s:date format="yyyy-MM-dd HH:mm:ss"
											name="startTime" /></td>
									<td class="center"><s:property value="name" /></td>
									<td class="center"><s:property value="phoneNumber" /></td>
									<td class="center"><s:property value="identificationCard" /></td>
									<td class="center">￥<s:property value="price" /></td>
									<td class="centeralign">
									<s:if test="orderProperty==4">已退票</s:if>
									<s:if test="orderProperty==5">已失效</s:if>
									<s:if test="orderProperty==6">未通过审核</s:if>
									<s:if test="orderProperty==7">不符合退票规定</s:if>
									<s:if test="orderProperty==8">已完成</s:if>
									</td>
								</tr>
								</s:if>	
								<s:if test="orderProperty==6">
								<tr class="gradeX orderSix">
									<td class="aligncenter"><span class="center"> <input
											type="checkbox" />
									</span></td>
									<td class="center"><s:property value="orderId" /></td>
									<td class="center"><s:property value="customer.username" /></td>
									<td class="center"><s:property value="flightNumber" /></td>
									<td class="center"><s:property value="startPoint" /></td>
									<td class="center"><s:property value="endPoint" /></td>
									<td class="center"><s:date format="yyyy-MM-dd HH:mm:ss"
											name="startTime" /></td>
									<td class="center"><s:date format="yyyy-MM-dd HH:mm:ss"
											name="startTime" /></td>
									<td class="center"><s:property value="name" /></td>
									<td class="center"><s:property value="phoneNumber" /></td>
									<td class="center"><s:property value="identificationCard" /></td>
									<td class="center">￥<s:property value="price" /></td>
									<td class="centeralign">
									<s:if test="orderProperty==4">已退票</s:if>
									<s:if test="orderProperty==5">已失效</s:if>
									<s:if test="orderProperty==6">未通过审核</s:if>
									<s:if test="orderProperty==7">不符合退票规定</s:if>
									<s:if test="orderProperty==8">已完成</s:if>
									</td>
								</tr>
								</s:if>
								<s:if test="orderProperty==7">
								<tr class="gradeX orderSeven">
									<td class="aligncenter"><span class="center"> <input
											type="checkbox" />
									</span></td>
									<td class="center"><s:property value="orderId" /></td>
									<td class="center"><s:property value="customer.username" /></td>
									<td class="center"><s:property value="flightNumber" /></td>
									<td class="center"><s:property value="startPoint" /></td>
									<td class="center"><s:property value="endPoint" /></td>
									<td class="center"><s:date format="yyyy-MM-dd HH:mm:ss"
											name="startTime" /></td>
									<td class="center"><s:date format="yyyy-MM-dd HH:mm:ss"
											name="startTime" /></td>
									<td class="center"><s:property value="name" /></td>
									<td class="center"><s:property value="phoneNumber" /></td>
									<td class="center"><s:property value="identificationCard" /></td>
									<td class="center">￥<s:property value="price" /></td>
									<td class="centeralign">
									<s:if test="orderProperty==4">已退票</s:if>
									<s:if test="orderProperty==5">已失效</s:if>
									<s:if test="orderProperty==6">未通过审核</s:if>
									<s:if test="orderProperty==7">不符合退票规定</s:if>
									<s:if test="orderProperty==8">已完成</s:if>
									</td>
								</tr>
								</s:if>	

								<s:if test="orderProperty==8">
								<tr class="gradeX orderEight">
									<td class="aligncenter"><span class="center"> <input
											type="checkbox" />
									</span></td>
									<td class="center"><s:property value="orderId" /></td>
									<td class="center"><s:property value="customer.username" /></td>
									<td class="center"><s:property value="flightNumber" /></td>
									<td class="center"><s:property value="startPoint" /></td>
									<td class="center"><s:property value="endPoint" /></td>
									<td class="center"><s:date format="yyyy-MM-dd HH:mm:ss"
											name="startTime" /></td>
									<td class="center"><s:date format="yyyy-MM-dd HH:mm:ss"
											name="startTime" /></td>
									<td class="center"><s:property value="name" /></td>
									<td class="center"><s:property value="phoneNumber" /></td>
									<td class="center"><s:property value="identificationCard" /></td>
									<td class="center">￥<s:property value="price" /></td>
									<td class="centeralign">
									<s:if test="orderProperty==4">已退票</s:if>
									<s:if test="orderProperty==5">已失效</s:if>
									<s:if test="orderProperty==6">未通过审核</s:if>
									<s:if test="orderProperty==7">不符合退票规定</s:if>
									<s:if test="orderProperty==8">已完成</s:if>
									</td>
								</tr>
								</s:if>
							</s:iterator>
						</tbody>
					</table>

				</div>
				<!--maincontentinner-->
			</div>
			<!--maincontent-->

		</div>
		<!--rightpanel-->

	</div>
	<!--mainwrapper-->
	<script type="text/javascript">
		$("#four").click(function() {
			var $cr = $("#four");
			if ($cr.is(":checked")) {
				$(".orderFour").css("display", "table-row");
			} else {
				$(".orderFour").css("display", "none");
			}
		});
		$("#five").click(function() {
			var $cr = $("#five");
			if ($cr.is(":checked")) {
				$(".orderFive").css("display", "table-row");
			} else {
				$(".orderFive").css("display", "none");
			}
		});
		$("#six").click(function() {
			var $cr = $("#six");
			if ($cr.is(":checked")) {
				$(".orderSix").css("display", "table-row");
			} else {
				$(".orderSix").css("display", "none");
			}
		});
		$("#seven").click(function() {
			var $cr = $("#seven");
			if ($cr.is(":checked")) {
				$(".orderSeven").css("display", "table-row");
			} else {
				$(".orderSeven").css("display", "none");
			}
		});
		$("#eight").click(function() {
			var $cr = $("#eight");
			if ($cr.is(":checked")) {
				$(".orderEight").css("display", "table-row");
			} else {
				$(".orderEight").css("display", "none");
			}
		});
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
</body>
</html>

