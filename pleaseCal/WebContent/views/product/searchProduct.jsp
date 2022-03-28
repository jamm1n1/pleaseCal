<%@page import="com.uni.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
<meta name="description" content="" />
<meta name="author" content="" />
<style>
</style>
</head>
<body style=background:#f8f8f8>
	<jsp:include page = "../common/menu.jsp"/>
	
	<div><br><br></div>
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5">
            <div class="col-lg-6">
                <h3 class="fw-bolder mt-5">"${search}"(으)로 검색한 결과</h3>
            </div>
        </div>
    </div><br>
    
   <div class="container px-4 px-lg-5">
     	<div class="container px-4 px-lg-4 mt-4">
     		<h3 class="fw-bolder mb-4">공지사항</h3>
     		<c:if test="${ !empty nList && !empty search}">
     		<h5 class="mt-5">총 ${fn:length(nList)} 건</h5>
     		</c:if>
     		<c:if test="${ empty nList || empty search}">
     		<h5 class="mt-5">총 0 건</h5>
     		</c:if>
     	</div>
        <div class="container px-4 px-lg-4 mt-4" id="list">
			<!-- 후기 내역 -->
			<table class="table">
	           <c:if test="${ !empty nList && !empty search}">         
               <thead>
                 <th>No</th>
                 <th>Title</th>
                 <th>Writer</th>
                 <th>Count</th>
                 <th>Date</th>
               </thead>  
               <tbody>
               </c:if>
               
				<%-- list가 비어있으면 --%>
                 <c:if test="${ empty nList || empty search}">
                   <div class="col mb-5" style="height: auto; min-height: 50px;">		
						<div class="text-center">
						<h3>검색결과가 없습니다</h3>
						</div>
					</div>
                </c:if>
                    
		                    
                 <%-- list가 비어있지 않으면 --%>
                 <c:if test="${ !empty nList && !empty search}">
                 <%-- for문 안에서 사용할 변수명과 배열 set --%>
               	 <c:set var="nList" value="${nList}"/>
               	<%-- varStatus : 반복 횟수 변수명 --%>
               	 <c:forEach items="${nList}" varStatus="st">
                 <%-- st.index : 0부터 순서대로 인덱스 실행 --%>
                 	<tr>
                     <td>${nList[st.index].noticeNo}</td>
                     <td>${nList[st.index].noticeTitle}</td>
                     <td>관리자</td>
                     <td>${nList[st.index].count}</td>
                     <td>${nList[st.index].createDate}</td>
                   	</tr>
                </c:forEach>
            	</c:if>
	  
	         	</tbody>
	          </table>
        </div>
    </div><br><br>
    <script>
	       $(function() {
   			// 게시글 클릭했을 때
   			$(".table>tbody>tr").click(function() {

   				let nno = $(this).children().eq(0).text(); // n.getNoticeNo()
   				
   				// 해당 공지사항 상세 페이지로 넘어가기
   				// 쿼리스트링으로 작성
   				location.href= "<%=request.getContextPath()%>/noticeDetail.do?nno="+nno;
   			})
   		})
	</script>
	
	<div class="container px-4 px-lg-5">
     	<div class="container px-4 px-lg-4 mt-4">
     		<h3 class="fw-bolder mb-4">상품</h3>
     		<c:if test="${ !empty list && !empty search}">
     		<h5 class="mt-5">총 ${fn:length(list)} 건</h5>
     		</c:if>
     		<c:if test="${ empty list || empty search}">
     		<h5 class="mt-5">총 0 건</h5>
     		</c:if>
     	</div>
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="list">
		<c:if test= "${empty list || empty search}">
			<div class="col mb-5" style="height: auto; min-height: 300px;">		
			<div class="text-center">
				<h3>검색결과가 없습니다</h3>
				<br><br>
			</div>
			</div>
		</c:if>
		<c:if test= "${!empty list && !empty search}">
		<c:forEach var="item" items="${list}" varStatus="i">   
		<div class="col mb-5">		
			<div>
				<a href="<%=request.getContextPath() %>/detailProduct.do?no=${item.pId}"><img class="card-img-top" src="<%=request.getContextPath() %>/resources/image/${item.piName}" alt="상품이미지" /></a>
				<div class="card-body p-4">
					<div class="text-center">
						<h5 class="fw-bolder">${item.pName}</h5>${item.pPrice} 원
					</div>
				</div>
				<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
					<div class="text-center">
						<a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath() %>/detailProduct.do?no=${item.pId}">상세정보</a>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		</c:if>
	</div>
	</div>
	</div>
	

	
	<jsp:include page = "../common/footer.jsp"/>
	
</body>
</html>
