<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#b {
	text-align: center;
	vertical-align: middle;
}
#img {
	width:10%;
	
}
#b {
	width:15%;
}
.h {
	width:10%;
}
</style>
</head>
<body>
	<jsp:include page = "../common/menu.jsp"/>
	
	<br><br><br>
	<div class="container px-4 px-lg-5 mt-5">
		<h2>나의 후기</h2>
		<br>
		
		<c:if test= "${empty list}">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="list">
			<div class="col mb-5" style="height: auto; min-height: 300px;">		
				<div class="text-center">
					<h3>등록한 후기가</h3>
					<h3>없습니다</h3>
				</div>
			</div>
		</div>
		</c:if>
		
		<c:forEach var="item" items="${list}" varStatus="i">   
		<form id="remove" name = "enrollForm" action ="<%=request.getContextPath()%>/reviewdelete.do" method="post" >
		<table class="table table-bordered">
			
	        <tr>
	            <td>주문번호</td>
	            <td colspan="2" >${item.orderNo}<input type="hidden" name="orderNo" value="${item.orderNo}"></td>
	            <td rowspan="4" id="b"><button type="submit" class="btn btn-outline-dark btn-lg">삭제하기</button></td>
	        </tr>
	        <tr>
	            <td rowspan="3" id="img"><img class="card-img-top" src="<%=request.getContextPath() %>/resources/image/${item.piName}" alt="상품이미지" style="width: 100px; height:auto;"/></div></td>
	            <td class="h">상품이름</td>
	            <td><input type="hidden" name="pName" value="${item.pName}"><input type="hidden" name="pId" value="${item.pId}">${item.pName}</td>
		
	        </tr>
	        <tr>
	            <td>후기제목</td>
	            <td>${item.rName}</td>
	       
	        </tr>
	        <tr>
	            <td rowspan="2">후기내용</td>
	            <td rowspan="2"><div>${item.rContent}</div> </td>
	       
	        </tr>
	       
	    </table>
	    </form>
	    <br><br>
	    </c:forEach>
    </div>
    
    <script>
    
		$(function(){
			
			let msg = "<%=msg%>";
			if(msg != "null") {
				alert(msg);
			}
			
			
		})
    	
    </script>
     
    <jsp:include page = "../common/footer.jsp"/>
</body>
</html>