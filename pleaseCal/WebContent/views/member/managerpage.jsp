<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>mypage</title>
 <style>
 body{
background-image:url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150404_201%2Fbbilla_1428082120293qFxQp_JPEG%2F%25C7%25CF%25B3%25AA%25BE%25B2%25B9%25D9%25C5%25C1%25C8%25AD%25B8%25E9_05_1920x1080_20150402-01.jpg&type=a340')
}
 #Members{
     margin-left: 20%;
    margin-top: 5%;
    height:300px;
    width:1200px;
 }

 
 #membut{
 
   height:200px;
    width:300px;
    background-color:white;
 }
 #名前{
  margin-top: 10%;
 }
 </style>

<jsp:include page = "../common/menu.jsp"/>
   <div id="名前">
   <strong><h4>managerPage</h4></strong>
   </div>
   <div id="Members">
   <button id="membut" type="button"   onClick="checkmem();">
    <h4>회원 목록</h4><small>쇼핑몰을 이용하는 고객들의정보가있어요<br>୧(๑•̀ᗝ•́)૭</small>
   </button>
     
    <button id="membut" type="button"  style="margin-left: 400px;" onClick="product_IO();">
    <h4>상품 관리</h4><small>쇼핑몰의 상풀을 입고및출고할 수 있어요<br>＼(╹◡╹＼Ξ／╹◡╹)／</small>
    </button>
    
   </div>
   <script>
   function checkmem(){
       location.href = "<%= request.getContextPath()%>/MemberCheck.do"; 
              }    
   function product_IO(){
       location.href = "<%= request.getContextPath()%>/Product_IO.do"; 
              }    
   
   </script>
</body>
</html>