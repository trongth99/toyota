<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="springForm"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@include file="../layout/js.jsp"%>


<springForm:form method="POST" action="" id='submitFormModal' modelAttribute="business">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="modal-header">
			<h2>${name}
				<spring:message code="doanh_nghiep" />
			</h2>
		</div>
		<div class="modal-body">
			<div class="row clearfix">
				<div class="col-md-6 mb-0">
					<label><spring:message code="ten_dang_nhap" /> (*)</label>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="text" class="form-control" value="<c:out value='${business.username }'/>" name="username" id="username" >
							<input type="hidden" class="form-control" value="<c:out value='${business.id }'/>" name="id"  id="id" autocomplete="nofill">
						</div>
					</div>
				</div>
				<div class="col-md-6 mb-0">
					<label class="form-label"><spring:message code="ho_va_ten" /> (*)</label>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="text" class="form-control" value="<c:out value='${business.fullName }'/>" name="fullName">
						</div>
					</div>
				</div>
				<div class="col-md-6 mb-0">
					<label class="form-label"><spring:message code="mat_khau" /></label>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" class="form-control" value="" name="password" autocomplete="new-password">
						</div>
					</div>
				</div>
				<div class="col-md-6 mb-0">
					<label class="form-label"><spring:message code="email" /></label>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="text" class="form-control" value="<c:out value='${business.email }'/>" name="email">
						</div>
					</div>
				</div>

				<div class="col-md-6 mb-0">
					<label class="form-label"><spring:message code="trang_thai" /></label>
					<div class="form-group form-float">
						<div class="form-line">
							<select class="form-control show-tick" name="status">
								<option value="1" ${business.status eq '1' ? 'selected': ''}><spring:message code="hoat_dong" /></option>
								<option value="0" ${business.status eq '0' ? 'selected': ''}><spring:message code="khong_hoat_dong" /></option>
							</select>
						</div>
					</div>
				</div>
				
			<%-- 	<c:set var="grid" value='${fn:split(fn:replace(business.groupId," ", ""), ",")}' /> --%>
	<%-- 			<div class="col-md-6 mb-0">
					<label class="form-label"><spring:message code="nhom_nguoi_dung" /> (*)</label>
					<div class="form-group form-float">
						<div class="form-line" style="display: flex;flex-direction: column-reverse;">
							<select class="form-control select2 " name="groupId" multiple="multiple"  style="width: 100%;">
								<option value="0">--
									<spring:message code="chon_nhom_nguoi_dung" /> --
								</option>
								<c:forEach items="${userGroups }" var="item">
									<c:set var="contains" value="false" />
									<c:forEach var="it" items="${grid}">
										<c:if test="${it eq item.id}">
											<c:set var="contains" value="true" />
										</c:if>
									</c:forEach>

									<c:if test="${item.groupName eq 'supper_admin' }">
										<c:if test="${username eq 'supper_admin' }">
											<option value="${item.id }" <c:if test="${contains}">selected="selected"</c:if>><c:out value='${item.groupName}'/></option>
										</c:if>
									</c:if>
									<c:if test="${item.groupName ne 'supper_admin' }">
										<option value="${item.id }" <c:if test="${contains}">selected="selected"</c:if>><c:out value='${item.groupName}'/></option>
									</c:if>
								</c:forEach>
							</select>
							
						</div>
						
					</div>
					
				</div> --%>
				
				<div class="col-md-12 mb-0 text-center">
					<span style="color: red; font-size: 12px;" id="ajax-error"></span>
				</div>
				<div class="col-md-12 mb-0 text-right">
					<div id="ajax-load" class="preloader pl-size-xs hidden">
						<div class="spinner-layer pl-red-grey">
							<div class="circle-clipper left">
								<div class="circle"></div>
							</div>
							<div class="circle-clipper right">
								<div class="circle"></div>
							</div>
						</div>
					</div>
					<button type="submit" class="btn btn-primary btn-sm" > 
						<i class="fa fa-save"></i> <span><spring:message code="luu" /></span>
					</button>
					<button class="btn btn-danger btn-sm" data-dismiss="modal">
						<i class="fa fa-times"></i> <span><spring:message code="dong" /></span>
					</button>
				</div>
			<div class="text-left col-md-12 mb-0">
			            <ol>
				              <li> Mật khẩu có độ dài từ 8 đến 12 ký tự / Password must be between 8 and 12 characters long. </li>
				               <li> Mật khẩu phải chứa chữ hoa, chữ thường, số và ký tự đặc biệt/Password must contain uppercase, lowercase letters, numbers and special characters</li>
				                
				                 <li> Mật khẩu không được phép giống với tên tài khoản người dùng /Password shall not allow to be the same as user account name.</li>
			            </ol>
	         </div>
			</div>

		</div>
	</div>
</springForm:form>
<script type="text/javascript">

	$(document).ready(function() {
						
						
						$.validator.addMethod("valueNotEquals", function(value,element, arg) {
							return arg !== value;
						}, "Value must not equal arg.");

						$("#submitFormModal").validate({

											ignore : function(index, el) {
												let $el = $(el);
												if ($el
														.hasClass('always-validate')) {
													return false;
												}
												return $el.is(':hidden');
											},
											rules : {
												username : {
													required : true
												},
												fullName : {
													required : true
												},
												
												email : {
													  required : true
												},
												password : {
													required : true
												}
												 /* groupId : {
													required : true
												}  */
											},
											messages : {
												username : {
													required : '<spring:message code="nhap_ten_dang_nhap" />',
												},
												fullName : {
													required : '<spring:message code="nhap_ho_va_ten" />'
												},
												
												email : {
											    	  required : '<spring:message code="nhap_email" />'
												},
												password : {
													 required : '<spring:message code="nhap_password" />'
												}
												/*  groupId : {
													required : '<spring:message code="chon_nhom_nguoi_dung" />'
												}   */
											}
										}
										
									
								);
					});
	
</script>

<%@include file="../layout/footerAjax.jsp"%>
