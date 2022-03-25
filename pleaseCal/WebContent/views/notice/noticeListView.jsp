<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.notice.model.vo.Notice, java.util.ArrayList"%>
    
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
		margin-top:100px;
	}
	
	.table {
		border:1px solid white;
		text-align:center;
	}
	
	.searchArea {
		margin:auto;
		margin-top:30px;
		margin-bottom:30px;
	}
	
	.pagingArea {
		margin:auto;
		margin-top:50px;
	}
	
	.table>tbody>tr:hover {
		background:darkgrey;
		cursor:pointer
	}
	
	#insertBtn {
		margin:auto;
		margin-bottom:20px;
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
               <h4 class="card-title">Notice</h4>
             </div>
             <div class="card-body">
               <div class="table-responsive">
                  
                  <table class="table">
                    
                    <thead class=" text-primary">
                    	<tr>
                    		<th>No</th>
		                    <th>Title</th>
		                    <th>Writer</th>
		                    <th>Count</th>
		                    <th>Date</th>
                    	</tr>
                    </thead>
                    
                    <tbody>
						<%-- list가 비어있으면 --%>
	                    <c:if test="${ empty list }">
	                         <tr>
	                           <td colspan="5">존재하는 공지사항이 없습니다.</td>
	                        </tr>
	                    </c:if>
	                    
	                    <%-- list가 비어있지 않으면 --%>
	                    <c:if test="${ !empty list }">
	                    	<%-- for문 안에서 사용할 변수명과 배열 set --%>
		                	<c:set var="list" value="${list}"/>
		                	<%-- varStatus : 반복 횟수 변수명 --%>
		                	<c:forEach items="${list}" varStatus="st">
			                 	<%-- st.index : 0부터 순서대로 인덱스 실행 --%>
			                 	<tr>
			                     <td>${list[st.index].noticeNo}</td>
			                     <td>${list[st.index].noticeTitle}</td>
			                     <td>관리자</td>
			                     <td>${list[st.index].count}</td>
			                     <td>${list[st.index].createDate}</td>
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
    
	<br>
	
	<!-- 페이징바 만들기 -->
	<div class="pagingArea" align="center">
		<!-- 맨 처음으로 (<<) -->
		<button onclick="location.href='<%=request.getContextPath()%>/noticeList.do?currentPage=1'"> &lt;&lt; </button>
	
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
				<button onclick="location.href='<%= request.getContextPath() %>/noticeList.do?currentPage=${pi.currentPage - 1}'"> &lt; </button>
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
					<button onclick="location.href='<%=request.getContextPath() %>/noticeList.do?currentPage=${p}'"> ${p} </button>
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
				<button onclick="location.href='<%= request.getContextPath() %>/noticeList.do?currentPage=${pi.currentPage + 1}'"> &gt; </button>
			</c:otherwise>
		</c:choose>
	
		<!-- 맨 끝으로 (>>) -->
		<button onclick="location.href='<%=request.getContextPath()%>/noticeList.do?currentPage=${pi.maxPage}'"> &gt;&gt; </button>
	</div>
	
	<%-- 검색하기 버튼 클릭 시 검색 서블릿으로 넘어가도록 --%>
   	<form class="searchArea" align="center" action="<%=request.getContextPath()%>/noticeSearch.do" method="get" >
        <select id="condition" name="condition">
           <option value="title">제목</option>
           <option value="content">내용</option>
        </select>
        <input type="search" id="search" name="search">
        <button type="submit">검색하기</button>
  	</form>
	
    <div id="insertBtn" align="center">
        
		<%-- 세션에서 가져온 로그인 유저가 비어있지 않고, 로그인 유저 아이디가 admin 이라면 --%>
     	<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId == 'admin'}">
			<%-- 클릭 시 작성하기 폼으로 화면 전환하는 서블릿 연결 --%>
	        <button onclick="location.href='<%=request.getContextPath()%>/noticeEnrollForm.do'">작성하기</button>     		
     	</c:if>
    </div>
	
	
	
	<script>
		<%-- list 가 비어있지 않으면 --%>
		<c:if test="${!empty list}">
	
			$(function() {
	   			// 게시글 클릭했을 때
	   			$(".table>tbody>tr").click(function() {
	   				
	   				let nno = $(this).children().eq(0).text(); // n.getNoticeNo()
	   				
	   				// 해당 공지사항 상세 페이지로 넘어가기
	   				// 쿼리스트링으로 작성
	   				location.href= "<%=request.getContextPath()%>/noticeDetail.do?nno="+nno;
	   			})
	   		})
   		</c:if>
			
		/*
		// 폼 제출 시
		$("form").submit(function() {
			
			let input = $("#search").val();
			
			console.log(input);
			// 검색창 비어 있으면 공지사항 리스트 페이지 다시 호출
			if(input == "") {
				//$(this).removeAttr("action");
			} else {
					
			}
			
		})*/
	</script>
	

	
	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>

</body>
</html>