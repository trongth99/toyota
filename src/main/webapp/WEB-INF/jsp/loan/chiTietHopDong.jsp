<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../layout/header2.jsp"%>
<%@include file="../layout/js.jsp"%>

<!-- Content Wrapper. Contains page content -->

<style>
.row{
margin-bottom: 10px;
}
.path{
    float: right;
    background: transparent;
    margin-top: 0;
    margin-bottom: 0;
    font-size: 12px;
    padding: 7px 5px;

    border-radius: 2px;
}
.content-header{
display: flex;
flex-direction: column;
}
.content-wrapper{
   background-color: white;
}
.container{
margin-left: auto;
margin-right: auto;
}
.pay{
border: solid 2px white;
border-top-color: rgba(0, 53, 128, 0.08);
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
}
</style>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header"style="border: 2px solid #F2F5F8">

	    <h1>
			Chi tiết hợp đồng
		</h1>
		<ol class="path breadcrumb" style="position: static;">
			<li><a href="${contextPath}/loan">Khoản vay</a></li>
			<li class="active">Chi tiết hợp đồng</li>
		</ol>

		
	</section>

	<!-- Main content -->
	<!-- <form id="submitForm" action="" method="get"> -->
		
			<div class="box box-danger" style="border-top-color: white;">
					<div class="container" style="width: 100%;">
						
						<div class="row " style="margin-top: 57px;">
						    
						    <div class="col-sm-12">
						   <%--  <img src="${contextPath }/img/oto.png" class="user-image" alt="User Image" style="height: 33%;width: 100%;border-radius: 3px"> --%>
						     </div>
						    
						
						</div>	
	                  
	                  <div class="container">
	                  
		                  <div class="row">
		                        <div class="col-sm-1">
						            <img src="${contextPath }/img/avtoto.jpg" class="user-image" alt="User Image" style="height: 50%;width: 100%;border-radius: 3px">
		                        </div>
						        <div  style="display: flex;flex-direction: column;margin-top: -10px;" class="col-sm-3">
						              <h4 >Hợp đồng ${Loan.soHopDong }</h4> 
						              Biển số xe: ${Loan.bienSoXe }
						              
						           
				                 </div>
				                    <div class=" col-sm-6 text-right" >
									<c:if test="${Loan.trangThai eq 'fail' }">
									
										<div style="color: red;">
											<!-- <i class="fa fa-exclamation-triangle" aria-hidden="true">  -->
												Chưa thanh toán
										</div>
									</c:if>
									<c:if test="${Loan.trangThai eq 'success' }">
										<div style="color: #2EB553;">
											
												Đã thanh toán
										</div>
									</c:if>
			
								</div>
				                 <input type="hidden" id="order_id" name="order_id" value="${Loan.soHopDong }">
							                   <input type="hidden" id="order_id" name="order_id" value="${Loan.id }">
			
								
							</div>
		                  <div class="row">
		                        <div class="col-sm-12">
						           <h4>Chi tiết số tiền thanh toán</h4> 
		                        </div>
		                        <div class="col-sm-12">
								    <div class="col-sm-6">
								          <div class="row">
										          <div  class="col-sm-6">
										             Gốc
								                 </div>
								                 <div  class="col-sm-6">
										             <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LoanDetail.goc }" />  vnd
								                 </div>
								          </div>
								          <div class="row">
								                <div  class="col-sm-6">
										             Lãi
								                 </div>
								                 <div  class="col-sm-6">
								                   <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LoanDetail.lai }" />  vnd
										             
								                 </div>
								          </div>
								          <div class="row">
								                <div  class="col-sm-6">
										            Phạt trễ hạn
								                 </div>
								                 <div  class="col-sm-6">
								                   <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LoanDetail.phatTreHan }" />  vnd
										             
								                 </div>
								          </div>
								          
						                 
					                 </div>
					                 <div class="col-sm-6">
								          <div class="row">
										          <div  class="col-sm-6">
										             Phạt trễ hạn/ Tiền dư
								                 </div>
								                 <div  class="col-sm-6">
								                  <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LoanDetail.tienDu }" />  vnd
										             
								                 </div>
								          </div>
								          <div class="row">
								                <div  class="col-sm-6">
										             Số ngày trễ hạn
								                 </div>
								                 <div  class="col-sm-6">
								                 
										              ${LoanDetail.soNgayTreHan }
								                 </div>
								          </div>
								          <div class="row">
								                <div  class="col-sm-6">
										            Ngày đến hạn
								                 </div>
								                 <div  class="col-sm-6">
								                 <fmt:formatDate pattern = "dd/MM/yyyy " value = "${LoanDetail.ngayHetHan }" />
										              
								                 </div>
								          </div>
								          
						                 
					                 </div>
					                  
		                        </div>
		                        <div  class="col-sm-10" >
		                                  <div class="row pay" >
		                                       <div class="col-sm-6 ">Số tiền cần thanh toán</div>
						                       <div class="col-sm-6 " style="text-align: right; color: red;" > <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LoanDetail.tienTToan }" />  vnd </div>
						                       <input type="hidden" id="amount" name="amount" value="${LoanDetail.tienTToan }">
		                                  </div>
						                 
				                 </div>
				                 <div class="col-sm-12 ">
				                      <div class="col-sm-10">
				                           <!--  <button type="button" class="btn btn-sm btn-danger pull-right"  onclick="openFoxpay(this)" >Thanh toán ngay</button> -->
				                          
				                          
				                            <button type="button" class="btn btn-sm btn-danger pull-right"   onclick="javascript:window.location='${contextPath}/loan/kieuTT?id=${Loan.id }'">Thanh toán ngay</button>
				                           
				                            
				                           
				                      </div>
				                      
				                 </div>
				                 <div class="col-sm-10">
								    <div class="group-tabs">
								      <!-- Nav tabs -->
								      <ul class="nav nav-tabs" role="tablist">
								        <li role="presentation" ><a class="pre" href="#home" aria-controls="home" role="tab" data-toggle="tab">Kế hoạch thanh toán</a></li>
								        <li role="presentation" class="active "><a class="pre" href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Lịch sử thanh toán</a></li>
								        <li role="presentation" ><a class="pre" href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Bảo hiểm xe</a></li>
								        <li role="presentation" ><a class="pre" href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Giấy biên nhận thế chấp</a></li>
								        
								      </ul>
								
								      <!-- Tab panes -->
								      <div class="tab-content">
								        <div role="tabpanel" class="tab-pane active" id="home">
											   <table class="table table-bordered " style="margin-top: 30px;">
											    <thead>
											      <tr>
											        <th style="border-right: none;border-bottom: none;">Kỳ đã thanh toán 1</th>
											        <th style="border-bottom: none;border-left:none;border-right: none;"></th>
											        <th style="border-left: none;border-bottom: none;text-align: right;color: #366AE2;"><i class="fa fa-eye" aria-hidden="true"></i>&ensp;Xem hóa đơn</th>
											        
											      </tr>
											    </thead>
											    <tbody>
											      <tr>
											        <td>
											          <div class="row">
												          <div class="col-sm-6">
												          Ngày giao dịch
												          </div>
												          <div class="col-sm-6">
												          25/3/2020
												          </div>
											          </div>
											          <div class="row">
												          <div class="col-sm-6">
												          Ngày hiệu lực
												          </div>
												          <div class="col-sm-6">
												          25/3/2020
												          </div>
											          </div>
											        </td>
											         <td>
											             <div class="row">
												          <div class="col-sm-6">
												          Số tiền gốc
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											          <div class="row">
												          <div class="col-sm-6">
												          Số tiền lãi
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											        </td>
											        <td>
											             <div class="row">
												          <div class="col-sm-6">
												          Phí phạt
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											          <div class="row">
												          <div class="col-sm-6">
												          Dư nợ
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											        
											        </td>
											        
											      </tr>
											     
											    
											    </tbody>
											  </table>
								        </div>
								        <div role="tabpanel" class="tab-pane" id="profile">
								        <table class="table table-bordered " style="margin-top: 30px;">
											    <thead>
											      <tr>
											        <th style="border-right: none;border-bottom: none;">Kỳ đã thanh toán 1</th>
											        
											      </tr>
											    </thead>
											    <tbody>
											      <tr>
											        <td>
											          <div class="row">
												          <div class="col-sm-6">
												          Ngày giao dịch
												          </div>
												          <div class="col-sm-6">
												          25/3/2020
												          </div>
											          </div>
											          <div class="row">
												          <div class="col-sm-6">
												          Ngày hiệu lực
												          </div>
												          <div class="col-sm-6">
												          25/3/2020
												          </div>
											          </div>
											        </td>
											         <td>
											             <div class="row">
												          <div class="col-sm-6">
												          Số tiền gốc
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											          <div class="row">
												          <div class="col-sm-6">
												          Số tiền lãi
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											        </td>
											        <td>
											             <div class="row">
												          <div class="col-sm-6">
												          Phí phạt
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											          <div class="row">
												          <div class="col-sm-6">
												          Dư nợ
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											        
											        </td>
											        
											      </tr>
											     
											    
											    </tbody>
											  </table>
								        </div>
								        <div role="tabpanel" class="tab-pane" id="messages">
								        <table class="table table-bordered " style="margin-top: 30px;">
											    <thead>
											      <tr>
											        <th style="border-right: none;border-bottom: none;">Kỳ đã thanh toán 1</th>
											        
											      </tr>
											    </thead>
											    <tbody>
											      <tr>
											        <td>
											          <div class="row">
												          <div class="col-sm-6">
												          Ngày giao dịch
												          </div>
												          <div class="col-sm-6">
												          25/3/2020
												          </div>
											          </div>
											          <div class="row">
												          <div class="col-sm-6">
												          Ngày hiệu lực
												          </div>
												          <div class="col-sm-6">
												          25/3/2020
												          </div>
											          </div>
											        </td>
											         <td>
											             <div class="row">
												          <div class="col-sm-6">
												          Số tiền gốc
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											          <div class="row">
												          <div class="col-sm-6">
												          Số tiền lãi
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											        </td>
											        <td>
											             <div class="row">
												          <div class="col-sm-6">
												          Phí phạt
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											          <div class="row">
												          <div class="col-sm-6">
												          Dư nợ
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											        
											        </td>
											        
											      </tr>
											     
											    
											    </tbody>
											  </table>
								        </div>
								        <div role="tabpanel" class="tab-pane" id="settings">
								        <table class="table table-bordered " style="margin-top: 30px;">
											    <thead>
											      <tr>
											        <th style="border-right: none;border-bottom: none;">Kỳ đã thanh toán 1</th>
											        
											      </tr>
											    </thead>
											    <tbody>
											      <tr>
											        <td>
											          <div class="row">
												          <div class="col-sm-6">
												          Ngày giao dịch
												          </div>
												          <div class="col-sm-6">
												          25/3/2020
												          </div>
											          </div>
											          <div class="row">
												          <div class="col-sm-6">
												          Ngày hiệu lực
												          </div>
												          <div class="col-sm-6">
												          25/3/2020
												          </div>
											          </div>
											        </td>
											         <td>
											             <div class="row">
												          <div class="col-sm-6">
												          Số tiền gốc
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											          <div class="row">
												          <div class="col-sm-6">
												          Số tiền lãi
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											        </td>
											        <td>
											             <div class="row">
												          <div class="col-sm-6">
												          Phí phạt
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											          <div class="row">
												          <div class="col-sm-6">
												          Dư nợ
												          </div>
												          <div class="col-sm-6">
												          0 vnd
												          </div>
											          </div>
											        
											        </td>
											        
											      </tr>
											     
											    
											    </tbody>
											  </table>
								        </div>
								           <input type="hidden" id="result_code" name="result_code" value="${result_code}">
								      </div>
								    </div>
 

				                 </div>
				                 
								

		                  </div>

	                </div>
	             </div>
	           
	            <!-- /.box-header -->
	           
	            
	              
	
					
	         
	            <!-- /.box-body -->
	          </div>
		
<!-- 	</form> -->
	
	<!-- /.content -->
</div>

<%-- <%@include file="../layout/footer2.jsp"%> --%>



<script type="text/javascript">
/* function openFoxpay(obj) {
	
		var data = {
		   "order_id": 	$("#order_id").val(),
		   "amount": 	$("#amount").val(),
		};
	console.log(data)
		$.ajax({
			url:'/loan/thanhToanTien',
		    data: JSON.stringify(data),
		    type: 'POST',
		    processData: false,
		    contentType: false
		}).done(function(data) {
			console.log(data);
			location.href= data;
			
		
		}).fail(function(data) {
			toastr.error("<spring:message code="ekycdn.loi_kiem_tra_thong_tin" />");
			$(obj).button('reset');
		});
} */

$(document).ready(function(){
	
	if($("#result_code").val() == "200"){
		swal({
		     title: "Thành công!",
		     text: "Thanh toán thành công",
		     type: "success",
		     timer: 3000,
			 showConfirmButton: false,
		     });
	}
});
</script>