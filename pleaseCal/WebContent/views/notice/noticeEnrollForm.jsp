<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- jstl import --%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<style>

	.outer{
		margin:auto;
		margin-top:50px;
		margin-bottom:50px;
	}
	
	#enrollForm{
		width:100%;
		margin:auto;
	}
	
	#enrollForm>table{
		border:1px solid black;
	
	}
	
	#enrollForm>table input{
		width:100%;
		box-sizing:border-box;
	}

</style>



</head>
<body>

	<!-- menu -->
	<jsp:include page = "../common/menu.jsp"/>
	
	<div class="outer">
		<br>
		
		<h2 align="center">공지사항 작성하기</h2>
		
		<form id="enrollForm" action="<%=request.getContextPath()%>/noticeInsert.do" method="post">
			<div align="center">
				<table width="100%">
					<tr>
						<td>제목</td>
						<td><input type="text" id="title" name="title"/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea id="content" name="content" rows="10" cols="30" style="width:766px; height:412px;"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="btns" align="center">
				<button type="submit" id="insert" onClick="submitPost()">등록하기</button>
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
						alert("완료!");
					}
				}, //boolean
				
				fOnAppLoad : function(){
					//예제 코드
					//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
				},
				
	        	fCreator: "createSEditor2"
	      	})
	    }
		
	    
	    $(document).ready(function() {
	      smartEditor();
	    })
		
	    
		submitPost = function() {
	    	
	    	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
	    	let content = document.getElementById("content").value;
	    	
	    	if(content == "") {
   		    	alert("내용을 입력해주세요.")
   		    	oEditors.getById["content"].exec("FOCUS")
   		    	return;
   		  	} else {
   		    	console.log(content);
	    	}
	    }
	  
	    
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
				alert("제목을 입력해주세요.");
				// 해당 입력창에 포커스 주기
				$("#title").focus();
				
				return false;
			
			// 내용이 비어있는 경우
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