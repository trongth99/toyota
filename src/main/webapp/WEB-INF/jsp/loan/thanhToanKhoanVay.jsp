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

.container {
	margin-left: auto;
	margin-right: auto;
}

.pay {
	border-radius: 3px;
	background-color: rgba(0, 53, 128, 0.2);
	height: 40px;
	margin-left: auto;
	margin-right: auto;
	display: flex;
	align-items: center;
}

.pre:hover {
	border: none;
	border-bottom-color: 1px soid #ddd;
}
.col-sm-12{
margin-bottom: 10px;
}
.nameTT{
	margin: auto;
}
}
</style>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">

		<h1>
			Thanh toán trực tuyến
		</h1>
		<ol class="path breadcrumb" style="position: static;">
			<li><a href="${contextPath}/loan">Khoản vay</a></li>
			<li class="active">Thanh toán trực tuyến</li>
		</ol>


	</section>

	<!-- Main content -->
	 <form id="submitForm" action="" method="get">

	<div class="box box-danger" style="border-top-color: #d2d6de;">
		<div class="container" style="width: 100%;">

			<div class="row " style="margin-top: 57px;">

				<div class="col-sm-12">
					<%--  <img src="${contextPath }/img/oto.png" class="user-image" alt="User Image" style="height: 33%;width: 100%;border-radius: 3px"> --%>
				</div>


			</div>

			<div class="container">

				<div class="row">
					
						<div style="height: 65px;" class="col-sm-4">
						<h3 >Hợp đồng cần thanh toán</h3>
							<div style="border: 2px solid  #F2F5F8;border-radius: 5px;  display: flex;" class="col-sm-12">
							      <input type="radio" id="html" name="" checked="checked">&ensp;
							     <img src="${contextPath }/img/avtoto.jpg" class="user-image" alt="User Image" style="height: 80%; width: 20%;margin-top: 6px; border-radius: 3px">&emsp;
							     <div style="display: flex; flex-direction: column; margin-top: -4px;">
										<h4>Hợp đồng ${Loan.soHopDong }</h4>
										Biển số xe: ${ Loan.bienSoXe }
								 </div>
							</div>
						     
						</div>
						
						<div class="col-sm-6">
						<h3 style="margin-top: 45px;">Chọn hình thức thanh toán</h3>
						     <div class="row">
							     <div  class="col-sm-12 tt">
									<div style="border: 2px solid  #F2F5F8;border-radius: 5px;  display: flex;height: 65px;" class="col-sm-12">
										      <input type="radio" id="html" name="fav_language" checked="checked">&ensp;
										     <img src="${contextPath }/img/nghang.png" class="user-image" alt="User Image" style="height: 85%; width: 10%;margin-top: 6px; border-radius: 3px">&emsp;
										     <div style="display: flex; flex-direction: column; ">
													<h4 class="nameTT">Cổng thông tin khách hàng</h4>
													
											 </div>
										</div>
									     
								</div></br>
								 <div  class="col-sm-12">
									<div style="border: 2px solid  #F2F5F8;border-radius: 5px;  display: flex;height: 65px;" class="col-sm-12">
										      <input type="radio" id="html" name="fav_language" checked="checked">&ensp;
										     <img src="${contextPath }/img/shoppe.jpg" class="user-image" alt="User Image" style="height: 85%; width: 10%;margin-top: 6px; border-radius: 3px">&emsp;
										     <div style="display: flex; flex-direction: column; ">
													<h4 class="nameTT">Shoppe pay</h4>
													
											 </div>
										</div>
									     
								</div></br>
								 <div  class="col-sm-12">
									<div style="border: 2px solid  #F2F5F8;border-radius: 5px;  display: flex;height: 65px;" class="col-sm-12">
										      <input type="radio" id="html" name="fav_language" checked="checked">&ensp;
										     <img src="${contextPath }/img/logonh.png" class="user-image" alt="User Image" style="height: 85%; width: 10%;margin-top: 6px; border-radius: 3px">&emsp;
										     <div style="display: flex; flex-direction: column;">
													<h4 class="nameTT">Nộp tiền mặt qua Payoo và Viettel</h4>
													
											 </div>
										</div>
									     
								</div></br>
								<div  class="col-sm-12">
									<div style="border: 2px solid  #F2F5F8;border-radius: 5px;  display: flex;height: 65px;" class="col-sm-12">
										      <input type="radio" id="html" name="fav_language" checked="checked">&ensp;
										     <img src="${contextPath }/img/foxpay.png" class="user-image" alt="User Image" style="height: 85%; width: 10%;margin-top: 6px; border-radius: 3px">&emsp;
										     <div style="display: flex; flex-direction: column; ">
													<h4 class="nameTT">Foxpay</h4>
													
											 </div>
										</div>
									     
								</div>
						     </div>
						
						</div>
						<div class="col-sm-12 ">
				                      <div class="col-sm-10">
				                           <button type="button" class="btn btn-sm btn-danger pull-right"  onclick="openFoxpay(this)" >Thanh toán ngay</button>
				                             
				                           
				                      </div>
				                      
				          </div>
						
					</div>
					
					
					<input type="hidden" id="order_id" name="order_id" value="${Loan.soHopDong }">
                    <input type="hidden" id="amount" name="amount" value="${LoanDetail.tienTToan }">

				</div>
				

			</div>
		</div>
	
	</form>
</div>

<%-- <%@include file="../layout/footer2.jsp"%> --%>



<script type="text/javascript">

	function openFoxpay(obj) {

		var data = {
			"order_id" : $("#order_id").val(),
			"amount" : $("#amount").val(),
		};
		console.log("zhjdbhjabsdas");
		$.ajax({
					url : '${contextPath }/loan/thanhToan',
					data : JSON.stringify(data),
					type : 'POST',
					processData : false,
					contentType : false
				}).done(function(data) {
					console.log(data);
					location.href = data;

				}).fail(function(data) {
							toastr.error("<spring:message code="ekycdn.loi_kiem_tra_thong_tin" />");
							$(obj).button('reset');
						});
	}
</script>