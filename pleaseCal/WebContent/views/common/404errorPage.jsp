<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>

<!-- Custom fonts for this template-->
<link href="././resources/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="././resources/css/sb-admin-2.min.css" rel="stylesheet">
<style>
div {
	
}
#wrapper{
	height: 100vh;
	text-align: center;
	padding: 20px;
	margin: 15px;
}
.container-fluid{
	display: inline-block;
	width: 50%;
	padding: 50px;
	margin: 30px;
	
}
.text-center{
	display: inline-block;
}

</style>
</head>

<body id="page-top">
	
	<jsp:include page = "../common/menu.jsp"/>
    <!-- Page Wrapper -->
    <div id="wrapper">

         <!-- Begin Page Content -->
         <div class="container-fluid">

             <!-- 404 Error Text -->
             <div class="text-center">
                 <div class="error mx-auto" data-text="404">404</div>
                 <p class="lead text-gray-800 mb-5">Page Not Found</p>
                 <p class="text-gray-500 mb-0">현재 찾을 수 없는 페이지를 요청하였습니다</p>
                 <p class="text-gray-500 mb-0">존재하지 않는 주소를 입력하였거나, 요청한 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다</p>
                 <p class="text-gray-500 mb-0">고객센터를 통해 문의하세요</p> <br>
                 <a href="index.jsp" class="btn btn-secondary btn-icon-split">
                     <span class="text">메인</span>
                 </a>
                 &ensp; &ensp;
                 <a href="javascript:window.history.back();" class="btn btn-secondary btn-icon-split">
                     <span class="text">뒤로가기</span>
                 </a>
             </div>

         </div>
     

    </div>
    
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
	
	<jsp:include page = "../common/footer.jsp"/>
</body>

</html>