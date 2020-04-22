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
					<a href="http://www.ceair.com">首页</a> <i></i>
				</li>
				<li id="menu-myceair">
					<a href="<%=basePath%>customerinfo?customerName=${customer}"><li id="menu-myceair">我的信息<i></i></li></a>
				</li>
				<li id="menu-booking" class="current">
					<a href="#">预订行程</a>
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
			<h1>舱位选择</h1>
		</article>
		<section class="booking-select">
		<aside class="right-side">
				<section id="flight-info">
					<div class="flight-section" style="z-index: 4;">
						<div class="head">
							<dl style="height: 80px;border:1px solid #000;">
								<dt class="right">
									<b>${flight.beginSite}</b><br>
									<b>${flight.beginTime}</b>
								</dt>
								
								<dt class="center" style="width: 100px">
									${fsDate}<br>
                                     -----------><br>
                                    ${flight.travelDate}<br>
								</dt>
								<dt class="left">
									<b>${flight.endSite}</b><br>
									<b>${flight.endTime}</b>
								</dt>
							</dl>
					</div>	
					
					<div class="body">
							<ul>
								<li class="c-4">
									经济舱(剩余：<span class="seatAlarm" style="color: #D42826;">${Eseat}</span>张)
								</li>
								<li class="c-5">
									<span class="price normal red">${flight.eprice}¥</span>
								</li>
								<li class="c-6"></li>
								<c:if test="${Eseat>0}">
								<li class="c-7">
									<a href="fillOrder?price=${flight.eprice}&seatId=E" onclick="ifLogin()"><input type="button" value="预 订" cabinidx="0"  class="button lightred"  name="select" id="tourist_class"></a>
								</li>
								</c:if>
							</ul>
							<ul>
								<li class="c-4">
									公务舱(剩余：
									<span class="seatAlarm" style="color: #D42826;">${Bseat}</span>张)
								</li>
								<li class="c-5">
									<span class="price normal red">${flight.bprice}¥</span>
								</li>
								<li class="c-6"></li>
								<c:if test="${Bseat>0}">
								<li class="c-7">
									<a href="fillOrder?price=${flight.bprice}&seatId=B">
										<input type="button" value="预 订" cabinidx="1"  class="button lightred"  name="select" id="business_class">
									</a>
								</li>
								</c:if>
							</ul>
								<ul>
								<li class="c-4">
									头等舱(剩余：<span class="seatAlarm" style="color: #D42826;">${Yseat}</span>张)
								</li>
								<li class="c-5">
									<span class="price normal red">${flight.fprice}¥</span>
								</li>
								<li class="c-6"></li>
								<c:if test="${Yseat>0}">
									<li class="c-7">
										<a href="fillOrder?price=${flight.fprice}&seatId=Y">
											<input type="button" value="预 订" id="first_class"  class="button lightred"  name="select">
										</a>
									</li>
								</c:if>
							</ul>
						</div>
				</div>
				</section>
			</hgroup>

		</aside>
		<div class="clear"></div>
	</section>
</section>
<!--footer-->
<footer id="footer">
<hgroup class="links white">
	<a href="http://easternmiles.ceair.com/about/zjdh/index.html" target="_blank">关于东航</a>
	|
	<a href="http://easternmiles.ceair.com/guide2/xqfw/t201347_8968.html" target="_blank">旅客须知</a>
	|
	<a href="http://easternmiles.ceair.com/about/flys/index.html" target="_blank">法律和隐私条款</a>
	|
	<a href="http://easternmiles.ceair.com/guide2/hycjwtjd/index.html" target="_blank">常见问题</a>
	|
	<a href="http://easternmiles.ceair.com/sitemap.html" target="_blank">网站地图</a>
	|
	<a href="http://easternmiles.ceair.com/about/lxwm/index.html" target="_blank">联系我们</a>
	|
	<a href="http://easternmiles.ceair.com/about/thlm/index.html" target="_blank">天合联盟</a>
	|
	<a href="http://easternmiles.ceair.com/about/yqlj/index.html" target="_blank">友情链接</a>
	|
	<a href="http://www.arrivalguides.com/" target="_blank">目的地指南</a>
	<br>
	© Copyright 2010 中国东方航空
	<a href="http://www.miibeian.gov.cn" target="_blank">沪ICP备10009470号</a>
	<a target="_blank" href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20120628104633144">
		<img src="http://easternmiles.ceair.com/resource2/images/globle/img_integrity_1.gif"></a>
	<a href="http://search.cxwz.org/cert/l/CX20111018000613000621" target="_blank">
		<img src="http://easternmiles.ceair.com/resource2/images/globle/img_integrity_2.gif"></a>
	<i><img src="http://easternmiles.ceair.com/resource3/images/globle/img_95530.png"></i>
</hgroup>
</footer>


<div class="pop search-citys-pop click"  style="display: none; z-index: 9999" id="cityarea"> <a href="javascript:void(0)" class="pop-close"></a>
  <div class="search-citys-tt click"> <a class="current click" onClick="tabCutover(this,'s-citys1')" href="javascript:void(0)">热门城市<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys2')" href="javascript:void(0)">ABCDEFG<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys3')" href="javascript:void(0)">HIJKL<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys4')" href="javascript:void(0)">MNOPQRST<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys5')" href="javascript:void(0)">UVWXYZ<span></span></a> </div>
  <div class="search-citys-list click" id="citylist"></div>
</div>

  </body>
  <script type="text/javascript">
  	function ifLogin() {
		if(${sessionScope.customer==null}){
			alert("请先登录");
		}
	}
  </script>
</html>
