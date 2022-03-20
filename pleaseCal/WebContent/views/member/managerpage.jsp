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
 
 #Members{
     margin-left: 20%;
    margin-top: 5%;
    height:300px;
    width:1200px;
 }

 
 #membut{
 
   height:200px;
    width:300px;
 }
 
 </style>

<jsp:include page = "../common/menu.jsp"/>
   
   <strong><h4>managerPage</h4></strong>
   <form>
   <div id="Members">
   <input id="membut" type="button" value="회원 목록"  onClick="location.href='<%=request.getContextPath() %>/MemberCheck.do'"></input>
     
    <input id="membut" type="button" value="상품 관리" style="margin-left: 400px;" onClick="location.href='<%=request.getContextPath() %>/Product_IO.do'">
    
    </input>
    </form>
   </div>
</body>
</html>