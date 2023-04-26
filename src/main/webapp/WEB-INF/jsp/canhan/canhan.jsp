<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../layout/header2.jsp"%>
<%@include file="../layout/js.jsp"%>

<!-- Content Wrapper. Contains page content -->

<style>
.row{
margin-bottom: 10px;
}
.content-wrapper{
   background-color: white;
}
.content-header{
display: flex;
flex-direction: column;
}
.infor{
background-color: rgba(0, 53, 128, 0.08); border-radius: 5px;margin-left: 30px;
}
.btInfor{
background-color: #366AE2; margin: 10px;border-radius: 5px;text-align: center;color: white;
}
}
</style>
<div class="content-wrapper" >
	<!-- Content Header (Page header) -->
	<section class="content-header">

	    <h1>
			Thông tin tài khoản
		</h1>
		<ol class="path breadcrumb" style="position: static;">
			<li><a href="${contextPath}/">Trang chủ</a></li>
			<li class="active">Cá nhân</li>
		</ol>

		
	</section>

	<!-- Main content -->
	<form id="submitForm" action="" method="get">
		
			<div class="box box-danger" style="border-top-color: #d2d6de;">
						<div class="container" style="width: 100%;">
						
						<div class="row " style="margin-top: 20px;">
						
						     <div class="col-sm-2 infor" >
						          <div class="row" >
						                <div style="display: flex; margin: 20px 0px 0px 20px">
							                <img src="${contextPath }/img/canhan.jpg" class="user-image" alt="User Image" style="height: 40px;width: 40px;border-radius: 20px">
							               
							                &emsp; <div>
							                 ${info.fullName } </br>
							                 Khách hàng thân thiết
							                </div>
						                </div>
						                  
						                <div class="col-sm-12" >
							                <div class="row btInfor">
							                      <i class="fa fa-user-circle-o" aria-hidden="true"></i> Thông tin cá nhân
							                </div>
						               
						                </div>
						          
						          </div>
						     
						     
						     </div>
						     <div class="col-sm-8">
						     
						     <h3>Thông tin của tôi</h3>
						     
						     <div class="row">
						        <div class="col-sm-4">
						          Tên
						        </div>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="fullname" name="fullname" value="${info.fullName }">
						        </div>
						     </div>
						     <div class="row">
						        <div class="col-sm-4">
						          Giới tính
						        </div>
						        <div class="col-sm-8">
						            <input type="text"  class="form-control" id="fullname" name="fullname" value="${info.gender }">
						        </div>
						     </div>
						     <div class="row">
						        <div class="col-sm-4">
						          Ngày tháng năm sinh
						        </div>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="fullname" name="fullname" value="${info.dob }">
						        </div>
						     </div>
						     <div class="row">
						        <div class="col-sm-4">
						          CMND/CCCD
						        </div>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="fullname" name="fullname" value="${info.soCmt }">
						        </div>
						     </div>
						     <div class="row">
						        <div class="col-sm-4">
						          MST
						        </div>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="fullname" name="fullname" value="${info.mst }">
						        </div>
						     </div>
						     <div class="row">
						        <div class="col-sm-4">
						          Email
						        </div>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="fullname" name="fullname" value="${info.email }">
						        </div>
						     </div>
						     <div class="row">
						        <div class="col-sm-4">
						          Địa chỉ
						        </div>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="fullname" name="fullname" value="${info.address }">
						        </div>
						     </div>
						     <div class="row">
						        <div class="col-sm-4">
						          Số điện thoại
						        </div>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="fullname" name="fullname" value="${info.dienThoai }">
						        </div>
						     </div>
						     
						     </div>
						
						</div>	
	                  
			            
	            	
	                </div>
	             
	           
	            <!-- /.box-header -->
	           
	            
	              
	
					
	         
	            <!-- /.box-body -->
	          </div>
		
	</form>
	<!-- /.content -->
</div>

<%@include file="../layout/footer2.jsp"%>