<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../layout/header2.jsp"%>
<%@include file="../layout/js.jsp"%>

<!-- Content Wrapper. Contains page content -->

<style>
/* .row {
	margin-bottom: 10px;
} */

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
.col-sm-12 {
	margin-bottom: 10px;
}
.warming{
color: #366AE2;
background-color: #EDF2FD;
border-radius: 5px;
height: 40px;
margin-left: 15px;
}
.NdTT{
background-color: #F9FAFB;

border-radius: 5px;
}
.title{
border-top-left-radius: 10px;
border-top-right-radius: 10px;
background-color: #F9FAFB;
}
.titleDetail{
margin-left: 30px;
}
.pullRight{
text-align: right;
}
.input{
background-color: #F9FAFB;border: unset;
}
</style>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header" style="border: 2px solid #F2F5F8">

		<h1>
			Thanh toán sớm
		</h1>
		<ol class="path breadcrumb" style="position: static;">
			<li><a href="${contextPath}/loan">Khoản vay</a></li>
			<li class="active">Thanh toán sớm</li>
		</ol>


	</section>

	<!-- Main content -->
	<form id="submitForm" action="" method="get">

		<div class="box box-danger" style="border-top-color: white; box-shadow: 0 -2px 1px rgb(0 0 0/ 10%);">
			<div class="container" style="width: 100%;">

				<div class="row " style="margin-top: 57px;">

					<div class="col-sm-12">
						<%--  <img src="${contextPath }/img/oto.png" class="user-image" alt="User Image" style="height: 33%;width: 100%;border-radius: 3px"> --%>
					</div>


				</div>

				<div class="container">

					<div class="row">

						<div style="height: 65px;" class="col-sm-4">
							<h3>Hợp đồng cần thanh toán</h3>
							<c:forEach items="${loans}" var="item" varStatus="status">
								<div style="border: 2px solid #F2F5F8; border-radius: 5px; display: flex;" class="col-sm-12">
									<input type="radio" id="khoanVay" name="khoanVay" value="${item.id }" checked="checked">&ensp;
									<img src="${contextPath }/img/avtoto.jpg" class="user-image" alt="User Image"
										style="height: 80%; width: 20%; margin-top: 6px; border-radius: 3px">&emsp;
									<div
										style="display: flex; flex-direction: column; margin-top: -4px;">
										<h4>Hợp đồng ${item.soHopDong }</h4>
										Biển số xe: ${ item.bienSoXe }
										<%-- <input type="hidden" id="id" name="id" value="${item.id }"> --%>
									</div>
								</div>
							</c:forEach>


						</div>
						<div class="col-sm-7">
							
							<div class="row">

								
								<div class="col-sm-12">
									<div class="row title">
										<div class="titleDetail">
											<h3>Chi tiết số tiền trả nợ sớm</h3>
											Hợp đồng số:<input type="reset" class="input" id="soHD" name="soHd">
										</div>

									</div>
									<div class="row" style="border: 1px solid #F2F5F8;">
										<div class="col-sm-12" style="margin-top: 10px;">
											<div class="col-sm-6">Số tiền vay ban đầu</div>
											<div class="col-sm-6  pullRight"><input type="reset" class="input" id="goc" name="goc" style="background-color: white;"></div>
										</div>
										<div class="col-sm-12">
											<div class="col-sm-6">Dư nợ còn lại</div>
											<div class="col-sm-6 pullRight"><input type="reset" class="input" id="duNoConLai" name="duNoConLai" style="background-color: white;"></div>
										</div>
										<div class="col-sm-12">
											<div class="col-sm-6">Lãi suất vay</div>
											<div class="col-sm-6 pullRight">11%</div>
										</div>
										<div class="col-sm-12">
											<div class="col-sm-6">Lãi suất phạt trả sớm</div>
											<div class="col-sm-6 pullRight">1.401% vnd</div>
										</div>
										<div class="col-sm-12">
											<div class="col-sm-6">Ngày thanh toán tiếp theo</div>
											<div class="col-sm-6 pullRight">06/08/2020</div>
										</div>
									</div>
									<div class="row" style="border: 1px solid #F2F5F8;">
										<div class="col-sm-12" style="margin-top: 10px;">
											<div class="col-sm-6">Số tiền cần thanh toán</div>
											<div class="col-sm-6 pullRight">
												<input class=" form-control-sm" type="text" id="soTienTT" name="soTienTT" data-decimal="4" data-decimal-auto="4">
											</div>
										</div>
										<div id="tongTien" style="display: none;">
											<div class="col-sm-12">
												<div class="col-sm-12 NdTT">
													<div class="col-sm-12">
														<label>Thông tin quy định về trả nợ sớm</label>
													</div>
													<div class="col-sm-12">Nội dung về thông tin quy định
														sẽ hiển thị tại đây</div>
												</div>

											</div>
											<div class="col-sm-12">
												<div class="col-sm-6">Phạt trả nợ sớm</div>
												<div class="col-sm-6 pullRight"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "9800" /> vnd</div>
											</div>
											<div class="col-sm-12" style="color: red;">
												<div class="col-sm-6">Tổng số tiền cần thanh toán</div>
												<div class="col-sm-6 pullRight">
													<input type="reset" class="input" id="tongSTTT"
														name="tongSTTT" style="background-color: white;">
													vnd
												</div>
											</div>
											<div class="col-sm-12 ">
												<div class="col-sm-12 warming">
													<div style="margin: 10px;">
														<i class="fa fa-exclamation-triangle" aria-hidden="true"> Bảng
															tính chỉ mang tính tham khảo, vui lòng liên hệ TFSVN để
															được cung cấp thông tin cụ thể</i>
													</div>


												</div>

											</div>
											<%-- onclick="javascript:window.location='${contextPath}/loan/kieuTTSom'" --%>
											<div class="col-sm-12">
											   <input type="hidden" id="id" name="id" >
												<button type="button" class="btn btn-sm btn-danger pull-right" id="thanhToan" >Thanh toán ngay</button>
												 <button type="button" class="btn btn-sm btn-secondary pull-right" style="margin-right: 10px;">Lưu bảng tính</button>
											</div>
										</div>


										</br>
										

										</div>

									</div>
									

								</div>

							</div>
							

						</div>

						</div>
						

					</div>


					

				</div>


			</div>
		</div>

	</form>
</div>

<%-- <%@include file="../layout/footer2.jsp"%> --%>



<script type="text/javascript">

function formatNumber (num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
}



var id = $('input[name="khoanVay"]:checked').val();
$("#id").val(id);
 $(document).ready(function(){
	 console.log("ashbb");
	 console.log($("#id").val());
	
/* 	if($("#result_code").val() == "200"){
		swal({
		     title: "Thành công!",
		     text: "Thanh toán thành công",
		     type: "success",
		     timer: 3000,
			 showConfirmButton: false,
		     });
	} */
	var idKhoanVay = $('input[name="khoanVay"]:checked').val()
	var id = $('input[name="khoanVay"]:checked').val();
	 $.ajax({
		    url:'/toyota/api/loan/loanDetail?id='+idKhoanVay+'',
			
			type: 'POST',
			processData: false,
			contentType: 'application/json'
		}).done(function(data) {
			//console.log(data.soHopDong);
			$("#soHD").val(data.soHopDong);
			$("#goc").val(formatNumber(data.goc));
			$("#duNoConLai").val(formatNumber(data.duNoConLai));
			
		}).fail(function(data) {
			toastr.error("Lỗi kiểm tra thông tin");
			
		});
	
 
}); 
	  


 


	  $('input[type=radio][name=khoanVay]').change(function(){
	
	//	console.log($('input[name="khoanVay"]:checked').val())
		var idKhoanVay = $('input[name="khoanVay"]:checked').val()
	     $("#idLoan").val(idKhoanVay);
			
			 $.ajax({
				    url:'/toyota/api/loan/loanDetail?id='+idKhoanVay+'',
	    			
					type: 'POST',
					processData: false,
					contentType: 'application/json'
	    		}).done(function(data) {
	    			//console.log(data.soHopDong);
	    			$("#soHD").val(data.soHopDong);
	    			$("#goc").val(formatNumber(data.goc));
	    			$("#duNoConLai").val(formatNumber(data.duNoConLai));
	    			$("#id").val(data.id);
	    		}).fail(function(data) {
	    			toastr.error("Lỗi kiểm tra thông tin");
	    			
	    		});
			 
			 
			 //////////////
		
			 
			 
});
	  
	 /*   $("#soTienTT").blur(function(){
		  $.ajax({
			    url:'/toyota/api/loan/soTienTT?soTienTT='+$("#soTienTT").val()+'',
  			
				type: 'POST',
				processData: false,
				contentType: 'application/json'
  		}).done(function(data) {
  			$('#tongTien').show();
  			console.log(data.tongSTTT);
  			$("#tongSTTT").val(data.tongSTTT);
  			//$("#goc").val(data.goc);
  			//$("#duNoConLai").val(data.duNoConLai);
  			
  		}).fail(function(data) {
  			toastr.error("Lỗi kiểm tra thông tin");
  			
  		});
	  });   */
	  
	    $("#soTienTT").keypress(function(e){
		  if (e.keyCode == 13) {
			  $.ajax({
				    url:'/toyota/api/loan/soTienTT?soTienTT='+$("#soTienTT").val()+'',
	  			
					type: 'POST',
					processData: false,
					contentType: 'application/json'
	  		}).done(function(data) {
	  			//$('#tongTien').show();
	  			
	  			$("#tongTien").attr("style", "display:block")
	  			console.log(data.tongSTTT);
	  			$("#tongSTTT").val(formatNumber(data.tongSTTT));
	  		
	  			 window.stop();
	  		}).fail(function(data) {
	  			toastr.error("Lỗi kiểm tra thông tin");
	  			
	  		});
		}
		 
	  });  
	  
	  $("#thanhToan").click(function(){
		  $.ajax({
			    url:'/toyota/api/loan/kieuTTSom?soHD='+$("#soHD").val()+'',
			
				type: 'GET',
				processData: false,
				contentType: 'application/json'
		}).done(function(data) {
			
			location.href='/toyota/loan/kieuTTSom?soHD='+$("#soHD").val()+'';
		
			console.log(data);
			
		}).fail(function(data) {
			toastr.error("Lỗi kiểm tra thông tin");
			
		});
	  });
</script>