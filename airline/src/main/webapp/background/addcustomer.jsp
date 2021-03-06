<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>添加客户信息</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />

<link rel="stylesheet" href="css/responsive-tables.css">
<!-- <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script> -->
<!-- <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script> -->
<script src="../Script/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.9.2.min.js"></script>
<script type="text/javascript" src="js/modernizr.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery.uniform.min.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="js/responsive-tables.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
</head>

<body>
	<div class="mainwrapper">

		<div class="header">

			<div class="headerinner">
				<ul class="headmenu">
					<li class="right">
						<div class="userloggedinfo">
						<div class="userinfo">
								<h5>
								<c:if test="${admin.permission == 1}">
									普通管理员
								</c:if>
								<c:if test="${admin.permission == 0}">
									高级管理员
								</c:if>	
								</h5>
								<ul>
									<c:if test="${not empty admin}">
										<li><a href="<%=basePath %>logoutAdmin">注销</a></li>
									</c:if>
									<c:if test="${empty admin}">
										<li><a href="login.jsp">登录</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</li>
				</ul>
				<!--headmenu-->
			</div>
		</div>

		<div class="leftpanel">

			<div class="leftmenu">
				<ul class="nav nav-tabs nav-stacked">
					<li class="nav-header">Navigation</li>
					<li><a href="<%=basePath%>background/index.jsp"><span
							class="iconfa-laptop"></span> 首页</a></li>
					<li class="dropdown active"><a href=""><span class="iconfa-group"></span>
							订票客户管理</a>
						<ul style="display:block;">
							<li class="active"><a href="<%=basePath%>background/addcustomer.jsp">增加客户信息</a></li>
							<li><a href="<%=basePath%>queryCustomers">查询客户信息</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href=""><span
							class="iconfa-pencil"></span> 航班机票管理</a>
						<ul>
							<li><a href="<%=basePath%>queryAllReserve">订票审核</a></li>
							<li><a href="<%=basePath%>RefundAudit">退票管理</a></li>
						</ul></li>
					<li class="dropdown"><a href=""><span class="iconfa-plane"></span>
							航班信息管理</a>
						<ul>
							<li><a href="<%=basePath%>queryCompanyPlanemodel">增加航班信息</a></li>
							<li><a href="<%=basePath%>background/addflightschedule.jsp">增加航班计划</a></li>
							<li><a href="<%=basePath%>background/addschedule.jsp">安排航班计划</a></li>
							<li><a href="<%=basePath%>background/findschedule.jsp">以往航班计划</a></li>
							<li><a href="<%=basePath%>queryFlight">查询航班信息</a></li>
						</ul></li>
					<li class="dropdown"><a href=""><span
							class=" iconfa-group"></span> 航空公司管理</a>
						<ul>
							<li><a href="<%=basePath %>background/addcompany.jsp">增加航空公司</a></li>
							<li><a href="<%=basePath %>queryCnamePname">添加公司机型</a>
							<li><a href="<%=basePath %>queryCompanys">查询航空公司</a></li>
						</ul></li>
					<li class="dropdown"><a href=""><span class="iconfa-plane"></span>
							机型管理</a>
						<ul>
							<li><a href="<%=basePath %>background/addplanemodel.jsp">增加机型</a></li>
							<li><a href="<%=basePath %>queryList">查询机型</a></li>
							<li><a href="<%=basePath %>queryPlanemodel">修改机型信息</a></li>
						</ul></li>
					<li><a href="<%=basePath%>background/printtable.jsp"><span class="iconfa-th-list"></span>
							报表打印管理</a></li>
					<c:if test="${admin.permission == 0}">
						<li class="dropdown"><a href=""><span class="iconfa-user"></span>
								人员用户管理</a>
							<ul>
								<li><a href="addnormaladmin.jsp">增加普通管理员</a></li>
								<li><a href="<%=basePath %>findAllAdmin">查询普通管理员</a></li>
							</ul>
						</li>
					</c:if>
				</ul>
			</div>
			<!--leftmenu-->

		</div>
		<!-- leftpanel -->

		<div class="rightpanel">

			<ul class="breadcrumbs">
				<li><a href="index.jsp"><i class="iconfa-home"></i></a> <span
					class="separator"></span></li>
				<li>增加客户信息</li>

				<li class="right"><a href="" data-toggle="dropdown"
					class="dropdown-toggle"><i class="icon-tint"></i> Color Skins</a>
					<ul class="dropdown-menu pull-right skin-color">
						<li><a href="default">Default</a></li>
						<li><a href="navyblue">Navy Blue</a></li>
						<li><a href="palegreen">Pale Green</a></li>
						<li><a href="red">Red</a></li>
						<li><a href="green">Green</a></li>
						<li><a href="brown">Brown</a></li>
					</ul></li>
			</ul>

			<div class="pageheader">
				<div class="pageicon">
					<span class="iconfa-laptop"></span>
				</div>
				<div class="pagetitle">
					<h1>添加客户信息</h1>
				</div>
			</div>
			<!--pageheader-->

			<div class="maincontent">
				<div class="maincontentinner">
					<div class="row-fluid">
					<form action="#" class="editprofileform"
								method="post" id="editForm">
						<div class="span4 profile-left">


							<div class="widgetbox personal-information">
							
								<h4 class="widgettitle">个人资料</h4>
								<div class="widgetcontent">
									<p>
										<label>用户名:</label> <input type="text" name="customerName"
											class="input-xlarge" value="" />
									</p>
									<p>
										<label>密码:</label> <input type="password" name="password"
											class="input-xlarge" value="" />
									</p>
									<p>
										<label>确认密码:</label> <input type="password" name="retypepassword"
											class="input-xlarge" value="" />
									</p>
									<p>
										<label>性别:</label> <input type="radio" name="sex"
											class="input-xlarge" value="男" />男 <input type="radio"
											name="sex" class="input-xlarge" value="女" />女
									</p>
								</div>
							</div>

						</div>
						<!--span4-->
						<div class="span8">
								<div class="widgetbox personal-information">
									<h4 class="widgettitle">联系信息</h4>
									<div class="widgetcontent">
										<p>
											<label>真实姓名:</label> <input type="text" name="realName"
												class="input-xlarge" value="" />
										</p>
										<p>
											<label>身份证号:</label> <input type="text" name="IDNumber"
												class="input-xlarge" value="" />
										</p>

										<p>
											<label>联系电话：</label> <input type="text" name="phone"
												class="input-xlarge" value="" />
										</p>
										<p>
											<label>联系邮箱:</label> <input type="text" name="email"
												class="input-xlarge" value="" />
										</p>
										<p align="center">
								<input type="hidden" name="mark" value="增加">
											<button type="button" onclick="commit();" class="btn btn-primary">提交</button>
										</p>
									</div>
								</div>
							
						</div>
						<!--span8-->
						</form>
					</div>
					<!--row-fluid-->

					<div class="footer">
						<div class="footer-left">
							<span>&copy; 2013. Shamcey Admin Template. All Rights
								Reserved.</span>
						</div>
						<div class="footer-right">
							<span>Designed by: <a href="http://themepixels.com/">ThemePixels</a></span>
						</div>
					</div>
					<!--footer-->

				</div>
				<!--maincontentinner-->
			</div>
			<!--maincontent-->

		</div>
		<!--rightpanel-->

	</div>
	<!--mainwrapper-->
	<script type="text/javascript">
		function commit(){
			jQuery.ajax({
				url:'../insertCustomer',
				data:jQuery("#editForm").serialize(),
				type:"post",
				dataType:'json',
				success:function(data){
					alert(data.res)
					if(data.res=="增加成功"){
						document.getElementById('editForm').reset();
					}
				},error:function(data){
					alert("失败")
				}
			})
		}
	</script>
</body>
</html>
