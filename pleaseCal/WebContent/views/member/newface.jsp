<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
input{
width:500px;
height:50px;
}
#waddress{
width:70px;
height:50px;
}
body{
background-image:url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150404_201%2Fbbilla_1428082120293qFxQp_JPEG%2F%25C7%25CF%25B3%25AA%25BE%25B2%25B9%25D9%25C5%25C1%25C8%25AD%25B8%25E9_05_1920x1080_20150402-01.jpg&type=a340')
}
#joinBtn{
width: 120px;
background-color : #64FE2E;
color : blue;
}
</style>

<body>

<div class="outer">
		<br>
		
		<h2 align="center">계정만들기</h2>
		
		<form id="enrollForm" action="<%=request.getContextPath() %>/insertMember.do" method="post" onsubmit="return joinValidate();">
			<table align="center" width="750px">
				<tr>	
				<td>아이디</td>			
					<td><input type="text"  name="userId"  placeholder="아이디를 입력하세요" width="300px" required></td>
					<td>
						<button type="button" id="idCheckBtn" onclick="checkId();">아이디중복체크</button>
					</td>
						
					</td>
				</tr>
				<tr>	
				<td>비밀번호</td>					
					<td><input type="password"  name="userPwd" placeholder="비밀번호를 입력하세요" required></td>
					<td></td>
				</tr>
				<tr>	
				<td>비밀번호 확인</td>				
					<td><input type="password"  name="checkPwd" placeholder="비밀번호 확인!" required></td>
					<td><label id = "pwdResult"></label></td>
				</tr>	
				<tr>	
				<td>이름</td>			
					<td><input type="text"  name="userName" placeholder="이름을 입력하세요" required></td>
					<td></td>
				</tr>
				
				<tr>
					<td>주소</td>	
					<td><input type="text" name="address" id="address" placeholder="주소를 입력하세요" required></td>
					<td><input type="button" id="waddress" value ="주소입력!" ></input></td>
		
				</tr>
				<tr>
					<td>전화번호(-포함)</td>	
					<td><input type="tel" maxlength="13" name="phone" placeholder="전화번호 입력해주세요(-입력)010-1234-5678" oninput="Hyphen(this)" required></td>
					<td></td>
				</tr>	
				
			</table>
			<br>
			<div class="btns" align="center">				
				<button type="submit" id="joinBtn" onclick="insert()" hidden >가입하기</button>
			
				
			</div>
		</form>
	
	</div>
	<script>
	//키발급 필요없음,사용량 제한없음,상업적으로 써도 상관없음 
	   window.onload = function(){
    document.getElementById("waddress").addEventListener("click", function(){ 
       new daum.Postcode({
       oncomplete: function(data) { 
           document.getElementById("address").value = data.address; //선택 주소 넣기        
       }
   }).open();
});
}
	
	   function joinValidate(){
			
	
		if($("#enrollForm input[name=userPwd]").val() != $("#enrollForm input[name=checkPwd]").val()){
			$("#pwdResult").text("비밀번호가달라요").css("color", "red");
			return false;		
		}
		
				
		window.alert("회원가입 성공 환영해요(ノ・∀・)ノ");
		 return true;
		
		
	}
	function checkId(){
		var userId = $("#newFace input[name=userId]");
		
		if(userId.val() ==""){
			alert("아이디를 입력해주세요")
			return false;
		}
		
		$.ajax({
			url:"idCheck.do",
			type:"post",
			data:{userId:userId.val()},
			success:function(result){
				if(result =="fail"){
					alert("사용불가한 아이디입니다.");
					userId.focus();
					
				}else{
					if(confirm("사용가능한 아이디입니다.")){
						userId.attr("readonly","true");
						$("#joinBtn").removeAttr("hidden");
					}else{
						userId.focus();
					}
				}
			},
			error:function(){
				console.log("서버통신실패")
			}
		});
		
	}

	
	const Hyphen = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '') //숫자가아니면 안됨 
		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, ""); //3~4~4면 3-4-4로되게 //
		}
	</script>
<script>


</script>


</body>
</html>