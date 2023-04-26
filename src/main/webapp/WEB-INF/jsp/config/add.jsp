<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="springForm"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@include file="../layout/js.jsp"%>


<springForm:form method="POST" action="" id='submitFormModal' modelAttribute="config">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="modal-header">
			<h2>${name} <spring:message code="cau_hinh" /></h2>
		</div>
		<div class="modal-body">
			<div class="row clearfix">
				<div class="col-md-6 mb-0">
					<label><spring:message code="ma" /></label>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="text" class="form-control" value="<c:out value='${config.ma }'/>" name="ma" autocomplete="nofill">
						</div>
					</div>
				</div>
				<div class="col-md-6 mb-0">
					<label class="form-label"><spring:message code="gia_tri" /></label>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="text" class="form-control" value="<c:out value='${config.giaTri }'/>" name="giaTri" />
						</div>
					</div>
				</div>
				<div class="col-md-6 mb-0">
					<label class="form-label"><spring:message code="mo_ta" /></label>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="text" class="form-control" value="<c:out value='${config.moTa }'/>" name="moTa">
						</div>
					</div>
				</div>
				<div class="col-md-6 mb-0">
					<label class="form-label"><spring:message code="trang_thai" /></label>
					<div class="form-group form-float">
						<div class="form-line">
							<select class="form-control show-tick" name="trangThai">
								<option value="0" ${config.trangThai eq '0' ? 'selected': ''}><spring:message code="khong_hoat_dong" /></option>
								<option value="1" ${config.trangThai eq '1' ? 'selected': ''}><spring:message code="hoat_dong" /></option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-12 mb-0 text-right">
					<button type="submit" class="btn btn-primary btn-sm">
						<i class="fa fa-save"></i> <span><spring:message code="luu" /></span>
					</button>
					<button class="btn btn-danger btn-sm" data-dismiss="modal">
						<i class="fa fa-times"></i> <span><spring:message code="dong" /></span>
					</button>
				</div>
			</div>
		</div>
	</div>
</springForm:form>
<script type="text/javascript">
	$(document).ready(function() {

		$("#submitFormModal").validate({
			rules : {
				ma : {
					required : true
				},
				giaTri : {
					required : true
				}
			},
			messages : {
				ma : {
					required : '<spring:message code="nhap_ma_cau_hinh" />',
				},
				giaTri : {
					required : '<spring:message code="nhap_gia_tri" />'
				}
			}
		});
	});
</script>

<%@include file="../layout/footerAjax.jsp"%>
