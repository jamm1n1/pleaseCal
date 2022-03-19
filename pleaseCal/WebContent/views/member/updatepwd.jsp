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
#pwd{
margin-top:70px;
}


</style>
</head>
<body>
<jsp:include page = "../common/menu.jsp"/>

 <div id="update" align="center">
<table>
<tr>
 <input id ="pwupdate"  type="button" value="비밀번호 변경" style="background-color: aqua;"></input>
 <input id ="updateadrress"  type="button" value="주소 변경" onClick="location.href='<%=request.getContextPath() %>/updateaddress.do'"></input>
 </tr>
 </table>
 <form id="updatePwdForm" action="<%= request.getContextPath() %>/updatePwdMember.do" method="post">
		<table id="pwd">
			<tr>
				<td><label>현재 비밀번호</label>
				<th><input type="password" name="userPwd" id="userPwd" ></th>
			</tr>
			<tr>
				<td><label>변경할 비밀번호</label></td>
				<th><input type="password" name="newPwd" ></th>
			</tr>
			<tr>
				<td><label>변경할 비밀번호 확인</label></td>
				<th><input type="password" name="checkPwd" ></th>
			</tr>
		</table>
		
		<br>
		<br>
		
		<div class="btns" align="center">
			<button  type="button" onclick="fnCheckPwd()">변경하기</button>
		</div>
	</form>
	<script>
		function fnCheckPwd(){
			var userPwd = $("#userPwd");
			var newPwd = $("input[name='newPwd']");
			var checkPwd = $("input[name='checkPwd']");
			
			if(userPwd.val().trim() === "" || newPwd.val().trim() === "" || checkPwd.val().trim() === ""){
				alert("비밀번호를 입력하세요")
				return false;
			}
			
			if(newPwd.val() != checkPwd.val()){
				alert("비밀번호가 다릅니다.")
				checkPwd.val('');
				checkPwd.focus();
				return false;
				
			}
			
			$("#updatePwdForm").submit();
		}
	</script>
 </div>


</body>
</html>