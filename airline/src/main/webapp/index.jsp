<%@ page language="java" import="java.util.*,com.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>中国东方航空公司</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>中国东方航空公司</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
<meta name="keywords" content="飞机票,东航官方网站,东航官网,中国东方航空,中国东方航空公司,东航">
<meta name="description" content="中国东方航空公司官方网站提供飞机票查询,飞机票预订,飞机票网上订票的一站式飞机票查询订购服务。最全国内机票查询,国际机票查询,机票预订100%出票。">
<meta name="baidu-site-verification" content="IOgz6fICIe">
<link rel="shortcut icon" href="http://easternmiles.ceair.com/favicon.ico">
<link rel="stylesheet" type="text/css" href="Stylesheets/index.css">
<link rel="stylesheet" type="text/css" href="Stylesheets/mystyle.css">
<script src="Script/jquery-1.8.3.min.js"></script>
<script src="Script/cities.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="Script/My97DatePicker/WdatePicker.js"></script>

</head>

<body>
<!--header-->
<header id="header">
  <hgroup>

    <c:if test="${not empty customer}">
    <address class="text blue">
    	<p>欢迎您，${customer}&nbsp;&nbsp;<a href="<%=basePath%>logout">注销</a> </p>
    </address>
    </c:if>
    <c:if test="${empty customer}">
	    <address class="text blue">
	   		<p> <a id="login" href="login.jsp">登录</a>&nbsp; | &nbsp; <a id="register" target="_blank" href="<%=basePath%>customer/regcustomer.jsp">注册</a></p>
	    </address>
    </c:if>
    <div class="clear"></div>
  </hgroup>
</header>
<!--end header--> 

<!--menu-->
<menu id="menu">
  <nav>
    <ul class="menu_index">
      <a href="<%=basePath%>customerinfo?customerName=${customer}" onclick="ifNotLogin()"><li id="menu-myceair">我的信息</li></a>
       <a href="flight/flightshow.jsp"><li id="menu-booking" class="current">预订行程<i></i></li></a>
    </ul>
  </nav>
</menu>
<!--end content--> 

<!-- 第一个下拉菜单 -->
<section class="menu-dropdown" id="dropdown-booking" style=" display: block;">
  <hgroup id="booking">
  
  <form action="<%=basePath %>queryFlightschedule"  method="post">
    <article id="tabTicket" class="b_content block">
      <ul class="category">
        <li rel="tabTicket">机票预定</li>
      </ul>
      <div class="error_msg red"></div>
      <dl class="form-field">
        <dt>出发地<br>
          <span class="city_box">
          <input type="text" name="beginSite" id="deptCd" class="input city" value="上海" onKeyUp="input_keyup();" onClick="append_city(this.id);" onBlur="input_blur()" onFocus="if(value=='上海'){value='';style.color='#606060';}" >
          <input class="text" id="hid_city_name" name="index_city" style="display: none">
          <input class="text" id="hid_real_city_name" name="real_index_city" style="display: none">
          </span></dt>
        <dd>目的地<br>
          <span class="city_box">
          <input type="text" name="endSite" id="arrDd" class="input city" value="广州" onKeyUp="input_keyup();" onClick="append_city(this.id);" onBlur="input_blur()" onFocus="if(value=='广州'){value='';style.color='#606060';}" >
           </span>
        </dd>
      </dl>
      <dl class="form-field">
        <dt>
          <input type="text" name="fsDate"  id="d422" class="input date Wdate" name="deptDt"  onfocus="WdatePicker()">
        </dt>
      </dl>
      <p class="btn">
        <input type="submit" class="button-blue"  id="btn_member_search" value="立刻查询">
      </p>
    </article>
    </form>
    
  </hgroup>
</section>
<div class="bottom_banner"> <img src="http://pic.c-ctrip.com/vacation_v2/bottom_banner1.jpg" class="bottom_banner_l" alt="吉祥航空" width="353" height="111"><img src="http://pic.c-ctrip.com/vacation_v2/bottom_banner2.jpg" class="bottom_banner_m" alt="瑞士国际航空公司" width="280" height="111"><img src="http://pic.c-ctrip.com/vacation_v2/bottom_banner3.jpg" class="bottom_banner_r" alt="日本航空" width="356" height="111"> </div>
<section class="primary-promotion">
  <div class="cover"> <img src="images/上海.png" alt=""> </div><!-- images/paris_eiffel-tower-seen-from-street_600x272.jpg -->
  <div class="description">
    <div class="destination-medium-up"> <span class="country">上海,</span> <span class="region">中国</span> </div>
    <div class="item">
      <div class="group"><a href="https://baike.baidu.com/item/%E4%B8%8A%E6%B5%B7/114606?fr=aladdin"  rel="nofollow">
        <div class="type">机票CNY6,430起</div>
        </a>
        <div class="miscellenous">特选经济舱</div>
      </div>
    </div>
  </div>
  <div class="secondary-promotions">
    <ul>
      <li class="item1">
        <div class="cover-img"> <i class="icon icon-flight-contrary" aria-hidden="true" lang="en"></i> <img src="images/Melbourne.png" alt="票价由3,500元*起" width="134" height="140"> </div>
        <div class="information">
          <div class="title">三亚</div>
          <a class="link" href="https://baike.baidu.com/item/%E4%B8%89%E4%BA%9A/181843?fr=aladdin" manual_cm_sp="CN-_-SALES-_-bjs-to-mel-from-cny3500-MultiMulti-2014" rel="nofollow">
          <div class="category">机票</div>
          <div class="price"><b>CNY3,500</b>起</div>
          </a>
          <div class="cabin-class">经济舱</div>
        </div>
      </li>
            <li class="item1">
        <div class="cover-img"> <i class="icon icon-flight-contrary" aria-hidden="true" lang="en"></i> <img src="images/北京长城.png" alt="票价由3,500元*起" width="134" height="140"> </div>
        <div class="information">
          <div class="title">北京</div>
          <a class="link" href="https://baike.baidu.com/item/%E5%8C%97%E4%BA%AC/128981?fr=aladdin" manual_cm_sp="CN-_-SALES-_-bjs-to-mel-from-cny3500-MultiMulti-2014" rel="nofollow">
          <div class="category">机票</div>
          <div class="price"><b>CNY3,500</b>起</div>
          </a>
          <div class="cabin-class">经济舱</div>
        </div>
      </li>
      
            <li class="item1">
        <div class="cover-img"> <i class="icon icon-flight-contrary" aria-hidden="true" lang="en"></i> <img src="images/桂林.jpg" alt="票价由3,500元*起" width="134" height="140"> </div>
        <div class="information">
          <div class="title">桂林</div>
          <a class="link" href="https://baike.baidu.com/item/%E6%A1%82%E6%9E%97/7495?fr=aladdin" manual_cm_sp="CN-_-SALES-_-bjs-to-mel-from-cny3500-MultiMulti-2014" rel="nofollow">
          <div class="category">机票</div>
          <div class="price"><b>CNY3,500</b>起</div>
          </a>
          <div class="cabin-class">经济舱</div>
        </div>
      </li>
    </ul>
        <ul style=" padding-top:50px;">
      <li class="item1">
        <div class="cover-img"> <i class="icon icon-flight-contrary" aria-hidden="true" lang="en"></i> <img src="images/大理.png" alt="票价由3,500元*起" width="134" height="140"> </div>
        <div class="information">
          <div class="title">大理</div>
          <a class="link" href="https://baike.baidu.com/item/%E5%A4%A7%E7%90%86%E7%99%BD%E6%97%8F%E8%87%AA%E6%B2%BB%E5%B7%9E/2916136?fromtitle=%E5%A4%A7%E7%90%86&fromid=32237&fr=aladdin" manual_cm_sp="CN-_-SALES-_-bjs-to-mel-from-cny3500-MultiMulti-2014" rel="nofollow">
          <div class="category">机票</div>
          <div class="price"><b>CNY3,500</b>起</div>
          </a>
          <div class="cabin-class">经济舱</div>
        </div>
      </li>
            <li class="item1">
        <div class="cover-img"> <i class="icon icon-flight-contrary" aria-hidden="true" lang="en"></i> <img src="images/杭州.png" alt="票价由3,500元*起" width="134" height="140"> </div>
        <div class="information">
          <div class="title">杭州</div>
          <a class="link" href="https://baike.baidu.com/item/%E6%9D%AD%E5%B7%9E/147639?fr=aladdin" manual_cm_sp="CN-_-SALES-_-bjs-to-mel-from-cny3500-MultiMulti-2014" rel="nofollow">
          <div class="category">机票</div>
          <div class="price"><b>CNY3,500</b>起</div>
          </a>
          <div class="cabin-class">经济舱</div>
        </div>
      </li>
      
       <li class="item1">
        <div class="cover-img"> <i class="icon icon-flight-contrary" aria-hidden="true" lang="en"></i> <img src="images/成都.png" alt="票价由3,500元*起" width="134" height="140"> </div>
        <div class="information">
          <div class="title">成都</div>
          <a class="link" href="https://baike.baidu.com/item/%E6%88%90%E9%83%BD/128473?fr=aladdin" manual_cm_sp="CN-_-SALES-_-bjs-to-mel-from-cny3500-MultiMulti-2014" rel="nofollow">
          <div class="category">机票</div>
          <div class="price"><b>CNY3,500</b>起</div>
          </a>
          <div class="cabin-class">经济舱</div>
        </div>
      </li>
    </ul>
  </div>
</section>
<div class="pop search-citys-pop click"  style="display: none; z-index: 9999" id="cityarea"> <a href="javascript:void(0)" class="pop-close"></a>
  <div class="search-citys-tt click"> <a class="current click" onClick="tabCutover(this,'s-citys1')" href="javascript:void(0)">热门城市<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys2')" href="javascript:void(0)">ABCDEFG<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys3')" href="javascript:void(0)">HIJKL<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys4')" href="javascript:void(0)">MNOPQRST<span></span></a> <a class="click" onClick="tabCutover(this,'s-citys5')" href="javascript:void(0)">UVWXYZ<span></span></a> </div>
  <div class="search-citys-list click" id="citylist"></div>
</div>
</body>
<script type="text/javascript">
  	function ifNotLogin() {
		if(${sessionScope.customer==null}){
			alert("请先登录");
		}
	}
  </script>
</html>