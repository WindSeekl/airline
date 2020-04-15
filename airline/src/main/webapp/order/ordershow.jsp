<%@ page language="java"
	import="java.util.*,com.*"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript"
	src="Script/My97DatePicker/WdatePicker.js"></script>
<script src="Script/jquery-1.8.3.min.js"></script>
</head>

<body>
	<!--header-->
	<header id="header"> <hgroup>
		<address class="text blue">
			<p>欢迎您，${currentUser.username}&nbsp;&nbsp;<a href="login.jsp">注销</a></p>
		</address>
		<address class="text blue">
			<p>
				<a id="login" href="login.jsp">登录</a>&nbsp; | &nbsp; <a
					id="register" target="_blank" href="regcustomer.jsp">注册</a>
			</p>
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
					
						<div class="b_content active" >

							<fieldset class="searchForm">
								<form name="formSearch" action="#" id="querybyID" method="get">
									<p>
										<span>* 初始查询结果仅向您显示7天内的信息</span>
									</p>
									<dl>
										<dt class="normal">
											<div class="optional">
												<h4 style="padding-left:10px;">
													<font>订单号</font>
													<mark class="icon triDown"></mark>
												</h4>
											</div>
											<input style="width: 300px;" type="text" name="exactQuery" id = "orderid"
												class="input" value="" cond="pnrNo" maxlength="6"> <input
												type="hidden" name="orderType" value="01">
										</dt>
										<dd>
											<input type=button name="search" class="button-search" id="button-search"
												value="查 询" style="height:34px;">
										</dd>
									</dl>
									<br>
									<dl class="advance" style="display: block;">
										<dt>								
											预订日期 <input type="date" class="input date Wdate"  id="date"
												onfocus="WdatePicker()"> 
												<input type="button" value="查询"  id="orderdate">
										</dt>
									</dl>
									<mark id="oldOrderSearch"
										onclick="javascript:location.href='http://easternmiles.ceair.com/myceair/old_order.html';">
									<a href="http://easternmiles.ceair.com/myceair/old_order.html"></a></mark>
								</form>
							</fieldset>

							<article class="dataList"> <mark
								class="icon shadowLeft"></mark> <mark class="icon shadowRight"></mark>
							<ul class="head"
								style="margin-left:-5px; width: 742px; margin-top: 8px;">
								<li class="c1" style="width: 140px; margin-top: 8px;">订单</li>
								<li class="c2" style="width: 220px; margin-top: 8px;">航班信息</li>
								<li class="c3" style="width: 80px; margin-top: 8px;">乘机人</li>
								<li class="c4"
									style=" text-align:center; width: 100px; margin-top: 8px;">总价</li>
								<li class="c5" style="width: 100px; margin-top: 8px;">订单状态</li>
								<li class="c6" style="width: 100px; margin-top: 8px;">操作</li>
								<div class="clear"></div>
							</ul>
							<ul id="data">
								
							</ul>
							
							</article>
						</div>
					<div style="margin-top:20px; float: right;">
                           <a href="#" /> 上一页</a>
                           <a href="#" />下一页</a>
                     </div>
				</div>
			</div>
		</div>
		 
		 			 <div class="bottom_banner" style="z-index:-10; margin-left: -20;">
		<img src="http://pic.c-ctrip.com/vacation_v2/bottom_banner1.jpg"
			class="bottom_banner_l" alt="吉祥航空" width="353" height="111"><img
			src="http://pic.c-ctrip.com/vacation_v2/bottom_banner2.jpg"
			class="bottom_banner_m" alt="瑞士国际航空公司" width="280" height="111"><img
			src="http://pic.c-ctrip.com/vacation_v2/bottom_banner3.jpg"
			class="bottom_banner_r" alt="日本航空" width="356" height="111">
	</div>

	</div>

</section> 
<script type="text/javascript">
$("#button-search").click(function(){
	var id = $("#orderid").val();
	querybyID()
});
$("#orderdate").click(function(){
	var date = $("#date").val();
	window.location='findByDateOrderAction.action?date='+date;
});
function pay(id) {
	var conf = confirm('确认付款！');
	if(conf) {
		window.location='paymentOrderAction.action?orderId='+id;
	}
}bounce
function cancel(id) {
	var conf = confirm('取消订单');
	if(conf) {
		window.location='cancelOrderAction.action?orderId='+id;
	}
}
function bounce(id) {
	var conf = confirm('确定退票');
	if(conf) {
		window.location='bounceOrderAction.action?orderId='+id;
	}
}
function querybyID(){
		$.ajax({
		url:"../queryOrder",
		data:null,
		type:"post",
		dataType:"json",
		success:function(data){
			console.log(data);
			for ( var i in data) {
				var html="<ul name='orderInfo'>";
					html += "<li class='c1'>订单Id："+data[i].reserveId+"<br/> ";
					html += "<br> ";
					html += "下单时间:"+data[i].orderDate+"<br/>";
					html += "<br>"; 
					html += "<a class='blue' name='orderNo' target='_blank' href='/order/ordershowdetail.jsp'>";
					html += "查看订单详情></a>";
					html += "</li>";
					html += "<li class='c2' style='width: 220px;'>";
					html += "<b title='白云机场 -虹桥机场 T2'> ";
					html += "<br/>";
					html += "<span class='airport'>";
					html += "&nbsp;";
					html += "</span>";
					html += ""+data[i].benginSite+" --"+data[i].endSite+"<br/>";
					html += "<span class='airport'>";
					html += "&nbsp;";	
					html += "</span>";
					html += "</b>";
					html += ""+data[i].benginDate+"<br/>-<br/>"+data[i].endDate+"";  
					html += "<li class='c3'";
					html += "style='width:80px; padding-top:35px; padding-bottom: 44px; border-right: 1px #ccc solid;'>";
					html += "<span>"+data[i].userName+"</span>";
					html += "</li>";
					html += "<li class='c4' style='width:80px; padding-top:35px; padding-bottom: 44px; text-align: center; border-right: 1px #ccc solid;'>";
					html += "<span class='red'>"+data[i].money+"￥ </span>";
					html += "<aside class='tips long' name='INSTips' style='top: -64px; opacity: 0; display: none;'>";
					html += "<p></p>";
					html += "<mark class='icon boxTri'></mark> </aside>";
					html += "</li>";
					html += "<li class='c5' style='border-right: 1px #ccc solid; padding-top:35px; padding-bottom: 44px;'><br/>";
					html += ""+data[i].state+"";
					html += "</li>";
					html += "<li class='c6 tall' style='width:90px;  padding-bottom: 44px; padding-top: 35px;'>";
					html += "<a href='#'>付款</a>";
					html += "<br/>";
					html += "<a href='#'>取消订单</a>";
					html += "<br/>";
					html += "<a href='#'>申请退票</a>";
					html += "</li>";
					html += "<div class='clear'></div>";
					html += "</ul>";
					$("#data").append(html);
					
			}
		}
	})
}
</script>


</body>
</html>



