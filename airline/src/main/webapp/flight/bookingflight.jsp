<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<s:if test="#session.currentUser">
		<address class="text blue">
			<p >
				欢迎您，
				${ currentUser.username}
				&nbsp;&nbsp;<a href="login.jsp">注销</a>
			</p>
		</address>
	</s:if> <s:else>
		<address class="text blue">
			<p>
				<a id="login"
					href="login.jsp">登录</a>
				&nbsp; | &nbsp; <a id="register" target="_blank"
					href="regcustomer.jsp">注册</a>
			</p>
		</address>
	</s:else>
	<div class="clear"></div>
	</hgroup> </header>
	<menu id="menu">
		<nav>
		<ul class="menu_index">
			<li id="menu-home"><a href="index.jsp">首页</a> <i></i>
			</li>
			<li id="menu-myceair"><a
				href="customer/customerinfo.jsp">我的信息</a>
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
	<form  action="saveOrderAction.action" method="post">
	<div id="main-area">

		<div id="content">
			<div class="clear"></div>
			<div class="order_info" style="padding-top: 30px;">
				<h2>订单信息</h2>
				<div class="body">

					<div class="clear"></div>

					<div class="row1">
						<div class="col1" style="padding-top:0px"><br>去程</div>
						<div class="col2"> <b>${flight.startPoint }</b> <b><s:date format="HH:mm" name="#request.flight.startTime"/></b>
							<span class="pk" style="display: none;">2014-11-27</span>
							<span class="ex" style="display: inline;">
								<br>
								<s:date name="#request.flightSchedule.day" format="yyyy-MM-dd"/>
								<br>${flight.startPointAirport}</span>
						</div>
						<div class="col4">
							<span class="pk" style="display: none;">————</span>
							<span class="ex" style="display: inline;">
							${flight.companyName }
							<br>
							${flight.flightNumber }<br>
							${cabinClass }
							</span>
						</div>
						<div class="col2">
							<b>${flight.endPoint }</b>
							<b><s:date format="HH:mm" name="#request.flight.arrivalTime"/></b>
							<span class="pk" style="display: none;">2014-11-27</span>
							<span class="ex" style="display: inline;">
								<br>
								<s:date name="#request.flightSchedule.day" format="yyyy-MM-dd"/>
								<br>${flight.endPointAirport}</span>
						</div>
						<div class="col4">
						<br>
							<a href="/index.jsp">修改航班</a>
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
							<div class="row">
								<div class="col1">&nbsp;</div>
								<div class="col2">
									<input name="person" id="radio_ADT" class="input_rc paxTypeRadio" type="radio" value="ADT" checked="checked"  >
									<span class="radioSpan initno" >成人</span>
									<input name="person" id="radio_CHD" class="input_rc paxTypeRadio initno" type="radio" value="CHD" >
									<span class="radioSpan initno" >儿童</span>
								</div>
							</div>
							<div class="input_ADT" name="paxInput">
								<div class="row">
									<div class="col1"> <i>*</i>
										&nbsp;旅客姓名：
									</div>
									<div class="col2">
										<input type="text" class="input selectInfo" name="realName" autocomplete="off" style="height:20px;" maxlength="28" value="${currentUser.realName }"></div>
								</div>
								<div class="row">
									<div class="col1"> <i>*</i>
										&nbsp;证件号码：
									</div>
									<div class="col2">
										<input type="text" class="input note_tips" name="identificationCard"  style="height:20px;" tips="" value="${currentUser.identificationCard }"></div>
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
									<input type="text" name="phoneNumber"  style="height:20px;" class="input" value="${currentUser.phoneNumber }">
									<input id="finalprice" type="text" name="finalprice" value=" " style="display: none">
									</div>
							
							</div>
						</div>
						<div class="none" id="inputInfo">
							<div class="btn"></div>
						</div>
					</div>
				</div>
				<div class="btn_confirm">
					<input type="submit" name="next" class="button navblue" value="确认并提交订单" id="btn_passenger"></div>

				<div class="infoFloat ready" id="infoFloat" style="position: absolute; left: 740px;">
					<h2>乘机人名单</h2>
					<div class="body">
						<ul></ul>
						<div class="clear"></div>
						<div class="itext">
							<span class="tktPrice">
							<div style="display:block" id="adult">
								<i>基本票价：￥${cabinclassprice}</i>
								<br></span>
							</div>
								<div style="display:none" id="children">
								<span class="tktPrice">
								<i>儿童票价：￥${cabinclassprice*children/100}</i>
								<br></span>
								<i name="tax" >儿童折扣:
								<b>${children}%</b></i> <br></div>
					
							<i name="tax">帐号类型:
								<b>${accountType }</b></i> 
							<br>
							<i name="fee">享有折扣:
								<b><s:if test="#request.discountrate==1">无折扣</s:if><s:else> ${discountrate}%</s:else></b></i> 
						</div>
						<div class="itotal" >
							<div class="iname">订单总价：</div>
							<div id="totalPrice" class="iprice" >￥${cabinclassprice}</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>

			</div>
			<!--footer-->


	</div></div>
	</form>
	</hgroup> </aside>
	<div class="clear"></div>
	</section> </section> </section>
	<!--footer-->
	<section id="blank"></section>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#finalprice").attr("value" ,${cabinclassprice});
	});
	$("#radio_ADT").change(function(){  
		var price=${discountrate*cabinclassprice};
		$("#adult").css("display","block") ; 
		$("#children").css("display","none") ;
		$("#totalPrice").html("￥"+price);
		$("#finalprice").attr("value" , price);
		}); 
	$("#radio_CHD").change(function(){ 
		var price=${cabinclassprice*children*discountrate/100};
		$("#children").css("display","block") ; 
		$("#adult").css("display","none") ;
		$("#totalPrice").html("￥"+price);
		$("#finalprice").val(price);
		$("#finalprice").attr("value" , price);
		});
	</script>
</body>
</html>
