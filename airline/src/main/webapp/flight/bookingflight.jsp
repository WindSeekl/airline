<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>航空订票系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link type="text/css" href="Stylesheets/public.css" rel="stylesheet">
<script src="Script/jquery-1.8.3.min.js"></script>
<script src="Script/cities.js" type="text/javascript"></script>
<script src="Script/jquery.validate.js" type="text/javascript"></script>
<link rel="stylesheet" href="Stylesheets/global.css">
<link type="text/css" href="Stylesheets/selectinfo.css" rel="stylesheet">
<link type="text/css" href="Stylesheets/booking_new.css" rel="stylesheet">
<style type="text/css">
.L_title {
	text-align: center;
	font-size: 22px;
	font-weight: bold;
	color: #1D1F92;
	height: 40px;
	line-height: 40px;
	border-bottom: #cccccc solid 1px;
	margin: 10px;
}

</style>
</head>
<body>
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
	<menu id="menu">
		<nav>
		<ul class="menu_index">
			<li id="menu-home"><a href="index.jsp">首页</a> <i></i>
			</li>
			<li id="menu-myceair"><a href="<%=basePath%>customerinfo?customerName=${customer}"><li id="menu-myceair">我的信息<i></i></li></a>
				<i></i></li>
			<li id="menu-booking" class="current">
					<a href="index.jsp">预订行程</a>
					<i></i>
				</li>
		</ul>
		</nav>
	</menu>

	<section id="main-area"> <article class="position">
	您的位置： <a href="index.jsp">首页</a> &gt;
	<h1>
		<a href="index.jsp">预订行程</a>
	</h1>
	&gt;
	<h1>下订单</h1>
	</article> 
	
	<section id="content" class="auto"> <section
		class="booking-select"> <aside class="right-side"> 
		
		<hgroup
		id="flight-departure"> 
		
	<form action="#" method="post" id="orderform">
	<div id="main-area">

		<div id="content">
			<div class="clear"></div>
			<div class="order_info" style="padding-top: 30px;">
				<h2 style="color: black;">${flight.companyName}|航班${flight.flightNo}</h2>
				<div class="body">

					<div class="clear"></div>

					<div class="row1">
						<div class="col1" style="padding-top:0px"><br>去程</div>
						<div class="col2">
							<b style="font-size: 25px">${flight.beginSite}</b>
							<span class="pk" >${flight.beginAir}</span>
							<span class="ex" style="display: inline;">
								<br><br><b>${flight.beginTime}</b></span>
						</div>
						<div class="col4">
							<span class="ex" style="display: inline;">
							${fsDate}<br>
							——————<br>
							${flight.travelDate}<br>
							</span>
						</div>
						<div class="col2">
						<span class="pk" >${flight.endAir}</span>
							<b style="font-size: 25px">${flight.endSite}</b>
							<span class="ex" style="display: inline;">
								<br><br><b>${flight.endTime}</b></span>
						</div>
						<div class="col4">
						<br>
							<a href="<%=basePath%>flight/flightshow.jsp">修改航班</a>
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
			<div class="passenger_new">

				<div class="info" id="paxInput">
					<h2>填写乘机人资料</h2>
					<div class="body">
						<div class="box init">
							<div class="input_ADT" name="paxInput">
								<div class="row">
									<div class="col1"> <i>*</i>
										&nbsp;旅客姓名：
									</div>
									<div class="col2">
										<input type="text" class="input selectInfo" name="userName" autocomplete="off" style="height:20px;" maxlength="28" value=""></div>
								</div>
								<div class="row">
									<div class="col1"> <i>*</i>
										&nbsp;证件号码：
									</div>
									<div class="col2">
										<input type="text" class="input note_tips" name="cardId"  style="height:20px;" tips="" value=""></div>
								</div>
								<div class="clear"></div>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>

				<div class="info" id="contactInfo">
					<h2>填写联系人资料</h2>
					<div class="body">
						<div class="form">
							<div class="row">
								<div class="col1">
									地址
								</div>
								<div class="col2">
									<input type="text" name="address"  style="height:20px;" class="input" ></div>
							</div>
							<div class="row">
								<div class="col1">
									<i>*</i>
									移动电话
								</div>
								<div class="col2">
									<input type="text" name="phoneNum"  style="height:20px;" class="input">
								</div>
							</div>
						</div>
						<div class="none" id="inputInfo">
							<div class="btn"></div>
						</div>
					</div>
				</div>
				<div class="btn_confirm">
					<input type="button"  class="button navblue" value="提交订单" id="submitOrder">
					<input type="button"  class="button navblue" value="直接付款" id="payment">
				</div>
				<div class="infoFloat ready" id="infoFloat" style="position: absolute; left: 740px;">
					<h2>折扣信息</h2>
					<div class="body">
						<ul></ul>
						<div class="clear"></div>
						<div class="itext">
							<i>舱位：<b>${seatId}</b></i><br>
							<i>基本票价：<b>${price}￥</b></i><br>
							<i>帐号类型：<b>${VIPgrade}</b></i><br>
							<i>享有折扣：<b>${discountInfo}</b></i>
						</div>
						<div class="itotal" >
							<div class="iname">订单价格：</div>
							<div id="totalPrice" class="iprice" >￥${discountPrice}</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<input value="${seatId}" type="hidden" name="seatId">
				<input value="${flight.flightNo}" type="hidden" name="flightId">
				<input value="${fsDate} ${flight.beginTime}" type="hidden" name="benginDate">
				<input value="${fsDate} ${flight.endTime}" type="hidden" name="endDate">
				<input value="${flight.beginSite}" type="hidden" name="benginSite">
				<input value="${flight.endSite}" type="hidden" name="endSite">
				<input value="${flight.travelDate}" type="hidden" name="travelDate">
				<input value="${discountPrice}" type="hidden" name="money">
				<input value="${customer}" type="hidden" name="customerName">
				<input  type="hidden" name="state" id="sta">
			</div>
			<!--footer-->
	</form>
	</hgroup> </aside>
	<div class="clear"></div>
	</section> </section> </section>
	<!--footer-->
	<script type="text/javascript">
	jQuery("#submitOrder").click(function(){
		jQuery("#sta").attr("value","待付款");
		jQuery.ajax({
			url:'../insertReserve',
			data:jQuery("#orderform").serialize(),
			type:"post",
			dataType:'json',
			success:function(data){
				alert(data.res)
				if(data.res=="下单成功"){
					document.getElementById('orderform').reset();
				}
			},error:function(data){
				alert("失败")
			}
		})
	})
	jQuery("#payment").click(function(){
		jQuery("#sta").attr("value","购票审核中");
		jQuery.ajax({
			url:'../insertReserve',
			data:jQuery("#orderform").serialize(),
			type:"post",
			dataType:'json',
			success:function(data){
				alert(data.res)
				if(data.res=="下单成功"){
					document.getElementById('orderform').reset();
				}
			},error:function(data){
				alert("失败")
			}
		})
	})
	</script>
</body>
</html>
