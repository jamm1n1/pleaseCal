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
		margin-bottom:250px;
	}
	
	#updateForm>table{
		border:1px solid black;
	}
	
	#updateForm{
		
	}
	
	#updateForm>table input, #updateForm>table textarea{
		width:100%;
		box-sizing:border-box;
	}
	
	/*#deleteBtn{color:gray;}
	#deleteBtn:hover{cursor:pointer}*/
	
	/*.btns{margin:auto; margin-bottom:20px}*/
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
						<textarea rows="15" id="content" name="content" style="resize:none;">${b.boardContent}</textarea>
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
				<tr>
					<th>비밀번호</th>
					<td><input tyle="text" id="pwd" name="pwd"></td>
				</tr>
				<tr>
					<th>비밀글 설정</th>
					<td>
						<label>
					    	<input type="radio" id="public" name="public" disabled> 공개글
					    	<input type="radio" id="secret" name="secret" checked> 비밀글
					  	</label>
					</td>
				</tr>
			</table>
			<br>
		
			<div class="btns" align="center">
				<button type="submit">수정하기</button>
			</div>
		</form>
	</div>
	
	<script>
	
		// 폼 제출 시 카테고리, 내용, 비밀번호 비어 있으면 알림창 띄우기
		$("form").submit(function() {
			// 내용, 비밀번호 값을 변수에 담아서
			var content = $("#content").val();
			var pwd = $("#pwd").val();
			
			// 내용이 비어있는 경우
			if(content == "" || content == null) {
				// 폼의 액션 태그 제거 (서블릿으로 넘어가 게시글 등록 막기 위해)
				$(this).removeAttr("action");
				// 알림 띄우기
				alert("내용을 작성해주세요.");
				// 해당 입력창에 포커스 주기
				$("#content").attr("tabindex", -1).focus();
				
				return false;
			
			// 비밀번호가 비어있는 경우
			} else if(pwd == "" || pwd == null) {
				// 폼의 액션 태그 제거 (서블릿으로 넘어가 게시글 등록 막기 위해)
				$(this).removeAttr("action");
				// 알림 띄우기
				alert("비밀번호를 작성해주세요.");
				// 해당 입력창에 포커스 주기
				$("#pwd").focus();
				
				return false;
			
			// 잘 작성이 되어있으면
			} else {
				// 제거했던 액션 태그 다시 추가해서 잘 진행되도록
				$(this).attr("action", "<%=request.getContextPath()%>/boardInsert.do");
			}	
		})
		
	</script>
	

	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>
   	
</body>
</html>