<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>준비된 모든 상품</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
</head>
<body>
	<jsp:include page = "../common/menu.jsp"/>

	<section class="py-5">
       <div class="container px-4 px-lg-5 mt-5">
           <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="list">
           		<!-- 모든상품 삽입 -->
           </div>
       </div>
   </section>
   <script>
   
   		$(function(){
   			
   			$.ajax({
   		   		url: "listProduct.do",
   		   		
   		   		type: "get",
   		   		
   		   		success:function(list){
   		   	
   		   			let value = "";
   		   			
   		   			for(var i in list){

						value += '<div class="col mb-5">'+
						
									'<div class="card h-100">'+
									'<a href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'"><img class="card-img-top" src="<%=request.getContextPath() %>/resources/image/'+list[i].piName+'" alt="상품이미지" /></a>'+
										'<div class="card-body p-4">'+
										
											'<div class="text-center">'+
											'<h5 class="fw-bolder">'+list[i].pName+'</h5>'+list[i].pPrice+
											'</div>'+
										'</div>'+
											
										'<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'+
											'<div class="text-center">'+
											'<a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'">상세정보</a>'+
											'</div>'+
										'</div>'+
									'</div>'+
								'</div>';
		                  
					}
					$("#list").html(value);
   		   		},
   		   		
   		   		error:function(){
   		   			console.log("ajax통신실패");
   		   		}
   	   		})
   		})
   		
   </script>
   
	<jsp:include page = "../common/footer.jsp"/>
</body>
</html>