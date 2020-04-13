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
	<form method="post" action="loginUserAction.action" name="form_login1"
		id="form_login1">
		<h2>
			<p class="delu">会员登录</p>
		</h2>
		<article style="padding:20px;">

		<div class="error_msg"></div>
		<dl>
			<dt>登录名</dt>
			<dd>
				<input type="text" value="" class="input long error"
					name="user.username" id="username"> <span
					style="line-height: 120%; display: block; color:#cc0000;"></span>
			</dd>
		</dl>
		<dl>
			<dt>登录密码</dt>
			<dd name="member_pas">
				<input type="password" class="input valid" name="user.password" id="password">
				<span style="line-height: 120%; display: block; color:#cc0000;"></span>
			</dd>
		</dl>
		<dl>
			<dt>验证码</dt>
			<dd>
				<input type="text" class="input valid" id="txtvalidcode"
					name="validcode"> <span id="error"
					style="line-height: 120%; display: block; color:#cc0000;"></span> <img
					style="width:68px; height:26px;" onclick="reloadcode()"
					src="validate/validate.jsp" id="kaptchaImage">

			</dd>
		</dl>
		<p class="btn">
			<input type="button" value="登录" class="button-red" id="login">
		</p>
		</article>
	</form>
	</aside>
	<div class="clear"></div>
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
	 $("#login").click(function (){
	        if($("#form_login1").valid()){
	        	$.ajax({
	                type: "post",
	                url: "validatecustomer.action",
	                data: {username:$("#username").val(), password:$("#password").val()},
	                dataType: "json",
	                success: function(data){
	                	if(data){
	        	        	$("#form_login1").submit();
	        	        	postForm();}
	                	else{
	                	  $('#error').html("用户名或密码错误"); }
	                }
	            });

	         }
	    });
 	$("#form_login1").validate({
			rules : {
				"user.username" : {
					required : true,
				},
				"user.password" : {
					required : true
				},
				"validcode": { 
					required: true,
					 remote: {
					    type: "post",
					    url: "validatecode.action",
					    dataType: "json",
						data: {
						  authcode: function() {
						  return $("#txtvalidcode").val()
						         }
						  }
					}
			    }
			},
			messages : {
				"user.username" : {
					required : ' 请输入用户名',
				},
				"user.password" : {
					required : ' 请输入密码'
				},
				"validcode": { required: ' 请输入验证码',
					remote:'验证码错误'}
			},
			errorPlacement: function(error, element) {
				error.appendTo( element.next() );
			}
		}); 


$('#kaptchaImage').click(function () {
    $(this).attr("src", "validate/validate.jsp?" + Math.floor(Math.random()*100) );
});
</script>
</body>
</html>
