<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../layout/header2.jsp"%>
<%@include file="../layout/js.jsp"%>

<!-- Content Wrapper. Contains page content -->

<style>
.row {
	margin-bottom: 10px;
}

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

.typeCar {
	border-top: unset;
	border-left: unset;
	border-right: unset;
}

.phienBan {
	border-top: unset;
	border-left: unset;
	border-right: unset;
}

.pre:hover {
	border: none;
	border-bottom-color: 1px soid #ddd;
}

.pre {
	margin-right: 70px !important;
}

.input {
	color: black;
	margin: auto;
	width: 100%;
	font-weight: bold;
	text-align: center;
}

div.slider img {
	text-align: center;
	background: orange;
	font-size: 6rem;
	line-height: 3;
	margin: 0;
}

.bx-pager-item {
	display: none;
}

.user-image {
	height: 33%;
	width: 347px;
	border-radius: 3px;
	float: left;
	list-style: none;
	position: relative;
}

img {
	width: 100%;
}

.height {
	height: 10px;
}

/* Image-container design */
.image-container {
	max-width: 800px;
	position: relative;
	margin: auto;
	min-height: 200px;
	display: flex;
	align-items: center;
}

.next {
	right: 0;
}

/* Next and previous icon design */
.previous, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	padding: 10px;
	margin-top: -25px;
}

/* caption decorate */
.captionText {
	color: #000000;
	font-size: 14px;
	position: absolute;
	padding: 12px 12px;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Slider image number */
.slideNumber {
	background-color: #5574C5;
	color: white;
	border-radius: 25px;
	right: 0;
	opacity: .5;
	margin: 5px;
	width: 30px;
	height: 30px;
	text-align: center;
	font-weight: bold;
	font-size: 24px;
	position: absolute;
}

.fa {
	font-size: inherit;
}

/* .fa:hover {
	transform: rotate(360deg);
	transition: 1s;
	color: white;
} */

.footerdot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbbbbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.5s ease;
}

.active, .footerdot:hover {
	background-color: white;
}
</style>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->


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

					<div class="col-sm-7">
						<div class="group-tabs">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active "><a class="pre"
									href="#home" aria-controls="home" role="tab" data-toggle="tab">1.CHỌN
										PHƯƠNG TIỆN</a></li>
								<li role="presentation"><a class="pre" href="#profile"
									aria-controls="profile" role="tab" data-toggle="tab">2.CHỌN
										KẾ HOẠCH</a></li>
								<li role="presentation"><a class="pre" href="#messages"
									aria-controls="messages" role="tab" data-toggle="tab">3.GỬI
										THÔNG TIN</a></li>


							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="home">
									<div class="row">
										<div class="col-sm-12" style="color: red; margin-top: 20px;">
											<label>THÔNG TIN XE</label>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12">
											<div class="col-sm-4">
												<div class="col-sm-12">Thương hiệu</div>
												<div class="col-sm-12">
													<input type="text" id="thuongHieu" name="thuongHieu"
														value="Toyota"
														style="border-top: unset; border-left: unset; border-right: unset;">
												</div>
											</div>

											<div class="col-sm-4">
												<div class="col-sm-12">Mẫu xe</div>
												<div class="col-sm-12">
													<select class="typeCar" name="car" id="car">
														<option value="1" selected="selected">VIOS</option>
														<option value="2">Camry</option>

													</select>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="col-sm-12">Phiên bản</div>
												<div class="col-sm-12">
													<select class="phienBan" value="${cars }" name="loai"
														id="loai">

													</select>
												</div>
											</div>
										</div>

										<div class="col-sm-12" style="margin-top: 20px;">
											<div class="col-sm-6">
												<div class="col-sm-12">Mẫu xe</div>
												<div class="col-sm-12">
													<img src="" class="user-image" id="img" name="img"
														alt="User Image"
														style="height: 50%; width: 100%; border-radius: 3px">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="col-sm-12">Chọn phụ kiện</div>
												<div class="col-sm-12">
													<input type="text" id="phuKien" name="phuKien"
														value="Không"
														style="border-top: unset; border-left: unset; border-right: unset;">
												</div>
											</div>



										</div>
										<div class="col-sm-12" style="margin-top: 10px;">
											<div class="col-sm-6 text-center " style="color: red;">
												<label>Giá <input type="reset" id="price"
													name="price"
													style="background-color: white; border: unset; color: red;"></label></br>
												</br> <i class="fa fa-check-circle-o " aria-hidden="true"
													style="font-size: 20px; color: red;"></i>
											</div>
											<div class="col-sm-6"></div>

										</div>
										<div class="col-sm-12"
											style="margin-top: 40px; display: flex;">
											<div class="col-sm-8">
												<div class="col-sm-12">Bảo hiểm vật chất xe(gói 1 năm)</div>
												<div class="col-sm-12"
													style="display: flex; margin-top: 5px;">

													<input type="radio" id="css" name="baoHiem"
														value="Không mua" style="margin-top: 0px;"
														checked="checked">&ensp;Không mua&ensp;&ensp; <input
														type="radio" id="css" name="baoHiem" value="Có mua"
														style="margin-top: 0px;">&ensp; Có mua
												</div>
											</div>


										</div>
										<div class="col-sm-12"
											style="margin-top: 40px; display: flex;">
											<div class="col-sm-5">
												<div class="col-sm-12"
													style="background-color: #fdb8b8; border-radius: 3px; margin-left: 15px; height: 35px;">
													<div style="margin: 8px;">
														TỔNG GIÁ TRỊ XE: <input type="reset" id="total"
															name="total"
															style="border: unset; color: red; background-color: #fdb8b8;">
													</div>


												</div>

											</div>


										</div>
										<div class="col-sm-12"
											style="margin-top: 40px; display: flex;">
											<div class="row">
												<div class="col-sm-12">
													<label>GIẢI PHÁP CHÍNH</label>

												</div>
												<div class="col-sm-12">
													<div class="col-sm-4">Khách hàng:</div>
													<div class="col-sm-3">
														<input type="radio" id="css" name="khachHang"
															value="Không mua" style="margin-top: 0px;"
															checked="checked">&ensp; Cá nhân
													</div>
													<div class="col-sm-4">
														<input type="radio" id="css" name="khachHang"
															value="Không mua" style="margin-top: 0px;">&ensp;
														Doanh nghiệp
													</div>

												</div>
												<div class="col-sm-12" style="margin-top: 10px;">
													<div class="col-sm-4">Mục đích sử dụng:</div>
													<div class="col-sm-3">
														<input type="radio" id="css" name="fav_language"
															value="Không mua" style="margin-top: 0px;"
															checked="checked">&ensp; Kinh doanh
													</div>
													<div class="col-sm-4">
														<input type="radio" id="css" name="fav_language"
															value="Không mua" style="margin-top: 0px;">&ensp;
														Không kinh doanh
													</div>

												</div>

											</div>



										</div>
										<div class="col-sm-12" style="margin-top: 20px;">
											<div class="row">
												<div class="col-sm-6">

													<div class="col-sm-12">Số tiền trả trước:</div>
													<div class="col-sm-12" style="margin: 10px 0px 20px 0px;">
														<input type="text" id="minval"
															style="color: black; font-weight: bold; margin: auto; display: block;">
													</div>
													<div class="col-sm-12">
														<div id="slider-5"></div>
													</div>
												</div>
												<div class="col-sm-6">

													<div class="col-sm-12">Số tiền trả trước:</div>
													<div class="col-sm-12" style="margin: 10px 0px 20px 0px;">
														<input type="text" id="minval1"
															style="color: black; font-weight: bold; margin: auto; display: block;">
													</div>
													<div class="col-sm-12">
														<div id="slider-6"></div>
													</div>
												</div>

											</div>




										</div>
									</div>
								</div>



							</div>
						</div>


					</div>
					<div class="col-sm-4"
						style="border: 2px solid red; border-radius: 10px;">
						<div class="row">
							<div class="col-sm-12 text-center"
								style="color: red; margin-top: 10px;">
								<label>GỢI Ý MẪU XE PHÙ HỢP</label>
							</div>
							<div class="col-sm-12 text-center" sty>
								<p>Hãy để TFSVN giúp bạn tìm ra mẫu xe phù hợp với khả năng
									tài chính !</p>
							</div>
							<div class="col-sm-12 text-center">
								<p>Chọn khoảng trả góp mong muốn mỗi tháng</p>
							</div>
							<div class="col-sm-12 ">
								<div class="col-sm-5">
									<input type="text" id="minval3" name="minval3" class="input">
								</div>

								<div class="col-sm-2">&ensp;-&ensp;</div>

								<div class="col-sm-5">
									<input type="text" id="minval4" name="minval4" class="input">
								</div>
							</div>
							<div class="col-sm-12" style="margin-top: 20px;">
								<div class="col-sm-12">
									<div id="slider-7"></div>
								</div>

							</div>
							<div class="col-sm-12" style="margin-top: 20px;">
									
									<div class="" style="background-color: #fdb8b8; border-radius: 15px; margin:auto;width:70%; height: 35px;">
										<div style="margin: 8px;color: red;text-align: center;"><label style="margin: inherit;">TOYOTA VIOS</label><iv>


									</div>
									


								</div>
								<div class="col-sm-12 text-center">
								 
								   <p> trả góp chỉ từ <font style="color: red;">7000000đ</font>/tháng</p>
								 
								      
								 </div>
							<div class="col-sm-12">


								<div class="image-container">


									<!-- Next and Previous icon to change images -->

								</div>
								<a class="previous" onclick="moveSlides(-1)" style="color: black;"> <i class="fa fa-chevron-circle-left"></i>
								</a>
								 <a class="next" onclick="moveSlides(1)" style="color: black;"> <i class="fa fa-chevron-circle-right"></i>
								</a>

								
							</div>
							<div class="colsm-12 text-center" style="color: red;font-size: 18px;">
							    <label>Với gói vay Balloan</label>
							</div>


							<div class="col-sm-12 " style="margin-bottom: 10px;">
								<button type="submit" class="input-group  btn btn-danger "
									style="width: 100%;">Đăng ký ngay</button>
							</div>
						</div>



					</div>

				</div>
			</div>

		</div>

		<!-- 	</form> -->

		<!-- /.content -->
	</div>

	<%-- <%@include file="../layout/footer2.jsp"%> --%>



<script type="text/javascript">

function formatNumber (num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
}

var slideIndex = 1;
displaySlide(1);

function moveSlides(n) {
    displaySlide(slideIndex += n);
}

function activeSlide(n) {
    displaySlide(slideIndex = n);
}

/* Main function */
function displaySlide(n) {
    var i;
    var totalslides =$(".slide").tooltip();
       // document.getElementsByClassName("slide");
     
   
     
    if (n > totalslides.length) {
        slideIndex = 1;
    }
    if (n < 1) {
        slideIndex = totalslides.length;
    }
    for (i = 0; i < totalslides.length; i++) {
        totalslides[i].style.display = "none";
        if(slideIndex == 1){
        	totalslides[0].style.display = "block";
        }
    }
  
    if(slideIndex > 1){
    	totalslides[slideIndex - 1].style.display = "block";
    }
    
   
}




   
	$(document).ready(function() {
		
	

			
		
			
		
		//$(".slider").bxSlider();
		
		
		$(function() {
			$("#slider-5").slider({
				orientation : "horizontal",
				min : 83700000,
				max : 200000000,
				value : 83700000,
				slide : function(event, ui) {
					$("#minval").val(formatNumber(ui.value) + "đ/15%");
					
				}
			});
			$("#minval").val(formatNumber($("#slider-5").slider("value")) + "đ/15%");

			$("#slider-6").slider({
				orientation : "horizontal",
				min : 12,
				max : 36,
				value : 12,
				slide : function(event, ui) {
					$("#minval1").val( ui.value + " tháng");
				}
			});
			$("#minval1").val($("#slider-6").slider("value") + " tháng");

		

		});
		
		
		////////////////
		
		
	    		$.ajax({
	    			url:'${contextPath }/api/listTypeCar?id='+$("#car").val(),
	    		    type: 'GET',
	    		    processData: false,
	    		    contentType: false
	    		}).done(function(data) {
	    			var str = "";
	    			for ( x in data.cars) {
	    				  str += "<option value="+data.cars[x].type+">"+data.cars[x].type+"</option>"
	    				  $("#price").val(data.cars[x].price);
	    				  $("#total").val(data.cars[x].price);
	    			} 
	    			$("#loai").html(str);
	    			//////////////////////////////
	    		  console.log($("#loai").val());
		    		var data = {
		    				"id" : $("#car").val(),
		    				"type" : $("#loai").val()
		    			};
		    		
		    			$.ajax({
		    						url : '${contextPath }/api/getCar',
		    						data : JSON.stringify(data),
		    						type : 'POST',
		    						processData : false,
		    						contentType : false
		    					})
		    					.done(function(data) {
		    						console.log(data);
		    						var path = '${contextPath }/img/'+ data.img+'';
		    						 $("#img").attr("src",path);
		    						 $("#price").val(formatNumber(data.price));
		    						 $("#total").val(formatNumber(data.price));

		    					}).fail(function(data) {
		    								toastr.error("<spring:message code="ekycdn.loi_kiem_tra_thong_tin" />");
		    								$(obj).button('reset');
		    							});
		    			
		    			
		    			////////////////
	    		}).fail(function(data) {
	    			toastr.error("Lỗi kiểm tra thông tin");
	    			$(obj).button('reset');
	    		});
	    	
		//////////////
		   /* console.log($("#minval3").val());
	    		var data = {
	    				"fromPrice" : "500000000",
	    				"toPrice" : "15000000000"
	    			};
	    		   
	    			$.ajax({
	    						url : '${contextPath }/api/searchCar',
	    						data : JSON.stringify(data),
	    						type : 'POST',
	    						processData : false,
	    						contentType : false
	    					})
	    					.done(function(data) {
	    						console.log(data);
	    						var str = "";
	    		    			
	    		    			for ( x in data.cars) {
	    		    				//  str += "<option value="+data.cars[x].type+">"+data.cars[x].type+"</option>"
	    		    				//  str +=" <img src="${contextPath }/img/""" class="user-image" alt="User Image" style="height: 33%;width: 100%;border-radius: 3px">"
	    		    				console.log(data.cars[x].img);
	    		    				var link = "${contextPath }/img/"+data.cars[x].img+"";
	    		    				
	    		    				var cla = "slide";
	    		    				
	    		    				  str +="<div class="+cla+"><img  src="+link+"></div>"
	    		    				 
	    		    			} 
	    		    			$(".image-container").html(str);
	    						console.log(str)
	    					}).fail(function(data) {
	    								toastr.error("<spring:message code="ekycdn.loi_kiem_tra_thong_tin" />");
	    								$(obj).button('reset');
	    							}); */
	    
			
	});
	
	$("#slider-7").slider({
		orientation : "horizontal",
		min : 0,
		max : 60000000,

		values : [ 5000000, 45000000 ],
		slide : function(event, ui) {
			$("#minval3").val(formatNumber(ui.values[0]));
			$("#minval4").val(formatNumber(ui.values[1]));
		}
	});
	$("#minval3").val(formatNumber($("#slider-7").slider("values", 0)));
	$("#minval4").val(formatNumber($("#slider-7").slider("values", 1)));
	
	console.log($("#minval3").val().toString().replaceAll(",", ""));
	//$("<h2>New Heading</h2>").replaceAll("h2");
	var data = {
			"fromPrice" : $("#minval3").val().toString().replaceAll(",", ""),
			"toPrice" : $("#minval4").val().toString().replaceAll(",", "")
		};
	   
		$.ajax({
					url : '${contextPath }/api/searchCar',
					data : JSON.stringify(data),
					type : 'POST',
					processData : false,
					contentType : false
				})
				.done(function(data) {
					console.log(data);
					var str = "";
	    			
	    			for ( x in data.cars) {
	    				//  str += "<option value="+data.cars[x].type+">"+data.cars[x].type+"</option>"
	    				//  str +=" <img src="${contextPath }/img/""" class="user-image" alt="User Image" style="height: 33%;width: 100%;border-radius: 3px">"
	    				console.log(data.cars[x].img);
	    				var link = "${contextPath }/img/"+data.cars[x].img+"";
	    				
	    				var cla = "slide";
	    				
	    				  str +="<div class="+cla+"><img  src="+link+"></div>"
	    				 
	    			} 
	    			$(".image-container").html(str);
					console.log(str)
				}).fail(function(data) {
							toastr.error("<spring:message code="ekycdn.loi_kiem_tra_thong_tin" />");
							$(obj).button('reset');
						});

	
	
	  $("#car").change(function(){
  		$.ajax({
  			url:'${contextPath }/api/listTypeCar?id='+$("#car").val(),
  		    type: 'GET',
  		    processData: false,
  		    contentType: false
  		}).done(function(data) {
  			
  			var str = "";
  			
  			for ( x in data.cars) {
  			  str += "<option value="+data.cars[x].type+">"+data.cars[x].type+"</option>"
  			  $("#price").val(formatNumber(data.cars[x].price));
  			  $("#total").val(formatNumber(data.cars[x].price));
  			} 
  			$("#loai").html(str);
  			console.log($("#loai").val());
	  		var data = {
	  				"id" : $("#car").val(),
	  				"type" : $("#loai").val()
	  			};
	  		
	  			$.ajax({
	  						url : '${contextPath }/api/getCar',
	  						data : JSON.stringify(data),
	  						type : 'POST',
	  						processData : false,
	  						contentType : false
	  					})
	  					.done(function(data) {
	  						console.log(data);
	  						var path = '${contextPath }/img/'+ data.img+'';
	  						 $("#img").attr("src",path);
	  						 $("#price").val(formatNumber(data.price));
	  						 $("#total").val(formatNumber(data.price));


	  					}).fail(function(data) {
	  								toastr.error("<spring:message code="ekycdn.loi_kiem_tra_thong_tin" />");
	  								$(obj).button('reset');
	  							});
  			//$("#chiNhanh").selectize()[0].selectize.destroy();

  		}).fail(function(data) {
  			toastr.error("Lỗi kiểm tra thông tin");
  			$(obj).button('reset');
  		});
  	});
	  
	  
	
	  $("#loai").change(function(){
		  console.log($("#loai").val());
  		var data = {
  				"id" : $("#car").val(),
  				"type" : $("#loai").val()
  			};
  		
  			$.ajax({
  						url : '${contextPath }/api/getCar',
  						data : JSON.stringify(data),
  						type : 'POST',
  						processData : false,
  						contentType : false
  					})
  					.done(function(data) {
  						console.log(data);
  						var path = '${contextPath }/img/'+ data.img+'';
  						 $("#img").attr("src",path);
  						 $("#price").val(formatNumber(data.price));
  						 $("#total").val(formatNumber(data.price));
  					}).fail(function(data) {
  								toastr.error("<spring:message code="ekycdn.loi_kiem_tra_thong_tin" />");
  								$(obj).button('reset');
  							});
	
		});
	 
</script>