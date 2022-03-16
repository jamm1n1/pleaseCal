<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="utf-8" />
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
 <meta name="description" content="" />
 <meta name="author" content="" />
</head>
<body>
   <jsp:include page = "views/common/menu.jsp"/>
  
   
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
								'<div class="card h-100">'+
								'<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />'+
								'<div class="card-body p-4">'+
								'<div class="text-center">'+
								'<h5 class="fw-bolder">'+list[i].pName+'</h5>'+list[i].pPrice+'</div>'+
								'</div>'+
								'<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'+
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
   <!-- Footer-->
   <jsp:include page = "views/common/footer.jsp"/>

   
 </body>
</html>
