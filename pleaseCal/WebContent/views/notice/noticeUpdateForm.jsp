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
		
		<h2 align="center">???????????? ??????</h2>
		
		<form id="updateForm" action="<%=request.getContextPath()%>/noticeUpdate.do" method="post" >
		
			<input type="hidden" name="nno" value="${notice.noticeNo}">
		
			<table class="updateArea" align="center" width="870px">
				<tr>
					<th>??????</th>
					<td>
						<input type="text" id="title" name="title" value="${notice.noticeTitle}">
					</td>
				</tr>
				<tr>
					<th>??????</th>
					<td>
							<textarea id="content" name="content" rows="10" cols="30" style="width:766px; height:412px;">${notice.noticeContent}</textarea>
					</td>
				</tr>	
			</table>
			<br>
			
			<div class="btns" align="center">
				<button class="button" type="submit">????????????</button>
			</div>
		</form>
	</div>
	
	<script>
		
		let oEditors = []
		
	    smartEditor = function() {
	    	
			nhn.husky.EZCreator.createInIFrame({
	        	oAppRef: oEditors,
	        	// ???????????? ????????? textarea id
	        	elPlaceHolder: "content",
	        	// html editor skin url
	        	sSkinURI: "<%=request.getContextPath()%>/resources/smarteditor/SmartEditor2Skin.html",
	        	
	        	htParams : {
		        	// ?????? ?????? ??????
		        	bUseToolbar : true,
		        	// ????????? ?????? ????????? ?????? ??????
					bUseVerticalResizer : true,
					// ?????? ???(Editor | HTML | TEXT) ?????? ??????
					bUseModeChanger : true,
					
					fOnBeforeUnload : function(){
						//alert("??????!");
					}
				}, //boolean
				
				fOnAppLoad : function(){
					//?????? ??????
					//oEditors.getById["ir1"].exec("PASTE_HTML", ["????????? ????????? ?????? ????????? ???????????? text?????????."]);
				},
				
	        	fCreator: "createSEditor2"
	      	})
	    }
		
	    // ????????? ???????????? ????????? API ??????
	    $(document).ready(function() {
	      smartEditor();
	    })
	
		// ??? ?????? ??? ????????????, ??????, ???????????? ?????? ????????? ????????? ?????????
		$("form").submit(function() {
			// ????????? ????????? ?????????????????? ????????????
	    	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
	    	
			// ??????, ?????? ?????? ????????? ?????????
			let title = $("#title").val();
			let content = $("#content").val().trim();
			
			// ????????? ???????????? ??????
			if(title == "" || title == null) {
				// ?????? ?????? ?????? ?????? (??????????????? ????????? ????????? ?????? ?????? ??????)
				$(this).removeAttr("action");
				// ?????? ?????????
				alert("????????? ??????????????????.");
				// ?????? ???????????? ????????? ??????
				$("#title").focus();
				
				return false;
			
			// ????????? ???????????? ??????
			} else if(content == "" || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>') {
				// ?????? ?????????
				alert("????????? ??????????????????.")
				// ????????? ??????
   		    	oEditors.getById["content"].exec("FOCUS");
				
				return false;
			
			// ??? ????????? ???????????????
			} else {
				// ???????????? ?????? ?????? ?????? ???????????? ??? ???????????????
				$(this).attr("action", "<%=request.getContextPath()%>/noticeUpdate.do");
			}	
		})
		
	</script>
	
	
	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>
	
</body>
</html>