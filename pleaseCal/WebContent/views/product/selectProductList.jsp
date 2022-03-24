<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리별 상품</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
<meta name="description" content="" />
<meta name="author" content="" />
</head>
<body style=background:#f8f8f8>
	<jsp:include page = "../common/menu.jsp"/>

	<section class="py-5">
       <div class="container px-4 px-lg-5 mt-5">
       		<c:choose> 
                <c:when test="${no eq 1}">
                	<h1 id="title" class="display-5 fw-bolder">닭가슴살</h1>
                	<div class="content">
                		닭가슴살 1팩당 단백질이 54~55g으로 고함량 함유되어있습니다. <br>
                		화학적 첨가물을 첨가하지 않아 더욱 건강하고 안전한 음식을 추구합니다
                	</div>
                	<div><br><br></div>
                </c:when> 
                <c:when test= "${no eq 2}">
                	<h1 id="title" class="display-5 fw-bolder">단백질보충제</h1>
                 	<div class="content">
                		단백질 보충제는 단백질을 보충하는 가장 대중적이고 간편한 방법이며, 
                		운동 목표 달성을 위해서도 중요합니다. <br>
                		가장 순수한 단백질 파우더와 식물성 단백질 제품까지 고객분들의 다양한 선택을 돕고자 합니다.
                	</div>
                	<div><br><br></div>
                </c:when> 
                <c:when test= "${no eq 3}">
                	<h1 id="title" class="display-5 fw-bolder">도시락</h1>
                 	<div class="content">
                		한끼를 먹더라도 제대로 맛있게 먹을 수 없을까? <br>
                		맛과 건강을 동시에 챙겼습니다.
                	</div>
                	<div><br><br></div>
                </c:when> 
       		</c:choose>
           <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="list">
       			
           		<!-- 모든상품 삽입 -->
           </div>
       </div>
   </section>
   <script>
   
   		$(function(){
   			console.log(${no})

   			$.ajax({
   		   		url: "selectListProduct.do",
   		   		
   		   		type: "get",
   		   		
   		   		data:{
   		   			no: ${no}
   		   		},
   		   		
   		   		success:function(list){
   		   	
   		   			let value = "";
   		   			console.log(list)
   		   			
   		   			for(var i in list){
						
  		   				value += '<div class="col mb-5">'+
  		   				
									'<div>'+
										'<a href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'"><img class="card-img-top" src="<%=request.getContextPath() %>/resources/image/'+list[i].piName+'" alt="상품이미지" /></a>'+
										
										'<div class="card-body p-4">'+
									
											'<div class="text-center">'+
												'<h5 class="fw-bolder">'+list[i].pName+'</h5>'+list[i].pPrice+
											' 원</div>'+
											
										'</div>'+
									
										'<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'+
										
											'<div class="text-center">'+
												'<a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'">상세정보</a>'+
											'</div>'+
											
										'</div>'+
										
									'</div>'+
									
								'</div>';
								
								console.log(i);
							
   		   			
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