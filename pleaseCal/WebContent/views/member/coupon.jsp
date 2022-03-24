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
 body{
background-image:url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150404_201%2Fbbilla_1428082120293qFxQp_JPEG%2F%25C7%25CF%25B3%25AA%25BE%25B2%25B9%25D9%25C5%25C1%25C8%25AD%25B8%25E9_05_1920x1080_20150402-01.jpg&type=a340')
}
	.outer{
		width:800px;
		height:400px;
		
		color:black;
		margin:auto;
		margin-top:50px;
	}
	.listArea{
		border:1px solid black;
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
				    
					<th width="250"><h3>쿠폰이름</h3></th>
					<th width="200"><h3>쿠폰할인율</h3></th>				
				</tr>
			
			
				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 쿠폰이 없습니다.</td>
				</tr>
				<%}else{ %>
					<% for(Coupon p : list){ %>
					<tr>				    
						<th><h4><%= p.getCname() %></h4></th>
						<th><h4><%= p.getCsale() %>%</h4></th>	
															
					</tr>
					
					<%} %>
					
				<%} %>
			
			
		</table>
			
		<br><br>
	

	</div>


</body>
</html>