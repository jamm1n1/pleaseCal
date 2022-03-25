<%@page import="com.uni.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- jstl import --%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 페이지</title>

<style>
	.outer{
		width:800px;
		height:500px;
		margin:auto;
		margin-top:50px;
	}
	
	.outer>table, .outer>table tr>*{
		border:1px solid black;
	}
	
	.outer>table{
		width:600px;
		height:300px;
	}
	
	.outer>table p{
		height:230px;
		margin:0;
	}
	
	.replyArea{
		width:800px;
		color:black;
		margin:auto;
		margin-bottom:50px;
	}
</style>

</head>
<body>
	
	<!-- menu -->
	<jsp:include page = "../common/menu.jsp"/>
	
	
	<div class="outer">
		<br>
		
		<h2 align="center">게시판 상세보기</h2>
		<br>
		
		<table align="center" id="board">
			<tr>
				<th width="100">분야</th>
				<td>${b.category}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${b.boardWriter}</td>
				<th>작성일</th>
				<td>${b.createDate}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<p>${b.boardContent}</p>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="3">
					<c:choose>
						<%-- 첨부파일이 원래 있으면 --%>
						<c:when test="${!empty at}">
							<%-- 해당 첨부파일 가져와서 띄우기 --%>
							<a download="${at.originName}" href="<%=request.getContextPath()%>/resources/board_upfiles/${at.changeName}">${at.originName}</a>
						</c:when>
						<%-- 없으면 해당 문구 출력 --%>
						<c:otherwise>
							첨부파일이 없습니다.
						</c:otherwise>
					</c:choose>
				</td> 
			</tr>
		</table>
		<br>
		
		<div class="btns" align="center">
			<button type="button" onclick="location.href='<%=request.getContextPath()%>/boardList.do?currentPage=1';">목록으로</button>
			<%-- 작성자가 본인이거나 관리자인 경우 수정, 삭제 버튼 활성화 --%>
			<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.getUserId() == b.boardWriter
							|| !empty sessionScope.loginUser && sessionScope.loginUser.userId == 'admin'}">
				<button type="submit" onclick="location.href='<%=request.getContextPath()%>/boardUpdateForm.do?bno=${b.boardNo}';">수정하기</button>
				<button type="button" onclick="deleteBoard();">삭제하기</button>
			</c:if>
		</div>
		
		<form action="" id="postForm" method="post">
			<%-- 게시글 번호 히든으로 가져올 수 있도록 --%>
			<input type="hidden" name="bno" value="${b.boardNo}">
		</form>
		
	</div>
	

	<script>
		
		// 삭제 버튼 클릭 시
		function deleteBoard(){
			
			let bno = ${b.boardNo};
			
			let url = "<%=request.getContextPath()%>/boardDeletePwdCheck.do?bno="+bno;
			let name = "boardPwdCheckPopup";
			let option = "width = 500, height = 300, top = 50%, left = 50%, location = no"
		
			open(url, name, option);
		}
		
	</script>
		
		
	
	
	
	
	<div class="replyArea">
		<!-- 댓글 작성하는 div -->
		<table border="1" align="center">
			<tr>
				<th>댓글작성</th>
				<c:choose>
					<%-- 로그인 되어있는 유저가 관리자라면 댓글 달 수 있도록 --%>
					<c:when test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId == 'admin'}">
						<td><textarea rows="3" cols="60" id="replyContent" style="resize:none;"></textarea></td>
						<td><button id="addReply">댓글등록</button></td>	
					</c:when>
					<c:otherwise>
						<td><textarea readonly rows="3" cols="60" id="replyContent" style="resize:none;">관리자만 사용 가능한 서비스입니다.</textarea></td>
						<td><button disabled>댓글등록</button></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
		
		
		<!-- 댓글 리스트들 보여주는 div -->
		<div id="replyListArea">
			<table id="replyList" border="1" align="center">
				<!-- <tr>
					<td width="100px">admin</td>
					<td width="330px">댓글작성내용</td>
					<td width="150px">2020년 1월 23일</td>
				</tr>
				<tr>
					<td width="100px">user01</td>
					<td width="330px">댓글작성내용</td>
					<td width="150px">2020년 1월 22일</td>
				</tr>
				<tr>
					<td width="100px">test01</td>
					<td width="330px">댓글작성내용</td>
					<td width="150px">2020년 1월 20일</td>
				</tr> -->
			</table>
		</div>
	</div>

	<script>
	
		// 댓글 입력
		$(function() {
			
			selectReplyList(); // 입력하기 전에 댓글 리스트 출력하는 함수 먼저 실행
			
			$("#addReply").click(function() {
				var content = $("#replyContent").val(); // 댓글 내용
				var bno = ${b.boardNo}; // 게시글 번호
				
				$.ajax({
					url: "replyInsert.do", // 댓글 입력 서블릿으로 연결
					
					type: "post", // servlet에서 인코딩 먼저
					
					// servlet 변수명 : jsp 변수명
					data: {
							content : content,
							bno : bno
					},
					
					success: function(status){
						if(status == "success"){ // 성공적으로 입력되면 (넘겨 받은 문자가 success 이면)
							selectReplyList(); // 리스트 조회해서 실시간으로 바뀌도록
							$("#replyContent").val(""); // 입력했으니 댓글 입력창 비워주기
						}
					},
					
					error: function(){
						console.log("ajax 통신 실패 - 댓글 등록");
					}
				})
				
			})
		})
		
		// 댓글 리스트 조회
		function selectReplyList() {
			
			$("#replyList").empty(); // 조회할 때마다 비우고 다시 출력하도록
			
			$.ajax({
				
				url:"replyList.do",
				
				// 게시글 번호로 조회해서 가져올 것
				data: {bno:${b.boardNo}},
				
				type: "get",
				
				success: function(list){
					
					console.log(list);
					
					var value="";
					
					<%-- a 태그에서의 함수 호출 : 함수에 리턴값이 있던 없던 클릭해도 페이지의 최상위로 이동하지 않음 --%>
					for(var i in list){
						
						value += '<tr>'+
									'<td width="330px">'+ list[i].replyContent+'</td>' +
									'<td width="150px">'+ list[i].createDate+'</td>' +
									'<td><a href="javascript:void(0);" onClick="deleteConfirm(' + list[i].replyNo + ');">삭제</a></td>' +
								 '</tr>';
					}
					
					$("#replyList").html(value);
				},
				
				error: function(){
					console.log("ajax 통신실패 - 댓글 조회");
				}
				
			})
		}
		
		
		// 댓글 삭제 a태그 클릭 시
		function deleteConfirm(rno) {
			
			let result = confirm("댓글을 삭제하시겠습니까?");
			
			if(result) {
				
				$.ajax({
					
					url: "replyDelete.do",
					
					type: "post",
					
					data: {rno : rno},
					
					success: function(status) {
								if(status == "success"){ // 성공적으로 입력되면 (넘겨 받은 문자가 success 이면)
									selectReplyList(); // 리스트 조회해서 실시간으로 바뀌도록
								}
					},
					
					error: function(){
						console.log("ajax 통신 실패 - 댓글 삭제");
					}

				})

			} else {
				return false;
			}
		}
		

	</script>



	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>

</body>
</html>