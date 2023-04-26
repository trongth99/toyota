<%@ page contentType="text/html; charset=UTF-8"%>
<div class="panel panel-primary setup-content" id="step-3">
	<div class="panel-heading">
		<h3 class="panel-title">Legal Representative Information/ Thông Tin của Đại Diện Pháp Lý</h3>
	</div>
	<div class="panel-body">
		<div id="divTemplateNddpl">
			<!-- <div style="margin-bottom: 10px;" id="templateNddpl"> -->
			  <c:forEach items="${legalRepresentator}" var="item" varStatus="status">
			  <c:if test="${status.index == 0 }">
			
			<div style="margin-bottom: 10px;" id="templateNddpl">
			
			</c:if>
				<div class="row" >
					<div class="form-group col-sm-3">
						<div class="form-group  has-feedback">
							<label class="control-label">Full Name<br/><i style="font-weight: normal;">Họ và Tên</i></label>
							<input type="text" class="form-control input-sm" name="hoVaTenNddpl" id="hoVaTenNddpl" value="<c:out value='${item.hoTen}'/>"/>
							<input type="hidden" class="form-control input-sm" name="idNddpl" id="idNddpl" value="<c:out value='${item.id}'/>"/>
						</div>
					</div>	
					<div class="form-group col-sm-3">
						<div class="form-group  has-feedback">
							<label class="control-label">Mobile Number<br/><i style="font-weight: normal;">Số Điện Thoại</i></label>
							<input type="text" class="form-control input-sm" name="soDienThoaiNddpl" id="soDienThoaiNddpl" value="<c:out value='${item.phone}'/>"/>
						</div>
					</div>	
					<div class="form-group col-sm-3">
						<div class="form-group  has-feedback">
							<label class="control-label">Email<br/><i style="font-weight: normal;">Thư Điện Tử</i></label>
							<input type="text" class="form-control input-sm" name="emailNddpl" id="emailNddpl" value="<c:out value='${item.email}'/>"/>
						</div>
					</div>	
					<div class="form-group col-sm-2">
						<div class="form-group  col-sm-1" style="margin-top: 48px;">
						 <c:if test="${item.checkMain eq 'yes' }">
						  <input type="radio" class="" name="checkMainNddpl"  style="margin-right: 20px;" checked>
						</c:if> 
						<c:if test="${item.checkMain eq 'no' }">
						  <input type="radio"  name="checkMainNddpl"    style="margin-right: 20px;"  />
						</c:if>
						 <c:if test="${checkMain eq 'no' }">
						  <input type="radio" name="checkMainNddpl"  style="margin-right: 20px;"  checked />
						</c:if>	 
						</div>
						<div class="form-group col-sm-9" style="margin-top: 36px;">
							<label class="control-label">Account Holder<br/><i style="font-weight: normal;">Chủ Tài Khoản</i></label>
						</div>
					</div> 

					<div class="form-group col-sm-1 delete">
							<button  type="button" style="margin-top: 10px;" id="boTempalteNddpl" onclick="remove3(this)"><i  class="fa fa-minus minus" aria-hidden="true" ></i></button>
		            </div>
				</div>
					<c:if test="${status.index == 0 }"></div></c:if>
			</c:forEach>

			
				
		<!-- 	</div> -->
		</div>
		
		<div class="row">
			<div class="form-group col-sm-12">
				<div class="form-group  has-feedback">
					<label class="control-label">
					
					<c:if test="${haveAcccountHolder eq 'yes' }">
					<input type="checkbox"  name="Nuq" id="xacNhanNuq" style="margin-right: 20px;" checked="checked"/>
					</c:if>
					<c:if test="${haveAcccountHolder eq 'no' }">
					<input type="checkbox"  name="Nuq" id="xacNhanNuq" style="margin-right: 20px;" />
					</c:if>
						 Is there someone authorized by Account Holder Representative?<i style="font-weight: normal;">/ Có người được Đại Diện Chủ Tài Khoản ủy quyền không?</i>
					</label>
				</div>
			</div>
		</div>
		
		
		 <div class="row" >
			<div class="form-group col-sm-12">
				<div class="form-group  has-feedback">
					<label class="control-label">
					<c:if test="${allInOne eq 'yes'}">
					<input type="checkbox"  name="Nuq" id="checkAllInOne" style="margin-right: 20px;"  checked="checked"/>
					</c:if>
						<c:if test="${allInOne eq 'no'}">
					<input type="checkbox"  name="Nuq" id="checkAllInOne" style="margin-right: 20px;" />
					</c:if>
						Legal Representative cum PIC of Accounting, BOD, BOM<i style="font-weight: normal;">/ Chủ Tài Khoản kiêm Người Phụ Trách Kế Toán, Ban Điều Hành, Hội Đồng Quản Trị
</i>
					</label>
				</div>
			</div>
		</div> 
		 
		
		<button  type="button" style="margin-top: 10px;" id="themTempalteNddpl"><i class="fa fa-plus" aria-hidden="true"></i></button>
		<div class="form-group col-sm-12">
			<button class="btn btn-primary nextBtn pull-right" type="button" onclick="validateStep3Start(this)" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> <spring:message code="ekycdn.dang_xy_ly" />" id="step3"><spring:message code="ekycdn.tiep_theo" /></button>
			<button class="btn btn-default pull-right" type="button" onclick="prevStep(this)" style="margin-right: 10px;"><spring:message code="ekycdn.quay_lai" /></button>
		</div>
	</div>
</div>

<script type="text/javascript">

 /*  if( $('#checkAllInOne').is(':checked') ){
	

	      $( "xacNhanNuq" ).attr("checked", false);
	} 
	 
  $(document).ready(function(){
	  if( $('#checkAllInOne').is(':checked') ){
			
			
				 
			      $( "xacNhanNuq" ).attr("checked", false);
			} 
		
	}); */

  $(function() {
	  $('#checkAllInOne').click(function() {
		  if( $('#checkAllInOne').is(':checked') ){
				
				console.log(444444)
				 
		      $('#xacNhanNuq' ).prop( "checked", false );
		} 
		  
		  
	  });
	  
	  $('#xacNhanNuq').click(function() {
		  if( $('#xacNhanNuq').is(':checked') ){
				
			  console.log(55555);
				 
				  $('#checkAllInOne').prop( "checked", false );
		} 
		
		
		  
	  });
});

	$("#themTempalteNddpl").click(function(){
		if($("#divTemplateAdd .row").length < 6) {
			$("#divTemplateNddpl").append($("#templateNddpl .row").clone());
	
			$("input[name='idNddpl']").last().val("");
			$("input[name='hoVaTenNddpl']").last().val("");
			$("input[name='soDienThoaiNddpl']").last().val("");
			$("input[name='emailNddpl']").last().val("");
		}
		// $("input[name='checkMainNddpl']").last().prop("checked", false ); 
	});
 /* 	$("#boTempalteNddpl").click(function(){
 		if($("#divTemplateNddpl .row").length > 1)
 			$("#divTemplateNddpl .row:last").remove();
 	}); */
	
	function validateStep3Start(obj) {
 		
 		if(validateThongTin("Nddpl")){
 			if($("#checkAllInOne").is(":checked") && !$("#xacNhanNuq").is(":checked")) {				
 					uploadDuLieuStep456(obj);
 			}else if( !$("#xacNhanNuq").is(":checked") && !$("#checkAllInOne").is(":checked")){
 				uploadDuLieuStep4(obj);
 				
 			}else if(!$("#checkAllInOne").is(":checked") && $("#xacNhanNuq").is(":checked") ){
 				uploadDuLieuStep4(obj);
 		
 			}
 		}
		
		
			
	}
 	
 	function remove3(obj) {
 		if($("#divTemplateNddpl .row").length > 1){
 			for(i=1; i<=$("#divTemplateNddpl .row").length; i++) {
 				
 				var temp = $(obj).parent().parent().parent().attr("id");
 				
 				$(obj).parent().parent().remove();
 				$("input[name='checkMainNddpl']").prop("checked", true );
 				if(temp == "templateNddpl") {
 					$("#templateNddpl").append($("#divTemplateNddpl .row").get(0));
 				}
 				
 			}
 		}
 		
 	}
 	
/*  	function remove3(obj) {
		if($("#divTemplateNddpl .row").length > 1){
			$(obj).parent().parent().remove();
			$("input[name='checkMainNddpl']").prop("checked", true );
		}
		
	}  */
	var checkEmail = false;
	function validateThongTin(sub) {
		var check = 0;
		
		$("input[name='hoVaTen"+sub+"']").each(function(){
			if($(this).val() == "") {
				check ++;
				toastr.error("Full Name is not empty");
			}
		});
		$("input[name='soDienThoai"+sub+"']").each(function(){
			if($(this).val() == "") {
				check ++;
				toastr.error("Phone number is not empty");
			}
		});
		$("input[name='email"+sub+"']").each(function(){
			if(!validateEmail( $(this).val())) {
				check ++;
				toastr.error("Email invalid");
			}
		});
		$("input[name='checkMain"+sub+"']").each(function(index){
			if(index == 1){
				$("input[name='checkMain"+sub+"']:checked").eq(index).prop("checked" , true);
			}
		
			
		});
		
		$("input[name='email"+sub+"']").each(function(index){
			console.log(index);
			var email = $("input[name='email"+sub+"']").eq(0).val();
			
				if( email ==  $("input[name='email"+sub+"']").eq(index + 1).val()) {
					check ++;
					toastr.error("Email invalid gionh ngau");
				
				}
		}); 
		
		if(check > 0){
			
			return false;
		}
		return true;
	}
	function validateEmail(email) {
        var re = /\S+@\S+\.\S+/;
        return re.test(email);
    }
	
	var token = "";
	function uploadDuLieuStep4(obj) {
		$(obj).button('loading');
		var data = {
			
			//step3
			"legalRepresentator": 	getArrayPersonStep3("Nddpl"),
			"allInOne": 	$("#checkAllInOne").is(":checked")?"yes":"no",
			"haveAcccountHolder": 	$("#xacNhanNuq").is(":checked")?"yes":"no",
			//"editStatusNddpl": $("#editStatusNddpl").is(":checked")?"no":"yes"	
					
		};
		$.ajax({
			url:'/ekyc-enterprise/step4',
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
	}

	var token = "";
	function uploadDuLieuStep456(obj) {
		$(obj).button('loading');
		//getArrayPerson("Nddpl");
		var data = {
			
			
			"legalRepresentator": 	getArrayPersonStep3("Nddpl"),
			"chiefAccountant": 	getArrayPersonStep4("Nddpl"),
			"listOfLeaders": 	getArrayPersonStep3("Nddpl"),
			"allInOne": 	$("#checkAllInOne").is(":checked")?"yes":"no",
			"haveAcccountHolder": 	$("#xacNhanNuq").is(":checked")?"yes":"no",
			"haveAChiefAccountant":  "no"
					
			//"editStatusNddpl": $("#editStatusNddpl").is(":checked")?"no":"yes"	
		};
		$.ajax({
			url:'/ekyc-enterprise/step456',
		    data: JSON.stringify(data),
		    type: 'POST',
		    processData: false,
		    contentType: 'application/json'
		}).done(function(data) {
			if(data.status == 200) {
				token = data.token;
				//nextStep(obj);
				$(obj).button('reset');
				nextStep($("#step6"));
			} else if(data.status == 505){
				location.href='/ekyc-enterprise';
			} else {
				toastr.error("Not enough information to store / Không đủ thông tin cần lưu trữ");
				$(obj).button('reset');	
			}
		}).fail(function(data) {
			//toastr.error("Error check / Lỗi lưu thông tin");
			$(obj).button('reset');
			location.href='/login-doanh-nghiep';
		}); 
	}
	
	var token = "";
	function uploadDuLieuStep4567(obj) {
		$(obj).button('loading');
		//getArrayPerson("Nddpl");
		var data = {
			
			
			"legalRepresentator": 	getArrayPersonStep3("Nddpl"),
			"chiefAccountant": 	getArrayPersonStep4("Nddpl"),
			"listOfLeaders": 	getArrayPersonStep3("Nddpl"),
			"allInOne": 	$("#checkAllInOne").is(":checked")?"yes":"no",
			"haveAcccountHolder": 	$("#xacNhanNuq").is(":checked")?"yes":"no",
			"haveAChiefAccountant":  "no"
					
			//"editStatusNddpl": $("#editStatusNddpl").is(":checked")?"no":"yes"	
		};
		$.ajax({
			url:'/ekyc-enterprise/step456',
		    data: JSON.stringify(data),
		    type: 'POST',
		    processData: false,
		    contentType: 'application/json'
		}).done(function(data) {
			if(data.status == 200) {
				token = data.token;
				//nextStep(obj);
				$(obj).button('reset');
				nextStep($("#step-44"));
			} else if(data.status == 505){
				location.href='/ekyc-enterprise';
			} else {
				toastr.error("Not enough information to store / Không đủ thông tin cần lưu trữ");
				$(obj).button('reset');	
			}
		}).fail(function(data) {
			//toastr.error("Error check / Lỗi lưu thông tin");
			$(obj).button('reset');
			location.href='/login-doanh-nghiep';
		}); 
	}
	function getArrayPersonStep3(type) {
		
		var arr = [];
		//if(type == "Ktt" && !$("#xacNhanKtt").is(":checked")) return arr;
		$("input[name='soDienThoai"+type+"']").each(function(index){
			var json = {};
			if($("input[name='soDienThoai"+type+"']").eq(index).val() != "") {
				
				     
				
					//var checkMain = $("input[name='checkMain"+type+"']:checked").eq(index).prop("checked")?"yes":"no";
					//var editStatus = $("input[name='editStatus"+type+"']:checked").eq(index).prop("checked")?"Y":"N";
					
					json["hoTen"] = $("input[name='hoVaTen"+type+"']").eq(index).val();
					json["phone"] = $("input[name='soDienThoai"+type+"']").eq(index).val();
					json["email"] = $("input[name='email"+type+"']").eq(index).val();
					
						
                     if($("input:radio[name='checkMain"+type+"']").eq(index).is(':checked')){
                    	 json["checkMain"] = "yes";
					   }else{
						   json["checkMain"] =  "no";
					   }
					json["tokenCheck"] = uuidv4();
	                if($("input[name='id"+type+"']").eq(index).val() == null || $("input[name='id"+type+"']").eq(index).val() == ""){
						
						json["id"] = uuidv4().substring(1, 8);
					}else{
					
						json["id"] = $("input[name='id"+type+"']").eq(index).val();
					}
					json["time"] = Date.now();
					arr.push(json);

			}
		});
	 	console.log(arr);
		return arr;
	}
	function getArrayPersonStep4(type) {
		
		console.log($("select[name='typeKtt'] option:selected").val());
		var arr = [];
		//if(type == "Ktt" && !$("#xacNhanKtt").is(":checked")) return arr;
		$("input[name='hoVaTen"+type+"']").each(function(index){
			var json = {};
				//var checkMain = $("input[name='checkMain"+type+"']:checked").eq(index).prop("checked")?"Y":"N";
			
				json["hoTen"] = $("input[name='hoVaTen"+type+"']").eq(index).val();
				json["phone"] = $("input[name='soDienThoai"+type+"']").eq(index).val();
				json["email"] = $("input[name='email"+type+"']").eq(index).val();
				//json["editStatus"] = $("input[name='editStatus"+type+"']").eq(index).prop("checked")?"yes":"no";
				//if($("input[name='type"+type+"']"))
				json["loai"] = $("select[name='type"+type+"']").eq(index).val();
				json["loai"] = "Chief Account / Kế toán trưởng";
				json["tokenCheck"] = uuidv4();
                if($("input[name='id"+type+"']").eq(index).val() == null || $("input[name='id"+type+"']").eq(index).val() == ""){
					
					json["id"] = uuidv4().substring(1, 8);
				}else{
				
					json["id"] = $("input[name='id"+type+"']").eq(index).val();
				}
				json["time"] = Date.now();
		 		console.log(json);
				arr.push(json);
			//}
		});
		
	 	console.log(arr);
		return arr;
	}
	function uuidv4() {
		  return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
		    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
		  );
		}
</script>