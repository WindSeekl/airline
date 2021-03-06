<%@ page language="java"
	import="java.util.*,com.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>航空订票系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
<meta name="keywords" content="航空订票系统">
<meta name="description"
	content="航空订票系统">
<meta name="baidu-site-verification" content="IOgz6fICIe">
<link rel="shortcut icon"
	href="http://easternmiles.ceair.com/favicon.ico">
<link rel="stylesheet" type="text/css" href="Stylesheets/index.css">
<link rel="stylesheet" type="text/css" href="Stylesheets/myceair.css">
<link rel="stylesheet" type="text/css"
	href="Stylesheets/customerinfo.css">
<link rel="stylesheet" type="text/css" href="Stylesheets/ordershow.css">
<link rel="stylesheet" type="text/css"
	href="Stylesheets/ordershowdetail.css">
<script type="text/javascript"
	src="Script/My97DatePicker/WdatePicker.js"></script>
	<script src="Script/jquery-1.8.3.min.js"></script>
</head>

<body>
	<!--header-->
	<header id="header"> <hgroup>
	<c:if test="${not empty customer}">
		    <address class="text blue">
		    	<p>欢迎您，${customer}&nbsp;&nbsp;<a href="<%=basePath%>logout">注销</a> </p>
		    </address>
		    </c:if>
		    <c:if test="${empty customer}">
			    <address class="text blue">
			   		<p> <a id="login" href="login.jsp">登录</a>&nbsp; | &nbsp; <a id="register" target="_blank" href="regcustomer.jsp">注册</a></p>
			    </address>
		    </c:if>
	<div class="clear"></div>
	</hgroup> </header>
	<!--end header-->

	<!--menu-->
	<menu id="menu">
		<nav style="margin-top: -12;">
		<ul class="menu_index">
			<a href="customer/customerinfo.jsp"><li id="menu-myceair"
				class="current">我的信息<i></i></li></a>
			<a href="index.jsp"><li id="menu-booking">预订行程<i></i></li></a>
		</ul>
		</nav>
	</menu>
	<!--end content-->

	<!-- 第一个下拉菜单 -->
	<section class="menu-dropdown" id="dropdown-booking" style="height:540px;"> 
	<hgroup id="booking" style="min-height:410px;" margin:0 auto; > 
	<article id="tabTicket" class="b_content block">
	<div id="main-area" style="min-height: 520px">
		<div class="position gray">
			您的位置：<a href="index.jsp">首页</a> &gt;
			<h1>我的东航</h1>
		</div>
		<div class="myceair">
			<div class="left">
				<div class="home"></div>
				<div class="menu font14 bold m1">
					<a href="customer/customerinfo.jsp">个人信息</a>
				</div>

				<div class="menu font14 bold m2">
					<a href="order/ordershow.jsp">机票订单</a>
				</div>
				<div class="child"></div>
				<div class="menu font14 bold m9">
					<a href="customer/editcustomerpassword.jsp">更改密码</a>
				</div>
			</div>
			<div class="right" style="padding-left: 0px;">
				<div class="personal_info" id="switch">
					<div class="body">
						<article class="dataList noborder"> <mark
							class="icon shadowLeft"></mark> <mark class="icon shadowRight"></mark>
						<ul class="passengerHead">
							<li class="name">乘机人</li>
							<li index="0" title="${reserveDetail.userName}" class="active">
							<mark class="icon male">
							</mark><br></li>
							
						</ul>
						<div class="detail">
							<div class="basic" style="">
								<div class="text" id="data">
										<dl>
											<dt>证件类型</dt>
											<dd>身份证</dd>
											<dt>手机号码</dt>
											<dd>${reserveDetail.phoneNum }</dd>
										</dl>
										<dl>
											<dt>证件号码</dt>
											<dd>${reserveDetail.cardId}</dd>
										</dl>
								</div>
								<div class="jiage" style="margin-top:-25px">
									<p>
										<mark class="icon personalPrice"></mark>
										<span class="price normal red">￥${reserveDetail.money+20+120}<s:property value="#session.order.price+20+120"/></span>
									</p>
									<p>
										<u>机票<br>￥${reserveDetail.money}
										</u><u insureprice="20">保险<br>￥ 20
										</u><u>税费<br>￥ 120
										</u>
									</p>
								</div>
								<div class="clear"></div>
							</div>
							<section class="travelSection" style="">
							<div class="box" name="AIR" style="margin-rigth:25px;">
								<div class="body" style="margin-top:1px;">
									<div class="flight">
										<dl class="f1">
											航空公司：${companyName}
											<br>航&nbsp;班&nbsp;号&nbsp;：${reserveDetail.flightId}
											<br>舱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：${reserveDetail.seatId}
										</dl>
										<dl class="f2" style="margin-top: -10px">
											<dt>
												<div style="margin-top: 50px;font-size: 25px;color: black;">${reserveDetail.benginSite}</div>
											</dt>
											<dt class="time">
											<a style="color: #5AA5F0">${reserveDetail.benginDate}(出发)</a>
												<mark class="icon owBig"></mark>
											<a style="color: #5AA5F0">${reserveDetail.endDate}(抵达)</a>
											</dt>
											
											<dt class="l">
												<div style="margin-top: 50px;font-size: 25px;color: black;">${reserveDetail.endSite}</div>
											</dt>
										</dl>
										<div class="clear"></div>
									</div>

								</div>
							</div>
							</section>
						
						</div>
						<div class="clear"></div>
						</article>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	</article> </hgroup></section>
	<div class="bottom_banner">
		<img src="http://pic.c-ctrip.com/vacation_v2/bottom_banner1.jpg"
			class="bottom_banner_l" alt="吉祥航空" width="353" height="111"><img
			src="http://pic.c-ctrip.com/vacation_v2/bottom_banner2.jpg"
			class="bottom_banner_m" alt="瑞士国际航空公司" width="280" height="111"><img
			src="http://pic.c-ctrip.com/vacation_v2/bottom_banner3.jpg"
			class="bottom_banner_r" alt="日本航空" width="356" height="111">
	</div>
</body>
</html>




