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

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">

<style>

	.content {
		margin:auto;
		margin-top:50px;
	}

	.table{
		border:1px solid white;
		text-align:center;
	}
	
	.searchArea{
		margin:auto;
		margin-top:30px;
		margin-bottom:30px;
	}
	
	.pagingArea {
		margin:auto;
		margin-top:50px;
		margin-bottom:30px;
	}
	
	.table>tbody>tr:hover{
		background:darkgrey;
		cursor:pointer
	}
	
		.btn {
		backgroud-color: #ccc;
		border-radius: 5px;
	 	cursor: pointer;
	  	transition: all 0.3s ease;
	  	position: relative;
	  	display: inline-block;
	   	box-shadow: inset 2px 2px 2px 0px rgba(255,255,255,.5),
	   				7px 7px 20px 0px rgba(0,0,0,.1),
	   				4px 4px 5px 0px rgba(0,0,0,.1);
	  	outline: none;
	}
	
	.btn:after {
		position: absolute;
	  	content: "";
	  	width: 0;
	  	height: 100%;
	  	top: 0;
	  	left: 0;
	  	direction: rtl;
	  	z-index: -1;
	  	box-shadow: -7px -7px 20px 0px #fff9,
	   				-4px -4px 5px 0px #fff9,
	   				7px 7px 20px 0px #0002,
	   				4px 4px 5px 0px #0001;
	  	transition: all 0.3s ease;
	}
	
	.btn:hover {
		color: #000;
	}
	
	.btn:hover:after {
		left: auto;
	  	right: 0;
	  	width: 100%;
	}
	
	.btn:active {
		top: 2px;
	}
	
	input {
		border: 1px solid darkgrey;
		border-radius: 5px;
		outline: none;
		background-color: rgb(233, 233, 233);
		padding-left: 5px;
	}
	
	input:focus {
		outline: none;
		box-shadow: box-shadow: 0 0 0 2px #f00;
	}
	
	select, .searchBtn {
		border: 1px solid darkgrey;
		border-radius: 5px;
	}
	
	.insertBtn {
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
	
	.insertBtn:after {
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
	
	.insertBtn:hover {
		color: #fff;
	}
	
	.insertBtn:hover:after {
	  	left: 0;
	  	width: 100%;
	}
	
	.insertBtn:active {
	  	top: 2px;
	}


</style>

</head>

<body>
	
	<!-- menu -->
	<jsp:include page = "../common/menu.jsp"/>
	
	<!-- header -->
   	<jsp:include page = "../common/header.jsp"/>
	
	<div class="content">
       <div class="row">
         <div class="col-md-12">
           <div class="card">
             <div class="card-header">
               <h4 class="card-title">작성한 게시글</h4>
             </div>
             <div class="card-body">
               <div class="table-responsive">
               
                  <table class="table" id="blist">
                  
                    <thead class="text-primary">
						<tr>
                    		<th>No</th>
		                    <th>Category</th>
		                    <th>Writer</th>
		                    <th>Date</th>
		                    <th>Count</th>
                    	</tr>
                    </thead>
                    
                    <tbody id="boardList">
						
						<%-- list가 비어있으면 --%>
	                    <c:if test="${ empty list }">
	                         <tr>
	                           <td colspan="5">작성한 게시글이 없습니다.</td>
	                        </tr>
	                    </c:if>
	                    
	                    <%-- list가 비어있지 않으면 --%>
	                    <c:if test="${ !empty list }">
	                    	<%-- for문 안에서 사용할 변수명과 배열 set --%>
		                	<c:set var="list" value="${list}"/>
		                	<%-- varStatus : 반복 횟수 변수명 --%>
		                	<%--<c:forEach items="${list}" var="i" begin="0" end="${list.size()-1}" step="1"> --%>
		                	<c:forEach items="${list}" varStatus="st">
			                 	<%-- st.index : 0부터 순서대로 인덱스 실행 --%>
			                 	<tr>
			                    	<td>${list[st.index].boardNo}</td>
			                    	<td>${list[st.index].category}</td>
			                    	<td>${list[st.index].boardWriter}</td>
			                    	<td>${list[st.index].createDate}</td>
			                    	<td>${list[st.index].count}</td>
			                   	</tr>
			                 </c:forEach>
			            </c:if>
			            
		         	</tbody>
		         	
		          </table>
		          
               </div>
             </div>
           </div>
        </div>
      </div>
    </div>
	
	
	<!-- 페이징바 만들기 -->
	<div class="pagingArea" align="center">
		<!-- 맨 처음으로 (<<) -->
		<button class="btn" onclick="location.href='<%=request.getContextPath()%>/boardSelectList.do?currentPage=1'"> &lt;&lt; </button>
	
		<!-- 이전페이지로(<) -->
		<c:choose>
			<%-- 현재 페이지가 1인 경우 --%>
			<c:when test="${pi.currentPage == 1}">
				<%-- 이전 페이지로 가는 버튼 비활성화 --%>
				<button class="btn" disabled> &lt; </button>
			</c:when>
			<%-- 그 외에는 --%>
			<c:otherwise>
				<%-- 현재 페이지에서 하나 뺀 페이지로 이동하도록 --%>
				<button class="btn" onclick="location.href='<%= request.getContextPath()%>/boardSelectList.do?currentPage=${pi.currentPage - 1}'"> &lt; </button>
			</c:otherwise>
		</c:choose>
		 
		<!-- 페이지 목록 -->
		<%-- var : for문 안에서 사용할 변수명 / begin : 초기값 / end : 최대값 / step : 증가값 --%>
		<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1">
			<c:choose>
				<%-- 현재 페이지에 해당하는 버튼 비활성화 --%>
				<c:when test="${p == pi.currentPage}">
					<button class="btn" disabled> ${p} </button>
				</c:when>
				<%-- 그 외에는 클릭하면 해당 페이지로 넘어가도록 --%>
				<c:otherwise>
					<button class="btn" onclick="location.href='<%=request.getContextPath() %>/boardSelectList.do?currentPage=${p}'"> ${p} </button>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 다음페이지로(>) -->
		<c:choose>
			<%-- 현재 페이지가 마지막 페이지인 경우 --%>
			<c:when test="${pi.currentPage == pi.maxPage}">
				<%-- 다음 페이지로 가는 버튼 비활성화 --%>
				<button class="btn" disabled> &gt; </button>
			</c:when>
			<%-- 그 외에는 --%>
			<c:otherwise>
				<%-- 현재 페이지에서 하나 더한 페이지로 이동하도록 --%>
				<button class="btn" onclick="location.href='<%= request.getContextPath() %>/boardSelectList.do?currentPage=${pi.currentPage + 1}'"> &gt; </button>
			</c:otherwise>
		</c:choose>
	
		<!-- 맨 끝으로 (>>) -->
		<button class="btn" onclick="location.href='<%=request.getContextPath()%>/boardSelectList.do?currentPage=${pi.maxPage}'"> &gt;&gt; </button>
		 
	</div>

	
	<br>
	
	<script>
		/*
		$(function() {
			
			$("#boardList").empty(); // 리스트 가져올 때마다 비우고 새로 가져오도록
			
			$.ajax({
				url: "boardList.do",
				
				type: "get",
				
				//dataType: "html",
				
				success: function(list) {
					console.log(list);
					
					var value = "";
					
					if(list != null) {
	                     
						for(var i in list) {
							value += '<tr>' +
										'<td>' + list[i].boardNo + '</td>' +
										'<td>' + list[i].category + '</td>' +
										'<td>' + list[i].boardWriter + '</td>' +
										'<td>' + list[i].createDate + '</td>' +
										'<td>' + list[i].count + '</td>' +
									 '</tr>';
						}
						
					} else {
						
						value = '<tr><td>존재하는 게시글이 없습니다.</td></tr>';
					}
					
					$("#boardList").html(value);
				},
				
				error: function(e) {
					console.log("ajax 통신 실패");
				}

			})
			
		})*/
		
		
		// list 가 비어있지 않으면
		<c:if test="${!empty list}">
			$(function() {
	   			// 게시글 클릭했을 때
	   			$(".table>tbody>tr").click(function() {
	   				// 게시글 번호 가져와서 변수에 담기
	   				let bno = $(this).children().eq(0).text();

   					location.href= "<%=request.getContextPath()%>/boardSelectDetail.do?bno="+bno;
	   			})
	   		})
   		</c:if>
			
	</script>
	
	
	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>
	
</body>
</html>