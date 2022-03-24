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
	
	<div class="outer"><br><br>

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

			<button type="button" onclick="location.href='<%=request.getContextPath()%>/noticeList.do';">목록으로</button>
			
			<%-- 로그인이 되어있고 해당 아이디가 관리자라면 --%>
			<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId == 'admin'}">
				<%-- 바로 url 연결해줘서 서블릿으로 연결 / 쿼리스트링으로 --%>
				<button type="button" onclick="location.href='<%=request.getContextPath()%>/noticeUpdateForm.do?nno=${notice.noticeNo}';">수정하기</button>
				<button type="button" id="delete" onclick="deleteNotice()">삭제하기</button>
			</c:if>
		</div>
	</div>
	
	<script>
		// 삭제 버튼 클릭 시
		function deleteNotice() {
			// 변수에 담아서
			var result = confirm("정말 삭제하시겠습니까?");
			// true 면 (삭제하려고 하면)
			if(result) {
				// 삭제 서블릿 실행
				location.href="<%=request.getContextPath()%>/noticeDelete.do?nno=${notice.noticeNo}";
				alert("삭제가 완료되었습니다.");
				return true;
			// false 면 (삭제 취소)
			} else {
				return false;
			}
			
		}
	
	
	</script>
	
	
	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>
	
</body>
</html>