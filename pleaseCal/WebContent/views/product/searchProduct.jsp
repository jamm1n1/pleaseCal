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
<body>
	<jsp:include page = "../common/menu.jsp"/>
	

    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5">
            <div class="col-lg-6">
                <h3 class="mt-5">"${search}"(으)로 검색한 결과</h3>
                <h5 class="mt-5">총 ${fn:length(list)} 건</h5>
            </div>
        </div>
    </div>

	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="list">
		
		<c:forEach var="item" items="${list}" varStatus="i">   
		<div class="col mb-5">		
			<div class="card h-100">
				<a href="<%=request.getContextPath() %>/detailProduct.do?no=${item.pId}"><img class="card-img-top" src="<%=request.getContextPath() %>/resources/image/${item.piName}" alt="상품이미지" /></a>
				<div class="card-body p-4">
					<div class="text-center">
						<h5 class="fw-bolder">${item.pName}</h5>${item.pPrice}
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
	</div>
	</div>

	
	<jsp:include page = "../common/footer.jsp"/>
	
</body>
</html>