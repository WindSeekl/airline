<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Shamcey - Metro Style Admin Template</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />

<link rel="stylesheet" href="css/responsive-tables.css">
<link rel="stylesheet" href="../Stylesheets/printtable.css">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
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
<script type="text/javascript" src="../Script/jquery-1.8.3.min.js"></script>
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
					<li><a href="../countOrderAction.action"><span
							class="iconfa-laptop"></span> 首页</a></li>
					<li class="dropdown"><a href=""><span class="iconfa-group"></span>
							订票客户管理</a>
						<ul>
							<li><a href="addcustomer.jsp">增加客户信息</a></li>
							<li><a href="../BgfindAllUser.action">查询客户信息</a></li>
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
							<li><a href="../findCompanyFlightAction.action">增加航班信息</a></li>
							<li><a href="addflightschedule.jsp">增加航班计划</a></li>
							<li><a href="../addscheduleFlightAction.action">安排航班计划</a></li>
							<li><a href="../findpastscheduleFlightAction.action">以往航班计划</a></li>
							<li><a href="../bgfindAllFlightAction.action">查询航班信息</a></li>
						</ul></li>
					<li class="dropdown"><a href=""><span
							class=" iconfa-group"></span> 航空公司管理</a>
						<ul>
							<li><a href="addcompany.jsp">增加航空公司</a></li>
							<li><a href="../showplanemodelCompanyAction.action">添加公司机型</a>
							<li><a href="../findCompanyAction.action">查询航空公司</a></li>
						</ul></li>
							<li class="dropdown"><a href=""><span
							class="iconfa-plane"></span> 机型管理</a>
						<ul>
							<li><a href="addplanemodel.jsp">增加机型</a></li>
							<li><a href="../findPlaneModelAction.action">查询机型</a></li>
						</ul></li>	
					<li  class="active"><a href="printtable.jsp"><span class="iconfa-th-list"></span>
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
				<li><a href="dashboard.jsp"><i class="iconfa-home"></i></a> <span
					class="separator"></span></li>
				<li>报表打印管理</li>
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
					<h5>All Features Summary</h5>
					<h1>Dashboard</h1>
				</div>
			</div>
			<!--pageheader-->

			<div class="maincontent">
				<div class="maincontentinner">
				<div style="margin-left: 100px;">
				 
				 <div style="width: 500px;">
				<form action="../findByIdentificationCardOrderAction.action" method="post" id="identificationCardform">
				<h5> 输入身份证号: &nbsp;</h5> 
				<input type="text" name="identificationCard" id="identificationCard">&nbsp;
				 <button id="searchidentificationCard" type="button" class="btn btn-primary">提交</button>
				 </form>
				 </div>
                 <br>
                <table class="table responsive">
               <thead>
               <tr><h4 class="widgettitle" style="text-align: center; width: 770px;">登机牌BORDING PASS</h4></tr>
               </thead>
                    <tbody>
                    <tr> <div style="height:5px; width:800px; background-color: red; ">&nbsp</div> </tr>
                        <tr>
                            <th style="background-color: white; color: black; ">航班</th>
                            <th>航班&nbsp;&nbsp;FLIGHT</th>
                            <th>日期&nbsp;&nbsp;DATE</th>
                            <th>舱位&nbsp;&nbsp;CALSS</th>
                            <th>单号&nbsp;&nbsp;SERIAL .NO</th>
                            <th>价格&nbsp;&nbsp;PRICE</th>
                        </tr>
                        <tr>
                            <td>Trident</td>
                            <td>${writeorder.flightNumber}</td>
                            <td>${writeorder.startTime }</td>
                            <td>${writeorder.cabinClass}</td>
                            <td>${writeorder.orderId }</td>
                            <td>${writeorder.price }</td>
                        </tr>
                        <tr>
                        <th>目的地 TO</th>
                        <th>目的地 TO</th>
                        <th>始发地FROM</th>
                        <th>姓名 NAME</th>
                        <th>身份证号 ID .NO</th>
                        <th></th>
                        </tr>
                        <tr>
                            <td>Trident</td>
                            <td>${writeorder.endPoint }</td>
                            <td>${writeorder.startPoint}</td>
                            <td>${writeorder.name}</td>
                            <td>${writeorder.identificationCard }</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                
               
                </div>
                 <div style="width:800px; border-bottom: 1px solid #ddd; margin-left: 450px;"><button id="writeOrder" style="width:80px;hieght:50px;">
                 <input id="orderId" value="${writeorder.orderId}" style="display: none;">打印
                 </button></div>
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

$("#searchidentificationCard").click(function() {
	$.ajax({
        type: "post",
        url: "../validateidentificationCard.action",
        data: {identificationCard:$("#identificationCard").val()},
        dataType: "json",
        success: function(data){
        	if(data){
	        	$("#identificationCardform").submit();
	        	postForm();}
        	else{
        	  alert("无该身份证的机票"); }
        }
	 });
});
$("#writeOrder").click(function() {
	$.ajax({
        type: "post",
        url: "../writeIdentificationCardOrderAction",
        data: {orderId:$("#orderId").val()},
        dataType: "json",
        success: function(data){
        	alert("打印成功");
        }
	 });
});
</script>

</body>
</html>

