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
	
	.outer {
		margin:auto;
		margin-top:50px;
	}
	
	.detailArea {
		width:60%;
		margin:auto;
		margin-top: 40px;
		margin-bottom: 20px;
		border:1px solid black;
		border-left: none;
		border-right: none;
	}
	
	.detailArea tr {
		border:1px solid black;
		border-left: none;
		border-right: none;
	}
	
	.detailArea p {height:150px;}
	
	.btns {margin:atuo; margin-bottom:50px;}
	
	.button {
		color: #fff;
  		border-radius: 5px;
  		padding: 5px 15px;
  		font-family: 'Lato', sans-serif;
  		font-weight: 500;
  		background: transparent;
  		cursor: pointer;
  		transition: all 0.3s ease;
  		position: relative;
  		display: inline-block;
   		box-shadow:	inset 2px 2px 2px 0px rgba(255,255,255,.5),
   					7px 7px 20px 0px rgba(0,0,0,.1),
   					4px 4px 5px 0px rgba(0,0,0,.1);
  		outline: none;
  		
		background: black;
	  	border: none;
	  	z-index: 1;
	}
	
	.button:after {
		position: absolute;
  		content: "";
  		width: 0;
  		height: 100%;
	  	top: 0;
	  	right: 0;
	  	z-index: -1;
	  	background-color: grey;
	  	border-radius: 5px;
   		box-shadow: inset 2px 2px 2px 0px rgba(255,255,255,.5),
   					7px 7px 20px 0px rgba(0,0,0,.1),
   					4px 4px 5px 0px rgba(0,0,0,.1);
  		transition: all 0.3s ease;
	}
	
	.button:hover {
		color: #fff;
	}
	
	.button:hover:after {
	  	left: 0;
	  	width: 100%;
	}
	
	.button:active {
	  	top: 2px;
	}
	
	.detailArea th {
		background-color: lightgrey;
		text-align: center;
		width: 100px;
	}
	
	.detailArea td {
		padding: 5px 5px 5px 10px;
		padding-left: 10px;
	}
	
</style>

</head>
<body>
	
	<!-- menu -->
	<jsp:include page = "../common/menu.jsp"/>
	
	<!-- header -->
   	<jsp:include page = "../common/header.jsp"/>
   	
	
	<div class="outer">
		
		<h2 align="center"> 공지사항 </h2>
		
		<table class="detailArea" border="1">
			<tr>
				<th>제목</th>
				<td colspan="3"><h4>${notice.noticeTitle}</h4></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td width="250px">관리자</td>
				<th>작성일</th>
				<td>${notice.createDate}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<p>${notice.noticeContent}</p>
				</td>
			</tr>	
		</table>
		
		<br>
		
		<div class="btns" align="center">

			<button class="button" type="button" onclick="location.href='<%=request.getContextPath()%>/noticeList.do';">목록으로</button>
			
			<%-- 로그인이 되어있고 해당 아이디가 관리자라면 --%>
			<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId == 'admin'}">
				<%-- 바로 url 연결해줘서 서블릿으로 연결 / 쿼리스트링으로 --%>
				<button class="button" type="button" onclick="location.href='<%=request.getContextPath()%>/noticeUpdateForm.do?nno=${notice.noticeNo}';">수정하기</button>
				<button class="button" type="button" id="delete" onclick="deleteNotice()">삭제하기</button>
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