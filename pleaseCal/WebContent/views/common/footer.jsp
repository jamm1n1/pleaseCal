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
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">Features</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">Pricing</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">FAQs</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">About</p></li>
	      </ul>
	    </div>
	
	    <div class="col">
	      <p class="m-0 text-center text-black"><b>서제민</b></p>
	      <ul class="nav flex-column">
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">Features</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">Pricing</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">FAQs</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">About</p></li>
	      </ul>
	    </div>
	
	    <div class="col">
	      <p class="m-0 text-center text-black"><b>임찬희</b></p>
	      <ul class="nav flex-column">
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">Features</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">Pricing</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">FAQs</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">About</p></li>
	      </ul>
	    </div>
	    
	    <div class="col">
	      <p class="m-0 text-center text-black"><b>현주아</b></p>
	      <ul class="nav flex-column">
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">Features</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">Pricing</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">FAQs</p></li>
	        <li class="nav-item mb-2"><p class="m-0 text-center text-white">About</p></li>
	      </ul>
	    </div>

    </footer>
    
</body>
</html>