<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'flighshow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" href="<%=basePath%>/Stylesheets/booking.css" rel="stylesheet">
	<link type="text/css" href="<%=basePath%>/Stylesheets/public.css" rel="stylesheet">
	<script src="<%=basePath%>/Script/jquery-1.8.3.min.js"></script>
    <script src="<%=basePath%>/Script/cities.js" type="text/javascript"></script>
    <script src="<%=basePath%>/Script/jquery.validate.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath%>/Script/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/Stylesheets/mystyle.css">
    	<style type="text/css">
.flight-section {
    transform-origin: 50% 50% 0;
    transition: all 1000ms ease 0s, opacity 800ms ease 0s;
    -webkit-transform-origin: 50% 50% 0;
    -webkit-transition: all 1000ms ease 0s, opacity 800ms ease 0s;
}
#flight-departure .flight-section.past { 
    opacity: 0;
    transform: rotateY(180deg);
    -webkit-transform: rotateY(180deg);
}

#flight-departure .flight-section.future {
    opacity: 1;
    transform: rotateY(0deg);
    -webkit-transform: rotateY(0deg);
    z-index:22px;
}
</style>
  </head>
<body>
  	<header id="header">
		<hgroup>

			<s:if test="#session.currentUser">
				<address class="text blue">
					<p style="padding-top: 15px;">
						欢迎您，	
						${currentUser.username}
						&nbsp;&nbsp;<a href="login.jsp">注销</a>
					</p>
				</address>
			</s:if>
			<s:else>
				<address class="text blue">
					<p>
						<a id="login" href="login.jsp">登录</a>
						&nbsp; | &nbsp;
						<a id="register" target="_blank" href="regcustomer.jsp">注册</a>
					</p>
				</address>
			</s:else>
			<div class="clear"></div>
		</hgroup>
	</header>
	<menu id="menu">
		<nav>
			<ul class="menu_index">
				<li id="menu-home">
					<a href="index.jsp">首页</a> <i></i>
				</li>
				<li id="menu-myceair">
					<a href="customer/customerinfo.jsp">我的东航</a> <i></i>
				</li>
				<li id="menu-booking" class="current">
					<a href="index.jsp">预订行程</a>
					<i></i>
				</li>

			</ul>
		</nav>
	</menu>

	<section id="main-area">
		<article class="position">
			您的位置：
			<a href="/">首页</a>
			&gt;
			<h1>
				<a href="/flight2014/">预订行程</a>
			</h1>
			&gt;
			<h1>航班选择</h1>
		</article>
		<section id="content" class="auto">
			<section class="booking-search">
			<form action="findFlightAction.action" method="post" id="flight_form">
				<dl>
					<dd>
						<span class="city_box">
							<input id="deptCd" name="startPoint" type="text" class="input city" onKeyUp="input_keyup();" onClick="append_city(this.id);" onBlur="input_blur()" value="${flightSchedule.startPoint}">
						</span>
					</dd>
					<dd>
						<span class="city_box">
							<input id="arrDd" name="endPoint" type="text" class="input city" onKeyUp="input_keyup();" onClick="append_city(this.id);" onBlur="input_blur()" value="${flightSchedule.endPoint}">
						</span>
					</dd>
					<dd>
						<input type="text" value="${flightSchedule.day}" name="day" id="day" class="input date" onfocus="WdatePicker({minDate:'%y-%M-{%d}'})">
					</dd>
			    <dd>
			        <span style="margin-left:10px;">航空公司</span>
					<input type="text" class="input flightNumber" name="companyName" id="companyName" >
				</dd>
				<dd>
			        <span style="margin-left:10px;">航空号</span>
					<input type="text" class="input flightNumber" name="flightNumber" id="flightNumber" >
				</dd>
				<dt>
				    <input type="text" value="${flightSchedule.flightScheduleId}" id="flightScheduleId" style="display: none;">
					<input type="button" name="search" class="button-search" value="搜 索" id="btn_flight_search"></dt>
			</dl>
			</form>
		</section>

		<section class="booking-select">
		<aside class="right-side">


			<hgroup id="flight-departure">


				<article class="flight-title"> <strong><b>选择去程</b>
						&nbsp; <s:property value="#request.flightSchedule.startPoint"/> - <s:property value="#request.flightSchedule.endPoint"/>&nbsp;&nbsp;<s:date format="MM月dd日" name="#request.flightSchedule.day"/></strong> 
					<em>当前
						<b class="blue" num="25"><s:property value="#request.flightNumber"/></b>
						条符合条件</em> 

				</article>



				<section id="flight-info">
				<s:iterator value="#request.flightlist">
					<div class="flight-section" style="z-index: 4;">
						<div class="head">
							<dl>
								<dt class="icon">
									<br>
									</dt>
								<dt>
								<s:property value="flight.companyName"/>
								
									<br>
									<span style="z-index: 9;" id="flightNumber"><s:property value="flight.flightNumber"/></span>
								</dt>
								<dt class="right">
									<b><s:date format="HH:mm" name="flight.startTime"/></b>
									<br><s:property value="flight.startPointAirport"/></dt>
								<dt class="center">
                                      ----->
								</dt>
								<dt class="left">
									<b><s:date format="HH:mm" name="flight.arrivalTime"/></b>
									<br><s:property value="flight.endPointAirport"/></dt>
								<dd class="btn">
									<span class="price"> <dfn>¥</dfn>
										<s:property value="flight.cabinPrice.touristClass"/>
										<i>起</i>
									</span>
								</dd>
							</dl>
						</div>
						<div class="body">
							<ul>
								<li class="c-4">
									经济舱(剩余：
									<span class="seatAlarm" style="color: #D42826;"><s:property value="touristClassAmount"/>
									</span>
									张)
								</li>
								<li class="c-5">
									<span class="price normal red"> <dfn>¥</dfn>
										<s:property value="flight.cabinPrice.touristClass"/>
									</span>
								</li>
								<li class="c-6"></li>
								<li class="c-7">
									<input type="button" value="预 订" cabinidx="0"  class="button lightred"  name="select" id="tourist_class" onclick="tourist(<s:property  value="flight.flightId"/>)"></li>
							</ul>
							<ul>
								<li class="c-4">
									公务舱(剩余：
									<span class="seatAlarm" style="color: #D42826;"><s:property value="businessClassAmount" />
									</span>
									张)
								</li>
								<li class="c-5">
									<span class="price normal red">
										<dfn>¥</dfn>
										<s:property value="flight.cabinPrice.businessClass"/>
									</span>
								</li>
								<li class="c-6"></li>
								<li class="c-7">
									<input type="button" value="预 订" cabinidx="1"  class="button gray"  name="select" id="business_class" onclick="business(<s:property  value="flight.flightId"/>)"></li>
							</ul>
								<ul>
								<li class="c-4">
									头等舱(剩余：
									<span class="seatAlarm" style="color: #D42826;"><s:property value="firstClassAmount"/>
									</span>
									张)
								</li>
								<li class="c-5">
									<span class="price normal red">
										<dfn>¥</dfn>
										<s:property value="flight.cabinPrice.firstClass"/>
									</span>
								</li>
								<li class="c-6"></li>
								<li class="c-7">
									<input type="button" value="预 订" id="first_class"  class="button gray"  name="select"  onclick="firstClass(<s:property  value="flight.flightId"/>)">
									<input id="flightId" type="text"  style="visibility: hidden; display: none;" >
								</li>
							</ul>
						</div>
					</div>
					<div class="line"></div>
					</s:iterator>
				</section>
			</hgroup>

		</aside>
		<div class="clear"></div>
	</section>
</section>
</section>
<!--footer-->
<section id="blank"></section>
<footer id="footer">
<hgroup class="links white">


</hgroup>
</footer>


<div class="pop search-citys-pop click"  style="display: none; z-index: 9999" id="cityarea"> <a href="javascript:void(0)" class="pop-close"></a>
  <div class="search-citys-tt click"> <a class="current click" onClick="tabCutover(this,'s-citys1')" href="javascript:void(0)">热门城市<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys2')" href="javascript:void(0)">ABCDEFG<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys3')" href="javascript:void(0)">HIJKL<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys4')" href="javascript:void(0)">MNOPQRST<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys5')" href="javascript:void(0)">UVWXYZ<span></span></a> </div>
  <div class="search-citys-list click" id="citylist"></div>
</div>
<script type="text/javascript">
$("#btn_flight_search").click(function (){
	if($("#flight_form").valid()){
		$.ajax({
            type: "post",
            url: "validateflight.action",
            data: {startPoint:$("#deptCd").val(), endPoint:$("#arrDd").val(),day:$("#day").val(),companyName:$("#companyName").val()
            	,flightNumber:$("#flightNumber").val()},
            dataType: "json",
            success: function(data){
            	if(data){
    	        	$("#flight_form").submit();
    	        	postForm();}
            	else{
            	  alert("无该航线的航班"); }
            }
        });
	}
});
function tourist(id){
	var flightScheduleId = $("#flightScheduleId").val();
	window.location = 'bookingFlightAction.action?id='+id+'&cabinClass='+2+'&flightScheduleId='+flightScheduleId;
}
function business(id){
	var flightScheduleId = $("#flightScheduleId").val();
	window.location = 'bookingFlightAction.action?id='+id+'&cabinClass='+1+'&flightScheduleId='+flightScheduleId;
}
function firstClass(id){
	var flightScheduleId = $("#flightScheduleId").val();
	window.location = 'bookingFlightAction.action?id='+id+'&cabinClass='+0+'&flightScheduleId='+flightScheduleId;
}
	$("#flight_form").validate({
		rules: {
			"companyName": {
				remote: {
					    type: "post",
					    url: "validatecompanyname.action",
					    dataType: "json",
						data: {
						  companyName: function() {
						  return $("#companyName").val();
						         }
						  }
					}
			},
			"flightNumber": {
				remote: {
				    type: "post",
				    url: "validateflightnumber.action",
				    dataType: "json",
					data: {
						flightNumber: function() {
					  return $("#flightNumber").val();
					         }
					  }
				}
			}
		},
		messages: {
			"companyName": {
				remote: '该公司不存在'
			},
			"flightNumber":{
				remote:'该航班号不存在'
			}
		},
		errorPlacement: function(error, element) {
			 error.appendTo(element.parent());  
		}
	});
</script>

  </body>
</html>
