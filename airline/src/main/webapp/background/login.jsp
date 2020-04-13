<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Shamcey - Metro Style Admin Template - shared on
	themelock.com</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<link rel="stylesheet" href="css/style.shinyblue.css" type="text/css" />

<script type="text/javascript" src="../Script/jquery-1.8.3.min.js"></script>

</head>

<body class="loginpage">

	<div class="loginpanel">
		<div class="loginpanelinner">

			<form id="login1" action="../loginAdmin.action" method="post">
				<div class="inputwrapper login-alert">
					<div class="alert alert-error">用户名或密码不正确</div>
				</div>
				<div class="inputwrapper animate1 bounceIn">
					<input type="text" name="admin.username" id="username"
						placeholder="请输入用户名" />
				</div>
				<div class="inputwrapper animate2 bounceIn">
					<input type="password" name="admin.password" id="password"
						placeholder="请输入密码" />
				</div>
				<div class="inputwrapper animate3 bounceIn">
					<button type="button"  id="adminlogin">登录</button>
				</div>
			</form>
		</div>
		<!--loginpanelinner-->
	</div>
	<!--loginpanel-->

	<div class="loginfooter">
		<p>&copy; 2013. Shamcey Admin Template. All Rights Reserved.</p>
	</div>
	<script type="text/javascript">
		$("#adminlogin").click(function() {
			$.ajax({
				type : "post",
				url : "../validateadmin.action",
				data : {
					adminUsername : $("#username").val(),
					password : $("#password").val()
				},
				dataType : "json",
				success : function(data) {
					if (data) {
						$("#login1").submit();
						postForm();
					} else {
						alert("用户名或密码错误");
					}
				}
			});
		});
	</script>
</body>
</html>
