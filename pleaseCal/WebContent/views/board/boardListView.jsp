<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%-- jstl import --%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">

<style>

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
	}
	
	.table>tbody>tr:hover{
		background:darkgrey;
		cursor:pointer
	}


</style>

</head>
<body>

	<!-- menu -->
	<jsp:include page = "../common/menu.jsp"/>
	
	<div class="content">
       <div class="row">
         <div class="col-md-12">
           <div class="card">
             <div class="card-header">
               <h4 class="card-title">Q&A</h4>
             </div>
             <div class="card-body">
               <div class="table-responsive">
               
                  <table class="table" id="blist">
                  
                    <thead class="text-primary">
                      <th>No</th>
                      <th>Category</th>
                      <th>Writer</th>
                      <th>Date</th>
                      <th>Count</th>
                    </thead>
                    
                    <tbody id="boardList">
						
						<%-- list가 비어있으면 --%>
	                    <c:if test="${ empty list }">
	                         <tr>
	                           <td colspan="5">존재하는 게시글이 없습니다.</td>
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
		<button onclick="location.href='<%=request.getContextPath()%>/boardList.do?currentPage=1'"> &lt;&lt; </button>
	
		<!-- 이전페이지로(<) -->
		<c:choose>
			<%-- 현재 페이지가 1인 경우 --%>
			<c:when test="${pi.currentPage == 1}">
				<%-- 이전 페이지로 가는 버튼 비활성화 --%>
				<button disabled> &lt; </button>
			</c:when>
			<%-- 그 외에는 --%>
			<c:otherwise>
				<%-- 현재 페이지에서 하나 뺀 페이지로 이동하도록 --%>
				<button onclick="location.href='<%= request.getContextPath() %>/boardList.do?currentPage=${pi.currentPage - 1}'"> &lt; </button>
			</c:otherwise>
		</c:choose>
		 
		<!-- 페이지 목록 -->
		<%-- var : for문 안에서 사용할 변수명 / begin : 초기값 / end : 최대값 / step : 증가값 --%>
		<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1">
			<c:choose>
				<%-- 현재 페이지에 해당하는 버튼 비활성화 --%>
				<c:when test="${p == pi.currentPage}">
					<button disabled> ${p} </button>
				</c:when>
				<%-- 그 외에는 클릭하면 해당 페이지로 넘어가도록 --%>
				<c:otherwise>
					<button onclick="location.href='<%=request.getContextPath() %>/boardList.do?currentPage=${p}'"> ${p} </button>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 다음페이지로(>) -->
		<c:choose>
			<%-- 현재 페이지가 마지막 페이지인 경우 --%>
			<c:when test="${pi.currentPage == pi.maxPage}">
				<%-- 다음 페이지로 가는 버튼 비활성화 --%>
				<button disabled> &gt; </button>
			</c:when>
			<%-- 그 외에는 --%>
			<c:otherwise>
				<%-- 현재 페이지에서 하나 더한 페이지로 이동하도록 --%>
				<button onclick="location.href='<%= request.getContextPath() %>/boardList.do?currentPage=${pi.currentPage + 1}'"> &gt; </button>
			</c:otherwise>
		</c:choose>
	
		<!-- 맨 끝으로 (>>) -->
		<button onclick="location.href='<%=request.getContextPath()%>/boardList.do?currentPage=${pi.maxPage}'"> &gt;&gt; </button>
		</div> 
	</div>
	
	
   	<form class="searchArea" align="center">
        <select id="condition" name="condition">
           <option value="title">제목</option>
           <option value="content">내용</option>
        </select>
        <input type="search" name="search">
        <button type="submit">검색하기</button>
  	</form>
	
	
     <div id="insertBtn" align="center">
		<%-- 클릭 시 작성하기 폼으로 화면 전환하는 서블릿 연결 --%>
        <button onclick="location.href='<%=request.getContextPath()%>/boardEnrollForm.do'">작성하기</button>
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
	   				
	   				// 관리자라면 비밀번호 입력 없이 바로 상세 조회 가능
	   				if(${!empty sessionScope.loginUser && sessionScope.loginUser.userId == 'admin'}) {
	   					
	   					location.href= "<%=request.getContextPath()%>/boardDetail.do?bno="+bno;
	   				
	   				} else {
	   					// 
		   				let url = "<%=request.getContextPath()%>/boardDetailPwdCheck.do?bno="+bno;
		   				let name = "boardPwdCheckPopup";
	   					let option = "width = 500, height = 300, top = 100, left = 200, toolbar = yes, location = no"
						
		   				open(url, name, option);
	   				}
					
	   			})
	   		})
   		</c:if>
			
	</script>
	<%-- 
	// 비밀번호 입력창 팝업으로 열기
	location.href= "<%=request.getContextPath()%>/boardPwdInsert.do?bno="+bno;
	
	상세 페이지로 넘어가는 서블릿
	// 해당 게시글 상세 페이지로 넘어가기
	// 쿼리스트링으로 작성
	location.href= "<%=request.getContextPath()%>/boardDetail.do?bno="+bno;
	--%>
	
	
	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>

</body>
</html>