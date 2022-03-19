<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, com.uni.coupon.model.vo.*"%>
       <%
       ArrayList<Coupon> list = (ArrayList<Coupon>)request.getAttribute("list");

    %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.outer{
		width:800px;
		height:400px;
		background:black;
		color:white;
		margin:auto;
		margin-top:50px;
	}
	.listArea{
		border:1px solid white;
		text-align:center;
	}

</style>
</head>
<body>

<jsp:include page = "../common/menu.jsp"/>

<div class="outer">
		<br>
		
		<h2 align="center">쿠폰함</h2>
		<br>

		<table class="listArea" align="center">
		
		<form  action="<%=request.getContextPath()%>/coupon.do" method="post">
					
			
				<tr>
					<th width="100">쿠폰이름</th>
					<th width="100">쿠폰할인율</th>				
				</tr>
			
			
				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 쿠폰이 없습니다.</td>
				</tr>
				<%}else{ %>
					<% for(Coupon p : list){ %>
					<tr>
						<td><%= p.getCname() %></td>
						<td><%= p.getCsale() %>%</td>										
					</tr>
					
					<%} %>
					
				<%} %>
			
			
		</table>
			
		<br><br>
	

	</div>


</body>
</html>