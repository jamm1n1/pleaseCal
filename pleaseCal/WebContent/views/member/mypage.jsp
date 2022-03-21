<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.uni.member.model.vo.*"%>
	<%
	 Member m = (Member)request.getAttribute("loginUser");
	 String userPwd = m.getUserPwd();
	 int mileage = m.getMilege();
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>mypage</title>
<style>
#Members {
	margin-left: 12%;
	margin-top: 5%;
	height: 200px;
	width: 1500px;
}

#membut {
	height: 200px;
	width: 300px;
}
#memdel{
    height: 200px;
	width: 300px;
	
}

#mil {
	margin-top: 5%;
	width: 1400px;
}

h5 {
	display: inline;
}

</style>

<jsp:include page = "../common/menu.jsp"/>

	<strong><h4 style="display:inline">
			MyPage
			</h4></strong>
			<input type="hidden" id = "originPwd" name = "originPwd" value = "<%=userPwd%>">
			
	<div id="mil">

		<strong><h5 style="margin-left: 250px">Milege</h5></strong> 
		<strong><h5	style="margin-left: 470px"><%=mileage%>원</h5></strong> 
		<strong><h5 style="margin-left: 100px">Coupon</h5></strong>
		<input type ="button" style="margin-left: 200px" value="조회" onClick="location.href='<%=request.getContextPath() %>/coupon.do'"></input>		
		<input type ="button"  value="쿠폰받기" onClick="location.href='<%=request.getContextPath() %>/howcoupon.do'"></input>		
		
	</div>
        <hr  style="border: solid 2px black;" >
        <form id="updateForm" >
	<div id="Members">
		<input id="membut" type="button" value="주문 목록"></input> 
		<input id="membut" type="button" value="회원 정보변경" style="margin-left: 200px;" onClick="location.href='<%=request.getContextPath() %>/memberupdate.do'"></input>		
		<input id="memdel" type="button" value="회원 탈퇴" style="margin-left: 200px;" onclick="deleteMember()"  ></input>			
		</form>
	</div>
	<script>
	
	     function deleteMember(){
	    	  var  pwd = prompt("현재 비밀번호를 입력해주세요")
	    	  var op = $("#originPwd").val();
	    	  
	    	  if(op === pwd){
	    	  	    	  
	    	  var val = confirm("정말로 탈퇴 하시겠습니까 ");
	    	      	  
	    	  if(val){
	    		  $("#updateForm").attr("action","<%=request.getContextPath()%>/deleteMember.do");
	    		  $("#updateForm").submit();
	    	  }else{
	    		  alert("취소하였습니다.");
	    	  }
	      }
	      }
	     </script>

</body>
</html>