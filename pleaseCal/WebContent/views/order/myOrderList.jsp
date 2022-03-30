<%@page import="com.uni.order.model.vo.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
	int uNo = (int)request.getAttribute("uNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	#img {
	
		width:100%;
		height:auto;
		text-align:center;
		
	}
	
	.card-body, .list-group, .card-header {
		border: solid 1px lightgray;
		text-align:center;
	}


</style>
</head>
<body>
	<jsp:include page = "../common/menu.jsp"/>
	<br><br><br><br><br><br>
	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

	<%if (!list.isEmpty()){ %>
		<%for(Order o : list){%>
			<form id="reviewForm" action ="<%=request.getContextPath()%>/reviewInsertForm.do" method="post">
			<div class="card mb-3" >
		  		<h3 class="card-header"><%=o.getOrderDate()%> 주문</h3>
		  		<div class="card-body">
		  			<input type="hidden" class="form-control" id="pId" name="pId" value="<%=o.getPId() %>">
					<input type="hidden" class="form-control" id="oId" name="oId" value="<%=o.getOrderNo()%>">
				    <h5 class="card-title">상품명 :<%=o.getPName() %></h5>
				    <h6 class="card-subtitle text-muted">주문번호 :<%=o.getOrderNo()%></h6>
				</div>

				    
				    <div><img id="img" src="<%=request.getContextPath() %>/resources/image/<%=o.getPiName() %>" alt="상품이미지"></div>
			    
		  	    <div class="card-body">
		  	    	
			   		<p class="card-text">금액 : <%=o.getPPrice() %></p>
			    </div>
			
			    <ul class="list-group list-group-flush">
				    <li class="list-group-item">수량 : <%=o.getPAmount() %></li>
				    <li class="list-group-item">배송상태 : <%=o.getDState() %></li>
				    <li class="list-group-item">배송요청사항 : <%=o.getDeliveryRequest() %></li>
			    </ul>
			    <div class="card-body">
			    	<button type="button" id="<%=o.getOrderNo()%><%=o.getPId() %>" >후기작성</button>
			    </div>
			    
			</div>
			</form>
			<br>

		<% }%>
	<%} %>

</div>
	<script>

	$(function(){
		
		let uNo = "<%=uNo%>";
		
		$.ajax({
			
			url: "reviewCheck.do",
			
			type: "post",
			
			data: {
				no: uNo
			},
			
			success:function(list){
				
				let val = "";
				
				for(var i in list) {
					
					val = "" + list[i].orderNo + list[i].pId 
					$('#'+val+'').hide();
					
				}

			},
			error:function(e){
		   			
				console.log(e)

			}
		})
		
	})
		
	
	</script>

	<jsp:include page = "../common/footer.jsp"/>
</body>
</html>