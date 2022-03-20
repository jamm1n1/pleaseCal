<%@page import="com.uni.notice.model.vo.Notice"%>
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
		margin-bottom:50px
	}
	
	#updateForm{
		width:60%;
		margin:auto;
	}
	
	#updateForm>table{
		border:1px solid black;
		
	}
	
	#updateForm>table input{
		width:100%;
		box-sizing:border-box;
	}

</style>

</head>
<body>

	<!-- menu -->
	<jsp:include page = "../common/menu.jsp"/>
	
	<div class="outer">
		
		
		<h2 align="center">공지사항 수정</h2>
		
		<form id="updateForm" action="<%=request.getContextPath()%>/noticeUpdate.do" method="post" >
		
			<input type="hidden" name="nno" value="${notice.noticeNo}">
		
			<table align="center">
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" id="title" name="title" value="${notice.noticeTitle}"></td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea id="content" name="content" cols="60" rows="15" style="resize:none;">${notice.noticeContent}</textarea>
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
			var title = $("#title").val();
			var content = $("#content").val();
			
			// 내용이 비어있는 경우
			if(title == "" || title == null) {
				// 폼의 액션 태그 제거 (서블릿으로 넘어가 게시글 등록 막기 위해)
				$(this).removeAttr("action");
				// 알림 띄우기
				alert("제목을 작성해주세요.");
				// 해당 입력창에 포커스 주기
				$("#title").focus();
				
				return false;
			
			// 비밀번호가 비어있는 경우
			} else if(content == "" || content == null) {
				// 폼의 액션 태그 제거 (서블릿으로 넘어가 게시글 등록 막기 위해)
				$(this).removeAttr("action");
				// 알림 띄우기
				alert("내용을 작성해주세요.");
				// 해당 입력창에 포커스 주기
				$("#content").attr("tabindex", -1).focus();
				
				return false;
			
			// 잘 작성이 되어있으면
			} else {
				// 제거했던 액션 태그 다시 추가해서 잘 진행되도록
				$(this).attr("action", "<%=request.getContextPath()%>/noticeInsert.do");
			}	
		})
		
	</script>
	
	
	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>
	
</body>
</html>