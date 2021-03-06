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
<title>修改密码</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>航空订票系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
<meta name="keywords" content="航空订票系统">
<meta name="description" content="航空订票系统">
<meta name="baidu-site-verification" content="IOgz6fICIe">
<link rel="shortcut icon" href="http://easternmiles.ceair.com/favicon.ico">
<link rel="stylesheet" type="text/css" href="Stylesheets/index.css">
<link rel="stylesheet" type="text/css" href="Stylesheets/mystyle.css">
<link rel="stylesheet" type="text/css" href="Stylesheets/myceair.css">
<link rel="stylesheet" type="text/css" href="Stylesheets/customerinfo.css">
<script src="Script/jquery-1.8.3.min.js"></script>
<script src="Script/jquery.validate.js" type="text/javascript"></script>
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
      <a href="customer/customerinfo.jsp"><li id="menu-myceair" class="current">我的信息<i></i></li></a>
      <a href="index.jsp"><li id="menu-booking">预订行程<i></i></li></a>

    </ul>
  </nav>
</menu>
<!--end content--> 

<!-- 第一个下拉菜单 -->
<section class="menu-dropdown" id="dropdown-booking" style="display: block; height:320px ">
  <hgroup id="booking">
    <article id="tabTicket" class="b_content block">
<div id="main-area">
<div class="position gray">
			您的位置：<a href="/index.jsp">首页</a> &gt;
			<h1>我的东航</h1>
		</div>
			<div class="myceair">
			<div class="left"><div class="home"></div>

<div class="menu font14 bold m1"><a href="<%=basePath%>customerinfo?customerName=${customer}">个人信息</a></div>

<div class="menu font14 bold m2"><a href="<%=basePath%>order/ordershow.jsp">机票订单</a></div>
<div class="child">
</div>
<div class="menu font14 bold m9"><a href="customer/editcustomerpassword.jsp">更改密码</a>
</div>
<script src="/resource2/js/myceair/j.tools.js"></script>
</div>
<div class="right">
				<div class="personal_info" id="switch">
					<div class="body">
						<div class="b_content active" rel="tab1">
                       
                            <form action="#" method="post" id="editpassword_form">
                            <input type="hidden" name="customerName" value=${customer}>
							<div class="name">
								<b class="blue bold">更改密码</b> <span class="gray block">
								<input id="editpassword" style="width:40px; height: 25px;" type="button" value="保存"></span>
							</div>
							<div class="row">
								<div class="col1">当前密码：</div>
								<div class="col2 blue"><input id="password" type="password" name="oldPassword" value="">&nbsp;</div>
								<span id="error"></span>
							</div>
							<div class="row">
								<div class="col1">新密码：</div>
								<div class="col2 blue"><input id="newpwd" type="password" name="password">
								&nbsp;	
								</div>
							</div>
							<div class="row">
								<div class="col1">确认密码：</div>
								<div class="col2 blue">
								<input id="retypepwd" type="password" name="retypepassword" onblur="jugesame()">
								&nbsp;						
								</div>
							</div>
							
                            </form>               			
                        </div>
			<div class="clear"></div>
		</div>
	</div>	
</div>
</div>
</div>
        
    </article>
  </hgroup>
</section>
<div class="bottom_banner"> <img src="http://pic.c-ctrip.com/vacation_v2/bottom_banner1.jpg" class="bottom_banner_l" alt="吉祥航空" width="353" height="111"><img src="http://pic.c-ctrip.com/vacation_v2/bottom_banner2.jpg" class="bottom_banner_m" alt="瑞士国际航空公司" width="280" height="111"><img src="http://pic.c-ctrip.com/vacation_v2/bottom_banner3.jpg" class="bottom_banner_r" alt="日本航空" width="356" height="111"> </div>
	<script type="text/javascript">
	 $("#editpassword").click(function (){
	        	$.ajax({
	                type: "post",
	                url: "../editPassword",
	                data: $("#editpassword_form").serialize(),
	                dataType: "json",
	                success: function(data){
        	        	alert(data.res)
	                },error: function(data){
	                	alert("修改失败")
	                }
	            });
	    });

</script>
</body>
</html>
