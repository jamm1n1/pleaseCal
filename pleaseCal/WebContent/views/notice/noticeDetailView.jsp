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
		
		<h2 align="center"> ???????????? </h2>
		
		<table class="detailArea" border="1">
			<tr>
				<th>??????</th>
				<td colspan="3"><h4>${notice.noticeTitle}</h4></td>
			</tr>
			<tr>
				<th>?????????</th>
				<td width="450px">?????????</td>
				<th>?????????</th>
				<td>${notice.createDate}</td>
			</tr>
			<tr>
				<th>??????</th>
				<td colspan="3">
					<p>${notice.noticeContent}</p>
				</td>
			</tr>	
		</table>
		
		<br>
		
		<div class="btns" align="center">

			<button class="button" type="button" onclick="location.href='<%=request.getContextPath()%>/noticeList.do';">????????????</button>
			
			<%-- ???????????? ???????????? ?????? ???????????? ??????????????? --%>
			<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId == 'admin'}">
				<%-- ?????? url ??????????????? ??????????????? ?????? / ????????????????????? --%>
				<button class="button" type="button" onclick="location.href='<%=request.getContextPath()%>/noticeUpdateForm.do?nno=${notice.noticeNo}';">????????????</button>
				<button class="button" type="button" id="delete" onclick="deleteNotice()">????????????</button>
			</c:if>
		</div>
	</div>
	
	<script>
		// ?????? ?????? ?????? ???
		function deleteNotice() {
			// ????????? ?????????
			var result = confirm("?????? ?????????????????????????");
			// true ??? (??????????????? ??????)
			if(result) {
				// ?????? ????????? ??????
				location.href="<%=request.getContextPath()%>/noticeDelete.do?nno=${notice.noticeNo}";
				alert("????????? ?????????????????????.");
				return true;
			// false ??? (?????? ??????)
			} else {
				return false;
			}
			
		}
	
	
	</script>
	
	
	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>
	
</body>
</html>