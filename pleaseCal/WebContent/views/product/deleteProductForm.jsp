<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
	text-align: center;
    vertical-align: middle;
}
</style>
</head>
<body>
	
	<section class="py-5">
	삭제할 상품번호
	<br><br>
		<form id ="dp" action="<%=request.getContextPath()%>/deleteProduct.do" method="post">
		<input type="text" id="pid" name="pid">
		<div><br>
		</div>
		<button type="submit" id="delete" class="btn btn-outline-dark btn-lg">삭제하기</button>
		</form>
	</section>
	
</body>
</html>
