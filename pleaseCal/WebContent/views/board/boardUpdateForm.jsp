<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- jstl import --%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.outer{
		width:900px;
		height:500px;
		margin:auto;
		margin-top:50px;
		margin-bottom:150px;
	}
	
	#updateForm>table{
		border:1px solid black;
	}
	
	#updateForm>table input, #updateForm>table textarea{
		width:100%;
		box-sizing:border-box;
	}
	
	#deleteBtn{color:gray;}
	#deleteBtn:hover{cursor:pointer}
</style>

</head>
<body>
	
	<!-- menu -->
	<jsp:include page = "../common/menu.jsp"/>
	
	<div class="outer">
		<br>
			
		<h2 align="center">게시판 수정하기</h2>
		<br>
		<%-- enctype="multipart/form-data" : 첨부파일 넘겨 받을 때 사용 --%>
		<form id="updateForm" action="<%= request.getContextPath() %>/boardUpdate.do" method="post" enctype="multipart/form-data">
			<%-- 게시글 번호 히든으로 넘기기 - 수정할 때 해당 게시글 번호로 하기 위해 --%>
			<input type="hidden" name="bno" value="${b.boardNo}">
			<table align="center">
				<tr>
					<th width="100">분야</th>
					<td width="500">
						<select name="category">
							<option>상품 문의</option>
							<option>배송 문의</option>
							<option>기타 문의</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="15" name="content" style="resize:none;">${b.boardContent}</textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<%-- 기존에 첨부파일이 있었을 경우 --%>
						<c:if test="${!empty at}">
							<%-- 첨부파일 출력 --%>
							${at.originName} <br>
							<%-- 기존 파일명, 시스템 파일명 가져오기 위해 히든으로 --%>
							<input type='hidden' name='originFile' value='${at.changeName}'>
							<input type='hidden' name='originFileNo' value='${at.fileNo}'>
						</c:if>
						<%-- 파일 첨부 --%>
						<input type="file" name="upFile">
					</td>					
				</tr>
			</table>
			<br>
		
			<div class="btns" align="center">
				<button type="submit">수정하기</button>
			</div>
		</form>
	</div>

	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>
   	
</body>
</html>