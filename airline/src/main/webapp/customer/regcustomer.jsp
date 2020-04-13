<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'reg.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="Stylesheets/regcustomer.css">
<script src="Script/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="Script/jquery.validate.js" type="text/javascript"></script>
</head>

<body>
	<div id="head">
		<div id="header">
		</div>
	</div>

	<div id="slide-image">
		<ul>
			<li id="slide1" class="active"></li>
		</ul>
	</div>
	<div id="container" style="">
		<div id="content">
			<div id="col_right" class="col_right" style="width: 100%;">
				<form id="easten_form" name="easten_form" action="regUserAction" method="post">
					<div class="L_title">帐号注册</div>
					<div class="main">
						<div class="content" style="line-height: 36px;">
							<div class="headline bg">个人情况</div>
							<div class="L_p">
								<table width="98%" border="0" cellspacing="2" cellpadding="2" style="font-size: 12px">
									<tbody>
										<tr>
											<td width="20%" align="right"> <b class="nation_css" style="color: rgb(255, 0, 0); ">*</b>
												用户名：
											</td>
											<td width="20%">
												<input type="text" name="user.username" value="" id="username"></td>
											<td width="40%" align="left">
												<span class="error"></span>
											</td>
										</tr>
										<tr>
											<td align="right"> <b style="color: #F00;">*</b>
												密码：
											</td>
											<td>
												<input type="password" name="user.password" value="" id="password"></td>
											<td align="left">
												<span  class="error"></span>
											</td>
										</tr>
										<tr>
											<td align="right">
												<b style="color: #F00;">*</b>
												确认密码：
											</td>
											<td>
												<input type="password" name="confirm_password" value=""></td>
											<td align="left">
												<span  class="error"></span>
											</td>
										</tr>
										<tr>
											<td align="right">
												<b style="color: #F00;">*</b>
												性别：
											</td>
											<td>
												<input type="radio" name="user.sex" id="sexM" value="0">
												<label for="sexM">男</label>
												<input type="radio" name="user.sex" id="sexF" value="1">
												<label for="sexF">女</label>
											</td>
											<td align="left" height="14px">
											</td>
										</tr>
										<tr>
											<td align="right">
												<b style="color: #F00;">*</b>
												真是姓名：
											</td>
											<td>
												<input type="text" name="user.realName" value="" id="realName"></td>
											<td align="left">

											</td>
										</tr>
										<tr id="tr_consume">
											<td align="right">
												<b style="color: #F00;">*</b>
												证件号码：
											</td>
											<td>
												<input type="text" name="user.identificationCard" value="" id="idtext0"></td>
											<td align="left">
		
											</td>
										</tr>
									</tbody>
								</table>

							</div>

							<div class="headline bg">联系方式</div>
							<div class="L_p">
								<table width="98%" border="0" cellspacing="2" cellpadding="2" style="font-size: 12px">
									<tbody>
										<tr>
											<td align="right" width="20%">
												<b style="color: #F00;">*</b>
												手机号码：
											</td>
											<td width="20%">
												<input type="text" name="user.phoneNumber" value="" id="phoneNumber"></td>
											<td align="left" width="40%">
	
											</td >
										</tr>
										<tr>
											<td align="right">
												<b style="color: #F00;">*</b>
												电子邮件：
											</td>
											<td >
												<input type="text" name="user.email" value="" id="easten_form_registerDto_email" style=""></td>
											<td align="left" >

											</td >
										</tr>
									</tbody>
								</table>
							</div>
							<div class="L_p">
								<div style="text-align: center; margin-top: 10px;">
									<input type="button"  value="提交" id="login1"></div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</form>

			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!--div class="foot">
	TODO mock-->
	<div id="foot">


	<div id="footer">
		<div class="container">
			<div class="links white">
				<a href="http://easternmiles.ceair.com/about/zjdh/index.html">关于东航</a>
				|
				<a href="http://easternmiles.ceair.com/guide/lxxz/index.html">旅行须知</a>
				|
				<a href="http://easternmiles.ceair.com/about/flys/index.html">法律和隐私条款</a>
				|
				<a href="http://easternmiles.ceair.com/guide/hycjwtjd/index.html">常见问题</a>
				|
				<a href="http://easternmiles.ceair.com/sitemap.html">网站地图</a>
				|
				<a href="http://easternmiles.ceair.com/about/lxwm/index.html">联系我们</a>
				|
				<a href="http://easternmiles.ceair.com/about/thlm/index.html">天合联盟</a>
				|
				<a href="http://easternmiles.ceair.com/about/yqlj/index.html">友情链接</a>
				<!--<a href="http://easternmiles.ceair.com/about/yjfk/index.html" class="button_blue">客户反馈</a>
			-->
			<br>
			© Copyright 2010 中国东方航空 &nbsp;&nbsp;
			<a target="_black" href="http://www.miibeian.gov.cn">沪ICP备10009470号</a>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
$("#login1").click(function (){
	if($("#easten_form").valid()){
	        $("#easten_form").submit();
	        postForm();
	}
});
	$("#easten_form").validate({
		rules: {
			"user.username": {
				required: true,
				remote: {
					    type: "post",
					    url: "validateusername.action",
					    dataType: "json",
						data: {
						  username: function() {
						  return $("#username").val()
						         }
						  }
					}
			},
			"user.password": {
				required: true,
				minlength: 6
			},
			"confirm_password": {
				required: true,
				minlength: 6,
				equalTo: '#password'
			},
			"user.sex": {
				required: true
			},
			"user.realName": {
				required: true
			},
			"user.email": {
				required: true,
				email: true
			},
			"user.phoneNumber": {
				required: true,
				number:true,
				minlength: 11,
				maxlength: 11

			},
			"user.identificationCard": {
				required: true,
				minlength: 18
			}
		},
		messages: {
			"user.username": {
				required: '用户名不能为空',
				remote:'用户名已存在'
			},
			"user.password":{
				required:'请输入密码',
				minlength:'密码不能小于6个字符'
			},
			"confirm_password": {
				required: '请输入确认密码',
				minlength: '确认密码不能小于6个字符',
				equalTo: '两次输入密码不一致不一致'
			},
			"user.sex": {
				required: "请选择性别"
			},
			"user.realName": {
				required: "请输入真实姓名"
			},
			"user.email": {
				required: "请输入电子邮箱",
				email: "请输入正确格式的电子邮箱"
			},
			"user.phoneNumber": {
				required: "请输入手机号码",
				minlength: "手机号码为11位",
				maxlength: "手机号码为11位",
				number:"请输入合法的数字"
			},
			"user.identificationCard": {
				required: "请输入身份证号码",
				minlength: "请正确输入您的身份证号码"
			}
		},
		errorPlacement: function(error, element) {
			error.appendTo(element.parent().next());
		}
	});
</script>
</body>
</html>