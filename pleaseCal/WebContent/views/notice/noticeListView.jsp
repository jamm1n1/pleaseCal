<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.notice.model.vo.Notice, java.util.ArrayList"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

	.table{
		border:1px solid white;
		text-align:center;
	}
	
	.searchArea{
		margin:auto;
		margin-top:50px;
		margin-bottom:30px;
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
               <h4 class="card-title">Notice</h4>
             </div>
             <div class="card-body">
               <div class="table-responsive">
                  
                  <table class="table">
                    
                    <thead class=" text-primary">
                    
                      <th>No</th>
                      <th>Title</th>
                      <th>Writer</th>
                      <th>Count</th>
                      <th>Date</th>
                      
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
	        	       	
   	<form class="searchArea" align="center">
        <select id="condition" name="condition">
           <option value="title">제목</option>
           <option value="content">내용</option>
        </select>
        <input type="search" name="search">
        <button type="submit">검색하기</button>
  	</form>
	
     <div id="insertBtn" align="center">
        
		<%-- 세션에서 가져온 로그인 유저가 비어있지 않고, 로그인 유저 아이디가 admin 이라면 --%>
     	<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId == 'admin'}">
			<%-- 클릭 시 작성하기 폼으로 화면 전환하는 서블릿 연결 --%>
	        <button onclick="location.href='<%=request.getContextPath()%>/noticeEnrollForm.do'">작성하기</button>     		
     	</c:if>
    </div>
     
	<br>
	
	
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
	</script>
	
	
	
	
	<!-- footer-->
   	<jsp:include page = "../common/footer.jsp"/>

</body>
</html>