<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#team {
	vertical-align:middle;
	margin-top:40px;
}
</style>
</head>
<body>

	<footer class="row row-cols-5 py-5 my-5 py-5 bg-secondary">

	    <div class="col" id="team">
	      <ul class="nav flex-column">
	      	<li class="nav-item mb-2"><p class="text-center"><a href="https://github.com/jamm1n1/pleaseCal"><img src="<%=request.getContextPath() %>/resources/image/git.png" alt="깃허브이미지" style="width: 50px; height:auto;"/></p></a></li>
	        <li class="nav-item mb-2"><p class="text-center text-white">&copy; 2022.04.04 세미프로젝트 1팀</p></li>
	      </ul>
	    </div>

	    <div class="col">
	      <p class="m-0 text-center text-black"><b>김영진</b></p>
	      <ul class="nav flex-column">
	        <li class="nav-item mb-2"></li>
	        <li class="nav-item mb-2"></li>
	        <li class="nav-item mb-2"></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">장바구니</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">결제 API</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">주문내역</p></li>
	      </ul>
	    </div>
	
	    <div class="col">
	      <p class="m-0 text-center text-black"><b>서제민</b></p>
	      <ul class="nav flex-column">
		<li class="nav-item mb-2"></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">회원가입</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">로그인</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">마이페이지</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">관리자 페이지</p></li>
	      </ul>
	    </div>
	
	    <div class="col">
	      <p class="m-0 text-center text-black"><b>임찬희</b></p>
	      <ul class="nav flex-column">
			<li class="nav-item mb-2"></li>
			<li class="nav-item mb-2"></li>
			<li class="nav-item mb-2"></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">공지사항 게시판</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">Q&A 게시판</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">팝업 공지</p></li>
	      </ul>
	    </div>
	    
	    <div class="col">
	      <p class="m-0 text-center text-black"><b>현주아</b></p>
	      <ul class="nav flex-column">
		<li class="nav-item mb-2"></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">상품</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">건강계산기</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">후기 게시판</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">전체검색</p></li>
	      </ul>
	    </div>

    </footer>
    
</body>
</html>
