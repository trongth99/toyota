<%@ page contentType="text/html; charset=UTF-8"%>
<div class="panel panel-primary setup-content" id="step-14">
	<div class="panel-heading">
		<h3 class="panel-title">Straight2Bank User Designation & Authorisation/ Chỉ Định và Ủy Quyền Người Sử Dụng Straight2Bank</h3>
	</div>
	<div class="panel-body">
		<div id="divTemplateAdd">
			<c:forEach items="${userDesignation}" var="item" varStatus="status">
				<c:if test="${status.index == 0 }"><div style="margin-bottom: 10px;" id="templateAdd"></c:if>
					<div class="row" title="${status.index}">
						<div class="form-group col-sm-3">
							<div class="form-group  has-feedback">
								<label class="control-label">Full Name<br/><i style="font-weight: normal;">Họ và Tên</i></label>
								<input type="text" class="form-control input-sm" name="hoVaTenAdd" value="<c:out value='${item.hoTen}'/>"/>
								<input type="hidden" class="form-control input-sm" name="idAdd" value="<c:out value='${item.id}'/>"/>
								<input type="hidden" class="form-control input-sm"  value="<c:out value='${status.index}'/>"/>
							</div>
						</div>	
						<div class="form-group col-sm-3">
							<div class="form-group  has-feedback">
								<label class="control-label">ID/ Passsport<br/><i style="font-weight: normal;">Số CMND/ CCCD/ Hộ Chiếu</i></label>
								<input type="text" class="form-control input-sm" name="soCmtAdd" value="<c:out value='${item.soCmt}'/>"/>
							</div>
						</div>
						<div class="form-group col-sm-3">
							<div class="form-group  has-feedback">
								<label class="control-label">Email<br/><i style="font-weight: normal;">Thư Điện Tử</i></label>
								<input type="text" class="form-control input-sm" name="emailAdd" value="<c:out value='${item.email}'/>"/>
							</div>
						</div>
						<div class="form-group col-sm-1 delete">
							<button  type="button" style="margin-top: 10px;" id="boTempalteAdd" onclick="remove111(this)"><i  class="fa fa-minus minus" aria-hidden="true" ></i></button>
		            </div>
					</div>
				<c:if test="${status.index == 0 }"></div></c:if>
			</c:forEach>
		</div>
		<button type="button" style="margin-top: 10px;" id="themTempalteAdd"><i class="fa fa-plus" aria-hidden="true"></i></button>
		
		<div class="row" style="margin-top: 30px;">
			<div class="form-group col-sm-12">
				<table class="table table-striped table-hover table-bordered">
					<tr>
						<td>Authorisation for<br/><i> Ủy quyền đối với</i></td>
						<td>User 1<br/><i>Người Sử Dụng 1</i></td>
						<td>User 2<br/><i>Người Sử Dụng 2</i></td>
						<td>User 3<br/><i>Người Sử Dụng 3</i></td>
						<td>User 4<br/><i>Người Sử Dụng 4</i></td>
						<td>User 5<br/><i>Người Sử Dụng 5</i></td>
						<td>User 6<br/><i>Người Sử Dụng 6</i></td>
					</tr>
					<tr id="tdr1">
						<td>Prepare Instructions<br/><i>Tạo các Lệnh</i></td>
						<td class="user1" style="text-align: center;"></td>
						<td class="user2" style="text-align: center;"></td>
						<td class="user3" style="text-align: center;"></td>
						<td class="user4" style="text-align: center;"></td>
						<td class="user5" style="text-align: center;"></td>
						<td class="user6" style="text-align: center;"></td>
					</tr>
					<tr id="tdr2">
						<td>View, print, download reports<br/><i>Xem, in, tải các báo cáo</i></td>
						<td class="user1" style="text-align: center;"></td>
						<td class="user2" style="text-align: center;"></td>
						<td class="user3" style="text-align: center;"></td>
						<td class="user4" style="text-align: center;"></td>
						<td class="user5" style="text-align: center;"></td>
						<td class="user6" style="text-align: center;"></td>
					</tr>
					<tr id="tdr3">
						<td>Approve and release Instructions  1<br/><i>Chấp thuận và đưa ra các lệnh</i></td>
						<td class="user1" style="text-align: center;"></td>
						<td class="user2" style="text-align: center;"></td>
						<td class="user3" style="text-align: center;"></td>
						<td class="user4" style="text-align: center;"></td>
						<td class="user5" style="text-align: center;"></td>
						<td class="user6" style="text-align: center;"></td>
					</tr>
					<tr id="tdr4">
						<td>Approve and release Instructions only jointly  1<br/><i>Chấp thuận và đưa ra các Lệnh chỉ thị đồng thời</i></td>
						<td class="user1" style="text-align: center;"></td>
						<td class="user2" style="text-align: center;"></td>
						<td class="user3" style="text-align: center;"></td>
						<td class="user4" style="text-align: center;"></td>
						<td class="user5" style="text-align: center;"></td>
						<td class="user6" style="text-align: center;"></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row" style="margin-top: 30px;">
			<div class="form-group col-sm-12">
				<div class="form-group  has-feedback">
					<label class="control-label">Register User(s) for e-Supporting Document Upload via S2B<br/><i style="font-weight: normal;">Đăng ký Người Sử Dụng chức năng Tải Chứng Từ Bổ Sung qua S2B</i></label>
					<input type="text" class="form-control input-sm" name="dangKyNguoiSuDung" id="dangKyNguoiSuDung" value="All users" value="<c:out value='${ekycDoanhNghiep.registerUser}'/>"/>
				</div>
			</div>	
		</div>
		<div class="row">
				<div class="form-group col-sm-12">
					<div class="form-group  has-feedback">
						<label class="control-label">Special Instructions <br/> <i style="font-weight: normal;">Chỉ Dẫn Đặc Biệt</i></label>
						<input type="text" class="form-control input-sm" name="specialInstructionsUser" id="specialInstructionsUser" value="<c:out value='${ekycDoanhNghiep.specialInstructionsUser}'/>"/>
					</div>
				</div>
		</div>
		
		
		<div class="form-group col-sm-12">
			<button class="btn btn-primary nextBtn pull-right" type="button" onclick="validateStep14Start(this)" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> <spring:message code="ekycdn.dang_xy_ly" />"><spring:message code="ekycdn.tiep_theo" /></button>
			<button class="btn btn-default pull-right" type="button" onclick="prevStep(this)" style="margin-right: 10px;"><spring:message code="ekycdn.quay_lai" /></button>
		</div>
	</div>
</div>

<script type="text/javascript">
var tdr1 = [];
var tdr2 = [];
var tdr3 = [];
var tdr4 = [];
<c:forEach items="${userDesignation}" var="item" varStatus="status">
tdr1.push('${item.taoLenh}');
tdr2.push('${item.baoCao}');
tdr3.push('${item.chapThuanLenh}');
tdr4.push('${item.chapThuanLenhDongThoi}');
</c:forEach>
</script>

<script type="text/javascript">
$(document).ready(function(){
	 
	for(i=1; i<=6; i++) {
		
		$("#tdr1 .user"+i).html("");
		$("#tdr2 .user"+i).html("");
		$("#tdr3 .user"+i).html("");
		$("#tdr4 .user"+i).html("");
		
	}
	for(i=1; i<=$("#divTemplateAdd .row").length; i++) {
		
		var j = i-1;
		
		 //if(tdr1[j] && tdr1[j] == 'Y')  
			$("#tdr1 .user"+i).html("<input type='checkbox' name='tdr1user"+i+"' checked>");
		 //else
			//$("#tdr1 .user"+i).html("<input type='checkbox' name='tdr1user"+i+"'>"); 
		 //$("#tdr1 .user"+i).html("<input type='checkbox' name='tdr1user"+i+"' checked>");
		if(tdr2[j] && tdr2[j] == 'Y') 
			$("#tdr2 .user"+i).html("<input type='checkbox' name='tdr2user"+i+"' checked>");
		else
			$("#tdr2 .user"+i).html("<input type='checkbox' name='tdr2user"+i+"'>");
		
		if(tdr3[j] && tdr3[j] == 'Y') 
			$("#tdr3 .user"+i).html("<input type='checkbox' name='tdr3user"+i+"' checked>");
		else
			$("#tdr3 .user"+i).html("<input type='checkbox' name='tdr3user"+i+"'>");
		
		if(tdr4[j] && tdr4[j] == 'Y')
			$("#tdr4 .user"+i).html("<input type='checkbox' name='tdr4user"+i+"' checked>");
		else
			$("#tdr4 .user"+i).html("<input type='checkbox' name='tdr4user"+i+"'>");
		
		
	}

});
function remove111(obj) {
	if($("#divTemplateAdd .row").length > 1){
		for(i=1; i<=$("#divTemplateAdd .row").length; i++) {
			var index = $(obj).parent().parent().attr("title");
			var temp = $(obj).parent().parent().parent().attr("id");
			$(obj).parent().parent().remove();
			if(temp == "templateAdd") {
				$("#templateAdd").append($("#divTemplateAdd .row").get(0));
			}
			addIndexRow();
			removeUser(index);
		}
	}
	
}
function removeUser(index) {
	var removeIndex = parseInt(index) +1;
	$("input[name='tdr1user"+removeIndex+"']").remove();
	$("input[name='tdr2user"+removeIndex+"']").remove();
	$("input[name='tdr3user"+removeIndex+"']").remove();
	$("input[name='tdr4user"+removeIndex+"']").remove();
	for(i=removeIndex; i<=$("#divTemplateAdd .row").length+1; i++) {
		if($("input[name='tdr1user"+(i+1)+"']").is(":checked"))
			$("#tdr1 .user"+i).html("<input type='checkbox' name='tdr1user"+i+"' checked>");
		else
			$("#tdr1 .user"+i).html("<input type='checkbox' name='tdr1user"+i+"'>");
		
		if($("input[name='tdr2user"+(i+1)+"']").is(":checked"))
			$("#tdr2 .user"+i).html("<input type='checkbox' name='tdr2user"+i+"' checked>");
		else
			$("#tdr2 .user"+i).html("<input type='checkbox' name='tdr2user"+i+"'>");
		
		if($("input[name='tdr3user"+(i+1)+"']").is(":checked"))
			$("#tdr3 .user"+i).html("<input type='checkbox' name='tdr3user"+i+"' checked>");
		else
			$("#tdr3 .user"+i).html("<input type='checkbox' name='tdr3user"+i+"'>");
		
		if($("input[name='tdr4user"+(i+1)+"']").is(":checked"))
			$("#tdr4 .user"+i).html("<input type='checkbox' name='tdr4user"+i+"' checked>");
		else
			$("#tdr4 .user"+i).html("<input type='checkbox' name='tdr4user"+i+"'>");
		
		if(i == ($("#divTemplateAdd .row").length+1)) {
			$("input[name='tdr1user"+i+"']").remove();
			$("input[name='tdr2user"+i+"']").remove();
			$("input[name='tdr3user"+i+"']").remove();
			$("input[name='tdr4user"+i+"']").remove();
		}
		
	}
	
}
 
function validateStep14Start(obj) {
	 
		if(validateThongTin("Add")) {
			  if(!$("input[name='tdr1user1']").is(':checked') && !$("input[name='tdr2user1']").is(':checked') && !$("input[name='tdr3user1']").is(':checked') && !$("input[name='tdr4user1']").is(':checked') && $("#divTemplateAdd .row").length >= 1 ){
				toastr.error("Authorisation for User 1 can not be empty ");
			}else if(!$("input[name='tdr1user2']").is(':checked') && !$("input[name='tdr2user2']").is(':checked') && !$("input[name='tdr3user2']").is(':checked') && !$("input[name='tdr4user2']").is(':checked') && $("#divTemplateAdd .row").length >= 2){
				toastr.error("Authorisation for User 2 can not be empty ");
			}else if(!$("input[name='tdr1user3']").is(':checked') && !$("input[name='tdr2user3']").is(':checked') && !$("input[name='tdr3user3']").is(':checked') && !$("input[name='tdr4user3']").is(':checked') && $("#divTemplateAdd .row").length >= 3){
				toastr.error("Authorisation for User 3 can not be empty ");
			}else if(!$("input[name='tdr1user4']").is(':checked') && !$("input[name='tdr2user4']").is(':checked') && !$("input[name='tdr3user4']").is(':checked') && !$("input[name='tdr4user4']").is(':checked') && $("#divTemplateAdd .row").length >= 4){
				toastr.error("Authorisation for User 4 can not be empty ");
			}else if(!$("input[name='tdr1user5']").is(':checked') && !$("input[name='tdr2user5']").is(':checked') && !$("input[name='tdr3user5']").is(':checked') && !$("input[name='tdr4user5']").is(':checked') && $("#divTemplateAdd .row").length >= 5){
				toastr.error("Authorisation for User 5 can not be empty ");
			}else if(!$("input[name='tdr1user6']").is(':checked') && !$("input[name='tdr2user6']").is(':checked') && !$("input[name='tdr3user6']").is(':checked') && !$("input[name='tdr4user6']").is(':checked') && $("#divTemplateAdd .row").length >= 6){
				toastr.error("Authorisation for User 6 can not be empty ");
			}else { 
				
				$(obj).button('loading');
				var data = {
					"userDesignation": 	getArrayPersonUserDesignation("Add"),
					"registerUser": $("#dangKyNguoiSuDung").val(),
					"specialInstructionsUser": $("#specialInstructionsUser").val()
				};
				$.ajax({
					url:'/ekyc-enterprise/luu-thong-tin-step9',
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
			
		}
	}
	//$(document).ready(function(){
		
			
		//addCheckUserLoad();
		$("#themTempalteAdd").click(function(){
			if($("#divTemplateAdd .row").length < 6) {
				$("#divTemplateAdd").append($("#templateAdd .row").clone());
				addIndexRow();
				$("input[name='idAdd']").last().val("");
				$("input[name='hoVaTenAdd']").last().val("");
				$("input[name='soCmtAdd']").last().val("");
				$("input[name='emailAdd']").last().val("");
				addCheckUser();
			}
		});
		
		function addIndexRow() {
			$("#divTemplateAdd .row").each(function(index){
				$(this).attr("title", index);
			});
		}
		

		
			
	
	 
		function addCheckUser() {
			var i =$("#divTemplateAdd .row").length;
			$("#tdr1 .user"+i).html("<input type='checkbox' name='tdr1user"+i+"' checked>");
			$("#tdr2 .user"+i).html("<input type='checkbox' name='tdr2user"+i+"' >");
			$("#tdr3 .user"+i).html("<input type='checkbox' name='tdr3user"+i+"' >");
			$("#tdr4 .user"+i).html("<input type='checkbox' name='tdr4user"+i+"' >");
		}
		function addCheckUserLoad() {
			for(i=1; i<=6; i++) {
				
				$("#tdr1 .user"+i).html("");
				$("#tdr2 .user"+i).html("");
				$("#tdr3 .user"+i).html("");
				$("#tdr4 .user"+i).html("");
				
			}
			for(i=1; i<=$("#divTemplateAdd .row").length; i++) {
				
				var j = i-1;
				// if(tdr1[j] && tdr1[j] == 'Y')  
					$("#tdr1 .user"+i).html("<input type='checkbox' name='tdr1user"+i+"' checked>");
				// else
				//	$("#tdr1 .user"+i).html("<input type='checkbox' name='tdr1user"+i+"'>"); 
				
				if(tdr2[j] && tdr2[j] == 'Y') 
					$("#tdr2 .user"+i).html("<input type='checkbox' name='tdr2user"+i+"' checked>");
				else
					$("#tdr2 .user"+i).html("<input type='checkbox' name='tdr2user"+i+"'>");
				
				if(tdr3[j] && tdr3[j] == 'Y') 
					$("#tdr3 .user"+i).html("<input type='checkbox' name='tdr3user"+i+"' checked>");
				else
					$("#tdr3 .user"+i).html("<input type='checkbox' name='tdr3user"+i+"'>");
				
				if(tdr4[j] && tdr4[j] == 'Y')
					$("#tdr4 .user"+i).html("<input type='checkbox' name='tdr4user"+i+"' checked>");
				else
					$("#tdr4 .user"+i).html("<input type='checkbox' name='tdr4user"+i+"'>");
				
				
			}
		}
//	});
	function validateThongTin2(sub) {
		
		var check = 0;
		
		$("input[name='hoVaTen"+sub+"']").each(function(){
			if($(this).val() == "") {
				check ++;
				toastr.error("Full Name is not empty");
			}
		});
		$("input[name='soCmt"+sub+"']").each(function(){
			if($(this).val() == "") {
				check ++;
				toastr.error("ID card number is not empty");
			}
		});
		$("input[name='email"+sub+"']").each(function(){
			if(!validateEmail( $(this).val())) {
				check ++;
				toastr.error("Email invalid");
			}
		});
		if(check > 0) return false;
		return true;
	}
	function getArrayPersonUserDesignation(type) {
		var arr = [];
		$("input[name='soCmt"+type+"']").each(function(index){
			var json = {};
			if($("input[name='soCmt"+type+"']").eq(index).val() != "") {
				var userIndex = index+1;
				json["hoTen"] = $("input[name='hoVaTen"+type+"']").eq(index).val();
				json["soCmt"] = $("input[name='soCmt"+type+"']").eq(index).val();
				json["email"] = $("input[name='email"+type+"']").eq(index).val();
				json["tokenCheck"] = uuidv4();
				 if($("input[name='id"+type+"']").eq(index).val() == null || $("input[name='id"+type+"']").eq(index).val() == ""){
						
						json["id"] = uuidv4().substring(1, 8);
					}else{
					
						json["id"] = $("input[name='id"+type+"']").eq(index).val();
					}
				if($("input[name='tdr1user"+userIndex+"']")) {
					var valtaoLenh = $("input[name='tdr1user"+userIndex+"']").prop("checked")?"Y":"N";
					json["taoLenh"] = valtaoLenh;		
					var valbaoCao = $("input[name='tdr2user"+userIndex+"']").prop("checked")?"Y":"N";
					json["baoCao"] = valbaoCao;	
					var valchapThuanLenh = $("input[name='tdr3user"+userIndex+"']").prop("checked")?"Y":"N";
					json["chapThuanLenh"] = valchapThuanLenh;	
					var valchapThuanLenhDongThoi = $("input[name='tdr4user"+userIndex+"']").prop("checked")?"Y":"N";
					json["chapThuanLenhDongThoi"] = valchapThuanLenhDongThoi;	
				}
				arr.push(json);
			}
		});
//	 	console.log(arr);
		return arr;
	}
</script>