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

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>


<style>

	.outer{
		margin:auto;
		margin-top:50px;
		margin-bottom:50px
	}
	
	#updateForm{
		width:100%;
		margin:auto;
		margin-top: 40px;
	}
	
	#updateForm>table{
		border:1px solid black;
		border-left: none;
		border-right: none;
	}
	
	#updateForm>table input{
		width:100%;
		box-sizing:border-box;
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
	
	.updateArea th {
		text-align: center;
		background-color: lightgrey;
	}
	
	.updateArea tr {
		border:1px solid black;
		border-left: none;
		border-right: none;
	}
	
	.updateArea td {
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
		
		<h2 align="center">공지사항 수정</h2>
		
		<form id="updateForm" action="<%=request.getContextPath()%>/noticeUpdate.do" method="post" >
		
			<input type="hidden" name="nno" value="${notice.noticeNo}">
		
			<table class="updateArea" align="center" width="870px">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" id="title" name="title" value="${notice.noticeTitle}">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
							<textarea id="content" name="content" rows="10" cols="30" style="width:766px; height:412px;">${notice.noticeContent}</textarea>
					</td>
				</tr>	
			</table>
			<br>
			
			<div class="btns" align="center">
				<button class="button" type="submit">수정하기</button>
			</div>
		</form>
	</div>
	
	<script>
		
		let oEditors = []
		
	    smartEditor = function() {
	    	
			nhn.husky.EZCreator.createInIFrame({
	        	oAppRef: oEditors,
	        	// 에디터가 들어갈 textarea id
	        	elPlaceHolder: "content",
	        	// html editor skin url
	        	sSkinURI: "<%=request.getContextPath()%>/resources/smarteditor/SmartEditor2Skin.html",
	        	
	        	htParams : {
		        	// 툴바 사용 여부
		        	bUseToolbar : true,
		        	// 입력창 크기 조절바 사용 여부
					bUseVerticalResizer : true,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부
					bUseModeChanger : true,
					
					fOnBeforeUnload : function(){
						//alert("완료!");
					}
				}, //boolean
				
				fOnAppLoad : function(){
					//예제 코드
					//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
				},
				
	        	fCreator: "createSEditor2"
	      	})
	    }
		
	    // 페이지 열자마자 에디터 API 실행
	    $(document).ready(function() {
	      smartEditor();
	    })
	
		// 폼 제출 시 카테고리, 내용, 비밀번호 비어 있으면 알림창 띄우기
		$("form").submit(function() {
			// 에디터 내용을 텍스트박스에 업데이트
	    	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
	    	
			// 제목, 내용 값을 변수에 담아서
			let title = $("#title").val();
			let content = $("#content").val().trim();
			
			// 제목이 비어있는 경우
			if(title == "" || title == null) {
				// 폼의 액션 태그 제거 (서블릿으로 넘어가 게시글 등록 막기 위해)
				$(this).removeAttr("action");
				// 알림 띄우기
				alert("제목을 입력해주세요.");
				// 해당 입력창에 포커스 주기
				$("#title").focus();
				
				return false;
			
			// 내용이 비어있는 경우
			} else if(content == "" || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>') {
				// 알림 띄우기
				alert("내용을 입력해주세요.")
				// 포커싱 주기
   		    	oEditors.getById["content"].exec("FOCUS");
				
				return false;
			
			// 잘 작성이 되어있으면
			} else {
				// 제거했던 액션 태그 다시 추가해서 잘 진행되도록
				$(this).attr("action", "<%=request.getContextPath()%>/noticeUpdate.do");
			}	
		})
		
	</script>
	
	
	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>
	
</body>
</html>