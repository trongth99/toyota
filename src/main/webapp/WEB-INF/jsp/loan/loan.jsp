<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../layout/header2.jsp"%>
<%@include file="../layout/js.jsp"%>

<!-- Content Wrapper. Contains page content -->

<style>
.row {
	margin-bottom: 10px;
}

.path {
	float: right;
	background: transparent;
	margin-top: 0;
	margin-bottom: 0;
	font-size: 12px;
	padding: 7px 5px;
	border-radius: 2px;
}

.content-header {
	display: flex;
	flex-direction: column;
}

.content-wrapper {
	background-color: white;
}

.nameLoan {
	margin-top: 30px;
	border: 2px solid rgba(0, 53, 128, 0.08);
	border-bottom: none;
	height: 60px;
	display: flex;
    align-items: center;
    justify-content: space-between;
}

.fa-download {
	color: #366AE2;
}
.fa-eye {
  color: #366AE2;
}
.input {
	text-align: right;
}
</style>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header" style="border: 2px solid #F2F5F8">

		<h1>Danh sách khoản vay</h1>
		<ol class="path breadcrumb" style="position: static;">
			<li><a href="${contextPath}/loan">Khoản vay</a></li>
			<li class="active">Danh sách khoản vay</li>
		</ol>


	</section>

	<!-- Main content -->
	<form id="submitForm" action="" method="get">

		<div class="box box-danger"
			style="border-top-color: white; box-shadow: 0 -2px 1px rgb(0 0 0/ 10%);">
			<div class="container" style="width: 100%;">

				<div class="row " style="margin-top: 57px;">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<img src="${contextPath }/img/oto.png" class="user-image"
							alt="User Image"
							style="height: 33%; width: 100%; border-radius: 3px">
					</div>
					<div class="col-sm-2"></div>

				</div>

				<div class="row">
					<c:forEach items="${loans}" var="item" varStatus="status">

						<div class="col-sm-3">
<%-- onclick="javascript:window.location='${contextPath}/loan/detail?id=${item.id }'" --%>
							<div class="col-sm-12 nameLoan" >
								<!-- <div style="height: 10px; width: 10px;"></div> -->

								<div class="">
									<div>
									 <label>Khoản vay</label>
									<c:if test="${item.trangThai eq 'fail' }">
									
										<div style="color: red;">
											<!-- <i class="fa fa-exclamation-triangle" aria-hidden="true">  -->
												Chưa thanh toán
										</div>
									</c:if>
									<c:if test="${item.trangThai eq 'success' }">
										<div style="color: #2EB553;">
											
												Đã thanh toán
										</div>
									</c:if>
									</div>
									
									
									
								</div>
								<div class="pull-right" style="text-align: right;">
										<i class="fa fa-download" aria-hidden="true" style="margin-right: 10px;"></i>
										
										<i class="fa fa-eye" onclick="javascript:window.location='${contextPath}/loan/detail?id=${item.id }'"></i>
										
										
									</div>

							</div>



							<div class="col-sm-12"
								style="border: 2px solid rgba(0, 53, 128, 0.08);">
								<div class="row">
									<div class="col-sm-6">Số hợp đồng</div>
									<div class="col-sm-6 input">${item.soHopDong }</div>
								</div>
								<div class="row">
									<div class="col-sm-6">Biển số xe</div>
									<div class="col-sm-6 input">${item.bienSoXe }</div>
								</div>
								<div class="row">
									<div class="col-sm-6 ">Ngày hiệu lực</div>
									<div class="col-sm-6 input">
										<fmt:formatDate pattern="dd/MM/yyyy "
											value="${item.ngayHLuc }" />

									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">Ngày kết thúc</div>
									<div class="col-sm-6 input">
										<fmt:formatDate pattern="dd/MM/yyyy "
											value="${item.ngayKThuc }" />

									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">Số tiền vay</div>
									<div class="col-sm-6 input">${item.soTienVay }</div>
								</div>
								<div class="row">
									<div class="col-sm-6">Dư nợ còn lại</div>
									<div class="col-sm-6 input">${item.duNoConLai }</div>
								</div>
							</div>

						</div>
					</c:forEach>
				</div>

			</div>


			<!-- /.box-header -->






			<!-- /.box-body -->
		</div>

	</form>
	<!-- /.content -->
</div>

<%-- <%@include file="../layout/footer2.jsp"%> --%>