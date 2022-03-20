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
		margin:auto;
		margin-top:50px;
		margin-bottom:50px;
	}
	
	#enrollForm{
		width:60%;
		margin:auto;
		margin-top:50px;
		margin-bottom:50px;
	}
	
	#enrollForm>table{
		border:1px solid black;
	
	}
	
	#enrollForm>table input, #enrollForm>table textarea{
		width:100%;
		box-sizing:border-box;
	}
	
	.btns{margin:auto; margin-bottom:20px}
	
</style>

</head>
<body>

	<!-- menu -->
	<jsp:include page = "../common/menu.jsp"/>
	
	<div>
		<br>
		
		<h2 align="center">질문 게시글 작성하기</h2>
		
		<%-- enctype="multipart/form-data" : 첨부파일 넘겨 받을 때 사용 --%>
		<form id="enrollForm" action="<%=request.getContextPath()%>/boardInsert.do" method="post"  enctype="multipart/form-data">
			
			<table align="center">

				<tr>
					<th width="100">카테고리</th>
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
						<textarea rows="15" name="content" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="upfile"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input tyle="text" name="pwd"></td>
				</tr>
				<tr>
					<th>비밀글 설정</th>
					<td>
						<label>
					    	<input type="radio" id="public" name="public" disabled> 공개글
					    	<input type="radio" id="secret" name="secret"> 비밀글
					  	</label>
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