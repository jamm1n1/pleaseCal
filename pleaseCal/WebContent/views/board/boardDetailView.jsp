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
	
	.outer {
		width:800px;
		height:500px;
		margin:auto;
		margin-top:30px;
	}
	
	.outer>table, .outer>table tr>* {
		border:1px solid black;
		border-left: none;
		border-right: none;
	}
	
	.outer>table {
		width:800px;
		height:300px;
	}
	
	.outer>table p {
		height:230px;
	}
	
	.replyArea {
		width:800px;
		color:black;
		margin:auto;
		margin-top: 80px;
		margin-bottom:50px;
		
	}
	
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
	
	.detailArea {
		width:60%;
		margin:auto;
		margin-bottom: 20px;
		border:1px solid black;
		border-left: none;
		border-right: none;
		align: center;
	}
	
	.detailArea th {
		background-color: lightgrey;
		text-align: center;
	}
	
	.detailArea td {
		padding: 5px 5px 5px 10px;
		padding-left: 10px;
	}
	
	#replyContent {
		margin: 0 10px 10px 10px;
		width: 600px;
	}
	
	#replyList {
		border-left: none;
		border-right: none;
		width: 600px;
	}
	
	#replyList tr:nth-child(2n+1) {
		background-color: lightgrey;
	}
	
	#replyList tr:nth-child(2n) {
		background-color: ;
	}
	
	.replyContent {
		padding-left: 10px;
	}
	
	.replyDate {
		padding-right: 10px;
	}
	
	.rArea {
		margin-left: 84px;
	}
	
	.replyDate {
		text-align: right;
	}
	
</style>

</head>
<body>
	
	<!-- menu -->
	<jsp:include page = "../common/menu.jsp"/>
	
	<!-- header -->
   	<jsp:include page = "../common/header.jsp"/>
	
	
	<div class="outer">
		<br>
		
		<h2 align="center">질문 게시글</h2>
		<br>
		
		<table class="detailArea">
			<tr>
				<th width="80px">카테고리</th>
				<td>${b.category}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${b.boardWriter}</td>
				<th width="80px">작성일</th>
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
			<button class="button" type="button" onclick="location.href='<%=request.getContextPath()%>/boardList.do?currentPage=1';">목록으로</button>
			<button class="button" type="submit" onclick="location.href='<%=request.getContextPath()%>/boardUpdateForm.do?bno=${b.boardNo}';">수정하기</button>
			<button class="button" type="button" onclick="deleteBoard();">삭제하기</button>
		</div>
		
		<form action="" id="postForm" method="post">
			<%-- 게시글 번호 히든으로 가져올 수 있도록 --%>
			<input type="hidden" name="bno" value="${b.boardNo}">
		</form>
		
	</div>
	

	<script>
		
		// 삭제 버튼 클릭 시
		function deleteBoard(){
			// 게시글 번호 변수에 담기
			let bno = ${b.boardNo};
			
			// 관리자라면
			if(${!empty sessionScope.loginUser && sessionScope.loginUser.userId == 'admin'}) {
				
				// confirm 결과 변수에 담아서
				let result = confirm("게시글을 삭제하시겠습니까?");
				// 확인 클릭 시 삭제 진행
				if(result) {
					alert("삭제가 완료되었습니다.");
					location.href="<%=request.getContextPath()%>/boardDelete.do?bno="+bno;
				} else {
					return false;
				}
			// 회원 및 비회원인 경우 비밀번호 확인 후 삭제되도록
			} else {
				// 실행할 url
				let url = "<%=request.getContextPath()%>/boardDeletePwdCheck.do?bno="+bno;
				// 팝업 이름
				let name = "boardPwdCheckPopup";
				// 팝업 속성
				let option = "width = 500, height = 200, top = 300, left = 500, location = no"
				// 위 세 가지는 필수 항목이며 이름은 없는 경우 "" 으로 대체 가능
				open(url, name, option);
			}
			
		}
		
	</script>
		
		
	
	
	<div class="replyArea">
		<!-- 댓글 작성하는 div -->
		<table class="replyTable" align="center">
			<tr>
				<th>댓글작성</th>
				<c:choose>
					<%-- 로그인 되어있는 유저가 관리자라면 댓글 달 수 있도록 --%>
					<c:when test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId == 'admin'}">
						<td><textarea rows="3" cols="60" id="replyContent" style="resize:none;"></textarea></td>
						<td><button class="button" id="addReply">댓글등록</button></td>	
					</c:when>
					<c:otherwise>
						<td><textarea readonly rows="3" cols="60" id="replyContent" style="resize:none;">관리자만 사용 가능한 서비스입니다.</textarea></td>
						<td><button class="button" disabled>댓글등록</button></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
		
		
		<!-- 댓글 리스트들 보여주는 div -->
		<div id="replyListArea">
			<table id="replyList" class="rArea">
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
	
		// 댓글 입력 클릭 시
		$("#addReply").click(function() {
			// 댓글 내용 변수에 담아서
			let replyContent = $("#replyContent").val();
			
			
		})
	
		// 댓글 입력
		$(function() {
			
			selectReplyList(); // 입력하기 전에 댓글 리스트 출력하는 함수 먼저 실행
			
			// 댓글 등록 클릭 시
			$("#addReply").click(function() {
				var content = $("#replyContent").val(); // 댓글 내용
				var bno = ${b.boardNo}; // 게시글 번호
				
				// 비어 있으면 알림창 띄우고 포커싱 주기
				if(content == null || content == "") {
					alert("댓글 내용을 작성해주세요.");
					$("#replyContent").focus();
					
					return false;
				// 내용 잘 담겨 있으면
				} else {
					
					$.ajax({
						url: "replyInsert.do", // 댓글 입력 서블릿으로 연결
						
						type: "post", // servlet에서 인코딩 먼저
						
						// servlet 변수명 : jsp 변수명
						data: {
								content : content,
								bno : bno
						},
						
						success: function(status){
									if(status == "success") { // 성공적으로 입력되면 (넘겨 받은 문자가 success 이면)
										selectReplyList(); // 리스트 조회해서 실시간으로 바뀌도록
										$("#replyContent").val(""); // 입력했으니 댓글 입력창 비워주기
									}
						},
						
						error: function(){
							console.log("ajax 통신 실패 - 댓글 등록");
						}
					})
				
				}
				
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
									'<td width="300px" class="replyContent">'+ list[i].replyContent +'</td>' +
									'<td width="120px" class="replyDate">'+ list[i].createDate +'</td>' +
									<%-- 댓글 삭제 관리자만 할 수 있도록 조건 설정 --%>
									<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId == 'admin'}">
										'<td align="center" width="50px"><a href="javascript:void(0);" onClick="deleteConfirm(' + list[i].replyNo + ');">삭제</a></td>' +
									</c:if>
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
			// confirm 결과 변수에 담아서
			let result = confirm("댓글을 삭제하시겠습니까?");
			
			// 확인 클릭 시 정상적으로 삭제
			if(result) {
				
				$.ajax({
					
					url: "replyDelete.do",
					
					type: "post",
					
					data: {rno : rno},
					
					success: function(status) {
								if(status == "success") { // 성공적으로 입력되면 (넘겨 받은 문자가 success 이면)
									selectReplyList(); // 리스트 조회해서 실시간으로 바뀌도록
								}
					},
					
					error: function(){
						console.log("ajax 통신 실패 - 댓글 삭제");
					}

				})
			// 취소 클릭 시 삭제 안 되고 그대로
			} else {
				return false;
			}
		}
		

	</script>



	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>

</body>
</html>