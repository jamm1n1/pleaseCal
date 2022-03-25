<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.uni.member.model.vo.Member"%>
<%
Member loginUser = (Member) session.getAttribute("loginUser");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="././resources/css/owl.carousel.css">
<link rel="stylesheet" href="././resources/css/owl.carousel.min.css">
<link href="././resources/css/styles.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="./resources/js/owl.carousel.js"></script>
<script src="./resources/js/owl.carousel.min.js"></script>

 <style>

 * {
 	font-family: 'Noto Sans KR', sans-serif;
 }
 </style>
<!-- Core theme CSS (includes Bootstrap)-->

</head>
<body>
<!-- Navigation-->


      <nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light">
          <div class="container px-4 px-lg-6">
              <a class="navbar-brand" href="#!">CAL</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                      <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath() %>">Home</a></li>
                      </li>
                      <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" id="navbarDropdown" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">상품</a>
                          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="<%=request.getContextPath() %>/productlistForm.do">모든상품</a></li>
                              <li><a class="dropdown-item" href="<%=request.getContextPath() %>/selectProductListForm.do?category=2">단백질보충제</a></li>
                              <li><a class="dropdown-item" href="<%=request.getContextPath() %>/selectProductListForm.do?category=1">닭가슴살</a></li>
                              <li><a class="dropdown-item" href="<%=request.getContextPath() %>/selectProductListForm.do?category=3">도시락</a></li>
                          </ul>
                      </li>
                            <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/noticeList.do">공지사항</a>
                         	<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/boardList.do">Q&A</a>
                      </li>
                      <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/healthInfo.do">건강계산기</a>

               </ul>
               <form class="searching" action="<%=request.getContextPath() %>/searchProduct.do">
            	 <input class="form-control" type="text" placeholder="전체검색" name="search">
           	   </form>  &nbsp; &nbsp;
             
             <div>
              
               <button class="btn btn-outline-dark" type="button" onClick="location.href='<%=request.getContextPath()%>/cartList.do'">
                  <i class="bi-cart-fill me-1"></i> Cart <span
                     class="badge bg-dark text-white ms-1 rounded-pill">0</span>
               </button>&nbsp;

                  </div>
            <% if (loginUser == null) { %>

                  <i class="fa-thin fa-people-roof"></i>
                  <input class="btn btn-outline-dark" id="manager" type="button" value="로그인" onClick="location.href='<%=request.getContextPath() %>/LoginPage.do'"><span
                     class="badge bg-dark text-white ms-1 rounded-pill"></span>
                           
               <% } else { %>
   
               <% if (loginUser != null && loginUser.getUserId().equals("admin")) { %>
   

                    <i class="fa-thin fa-people-roof"></i>
                  	<input class="btn btn-outline-dark" id="manager" type="button" value="관리자페이지" onClick="location.href='<%=request.getContextPath() %>/managerPage.do'"><span
                     class="badge bg-dark text-white ms-1 rounded-pill"></span>&nbsp;

                  
                   <i class="fa-thin fa-people-roof"></i>
                   <input class="btn btn-outline-dark" id="manager" type="button" value="로그아웃" onClick="location.href='<%=request.getContextPath() %>/logoutMember.do'"><span
                     class="badge bg-dark text-white ms-1 rounded-pill"></span>

               <% } else { %>
   
                  
 				<div id="userInfo">
					<i class="fa-thin fa-people-roof"></i>
                    <input class="btn btn-outline-dark" id="manager" type="button" value="마이페이지" onClick="location.href='<%=request.getContextPath() %>/mypageMember.do'"><span
                     class="badge bg-dark text-white ms-1 rounded-pill"></span>
                     
                    <i class="fa-thin fa-people-roof"></i>
                   <input class="btn btn-outline-dark" id="manager" type="button" value="로그아웃" onClick="location.href='<%=request.getContextPath() %>/logoutMember.do'"><span
                     class="badge bg-dark text-white ms-1 rounded-pill"></span>
                     <b style="color: blue;"><%=loginUser.getUserName()%> 님 </b> 어서오세요.
				</div>
                  
                  <%}%>
               <%}%>
               
            
         </div>
      </div>
      
   </nav>


</body>
</html>
