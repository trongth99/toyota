<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="springForm"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><spring:message code="title" text="Quản trị"/></title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<%-- <c:if test="${empty imageLogo }">
<link rel='SHORTCUT ICON' href='${contextPath }/img/logoscnew.ico' sizes="62x62" type='image/x-icon'  />
</c:if>  --%> 
<%-- <link rel="stylesheet" href="${contextPath }/css/fonts.css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"> --%>
<script src="${contextPath }/plugins/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="${contextPath }/css/lte2/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="${contextPath }/css/lte2/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="${contextPath }/css/lte2/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextPath }/css/select2.min.css">
<link rel="stylesheet" href="${contextPath }/css/lte2/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="${contextPath }/css/lte2/dist/css/skins/skin-blue-light.min.css">

<link rel="stylesheet" href="${contextPath }/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="${contextPath }/css/midpoint.css">
<link rel="stylesheet" href="${contextPath }/plugins/toastr/toastr.min.css">
<link rel="stylesheet" href="${contextPath }/plugins/pace-progress/themes/black/pace-theme-flat-top.css">


<script src="${contextPath }/plugins/toastr/toastr.min.js"></script>
<link href="${contextPath }/plugins/sweetalert/sweetalert.css" rel="stylesheet" />
<link href="${contextPath }/css/sweetalert.min.css" rel="stylesheet" />
<script src="${contextPath }/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${contextPath }/js/sweetalert2.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<script src="${contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

  <link href="${contextPath }/css/jquery-ui.css" rel="stylesheet">  
      <script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
      <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>  
      
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script  src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script> 


<script type="text/javascript">
    var contextPath = '${contextPath}';
    $(document).ready(function(){
        // Active menu
        $("#menu_left .treeview").each(function(){
            var obj = $(this);
            $(this).find("ul li a").each(function(){
            	var url = contextPath+window.location.pathname;
                if(url.startsWith(contextPath+$(this).attr("href")+"/") || (contextPath+$(this).attr("href")) == url) {
                    obj.addClass("menu-open");
                    obj.find("a").eq(0).parent().addClass("active");
                    $(this).parent().addClass("active");
                }
            });
        });
        var home = contextPath + "/";
        if(contextPath+window.location.pathname == home) {
        	$("#home_menu").parent().addClass("active");
        }
        $(".treeview").each(function(){
        	if($(this).find(".treeview-menu li").length == 0) {
        		$(this).hide();
        	} else {
        		$(this).show();
        	}
        });
    });

</script>

<style type="text/css">
@media only screen and (max-width: 900px) {
	.box-header>.box-tools {
		position: relative;
		left: 0px;
	}
}

label.error {
	font-weight: normal !important;
	color: red;
}

.col-xs-12 {
	background: white;
}

.img-thumbnail {
	max-width: 400px;
	max-height: 150px;
}
.navbar-static-top{

}
.fa-search{
color: black;
}
.fa-bell{
color: black;
}
.fa-envelope{
color: black;
}

</style>
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue-light">
	<div class="wrapper">
		<header class="main-header" style="border-color: white;">
			<a href="${contextPath }/loan" class="logo">
				<span class="logo-mini" style="color:red;">
					<b>T</b>
					OYOTA
				</span>
				<span class="logo-lg" style="   background-color: white;">
					<c:if test="${empty imageLogo }">	
				      	<img style="width: 100px; height: 30px; scale: 1.8;" src="${contextPath}/img/logotoyota.png" alt="Logo" class="brand-image elevation-3">
				    </c:if>  
				    <c:if test="${not empty imageLogo }">	
				      	<img src="${imageLogo }" alt="Logo" class="brand-image elevation-3">
				    </c:if>  
				</span>
			</a>
			<nav class="navbar navbar-static-top" role="navigation" style="background-color: white;">
				<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
					<span class="sr-only">Toggle navigation</span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown notifications-menu">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-globe"></i>
							</a>
							<ul class="dropdown-menu">
								<li>
									<ul class="menu">
										<li>
											<a href="${contextPath }/language?language=en" class="dropdown-item"> English </a>
										</li>
										<li>
											<a href="${contextPath }/language?language=vi" class="dropdown-item"> Việt Nam </a>
										</li>
									</ul>
								</li>
							</ul>
						</li>
						<li class="dropdown user user-menu">
							<a href="${contextPath }/ca-nhan" class="dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-search" aria-hidden="true"></i>
								<i class="fa fa-bell" aria-hidden="true"></i>
								<i class="fa fa-envelope" aria-hidden="true"></i>
								<img src="${contextPath }/img/avt.jpg" class="user-image" style="float: right;margin-left: 10px;">
								<%-- <span class="hidden-xs">${username}</span> --%>
							</a>
							<ul class="dropdown-menu">
								<li class="user-footer">
									<div class="pull-left" >
										<a href="${contextPath }/change-pass" style="color: black;" class="btn btn-default btn-flat"><spring:message code="doi_mat_khau" /></a>
									</div>
									<div class="pull-right">
										<a href="${contextPath }/logout" class="btn btn-default btn-flat"><spring:message code="dang_xuat" /></a>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar Menu -->
				<ul class="sidebar-menu" data-widget="tree" id="menu_left">
					<!-- <li class="header">ADMINISTRATION</li> -->

					<%-- <li class="nav-item">
						<a href="${contextPath }/" class="nav-link" id="home_menu">
							<i class="nav-icon fa fa-home"></i>
							<span><spring:message code="trang_chu" text="Trang chủ"/></span>
							
						</a>
					</li> --%>
					
					<c:forEach items="${userModuleMenus}" var="item">
						<li class="treeview">
							<c:if test="${item.parentId eq 0}">
								<a href="javascript:void(0);">
									<%-- <i class="${item.icon}"></i>  --%>
									<span>  <%-- <spring:message code="${item.name }" text="${item.name }"/> --%>  Khoản vay </span>
									<span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
								
								<ul class="treeview-menu">
									<c:forEach items="${userModuleMenus}" var="itemChild">
										<c:if test="${(itemChild.url ne '/xoa-ekyc-doanh-nghiep') and (itemChild.url ne '/xem-ekyc-doanh-nghiep') and (itemChild.url ne '/download-ekyc-doanh-nghiep')}">
											<c:if test="${itemChild.parentId eq item.id}">
												<li>
													<a href="${contextPath}<c:out value='${itemChild.url }'/>">
														<!-- <i class="fa fa-minus"></i> -->
														<span>&emsp;&emsp;<spring:message code="${itemChild.name }" text="${itemChild.name }"/></span>
													</a>
												</li>
											</c:if>
										</c:if>
									</c:forEach>
								</ul>
							</c:if>
						</li>
						
					</c:forEach>
					<li >
						          <a href="javascript:void(0);">
									<%-- <i class="${item.icon}"></i> --%>
									<span> <%-- <spring:message code="${item.name }" text="${item.name }"/> --%> Yêu cầu hỗ trợ </span>
									<span class="pull-right-container">
										<!-- <i class="fa fa-angle-left pull-right"></i> -->
									</span>
								</a>
						
					</li>
				</ul>
			</section>
		</aside>