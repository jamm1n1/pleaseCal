<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String tag = (String)request.getAttribute("tag"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<style>
body {
  padding-bottom: 30px;
}
</style>
</head>
<body>
	<jsp:include page = "../common/menu.jsp"/>
	
	<section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
			<h2></h2>
			<form id="enrollForm" name = "enrollForm" action ="<%=request.getContextPath()%>/reviewInsert.do" method="post" >
				<div class="mb-3">
					<input type="hidden" class="form-control" name="ono" id="ono" >
					<input type="hidden" class="form-control" name="pno" id="pno">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" placeholder="후기제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="후기내용을 입력해 주세요" ></textarea>
				</div>
			</form>

			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="check">값확인</button>
			</div>

		</div>

	</section>
	
	<script>
	
		$(function(){
			
   			let tag = "<%=tag%>";
   			console.log(tag)
			if(tag == "Y") {
				
				window.close();
				
			} else {
	   			
	 			let ono = opener.$("#pidhidden").val();
	 			$("#ono").val(ono)
	 			let pno = opener.$("#pidhidden").val();
	 			$("#pno").val(pno) 
	 			console.log($("#ono").val())
	   			console.log($("#pno").val())
				
			}
			
		})

		
		$("#check").click(function(){
			
			console.log(document.getElementById("ono").value);
			console.log(document.getElementById("pno").value);
		})
	
		
		$("#btnSave").click(function(){
			
			if(confirm("후기를 등록 하시겠습니까?")) {
				
				$("#enrollForm").submit();
		
			}
		})
			 
		
	
	</script>
	<jsp:include page = "../common/footer.jsp"/>
</body>

</html>