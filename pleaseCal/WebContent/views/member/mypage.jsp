<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.uni.member.model.vo.*"%>
	<%
	 Member m = (Member)request.getAttribute("loginUser");
	 String username=m.getUserName();
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
	 background-color:white;
}
#memdel{
    height: 200px;
	width: 300px;
	 background-color:white;
}
#memup{
 height: 200px;
 width: 300px;
 background-color:white;
}

#mil {
	margin-top: 5%;
	width: 1400px;
}

h5 {
	display: inline;
}
#名前{
margin-top: 5%;
}
body{
background-image:url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150404_201%2Fbbilla_1428082120293qFxQp_JPEG%2F%25C7%25CF%25B3%25AA%25BE%25B2%25B9%25D9%25C5%25C1%25C8%25AD%25B8%25E9_05_1920x1080_20150402-01.jpg&type=a340')
}
</style>

<jsp:include page = "../common/menu.jsp"/>
<div id="名前">
	<strong><h3 style="display:inline">
			<%=username%>님의MyPage
			</h3></strong>
			</div>
			<input type="hidden" id = "originPwd" name = "originPwd" value = "<%=userPwd%>">
			
	<div id="mil">

		<strong><h5 style="margin-left: 250px">Milege</h5></strong> 
		<strong><h5	style="margin-left: 470px"><%=mileage%>원</h5></strong> 
		<strong><h5 style="margin-left: 100px">Coupon</h5></strong>
		<input type ="button" style="margin-left: 200px" value="조회" onClick="location.href='<%=request.getContextPath() %>/coupon.do'"></input>		
		<input type ="button"  value="쿠폰받기" onClick="location.href='<%=request.getContextPath() %>/howcoupon.do'"></input>		
		
	</div>
        <hr  style="border: solid 2px black;" >
       
	<div id="Members">
	<table>
	<tr>
	<td><button id="membut" type="button" ><h4>주문목록</h4><small>고객님의소중한상품을담고있어요(≧∇≦)/</small></button> </td>
	<td><button id="memup" style="margin-left: 200px;" onClick="memberupdate();"><h4>정보수정</h4><small>고객님의주소및비밀번호를변경할수있어요<br>ヾ(・ᆺ・✿)ﾉﾞ</small></button></td>
	<form id="memdelete">	
	<td><button id="memdel" style="margin-left: 200px;" onclick="deleteMember();"><h4>회원탈퇴</h4><small>정말로..탈퇴할건가요｡ﾟ( ﾟஇ‸இﾟ+)ﾟ｡</small></button>		</td>
	</form>	
		</tr>	
		</table>
		
	</div>
	<script>
	 function memberupdate(){
         location.href = "<%= request.getContextPath()%>/memberupdate.do"; 
                }     
	
	
	     function deleteMember(){
	    	  var  pwd = prompt("현재 비밀번호를 입력해주세요")
	    	  var op = $("#originPwd").val();
	    	  
	    	  if(op === pwd){
	    	  	    	  
	    	  var val = confirm("한번만 다시 생각하면 안될까요?˚‧º·(˚ ˃̣̣̥᷄⌓˂̣̣̥᷅ )‧º·˚");
	    	      	  
	    	  if(val){
	    		  alert("잘가요.( ˃̣̣̥᷄⌓˂̣̣̥᷅ )");
	    		  $("#memdelete").attr("action","<%=request.getContextPath()%>/deleteMember.do");
	    		  $("#memdelete").submit();	    		  
	    	  }else{
	    		  alert("취소했어요.ヾ(๑ㆁᗜㆁ๑)ﾉ”");
	    	  }
	      }
	      }
	     </script>

</body>
</html>