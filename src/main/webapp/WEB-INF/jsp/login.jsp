
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="springForm"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin | Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <c:if test="${empty imageLogo }">
<link rel='SHORTCUT ICON' href='${contextPath }/img/logoscnew.ico' sizes="62x62" type='image/x-icon'  />
</c:if>   --%>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<!-- <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"> -->
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${contextPath}/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextPath}/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->

<link rel="stylesheet" href="${contextPath}/css/login.css">
</head>
<body style="background: white;">
	<div class="row"
		style="height: 100vh; overflow: hidden; margin: unset;">

		<div class="col-sm-6" style="padding: unset;">
			<img src="${contextPath }/img/anhlogin.jpg"
				class="user-image position-absolute img" alt="User Image"
				style="width: 100%;">
		</div>
		<div class="col-sm-6">

			<div class="login-box">

				<div class="login-logo">
					<img src="${contextPath}/img/logotoyota.png" alt="Logo"
						class="brand-image logo"></br></br>

					<h4>Đăng nhập vào tài khoản</h4>
				</div>
				<!-- /.login-logo -->
				
					<div class="card-body login-card-body">
						<c:if test="${not empty message }">
							<p class="login-box-msg" style="color: red;">${message }</p>
						</c:if>
						<form id="sign_in" method="POST" action="${contextPath}/login">
							<div>Số CMND / Mã số thuế</div>
							<div class="input-group mb-3">
								


								<div class="input-group-append"
									style="border-left: 1px solid #ced4da;">
									<div class="input-group-text">
										<span class="fas fa-user"></span>
									</div>
								</div>



								<input type="text" class="form-control" name="soCmt"
									placeholder="Số CMND / Mã số thuế" required autofocus
									style="border-right: 1px solid #ced4da;">

							</div>
							<div>Mật khẩu</div>
							<div class="input-group mb-3">
								<div class="input-group-append"
									style="border-left: 1px solid #ced4da;">
									<div class="input-group-text">
										<span class="fas fa-lock"></span>
									</div>
								</div>
								<input type="password" class="form-control" name="password"
									placeholder="Nhập mật khẩu" required
									style="border-right: 1px solid #ced4da;">

							</div>
							

								<!-- /.col -->
								<div class="btnDn">
									<button type="submit" class=" input-group  btn btn-danger ">Đăng nhập</button>
								</div>
								
						<div class="textDk"></br>
							<div><u>Quên mật khẩu?</u></div></br>
							<div>
								<u>Điều khoản</br> Chính sách bảo mật</u>
							</div>
						</div>

						<!-- /.col -->
							
						</form>
					</div>
					<!-- /.login-card-body -->
				
			</div>
		</div>

	</div>



	<script src="${contextPath}/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextPath}/js/adminlte.min.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>
