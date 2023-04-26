<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="springForm"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Ekyc</title>

<c:if test="${empty imageLogo }">
<link rel='SHORTCUT ICON' href='${contextPath }/img/logoscnew.ico' sizes="62x62" type='image/x-icon'  />
</c:if>  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${contextPath }/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath }/css/bootstrap.min.css">
  <script src="${contextPath }/js/jquery.min.js"></script>
  <script src="${contextPath }/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${contextPath }/css/bootstrap-datepicker.min.css">
  <script src="${contextPath }/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="${contextPath }/plugins/toastr/toastr.min.css">
<script src="${contextPath }/plugins/toastr/toastr.min.js"></script>
<link href="${contextPath }/plugins/sweetalert/sweetalert.css" rel="stylesheet" />
<script src="${contextPath }/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
var flag = true;
</script>
<link rel="stylesheet" type="text/css" href="${contextPath }/css/xSigner.css">
<link rel="stylesheet" type="text/css" href="${contextPath }/css/xSigner.css">
<script src='${contextPath }/js/xSignerEkyc.js'></script>
<style>
/*@import url('//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css');*/
 body {
    margin-top:30px;
}


.stepwizard-step p {
    margin-top: 0px;
    color:#666;
}
.stepwizard-row {
    display: table-row;
}
.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}
.stepwizard-step button[disabled] {
    /*opacity: 1 !important;
    filter: alpha(opacity=100) !important;*/
}
.stepwizard .btn.disabled, .stepwizard .btn[disabled], .stepwizard fieldset[disabled] .btn {
    opacity:1 !important;
    color:#bbb;
}
.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content:" ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-index: 0;
}
.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}
.btn-circle {
    width: 30px;
    height: 30px;
    text-align: center;
    padding: 6px 0;
    font-size: 12px;
    line-height: 1.428571429;
    border-radius: 15px;
}
.setup-content {
display: none;
}
.delete{
    margin-top: 35px;
}

.img-thumbnail {
max-width: 400px;
}
@media only screen and (max-width: 500px) {
  .img-thumbnail {
  	  max-width: 100%;
  }
}

/*  input[type=radio] {
    appearance: none;
    background-color: #fff;
    width: 13px;
    height: 13px;
    border: 1px solid #ccc;
    border-radius: 2px;
    display: inline-grid;
    place-content: center; 
  }

input[type=radio]::before {
    content: "";
    width: 10px;
    height: 10px;
    transform: scale(0);
    transform-origin: bottom left;
    background-color: #fff;
    clip-path: polygon(13% 50%, 34% 66%, 81% 2%, 100% 18%, 39% 100%, 0 71%);
}

input[type=radio]:checked::before {
     transform: scale(1); 
}
input[type=radio]:checked{
    background-color:   #0075FF;
   border: 2px solid #0075FF;
}  */
</style>
<body>
	<div class="container">
	<div style="display: block;">
		<div class="pull-left">
			 <img style="width: 185px;height: 95px;" src="${contextPath}/img/logosc%2031.png" alt="Logo" class="brand-image elevation-3"> 
		</div> 
		
		
		     <div class="pull-right " style=" margin-top: 35px;">
			     <a href="${contextPath }/logout-ekyc-doanh-nghiep" class="btn btn-default btn-flat ">Logout/ Đăng Xuất</a>
			</div> 
			<div class="pull-right " style=" margin-top: 35px;margin-right: 10px;">
				<a href="${contextPath }/doanh-nghiep/change-pass" class="btn btn-default btn-flat ">Change Password/ Đổi Mật Khẩu</a>
			</div>
		
	</div>

		<%@include file="menuStepDn2.jsp"%>
		<%@include file="doanhnghiep2/step0.jsp"%>
		<%@include file="doanhnghiep2/step1.jsp"%>
		<%@include file="doanhnghiep2/step2.jsp"%>
		<%@include file="doanhnghiep2/step3.jsp"%>
		<%@include file="doanhnghiep2/step4.jsp"%>
		<%@include file="doanhnghiep2/step44.jsp"%>
		<%@include file="doanhnghiep2/step5.jsp"%>
		<%@include file="doanhnghiep2/step6.jsp"%>
		<%@include file="doanhnghiep2/step10.jsp"%>
		<%@include file="doanhnghiep2/step12.jsp"%>
		<%@include file="doanhnghiep2/step14.jsp"%>
	</div>
	<script type="text/javascript">
		var successIcon = '<span class="glyphicon glyphicon-ok form-control-feedback"></span>';
		var successClass = 'has-success';
		var errorIcon = '<span class="glyphicon glyphicon-remove form-control-feedback"></span>';
		var errorClass = 'has-error';
		$(document).ready(function () {
			$('.datepicker').datepicker({
			     autoclose: true,
			     format: 'dd/mm/yyyy'
			})
			
		    var navListItems = $('div.setup-panel div.stepwizard-step a'),
		        allWells = $('.setup-content'),
		        allNextBtn = $('.nextBtn');
	
		    allWells.hide();
	
		    navListItems.click(function (e) {
		        e.preventDefault();
		        var $target = $($(this).attr('href')),
		            $item = $(this);
		        
				var curClick = $(this).text().trim();
				
				//comment de bo khoa chon
 		    	navListItems.each(function(){
 		        	if(parseInt($(this).text().trim()) > parseInt(curClick)) {
 		        		$(this).attr("disabled", "disabled");
 		        		$(this).addClass("disabled");
 		        	}
 		        })   
		        if (!$item.hasClass('disabled')) {
		            navListItems.removeClass('btn-success').addClass('btn-default');
		            $item.addClass('btn-success');
		            allWells.hide();
		            $target.show();
		            $target.find('input[type="text"]:eq(0)').focus();
		        }
		    });
	
		    $('div.setup-panel div a.btn-success').trigger('click');
		});
		
		function nextStep(obj) {
			var curStep = $(obj).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;
// 	        isValid = validate(curStepBtn);

	        if (isValid) {
	        	nextStepWizard.removeClass('disabled');
	        	nextStepWizard.removeAttr('disabled').trigger('click');
	        }
		}
		
		function prevStep(obj) {
			var curStep = $(obj).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().prev().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;
// 	        isValid = validate(curStepBtn);

	        if (isValid) {
	        	nextStepWizard.removeClass('disabled');
	        	nextStepWizard.removeAttr('disabled').trigger('click');
	        }
		}
		
		//validate step here
		function validate(curStepBtn) {
			if(curStepBtn == "step-2") {
				return validateStep2(curStepBtn);
			}
			return true;
		}
		function getBase64(file, idZen) {
		   var reader = new FileReader();
		   reader.readAsDataURL(file);
		   reader.onload = function () {
			   base64 = reader.result.replace(/^data:.+;base64,/, '');
			   $("#"+idZen).html(base64);
			   $("#"+idZen+"Img").attr("src", "data:image/jpeg;base64,"+base64);
			   $("#"+idZen+"Img").show();
		   };
		   reader.onerror = function (error) {
		     	console.log('Error: ', error);
		   };
		}
		function getBase64File(file, idZen) {
		   var reader = new FileReader();
		   reader.readAsDataURL(file);
		   reader.onload = function () {
			   base64 = reader.result.replace(/^data:.+;base64,/, '');
			   $("#"+idZen).html(base64);
		   };
		   reader.onerror = function (error) {
		     	console.log('Error: ', error);
		   };
		}
		function addCheckClass(value, valueCheck, type, id) {
			$("#"+id).parent().removeClass(successClass);
			$("#"+id).parent().removeClass(errorClass);
			if(type == "string") {
				if((valueCheck != null && value != null && value.toLowerCase() == valueCheck.toLowerCase())) {
					$("#"+id).parent().addClass(successClass);
					$("#"+id).parent().append(successIcon);
				} else if (valueCheck == "" || valueCheck == null || value == "" || value == null) {
					
				} else {
					$("#"+id).parent().addClass(errorClass);
					$("#"+id).parent().append(errorIcon);
					$("#"+id).parent().append('<span class="help-block">'+valueCheck+'</span>');
				}
			}
		}
		var _validFileExtensions = [".jpg", ".pdf", ".jpeg", ".png"];    
		function ValidateSingleInput(oInput) {
		    if (oInput.type == "file") {
		        var sFileName = oInput.value;
		         if (sFileName.length > 0) {
		            var blnValid = false;
		            for (var j = 0; j < _validFileExtensions.length; j++) {
		                var sCurExtension = _validFileExtensions[j];
		                if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
		                    blnValid = true;
		                    break;
		                }
		            }
		             
		            if (!blnValid) {
		            	toastr.error("Chỉ chấp nhận file có định dạng " + _validFileExtensions.join(", "));
		                oInput.value = "";
		                return false;
		            }
		        }
		    }
		    return true;
		}
		
		function addEventAllFile(fileInput, idBase64, idNameShow) {
			$("#"+fileInput).change(function(){
				if(ValidateSingleInput(this)) {
					var file =document.getElementById(fileInput).files[0];
					var url =URL.createObjectURL(file );
					$("#"+idBase64+"Img").attr("src", url);
					$("#"+idBase64).html("");
					$("#"+idBase64+"Img").show();
					getBase64File(file, idBase64);
					
					$("#"+idNameShow).html($("#"+fileInput).val());
					if($("#"+idNameShow).html()!="") {
						$("#"+idNameShow).show();
					}
				}
			}); 
			
			$("#"+fileInput).click(function(){
				$("#"+fileInput).val("");
				$("#"+idNameShow).hide();
			})
		}
		
		function addEventFile(fileInput, idBase64, idNameShow) {
			$("#"+fileInput).change(function(){
				if(ValidateSingleInput(this)) {
					$("#"+idBase64).html("");
					var file = document.querySelector('#'+fileInput).files[0];
					getBase64(file, idBase64);
				}
				$("#"+idNameShow).html($("#"+fileInput).val());
				if($("#"+idNameShow).html()!="") {
					$("#"+idNameShow).show();
				}
			});
			$("#"+fileInput).click(function(){
				$("#"+fileInput).val("");
				$("#"+idNameShow).hide();
				$("#"+idBase64+"Img").attr("src", "");
				$("#"+idBase64+"Img").hide();
			})
		}
		function numberWithCommas(x) {
			if(x && x.trim()!="")
		    	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
			return "";
		}
		
	</script>
	
</body>
</html>
