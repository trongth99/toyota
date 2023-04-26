<%@ page contentType="text/html; charset=UTF-8"%>
<div class="panel panel-primary setup-content" id="step-0">
	<div class="panel-heading">
		<h3 class="panel-title"><spring:message code="ekycdn.guideline" /></h3>
	</div>
	<div class="panel-body">
		<p>
			<b>Step 1: Upload Documents </b><br/>
			<i>Bước 1: Tải Tài Liệu</i><br/>
			<i>All documents must be digitally signed before uploading/ Tất cả các tài liệu cần được ký điện tử trước khi tải lên</i>
			<select name="chontailieu" id="chontailieu">
			    <option value="1" <c:if test="${ekycDoanhNghiep.typeDocument eq '1' }">selected="selected"</c:if> >Vietnamese local company/Công ty Việt Nam</option>
			    <option value="2" <c:if test="${ekycDoanhNghiep.typeDocument eq '2' }">selected="selected"</c:if> >Foreign Direct Investment Company/ Công ty có vốn đầu tư nước ngoài</option>
			    <option value="3" <c:if test="${ekycDoanhNghiep.typeDocument eq '3' }">selected="selected"</c:if> >Vietnamese Micro Small Enterprises/ Công ty Việt Nam siêu nhỏ</option>
			 
			</select>
		</p>
      	

      
      	<input type="hidden" class="form-control input-sm" name="typeDocument" id="typeDocument" value="<c:out value='${ekycDoanhNghiep.typeDocument}'/>"/>
      		<input type="hidden" class="form-control input-sm" name="statusDk" id="statusDk" value="<c:out value='${ekycDoanhNghiepTable.statusDonKy}'/>"/>
      
        <ul class="" id="vietnam" style="display: none;">
		
			<li>Enterprise registration certificate/ Giấy chứng nhận đăng ký kinh doanh *</li>
			<li>Company’s Charter/ Điều lệ công ty *</li>
			<li>Chief Accountant or PIC of Accounting Appointment Letter/ Giấy bổ nhiệm kế toán trưởng hoặc Người phụ trách kế toán *</li>
			<li>FATCA form/ Biểu mẫu FATCA *</li>
			<li>Shareholder list/ Danh sách cổ đông</li>
			<li>Tax Certificate (if applicable)/ Giấy chứng nhận mã số thuế (nếu có)</li>
			<!-- <li>Others/ Khác</li> -->
		</ul>
     
		<ul class="" id="ctyvietnam" style="display: none;">
		
			<li>Enterprise registration certificate/ Giấy chứng nhận đăng ký kinh doanh *</li>
			<li>Company’s Charter/ Điều lệ công ty *</li>
			<li>Chief Accountant or PIC of Accounting Appointment Letter/ Giấy bổ nhiệm Kế toán trưởng hoặc Người phụ trách kế toán *</li>
			<li>FATCA form/ Biểu mẫu FATCA *</li>
			<li>Shareholder list/ Danh sách cổ đông</li>
			<li>Tax Certificate (if applicable)/ Giấy chứng nhận mã số thuế (nếu có)</li>
			<!-- <li>Others/ Khác</li> -->
		</ul>
		
		<ul   id="ctyvondtuncngoai"  style="display: none;">
			<li>Enterprise registration certificate/ Giấy chứng nhận đăng ký kinh doanh *</li>
			<li>Company’s charter/ Điều lệ công ty *</li>
			<li>Chief Accountant or PIC of Accounting Appointment Letter/ Giấy bổ nhiệm Kế toán trưởng hoặc Người phụ trách kế toán *</li>
			<li>FATCA form/ Biểu mẫu FATCA *</li>
			<li>Letter of undertaking and indemnity regarding capital account/ Thư cam kết và bồi hoàn liên quan đến tài khoản vốn</li>
			<li>Investment Registration Certificate (if applicable)/ Giấy chứng nhận đầu tư (nếu có)</li>
			<li>Shareholder list/ Danh sách cổ đông</li>
			<li>Tax certificate (if applicable)/ Giấy chứng nhận mã số thuế (nếu có)</li>
			<!-- <li>Others/ Khác</li> -->
		</ul>
		<ul id="ctynho"  style="display: none;">
			<li>Enterprise registration certificate/ Giấy chứng nhận đăng ký kinh doanh *</li>
			<li>Company’s charter/ Điều lệ công ty *</li>
			<li>Chief Accountant or PIC of Accounting Appointment Letter/ Giấy bổ nhiệm Kế toán trưởng hoặc Người phụ trách kế toán *</li>
			<li>FATCA form/ Biểu mẫu FATCA *</li>
			<li>Declaration on Micro SME/ Tờ khai xác định doanh nghiệp siêu nhỏ *</li>
			<li>Investment registration certificate (if applicable)/ Giấy chứng nhận đầu tư (nếu có)</li>
			<!-- <li>Tax certificate (if applicable) <br/> <i>Giấy chứng nhận mã số thuế</i></li> -->
			<!-- <li>Others/ Khác</li> -->
		</ul>
	
		<p><b>Step 2:  Company Information</b><br/><i>Bước 2: Thông Tin Công Ty</i></p>
		<p><b>Step 3: Legal Representative Information</b><br/><i>Bước 3: Thông Tin của Đại Diện Pháp Lý</p>
		<p><b>Step 4: Chief Accountant or PIC of Accounting Information</b><br/><i>Bước 4: Thông Tin Kế Toán Trưởng hoặc Người Phụ Trách Kế Toán</i></p>
		<p><b>Step 5: Member’s Council, Board of Directors, Board of Management</b><br/><i>Bước 5: Hội Đồng Thành Viên, Hội Đồng Quản Trị, Ban Điều Hành</i></p>
		<p><b>Step 6:  Special Instruction</b><br/><i>Bước 6: Chỉ Dẫn Đặc Biệt</i></p>
		
		<div class="pull-left"> *: Mandatory/ Bắt buộc</div>
		<button class="btn btn-primary nextBtn pull-right" type="button"  onclick="validateStep0(this)" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> <spring:message code="ekycdn.dang_xy_ly" />"><spring:message code="ekycdn.tiep_theo" /></button>
	</div>
</div>

<script type="text/javascript">

$(document).ready(function(){
	
	    
           var type = 10;
          if( type == 10){
        	  $("#vietnam").show();
        	  type = 11;
        	  $("#ctyvn").show();
          }else {
        	  $("#vietnam").hide();
        	  $("#ctyvn").hide();
		} 
	
		
		if($("#typeDocument").val() == "1"){
			 $("#vietnam").hide();
			$("#ctyvietnam").show();
		}
		
		if($("#typeDocument").val() == "2"){
			 $("#vietnam").hide();
			$("#ctyvondtuncngoai").show();
		
		}else{
			$("#ctyvondtuncngoai").hide();
			
		}
		if($("#typeDocument").val() == "3"){
			$("#ctynho").show();
			 $("#vietnam").hide();
		}else {
			$("#ctynho").hide();
		
		}
		

		
		//if(typeDc == "1"){
		/* 	var type = $("#typeDocument").val();
			alert(type)
			
			if($("#typeDocument").val() == null){
				$("#ctyvietnam").show();
			}else{
				$("#ctyvietnam").hide();
			}  */
		//}
	 	
	
	
});
var chon;
$('#chontailieu').on('change', function () {
	  
	   if($("#chontailieu").val() == "3"){
		   chon = 3;
	       $("#ctynho").show();
	       $("#vietnam").hide();
	     	$("#ctnho").show();
	   } else {
			$("#ctnho").hide();
	       $("#ctynho").hide();
	   }
	   if($("#chontailieu").val() == "2"){
		   chon = 2
	       $("#ctyvondtuncngoai").show();
	       $("#vietnam").hide();
	       $("#ctyncngoai").show();
	   } else {
	       $("#ctyvondtuncngoai").hide();
	       $("#ctyncngoai").hide();
	   }
	   if($("#chontailieu").val() == "1"){
		   chon = 1;
	       $("#ctyvietnam").show();
	       $("#vietnam").hide();
	       $("#ctyvn").show();
	   } else {
			$("#ctyvn").hide();
	       $("#ctyvietnam").hide();
	   }
	});
	function validateStep0(obj) {
		var token = "";
			$(obj).button('loading');
			
			var data = {
			
				"typeDocument": $("#chontailieu").val()
				//"haveAChiefAccountant": $("#xacNhanKtt").is(":checked")?"yes":"no",
				//"editStatusKtt":$("#editStatusKtt").is(":checked")?"no":"yes",
			};

			
			$.ajax({
				url:'/ekyc-enterprise/luu-thong-tin-step0',
			    data: JSON.stringify(data),
			    type: 'POST',
			    processData: false,
			    contentType: 'application/json'
			   
			}).done(function(data) {
				if(data.status == 200) {
					token = data.token;
					nextStep(obj);
					$(obj).button('reset');
				} else if(data.status == 505){
					location.href='/ekyc-enterprise';
				} else {
					toastr.error("Not enough information to store / Không đủ thông tin cần lưu trữ");
					$(obj).button('reset');	
				}
			}).fail(function(data) {
				toastr.error("Error check / Lỗi lưu thông tin");
				$(obj).button('reset');
			}); 
			
		
		//nextStep(obj);
	}
</script>