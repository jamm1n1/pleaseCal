<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- jstl import --%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 폼</title>

<style>
	
	.outer {
		margin:auto;
		margin-top:50px;
		margin-bottom:50px;
	}
	
	#enrollForm {
		width:60%;
		margin:auto;
		margin-top:50px;
		margin-bottom:50px;
	}
	
	#enrollForm>table input, #enrollForm>table textarea {
		width:100%;
		box-sizing:border-box;
	}
	
	.btns {
		margin: auto;
		margin-bottom: 20px;
		margin-top: 20px;
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
	
	.insertArea th {
		text-align: center;
		background-color: lightgrey;
		
	}
	
	.insertArea tr {
		border:1px solid black;
		border-left: none;
		border-right: none;
		
	}
	
	.insertArea td {
		padding: 5px 5px 5px 5px;
	}
	
</style>

</head>
<body>

	<!-- menu -->
	<jsp:include page = "../common/menu.jsp"/>
	
	<!-- header -->
   	<jsp:include page = "../common/header.jsp"/>
	
	<div class="outer">
		
		<h2 align="center">질문 게시글 작성하기</h2>
		
		<%-- enctype="multipart/form-data" : 첨부파일 넘겨 받을 때 사용 --%>
		<form id="enrollForm" action="<%=request.getContextPath()%>/boardInsert.do" method="post" enctype="multipart/form-data">
			
			<table class="insertArea" align="center">
				<tr>
					<th width="100">카테고리</th>
					<td width="500" colspan="2">
						<select id="category" name="category">
							<option>상품 문의</option>
							<option>배송 문의</option>
							<option>기타 문의</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="2">
						<textarea rows="15" id="content" name="content" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="2"><input type="file" name="upfile"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="2"><input type="password" id="pwd" name="pwd"></td>
				</tr>
				<tr>
					<th>비밀글 설정</th>
					<td>
						<label>
					    	<input type="radio" id="public" name="public" disabled> 공개글
					  	</label>
					</td>
					<td>
						<label>
					    	<input type="radio" id="secret" name="secret" checked> 비밀글
					  	</label>
					</td>
				</tr>
				
			</table>
			
			<br>
			
			<div class="btns" align="center">
				<button class="button" type="submit" id="insert">등록하기</button>
			</div>
			
		</form>
	
	</div>
	
	<script>
	
		// 폼 제출 시 카테고리, 내용, 비밀번호 비어 있으면 알림창 띄우기
		$("form").submit(function() {
			// 내용, 비밀번호 값을 변수에 담아서
			let content = $("#content").val();
			let pwd = $("#pwd").val();
			
			// 비밀번호 정규식 확인하기 위해 (8~16자, 영문/숫자 조합)
			let regPwd = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
			
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
			
			// 비밀번호가 정규식 조건에 맞지 않는 경우
			} else if(!regPwd.test(pwd)) {
				// 폼의 액션 태그 제거 (서블릿으로 넘어가 게시글 등록 막기 위해)
				$(this).removeAttr("action");
				// 알림 띄우기
				alert("비밀번호는 영문/숫자 포함 8~16자로 입력해주세요.")
				// 입력된 값 선택
				$("#pwd").select();
				
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
