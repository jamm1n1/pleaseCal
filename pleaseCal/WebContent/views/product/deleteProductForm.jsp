<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	삭제할 상품번호
	<br><br>
	<form id ="dp" action="<%=request.getContextPath()%>/deleteProduct.do" method="post">
	<input type="text" id="pid" name="pid">
	<div><br>
	</div>
	<button type="submit" id="delete" class="btn btn-outline-dark btn-lg">삭제하기</button>
	</form>
	
</body>
</html>