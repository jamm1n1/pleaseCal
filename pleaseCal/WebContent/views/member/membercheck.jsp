<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.member.model.vo.*"%>
    
     <%
     ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
 
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
		width:1200px;
		height:800px;
		
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
		
		<h2 align="center">회원 목록</h2>
		<br>
		<table align="center">
	
						</tr>
		</table>
		<table class="listArea" align="center">
		
		<form  action="<%=request.getContextPath()%>/iogogo.do" method="post" >
					
			<thead>
				<tr>
					<th width="100">회원번호</th>
					<th width="100">회원아이디</th>
					<th width="100">회원비밀번호</th>	
					<th width="100">회원이름</th>	
					<th width="150">전화번호</th>	
					<th width="250">회원주소</th>										
					<th width="100">마일리지</th>																								
					<th width="100">회원유무</th>										
				</tr>
			<thead>
			<tbody>
				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 회원이 없습니다.</td>
				</tr>
				<%}else{ %>
					<% for(Member m : list){ %>
					<tr>
						<td><%= m.getUserNo() %></td>
						<td><%= m.getUserId() %></td>
						<td><%= m.getUserPwd()%></td>						
						<td><%= m.getUserName()%></td>						
						<td><%= m.getPhone()%></td>						
						<td><%= m.getAddress()%></td>						
						<td><%= m.getMilege()%></td>																		
						<td><%= m.getStatus()%></td>						
					</tr>
					
					<%} %>
					
				<%} %>
			
			</tbody>
		</table>
			
		<br><br>
		

	</div>

</body>
</html>