<%@ page language="java" pageEncoding="UTF-8"%>
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
<title>个人信息</title>
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
<link rel="stylesheet" type="text/css" href="Stylesheets/mystyle.css">
<link rel="stylesheet" type="text/css" href="Stylesheets/myceair.css">
<link rel="stylesheet" type="text/css"
	href="Stylesheets/customerinfo.css">

</head>

<body>
	<!--header-->
	<header id="header"> <hgroup>
	<h2>

	</h2>
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
		<nav>
		<ul class="menu_index">
			<a href="customer/customerinfo.jsp"><li id="menu-myceair" class="current">我的信息<i></i></li></a>
			<a href="index.jsp"><li id="menu-booking">预订行程<i></i></li></a>

		</ul>
		</nav>
	</menu>
	<!--end content-->

	<!-- 第一个下拉菜单 -->
	<section class="menu-dropdown" id="dropdown-booking"
		style="display: block; height:320px "> <hgroup id="booking">

	<article id="tabTicket" class="b_content block">
	<div id="main-area">
		<div class="position gray">
			您的位置：<a href="/index.jsp">首页</a> &gt;
			<h1>我的东航</h1>
		</div>
		<div class="myceair">
			<div class="left">
				<div class="home"></div>

				<div class="menu font14 bold m1">
					<a href="customer/customerinfo.jsp">个人信息</a>
				</div>

				<div class="menu font14 bold m2"><a href="<%=basePath%>order/ordershow.jsp">机票订单</a></div>
				<div class="child">
				</div>
				<div class="menu font14 bold m9">
					<a href="customer/editcustomerpassword.jsp">更改密码</a>
				</div>
				<script src="/resource2/js/myceair/j.tools.js"></script>
			</div>
			<div class="right">
				<div class="personal_info" id="switch">
					<div class="body">
						<div class="b_content active" rel="tab1">

							<div class="name">
								<b class="blue bold">基本信息</b> <span class="gray block"><a
									href="customer/editcustomerinfo.jsp">编辑</a></span>
							</div>
							<div class="row">
								<div class="col1">用户名：</div>
								<div class="col2 blue">${loginInfo.customerName}&nbsp;</div>
								<div class="col1">积分：</div>
								<div class="col2 blue">${loginInfo.integral}&nbsp;</div>
							</div>
							<div class="row">
								<div class="col1">性别：</div>
								<div class="col2 blue">
									${loginInfo.sex}
									&nbsp;
								</div>
								<div class="col1">注册时间：</div>
								<div class="col2 blue">${loginInfo.registerTime} &nbsp;</div>
							</div>
							<div class="row">
								<div class="col1">真实姓名：</div>
								<div class="col2 blue">${loginInfo.realName }&nbsp;</div>
								<div class="col1">账户类型：</div>
								<div class="col2 blue">
								<c:if test="${loginInfo.integral < 5000}">
									普通用户
								</c:if>
								<c:if test="${loginInfo.integral >= 5000 and loginInfo.integral < 10000}">
									铜牌用户
								</c:if>
								<c:if test="${loginInfo.integral >= 10000 and loginInfo.integral < 80000}">
									银牌用户
								</c:if>
								<c:if test="${loginInfo.integral >= 80000}">
									金牌用户
								</c:if>
									&nbsp;

								</div>
							</div>
							<div class="row">
								<div class="col1">身份证号：</div>
								<div class="col2 blue">${loginInfo.IDNumber }&nbsp;</div>
							</div>
							<div class="clear"></div>
							<div class="name">
								<b class="blue bold">联系信息</b> <span class="gray block"></span>
							</div>
							<div class="row">
								<div class="col1">手机号码：</div>
								<div class="col2 blue">${loginInfo.phone }&nbsp;</div>
								<div class="col1">邮件地址：</div>
								<div class="col2 blue">${loginInfo.email }&nbsp;</div>
							</div>
							<div class="clear"></div>
							<div class="line"></div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	</article> </hgroup> </section>
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
