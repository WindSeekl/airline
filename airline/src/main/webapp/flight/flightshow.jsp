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
			<form action="<%=basePath%>queryFlightschedule" method="post" id="flight_form">
				<dl>
					<dd>
						<span class="city_box">
							<input id="deptCd" name="beginSite" type="text" class="input city" onKeyUp="input_keyup();" onClick="append_city(this.id);" onBlur="input_blur()" value="${flightschedule.beginSite}">
						</span>
					</dd>
					<dd>
						<span class="city_box">
							<input id="arrDd" name="endSite" type="text" class="input city" onKeyUp="input_keyup();" onClick="append_city(this.id);" onBlur="input_blur()" value="${flightschedule.endSite}">
						</span>
					</dd>
					<dd>
						<input type="text" value="${flightschedule.fsDate}" name="fsDate" id="day" class="input date" onfocus="WdatePicker({minDate:'%y-%M-{%d}'})">
					</dd>
				<dt>
					<input  type="submit" name="search" class="button-search" value="搜 索" id="btn_flight_search"></dt>
			</dl>
			</form>
		</section>

		<section class="booking-select">
		<aside class="right-side">


			<hgroup id="flight-departure">


				<article class="flight-title"> <strong><b>选择去程</b>
						&nbsp; </strong> 
					<em>当前
						<b class="blue" num="25">${size }</b>
						条符合条件</em>
				</article>



				<section id="flight-info">
					<div class="flight-section" style="z-index: 4;">
					<c:if test="${not empty accordFlightList}">
							<c:forEach items="${accordFlightList}" var="flight">
						<div class="head">
						
							<dl>
								<dt class="right">
									<b>${flight.beginSite}</b><br>
									<p style="font-size: 15px">${flight.beginTime}</p>
								</dt>
								
								<dt class="center" style="width: 100px">
									${flightschedule.fsDate}<br>
                                     -----------><br>
                                    ${flight.travelDate}<br>
								</dt>
								
								<dt class="left">
									<b>${flight.endSite}</b><br>
									<p style="font-size: 15px">${flight.endTime}</p>
								</dt>
								<dd class="btn">
									<span class="price"><dfn>${flight.eprice}¥</dfn>
										<i>起</i>
									</span><br>
									
									<button>查询余票</button>
								</dd>
							</dl>
							</div>
							</c:forEach>
						</c:if>
						
						
						<div class="body">
							<ul>
								<li class="c-4">
									经济舱(剩余：
									<span class="seatAlarm" style="color: #D42826;">
									</span>
									张)
								</li>
								<li class="c-5">
									<span class="price normal red"> <dfn>¥</dfn>
								
									</span>
								</li>
								<li class="c-6"></li>
								<li class="c-7">
									<input type="button" value="预 订" cabinidx="0"  class="button lightred"  name="select" id="tourist_class" onclick="tourist(<s:property  value="flight.flightId"/>)"></li>
							</ul>
							<ul>
								<li class="c-4">
									公务舱(剩余：
									<span class="seatAlarm" style="color: #D42826;">
									</span>
									张)
								</li>
								<li class="c-5">
									<span class="price normal red">
										<dfn>¥</dfn>
									</span>
								</li>
								<li class="c-6"></li>
								<li class="c-7">
									<input type="button" value="预 订" cabinidx="1"  class="button gray"  name="select" id="business_class" onclick="business(<s:property  value="flight.flightId"/>)"></li>
							</ul>
								<ul>
								<li class="c-4">
									头等舱(剩余：
									<span class="seatAlarm" style="color: #D42826;">
									</span>
									张)
								</li>
								<li class="c-5">
									<span class="price normal red">
										<dfn>¥</dfn>
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
				</section>
			</hgroup>

		</aside>
		<div class="clear"></div>
	</section>
</section>
</section>
<!--footer-->


</hgroup>
</footer>


<div class="pop search-citys-pop click"  style="display: none; z-index: 9999" id="cityarea"> <a href="javascript:void(0)" class="pop-close"></a>
  <div class="search-citys-tt click"> <a class="current click" onClick="tabCutover(this,'s-citys1')" href="javascript:void(0)">热门城市<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys2')" href="javascript:void(0)">ABCDEFG<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys3')" href="javascript:void(0)">HIJKL<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys4')" href="javascript:void(0)">MNOPQRST<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys5')" href="javascript:void(0)">UVWXYZ<span></span></a> </div>
  <div class="search-citys-list click" id="citylist"></div>
</div>
<script type="text/javascript">
	var da = new Date();
	var year = da.getFullYear()+'年';
	var month = da.getMonth()+1+'月';
	var date = da.getDate()+'日';
	$('#now_time').text([year,month,date].join(' '));
</script>
  </body>
</html>
