<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.coupon.model.vo.*"%>
       <%
       ArrayList<Coupon> list = (ArrayList<Coupon>)request.getAttribute("list");

    %>%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:800px;
		height:500px;
		background:yellowgreen;
		color:blue;
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
<div class="outer">
		<br>
		
		<h2 align="center">쿠폰을가져라!</h2>
		<br>
		
		<table align="center">
		<tr>
		            <td width="70">쿠폰번호</td>				
						
		</tr>
		<tr>
		<form action="<%=request.getContextPath()%>/get.do" method="post">
		<td><input type="number" value="0" id="cid" name="cid"></input></td>
					
					<td><button onclick="get()">내려받기</button></td>
					
						</form>

		<table class="listArea" align="center">
		
		<form  action="<%=request.getContextPath()%>/howcoupon.do" method="post">
					
			
				<tr>
				    <th width="100">쿠폰번호</th>
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
					    <td><%= p.getCid() %></td>
						<td><%= p.getCname() %></td>
						<td><%= p.getCsale() %>%</td>
															
					</tr>
					
					<%} %>
					
				<%} %>
			
			
		</table>
			
		<br><br>
	
   
	</div>
	<script>
	
	 function get(){
	        window.alert("쿠폰받기 성공");
	        }
	
	</script>
</body>
</html>