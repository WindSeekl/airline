<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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

		<div class="header">
			<div class="headerinner">
				<ul class="headmenu">
					<li class="right">
						<div class="userloggedinfo">
												<div class="userinfo">
								<h5>
									<s:property value="#session.currentAdmin.username" /> <small>
									<s:if test="#session.currentAdmin.jurisdiction==1">
									普通管理员</s:if>
									<s:else>高级管理员</s:else></small>
								</h5>
								<ul>
									<li><a href="login.jsp">注销</a></li>
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
							<li><a href="addcustomer.jsp">增加客户信息</a></li>
							<li><a href="../BgfindAllUser.action">查询客户信息</a></li>
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
							<li><a href="../findCompanyFlightAction.action">增加航班信息</a></li>
							<li><a href="addflightschedule.jsp">增加航班计划</a></li>
							<li><a href="../addscheduleFlightAction.action">安排航班计划</a></li>
							<li><a href="../findpastscheduleFlightAction.action">以往航班计划</a></li>
							<li><a href="../bgfindAllFlightAction.action">查询航班信息</a></li>
						</ul></li>
					<li class="dropdown"><a href=""><span
							class=" iconfa-group"></span> 航空公司管理</a>
						<ul>
							<li><a href="addcompany.jsp">增加航空公司</a></li>
							<li><a href="../showplanemodelCompanyAction.action">添加公司机型</a>
							<li><a href="../findCompanyAction.action">查询航空公司</a></li>
						</ul></li>
							<li class="dropdown"><a href=""><span
							class="iconfa-plane"></span> 机型管理</a>
						<ul>
							<li><a href="addplanemodel.jsp">增加机型</a></li>
							<li><a href="../findPlaneModelAction.action">查询机型</a></li>
						</ul></li>	
					<li><a href="printtable.jsp"><span class="iconfa-th-list"></span>
							报表打印管理</a></li>
					<s:if test="#session.currentAdmin.jurisdiction==0">
					<li class="dropdown"><a href=""><span class="iconfa-user"></span>
							人员用户管理</a>
						<ul>
							<li><a href="addnormaladmin.jsp">增加普通管理员</a></li>
							<li><a href="../findAllAdmin.action">查询普通管理员</a></li>
						</ul></li></s:if>
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
					<h1>订单审核</h1>
				</div>
			</div>
			<!--pageheader-->

			<div class="maincontent">
				<div class="maincontentinner">

						<h4 class="widgettitle">待处理订单</h4>
						<table id="dyntable" class="table table-bordered responsive">
							<colgroup>
								<col class="con0" style="align: center; width: 4%" />
								<col class="con1" />
								<col class="con0" />
								<col class="con1" />
								<col class="con0" />
								<col class="con1" />
								<col class="con0" />
								<col class="con1" />
								<col class="con0" />
								<col class="con1" />
							</colgroup>
							<thead>
								<tr>
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
								<tr class="gradeX">
									<td class="aligncenter"><span class="center"> <input
											type="checkbox" />
									</span></td>
									<td class="center"><s:property value="orderId"/> </td>
									<td class="center"><s:property value="customer.username"/></td>
									<td class="center"><s:property value="flightNumber"/></td>
									<td class="center"><s:property value="startPoint"/></td>
									<td class="center"><s:property value="endPoint"/></td>
									<td class="center"><s:date format="yyyy-MM-dd HH:mm:ss" name="startTime"/></td>
									<td class="center"><s:date format="yyyy-MM-dd HH:mm:ss" name="startTime"/></td>
									<td class="center"><s:property value="name"/></td>
									<td class="center"><s:property value="phoneNumber"/></td>
									<td class="center"><s:property value="identificationCard"/></td>
									<td class="center">￥<s:property value="price"/></td>
									<td class="centeralign"><a href="../dealWaiteOrderAction?orderId=<s:property value="orderId"/>&property=1">
									<span class="iconfa-check"></span></a>
									&nbsp;
									<a href="../dealWaiteOrderAction?orderId=<s:property value="orderId"/>&property=0">
									<span class="iconfa-remove-sign"></span></a>
									
									</td>				
								</tr>
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

</body>
</html>
