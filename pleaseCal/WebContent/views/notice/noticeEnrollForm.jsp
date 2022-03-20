<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- jstl import --%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

	.outer{
		margin:auto;
		margin-top:50px;
		margin-bottom:50px;
	}
	
	#enrollForm{
		width:60%;
		margin:auto;
	}
	
	#enrollForm>table{
		border:1px solid black;
	
	}
	
	#enrollForm>table input{
		width:100%;
		box-sizing:border-box;
	}

</style>

</head>
<body>

	<!-- menu -->
	<jsp:include page = "../common/menu.jsp"/>
	
	<div class="outer">
		<br>
		
		<h2 align="center">공지사항 작성하기</h2>
		
		<form id="enrollForm" action="<%=request.getContextPath()%>/noticeInsert.do" method="post" >
		
			<table align="center">
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" name="title"></td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="content" cols="60" rows="15" style="resize:none;"></textarea>
					</td>
				</tr>	
			</table>
			<br>
			
			<div class="btns" align="center">
				<button type="submit" id="insert">등록하기</button>
				
			</div>
		</form>
	</div>
	
	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>
	
	
</body>
</html>