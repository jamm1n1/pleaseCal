<%@page import="com.uni.order.model.vo.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.contents-order {
	
		box-sizing:border-box;
		text-align:center;
	}
	
	.card mb-3 {
	
		display:inline-block;
	}
	
	#img {
	
		width:400px;
		height:400px;
		text-align:center;
		
	}
	
	.card-body {
		border: solid 1px lightgray;
	}

</style>
</head>
<body>
	<jsp:include page = "../common/menu.jsp"/>
	<br><br><br><br><br><br><br><br><br><br><br>
	<div class="contents-order">
	<div style="width:600px">
	<%if (!list.isEmpty()){ %>
		<%for(Order o : list){%>
			
			<div class="card mb-3" >
		  		<h3 class="card-header"><%=o.getOrderDate()%> 주문</h3>
		  		<div class="card-body">
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
			    <div>
			    	<button>후기작성</button>
			    </div>
			    
			</div>
			<br>
		<% }%>
	<%} %>
</div>
</div>
	<jsp:include page = "../common/footer.jsp"/>
</body>
</html>