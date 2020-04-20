<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'Customerlogin.jsp' starting page</title>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="Stylesheets/login.css">
<link type="text/css" href="Stylesheets/global.css" rel="stylesheet">
<script src="Script/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="Script/jquery.validate.js" type="text/javascript"></script>
</head>
<body>
	<header>


	<div style="float:right; margin:23px 200px 0 0;">
		<a id="register" target="_blank"
			href="customer/regcustomer.jsp">注册</a>
	</div>
	</header>

	<section id="login"> <hgroup> <aside class="adv">

	</aside> <aside class="form">
	<form method="post" action="#" name="form_login1"
		id="loginForm" onsubmit="return false;">
		<h2>
			<p class="delu">会员登录</p>
		</h2>
		<article style="padding:20px;">

		<dl>
			<dt>用户名</dt>
			<dd>
				<input type="text" value="" class="input long error"
					name="customerName" id="username"> <span
					style="line-height: 120%; display: block; color:#cc0000;"></span>
			</dd>
		</dl>
		<dl>
			<dt>密码</dt>
			<dd name="member_pas">
				<input type="password" class="input long error" name="password" id="password">
				<span style="line-height: 120%; display: block; color:#cc0000;"></span>
			</dd>
		</dl>
		<p class="btn">
			<input type="button" value="登录" class="button-red" id="loginBtn">
		</p>
		</article>
	</form>
	</aside>
	</hgroup> </section>
	<footer> <a
		href="http://easternmiles.ceair.com/about/zjdh/index.html">关于东航</a> |
	<a href="http://easternmiles.ceair.com/guide/lxxz/index.html">旅行须知</a>
	| <a href="http://easternmiles.ceair.com/about/flys/index.html">法律和隐私条款</a>
	| <a href="http://easternmiles.ceair.com/guide/hycjwtjd/index.html">常见问题</a>
	| <a href="http://easternmiles.ceair.com/guide/wzdt/index.html">网站地图</a>
	| <a href="http://easternmiles.ceair.com/about/lxwm/index.html">联系我们</a>
	| <a href="http://easternmiles.ceair.com/about/thlm/index.html">天合联盟</a>
	<a href="http://easternmiles.ceair.com/about/yqlj/index.html">| </a> <a
		href="http://easternmiles.ceair.com/about/yqlj/index.html">友情链接</a> <br>
	© Copyright 2010 中国东方航空 沪ICP备10009470号 </footer>
	<script type="text/javascript">
		$("#loginBtn").click(function(){
			$.ajax({
				url:'login',
				data:jQuery("#loginForm").serialize(),
				type:"post",
				dataType:'json',
				success:function(data){
					alert(data.res)
					if(data.res=="登录成功"){
						location.href="index.jsp"
					}else{
						document.getElementById('#form_login1').reset();
					}
				},error:function(data){
					alert("失败")
				}
			})
		})
	</script>
</body>
</html>
