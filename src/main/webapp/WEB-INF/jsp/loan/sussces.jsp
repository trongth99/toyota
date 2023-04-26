<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/js.jsp"%>

<div class="col-md-12 register-right">
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
			<h3 class="register-heading" style="color: black;">${message }</h3>
			<br/>
		</div>
		<input type="hidden" class="form-control input-sm" id="result" value="<c:out value='${txn.result}'/>"/>
		<input type="hidden" class="form-control input-sm" id="result_code" value="<c:out value='${txn.result_code}'/>"/>
		
		<input type="hidden" class="form-control input-sm" id="message" value="<c:out value='${txn.message}'/>"/>
		
	</div>
	<div class="row justify-content-center">
	  <button class="btnRegister "  id="btnRegisters" type="button"  style="background: #CCC;color: black;width: 200px;" style="background-color: black;">Close/ Đóng</button>
	</div>
	
</div>


<script>
 $(document).ready(function(){
	 location.href = 'https://tfsapp.page.link/app';
	        var data = {
				"result": $("#result").val(),
				"result_code": $("#result_code").val(),
				"message": $("#message").val(),
				//"editStatusKtt":$("#editStatusKtt").is(":checked")?"no":"yes",
			};
	        console.log(JSON.stringify(data));
	 window.ReactNativeWebView.postMessage(JSON.stringify(data))
	
}); 
</script>
<%@include file="../layout/footer.jsp"%>
			
