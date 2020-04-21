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
<title>Shamcey - Metro Style Admin Template</title>
<link rel="stylesheet" href="<%=basePath %>background/css/style.default.css" type="text/css" />

<link rel="stylesheet" href="<%=basePath %>background/css/responsive-tables.css">
<script type="text/javascript" src="<%=basePath %>background/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/jquery-ui-1.9.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/jquery.uniform.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/modernizr.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/responsive-tables.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/custom.js"></script>
<style type="text/css">
input{border:0;}

</style>
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
					<li><a href="index.jsp"><span
							class="iconfa-laptop"></span> 首页</a></li>
					<li class="dropdown"><a href=""><span class="iconfa-group"></span>
							订票客户管理</a>
						<ul>
							<li><a href="<%=basePath%>background/addcustomer.jsp">增加客户信息</a></li>
							<li><a href="<%=basePath%>queryCustomers">查询客户信息</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href=""><span
							class="iconfa-pencil"></span> 航班机票管理</a>
						<ul>
							<li><a href="../findwaiteOrderAction.action">订票审核</a></li>
							<li><a href="../findbounceOrderAction.action">退票管理</a></li>
							<li><a href="../findAllUserAllOrderAction.action">其他订单信息管理</a></li>
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
					<li><a href="printtable.jsp"><span class="iconfa-th-list"></span>
							报表打印管理</a></li>
					<c:if test="${admin.permission == 0}">
						<li class="dropdown active"><a href=""><span class="iconfa-user"></span>
								人员用户管理</a>
							<ul style="display:block;">
								<li class="active"><a href="<%=basePath %>background/addnormaladmin.jsp">增加普通管理员</a></li>
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
				<li><a href="dashboard.jsp"><i class="iconfa-home"></i></a> <span
					class="separator"></span></li>
				<li>查询普通管理员</li>
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
				<form action="results.jsp" method="post" class="searchbar">
					<input type="text" name="keyword"
						placeholder="To search type and hit enter..." />
				</form>
				<div class="pageicon">
					<span class="iconfa-laptop"></span>
				</div>
				<div class="pagetitle">
					
					<h1 style="padding-top: 7px;">所有管理员</h1>
				</div>
			</div>
			<!--pageheader-->

			<div class="maincontent">
				<div class="maincontentinner">

					<div class="maincontentinner">
						<h4 class="widgettitle">管理员信息</h4>
						<table class="table table-bordered responsive">
							<thead>
								<tr>
									<th class="centeralign"><input type="checkbox"
										class="checkall" /></th>
									<th>用户Id</th>
									<th>用户名</th>
									<th>密码</th>
									<th>权限</th>
									<th>操作</th>
								</tr>
							</thead>
							<c:if test="${not empty admins}">
								<tbody>
								<c:forEach var="admin" items="${admins}">
									<tr>
										<td class="centeralign"><input type="checkbox" /></td>
										<td>${admin.adminId }</td>
										<td>${admin.adminName }</td>
										<td>${admin.password} </td>
										<td>
											<c:if test="${admin.permission==0}">
											超级管理员
											</c:if>
											<c:if test="${admin.permission==1}">
											普通管理员
											</c:if>
										</td>
										<td class="centeralign">
												<a href="../findByIdAdmin?adminName=${admin.adminName}">
												<span class="icon-edit"></span></a>&nbsp;
												<form id="deleteAdmin" style="display: inline">
													<input type="hidden" name="adminName" value="${admin.adminName}">
													<input type="button" onclick="commit();" class="icon-trash">
												</form>
												<%-- <a href="../deleteAdmin.action?admin.administratorsId=${admin.adminName }" class="deleterow">
												<span class="icon-trash"></span>
												</a> --%>
												</td>
									</tr>
									</c:forEach>
								</tbody>
							</c:if>
						</table>
						
							<c:if test="${empty admins}">
								<center><h3>未获取到普通管理员信息</h3></center>
							</c:if>
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
				url:'../deleteAdmin',
				data:jQuery("#deleteAdmin").serialize(),
				type:"post",
				dataType:'json',
				success:function(data){
					alert(data.res)
					location.href="<%=basePath %>findAllAdmin"
				},error:function(data){
					alert("删除失败")
				}
			})
		}
	</script>
</body>
</html>
