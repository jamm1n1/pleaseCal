<%@page import="com.uni.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%
	// servlet에서 넘긴 notice 객체 가져오기 - object로 넘어오기 때문에 형변환 꼭 해야 함
	//Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	
	.outer{
		margin:auto;
		margin-top:50px;
	}
	
	#detailArea{
		width:60%;
		margin:auto;
		border-color:white;
		border:1px solid black;
	}
	
	#detailArea tr, #detailArea tr>td{
		border:1px solid black;
	}
	
	#detailArea p{height:150px;}
	
	.btns{margin:atuo; margin-bottom:50px}
	
	.btns a{text-decoration:none; color:black;}
	
</style>

</head>
<body>
	
	<!-- menu -->
	<jsp:include page = "../common/menu.jsp"/>
	
	<div class="outer">

		<table id="detailArea" border="1">
			<tr>
				<td>제목</td>
				<td colspan="3">${notice.noticeTitle}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>관리자</td>
				<td>작성일</td>
				<td>${notice.createDate}</td>
			</tr>
			<tr>
				<td colspan="4">
					<p>${notice.noticeContent}</p>
				</td>
			</tr>	
		</table>
		
		<br>
		
		<div class="btns" align="center">
		
			<a href="noticeList.do">목록으로</a> &nbsp;&nbsp;
				
			
			<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId == 'admin'}">
			
			<%-- 바로 url 연결해줘서 서블릿으로 연결 / 쿼리스트링으로 --%>
			<a href="noticeUpdateForm.do?nno=${notice.noticeNo}">수정하기</a> &nbsp;&nbsp;
			<a href="noticeDelete.do?nno=${notice.noticeNo}">삭제하기</a>
		
			</c:if>
			
		</div>
	</div>
	
	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>
	
</body>
</html>