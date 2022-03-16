<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="././resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page = "../common/menu.jsp"/>
	0: ${requestScope.list[0]} <br> 
	1: ${requestScope.list[1]} <br> 
	2: ${requestScope.list[2]} <br> 
	<jsp:include page = "../common/footer.jsp"/>
</body>
</html>