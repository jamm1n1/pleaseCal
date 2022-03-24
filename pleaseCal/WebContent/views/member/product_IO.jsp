<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.product_IO.model.vo.*"%>
    
     <%
       ArrayList<Product_IO> list = (ArrayList<Product_IO>)request.getAttribute("list");
     

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
		width:1000px;
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
		
		<h2 align="center">상품관리</h2>
		<br>
		<table align="center">
		<tr>
		            <td width="70">상품번호</td>
					<td width="70">상품수량</td>
						
		</tr>
		<tr>
		<form action="<%=request.getContextPath()%>/iogogo.do" method="post">
		<td><input type="number"  id="pid" name="pid"></input></td>
		<td><input type="number"  id="pnum" name="pnum"></input></td>
		
		
					
					<td><button onclick="io()" >입고및출고</button></td>
						</form>
						</tr>
		</table>
		<table class="listArea" align="center">
		
		<form  action="<%=request.getContextPath()%>/iogogo.do" method="post" >
					
			<thead>
				<tr>
					<th width="100">상품번호</th>
					<th width="300">상품이름</th>
					<th width="100">상품수량</th>	
									
				</tr>
			<thead>
			<tbody>
				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 상품 없습니다.</td>
				</tr>
				<%}else{ %>
					<% for(Product_IO p : list){ %>
					<tr>
						<td><%= p.getpId() %></td>
						<td><%= p.getpName() %></td>
						<td><%= p.getPnum()%></td>						
					</tr>
					
					<%} %>
					
				<%} %>
			
			</tbody>
		</table>
			
		<br><br>
		

	</div>
<script>
function io(){
	let pnum = $("#pnum").val();
	
	if(pnum > 0){	
		window.alert("입고완료~! (`Д´)ゞ");
	}
	if(pnum < 0 ){
		window.alert("출고완료~! (`Д´)ゞ");
	}
	
}

</script>
</body>
</html>