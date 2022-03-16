<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page = "../common/menu.jsp"/>
	0: ${requestScope.list[0]} <br> 
	1: ${requestScope.list[1]} <br> 
	2: ${requestScope.list[2]} <br> 
	<jsp:include page = "../common/footer.jsp"/>
</body>
</html>