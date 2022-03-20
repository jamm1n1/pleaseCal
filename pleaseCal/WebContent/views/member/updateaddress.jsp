<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.member.model.vo.*"%>
    <%
	 Member m = (Member)request.getAttribute("loginUser");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>

#update{
	    width:600px;
		height:300px;
	    border: 2px solid black;
		margin:auto;
		margin-top:50px;

}


#pwupdate{
width: 50%;
hieght:20%;
}
#updateadrress{
width: 50%;
hieght:20%;
}
#adrupdate{
margin-top:100px;
}


</style>
</head>
<body>
<jsp:include page = "../common/menu.jsp"/>

 <div id="update" align="center">
<table>
<tr>
 <input id ="pwupdate"  type="button" value="비밀번호 변경"  onClick="location.href='<%=request.getContextPath() %>/memberupdate.do'"></input>
 <input id ="updateadrress" type="button" value="주소 변경" onclick="address()"  style="background-color: aqua;"></input>
 </tr>
 </table>
  <form id="updatePwdForm" action="<%= request.getContextPath() %>/addressupdate.do" method="post">
		
			<div id="adrupdate" width="500px">
				<input type="text" name="newaddress" id="newaddress" width="300px">	
				<input type="button" id="waddress" value ="주소입력" width="30px"></input>
				<br><br>		
			<button>변경하기</button>
			</div>
			
	
		<br>
		<br>
	
			
		
		</table>
	</form>
 </div>
<script>
	   window.onload = function(){
    document.getElementById("waddress").addEventListener("click", function(){ 
       new daum.Postcode({
       oncomplete: function(data) { //선택시 입력값 세팅
           document.getElementById("newaddress").value = data.address; // 주소 넣기        
       }
   }).open();
});
}
</script>

</body>
</html>