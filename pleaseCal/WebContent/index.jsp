<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  String kakao =   (String)request.getAttribute("kakao");  %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<style>
	#a{text-decoration:none !important;}
	#d{color:black;}
</style>

</head>

<body style=background:#f8f8f8>
   
   	<!-- popup -->
	<jsp:include page = "views/common/popup.jsp"/>
	
   	<!-- menu -->
   	<jsp:include page = "views/common/menu.jsp"/>
	
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">칼로리를 부탁해</h1>
				<p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
			</div>
		</div>
	</header>


   	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="list">
           	
           		<!-- 대표상품 삽입 장소 -->
           </div>
       </div>
   	</section>
   
   
   	<script>
   		$(function(){
   			
   			$.ajax({
   		   		url: "topProduct.do",
   		   		
   		   		type: "get",
   		   		
   		   		success:function(list){
   		   			
   		   			let value = "";
   		   			
   		   			for(var i in list){
   		   			  		   				
   		   			value += '<div class="col mb-5">'+
							'<div>'+
							'<a href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'"><img class="card-img-top" src="<%=request.getContextPath() %>/resources/image/'+list[i].piName+'" alt="상품이미지" /></a>'+
		
							'<div class="card-body p-4">'+
							'<div class="text-center">'+
							'<h5 class="fw-bolder">'+list[i].pName+'</h5>'+list[i].pPrice+' 원</div>'+
							'</div>'+
							'<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'+
							'<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'">상세정보</a></div>'+
							'</div></div></div>';
		                  
					}
					$("#list").html(value);
   		   		},
   		   		
   		   		error:function(){
   		   			console.log("ajax통신실패");
   		   		}
   	   		})
   		})
	</script>
   
   	
   	<div class="container px-4 px-lg-6 mt-10" id="reviewdiv">
		<div class="owl-carousel owl-theme owl-loaded">
			<div class="owl-stage-outer text-center" >
		 		<h3>실제 구매한 고객님이 남긴</h3>
				<h4>REVIEW</h4>
			  	<div class="owl-stage"  id="reviewList">
				    <!-- 후기리스트 구역 -->  
			  	</div>
		  	</div>
		</div>
	</div>
	
	
	<script>
	
		$(function(){
			
			$.ajax({
   		   		url: "topReview.do",
   		   		
   		   		type: "get",
   		   		
   		   		success:function(list){
   		   			
   		   			let value = "";
   		   			
   		   			for(var i in list){
   		   				
   		   			value += '<div class="owl-item card-body p-4" id="title">'+
					    		'<a id="a" href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'"><img class="card-img-top" src="<%=request.getContextPath() %>/resources/image/'+list[i].piName+'" alt="상품이미지" style="width: 200px; height:auto;"/>'+
								'<br>'+
					    		'<h6 class="fw-bolder" style="color:black">'+list[i].rName+'</h6>'+
					    		'<br>'+
								'<div id="d" class="card-footer p-4 pt-0 border-top-0 id="content" style="background-color:#f8f8f8 ">'+list[i].rContent+'</div>'+
					   		'</div>';  				

					}
   		   			
					$("#reviewList").html(value);
   		   		},
   		   		
   		   		error:function(){
   		   			console.log("ajax통신실패");
   		   		},
   		   		
	   		   	complete : function() {
	   		   		
		   		   	$(document).ready(function(){ // OWL Carousel API
		   		   		
		   			    let owl = $('.owl-carousel');
		   			    
		   			    owl.owlCarousel({
		   			        items:5,                 // 한번에 보여줄 아이템 수
		   			        loop:true,               // 반복여부
		   			        margin:15,               // 오른쪽 간격
		   			        autoplay:true,           // 자동재생 여부
		   			        autoplayTimeout:1800,    // 재생간격
		   			        autoplayHoverPause:true  // 마우스오버시 멈출지 여부
		   			    });    
		   			    
		   			}); 
	   		    }

   	   		})
		
		})
		
   </script>
   
   <br><br><br><br>
   
   
   <!-- Footer-->
   <jsp:include page = "views/common/footer.jsp"/>

   
</body>
</html>
