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
<title>添加公司机型</title>
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
<script type="text/javascript" src="<%=basePath %>background/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath %>background/js/custom.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
<script type="text/javascript">
	jQuery(document).ready(function() {
		// dynamic table
		jQuery('#dyntable').dataTable({
			"sPaginationType" : "full_numbers",
			"aaSortingFixed" : [ [ 0, 'asc' ] ],
			"fnDrawCallback" : function(oSettings) {
				jQuery.uniform.update();
			}
		});

		jQuery('#dyntable2').dataTable({
			"bScrollInfinite" : true,
			"bScrollCollapse" : true,
			"sScrollY" : "300px"
		});

	});
</script>
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
            </ul><!--headmenu-->
        </div>
    </div>
    
    <div class="leftpanel">
        
        <div class="leftmenu">        
            <ul class="nav nav-tabs nav-stacked">
					<li class="nav-header">Navigation</li>
					<li><a href="<%=basePath%>background/index.jsp"><span
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
					<li class="dropdown  active"><a href=""><span
							class=" iconfa-group"></span> 航空公司管理</a>
						<ul style="display:block;">
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
        </div><!--leftmenu-->
        
    </div><!-- leftpanel -->
    
    <div class="rightpanel">
        
        <ul class="breadcrumbs">
            <li><a href="index.jsp"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>增加航空公司</li>
            <li class="right">
                    <a href="" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-tint"></i> Color Skins</a>
                    <ul class="dropdown-menu pull-right skin-color">
                        <li><a href="default">Default</a></li>
                        <li><a href="navyblue">Navy Blue</a></li>
                        <li><a href="palegreen">Pale Green</a></li>
                        <li><a href="red">Red</a></li>
                        <li><a href="green">Green</a></li>
                        <li><a href="brown">Brown</a></li>
                    </ul>
            </li>
        </ul>
        
        <div class="pageheader">
            <div class="pageicon"><span class="iconfa-laptop"></span></div>
            <div class="pagetitle">
                <h1>
                	<form action="queryPname" class="editprofileform" method="post" >
						<select name="companyName">
							<c:forEach items="${companyList}" var="company">
								<option value ="${company.companyName}" >${company.companyName}</option>
							</c:forEach>
						</select>
						<input type="submit" class="btn btn-primary" >
					</form>
                </h1>
            </div>
        </div><!--pageheader-->
        <div class="maincontent">
 					<div class="maincontentinner">
						<h4 class="widgettitle">已经拥有的机型</h4>
						<c:if test="${empty pnameList}">
							<h4 align="center">没有查询到已有机型</h4>
						</c:if>
						<c:if test="${not empty pnameList}">
						<table class="table table-bordered responsive" >
							<thead>
								<tr>
									<th class="centeralign"></th>
									<th>机型号</th>
									<th>头等舱总数量</th>
									<th>公务舱总数量</th>
									<th>经济舱总数量</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
									<c:forEach items="${pnameList}" var="planemodel">
										<form action="<%=basePath%>deleteCnamePname" method="post">
										<tr>
											<td class="centeralign"></td>
											<input type="hidden" name="planemodelName" value="${planemodel.planemodelName}"/>
											<input type="hidden" name="companyName" value="${companyName}"/>
											<td>${planemodel.planemodelName}</td>
											<td>${planemodel.fnumber}</td>
											<td>${planemodel.bnumber}</td>
											<td>${planemodel.enumber}</td>
											<td class="centeralign"><input type="submit" class="btn btn-primary" value="移除"/></td>
										</tr>
										</form>
									</c:forEach>
								
							</tbody>
						</table>
						</c:if>
						<br>
						<h4 class="widgettitle">可以添加的机型</h4>
						<c:if test="${empty notPnameList}">
							<h4 align="center">没有查询到可添加机型</h4>
						</c:if>
						<c:if test="${not empty notPnameList}">
						<table class="table table-bordered responsive" >
							<thead>
								<tr>
									<th class="centeralign"></th>
									<th>机型号</th>
									<th>头等舱总数量</th>
									<th>公务舱总数量</th>
									<th>经济舱总数量</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								
									<c:forEach items="${notPnameList}" var="planemodel">
										<form action="<%=basePath%>insertCnamePname" method="post">
											<tr>
												<td class="centeralign"></td>
												<input type="hidden" name="planemodelName" value="${planemodel.planemodelName}"/>
												<input type="hidden" name="companyName" value="${companyName}"/>
												<td>${planemodel.planemodelName}</td>
												<td>${planemodel.fnumber}</td>
												<td>${planemodel.bnumber}</td>
												<td>${planemodel.enumber}</td>
												<td class="centeralign"><input type="submit" class="btn btn-primary" value="添加"/></td>
											</tr>
										</form>
									</c:forEach>
								
								
							</tbody>
						</table>
						</c:if>
					</div>
        </div><!--maincontent-->
        
    </div><!--rightpanel-->
    </div>
</body>
</html>

