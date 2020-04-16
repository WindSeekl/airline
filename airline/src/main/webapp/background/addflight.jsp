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
<script type="text/javascript" src="<%=basePath %>background/js/modernizr.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/jquery.uniform.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/flot/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/responsive-tables.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/custom.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/My97DatePicker/calendar.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/My97DatePicker/WdatePicker.js"></script>
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
									<s:property value="#session.currentAdmin.username" /> <small>
									<s:if test="#session.currentAdmin.jurisdiction==1">
									普通管理员</s:if>
									<s:else>高级管理员</s:else></small>
								</h5>
								<ul>
									<li><a href="login.jsp">注销</a></li>
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
					<li class="active"><a href="../countOrderAction.action"><span
							class="iconfa-laptop"></span> 首页</a></li>
					<li class="dropdown"><a href=""><span class="iconfa-group"></span>
							订票客户管理</a>
						<ul>
							<li><a href="<%=basePath%>background/addcustomer.jsp">增加客户信息</a></li>
							<li><a href="<%=basePath%>queryCustomers">查询客户信息</a></li>
						</ul></li>
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
							<li><a href="addflightschedule.jsp">增加航班计划</a></li>
							<li><a href="../addscheduleFlightAction.action">安排航班计划</a></li>
							<li><a href="../findpastscheduleFlightAction.action">以往航班计划</a></li>
							<li><a href="../bgfindAllFlightAction.action">查询航班信息</a></li>
						</ul></li>
					<li class="dropdown"><a href=""><span
							class=" iconfa-group"></span> 航空公司管理</a>
						<ul>
							<li><a href="<%=basePath %>background/addcompany.jsp">增加航空公司</a></li>
							<li><a href="../showplanemodelCompanyAction.action">添加公司机型</a>
							<li><a href="<%=basePath %>queryCompanys">查询航空公司</a></li>
						</ul></li>
							<li class="dropdown"><a href=""><span
							class="iconfa-plane"></span> 机型管理</a>
						<ul>
							<li><a href="<%=basePath %>background/addplanemodel.jsp">增加机型</a></li>
							<li><a href="<%=basePath %>queryList">查询机型</a></li>
							<li><a href="<%=basePath %>queryPlanemodel">修改机型信息</a></li>
						</ul></li>	
					<li><a href="printtable.jsp"><span class="iconfa-th-list"></span>
							报表打印管理</a></li>
					<s:if test="#session.currentAdmin.jurisdiction==0">
					<li class="dropdown"><a href=""><span class="iconfa-user"></span>
							人员用户管理</a>
						<ul>
							<li><a href="addnormaladmin.jsp">增加普通管理员</a></li>
							<li><a href="../findAllAdmin.action">查询普通管理员</a></li>
						</ul></li></s:if>
				</ul>
			</div>
			<!--leftmenu-->

		</div>
		<!-- leftpanel -->

		<div class="rightpanel">

			<ul class="breadcrumbs">
				<li><a href="index.jsp"><i class="iconfa-home"></i></a> <span
					class="separator"></span></li>
				<li>增加航班信息</li>
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
					<h1>添加航班</h1>
				</div>
			</div>
			<!--pageheader-->
			<div class="maincontent">
				<div class="maincontentinner">
					<div class="row-fluid">
						<div class="span8" style="margin-left:20%;">
							<form action="#" class="editprofileform"
								method="post" id = "editprofileform">
								<div class="widgetbox personal-information">
									<h4 class="widgettitle">添加航班</h4>
									<div class="widgetcontent">
										<p>
											<label>航空公司:</label> 
											<select name="companyName" style="width:284px">
													<c:forEach items="${companyList}" var="company">
														<option value ="${company.companyName}" >${company.companyName}</option>
													</c:forEach>
											</select>
											
										</p>
										<p>
											<label>航班号：</label> 
											<input type="text"  name="flightNo" class="input-xlarge" value="" />
												
										</p>
										<p>
											<label>出发地:</label> <input type="text"  name="beginSite"
												class="input-xlarge" value="" />
												<!-- <span class="city_box">
										          <input type="text" name="beginSite" id="deptCd" class="input city" value="上海" onKeyUp="input_keyup();" onClick="append_city(this.id);" onBlur="input_blur()" onFocus="if(value=='上海'){value='';style.color='#606060';}" >
										          <input class="text" id="hid_city_name" name="index_city" style="display: none">
										          <input class="text" id="hid_real_city_name" name="real_index_city" style="display: none">
										         </span> -->
										</p>
										<p>
											<label>到达地:</label> 
											<input type="text" name="endSite"
												class="input-xlarge" value="" />
												<!-- <span class="city_box">
          										<input type="text" name="beginSite" id="arrDd" class="input city" value="广州" onKeyUp="input_keyup();" onClick="append_city(this.id);" onBlur="input_blur()" onFocus="if(value=='广州'){value='';style.color='#606060';}" >
          										</span> -->
										</p>
										<p>
											<label>出发机场:</label> <input type="text"  name="beginAir"
												class="input-xlarge" value="" />
										</p>
										<p>
											<label>到达机场:</label> <input type="text"  name="endAir"
												class="input-xlarge" value="" />
										</p>
										<p>
											<label>出发时间:</label> <input type="text" id="d241" name="beginTime"
												onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
												class="Wdate" style="width:270px" />
										</p>
										<p>
											<label>到达时间:</label> <input type="text" id="d241" name="endTime"
												onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
												class="Wdate" style="width:270px" />
										</p>
										<p>
											<label>头等舱价格:</label> <input type="text" style="width:270px" id="d241" name="fprice"
												 />
										</p>
										<p>
											<label>公务舱价格:</label> <input type="text" style="width:270px" id="d241" name="bprice"
												 />
										</p>
										<p>
											<label>经济舱价格:</label> <input type="text" style="width:270px" id="d241" name="eprice"
												 />
										</p>
										<p>
											<label>机型:</label> 
											<select name="planemodelName" style="width:284px">
													<c:forEach items="${planemodelList}" var="planemodel">
														<option value ="${planemodel.planemodelName}" >${planemodel.planemodelName}</option>
													</c:forEach>
											</select>
										</p>
										<p align="center">
											<input type="submit" class="btn btn-primary" onclick="commit()">
										</p>
									</div>
								</div>
							</form>
						</div>
						<!--span8-->
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
		<!--maincontent-->

	</div>
	<!--rightpanel-->
	<script type="text/javascript">
		function commit(){
			jQuery.ajax({
				url:'../insertFlight',
				data:jQuery("#editprofileform").serialize(),
				type:"post",
				dataType:'json',
				success:function(data){
					alert(data.res)
					if(data.res=="添加成功"){
						document.getElementById('editprofileform').reset();
					}
				},error:function(data){
					alert("失败")
				}
			})
		}
	</script>
</body>
</html>

