<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
    table, th, td{
        text-align: center;
        vertical-align: middle;
    }
    th,td{
    	padding:13px;
    }
    tr>td {
    	width:20%;
    }
    .form-select {
    	width:100px;
    }
</style>
</head>
<body>

	<jsp:include page = "../common/menu.jsp"/>
	
	<section class="py-5">
	<br>
	<div class="container px-4 px-lg-5 my-5">
    	<div class="row gx-4 gx-lg-5 align-items-center">
    		<form id ="productinsert" action="<%=request.getContextPath()%>/productInsert.do" method="post" enctype="multipart/form-data">
		    <table class="table table-bordered">
		        <thead>
		        <tr>
		            <td colspan="5">
		              <h4>신규상품등록</h4>
		            </td>
		        </tr>
		        </thead>
		        <tbody>
			        <tr>
			            <td rowspan="11" colspan="3"><div id="imgThum" style="width:700px"></div></td>
			        </tr>
			        <tr>
			            <td>상품번호</td>
			            <td><input type="text" id="pId" name="pId" value="${pId}" readonly> </td>
			        </tr>
			        <tr>
			            <td>상품이름</td>
			            <td><input type="text" id="pName" name="pName"> </td>
			        </tr>
			        <tr>
			            <td>상품가격</td>
			            <td><input type="text" id="pPrice" name="pPrice"> </td>
			        </tr>
			        <tr>
			            <td>개당용량(g)</td>
			            <td><input type="text" id="pQ" name="pQ"> </td>
			        </tr>
			        <tr>
			            <td>카테고리</td>
			            <td>
			                <div class="form-group">
			                    <select class="form-select" id="exampleSelect1" name="category">
			                      <option value=2>단백질파우더</option>
			                      <option value=1>닭가슴살</option>
			                      <option value=3>도시락</option>
			                    </select>
			                 </div>
			            </td>
			        </tr>
			        
			        <tr>
			        	<td>칼로리</td>
			        	<td><input type="text" id="cal" name="cal"></td>
			        </tr>
			        <tr>
			        	<td>탄수화물</td>
			        	<td><input type="text" id="car" name="car"></td>
			        </tr>
			        <tr>
			        	<td>단백질</td>
			        	<td><input type="text" id="pro" name="pro"></td>
			        </tr>
			        <tr>
			        	<td>지방</td>
			        	<td><input type="text" id="fat" name="fat"></td>
			        </tr>
			        <tr>
			        	<td>나트륨</td>
			        	<td><input type="text" id="nat" name="nat"></td>
			        </tr>
			        <tr>
			        	<td colspan="3" style="width:40%">
			                <input class="form-control" type="file" id="file" name="file" onchange="setThum(event)">
			            </td>
			        	<td>입고량</td>
			        	<td><input type="text" id="count" name="count"></td>
			        </tr>
			        <tr>
			            <td colspan="5"><button type="button" id="save" class="btn btn-outline-dark btn-lg">등록하기</button></td>
			        </tr>
		       </tbody>
		    </table>
		    </form>
		 </div>
	</div>
	</section>
    <script>
    
    	$("#save").click(function(){
    		
    		if($("#imgThum").html() == "" || $("#imgThum").html() == "" || $("#pId").val() == "" || $("#pName").val() == "" || 
    				$("#pPrice").val() =="" || $("#pQ").val() =="" || $("#cal").val() =="" || $("#car").val() =="" || $("#pro").val() =="" ||
    				$("#fat").val() =="" || $("#nat").val() =="" || $("#count").val() == "") {
    			alert("모든 값을 입력하세요")
    			
    		} else {
    			$("#productinsert").submit();
    		}
 
    		
    	})
    	
        function setThum(event) { //파일이 첨부되면

            let reader = new FileReader(); // File API 비동기적 파일의 내용을 읽어옴

            reader.onload = function(event) {  // 파일 읽기 완료시
                let img = document.createElement("img"); 
                img.setAttribute("src", event.target.result); // 파일경로를 src 속성에 추가
                img.style.width = "600px";
                img.style.height = "600px";
                $("#imgThum").append(img); 
            }; 
            
            reader.readAsDataURL(event.target.files[0]); // 바이너리 파일을 Base64 Encode 문자열로 반환
        }
    </script>
    
    <jsp:include page = "../common/footer.jsp"/>
</body>
</html>
