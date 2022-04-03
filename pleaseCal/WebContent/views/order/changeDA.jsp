<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
</head>
<body>
<script>
	
	window.onload = function(){
		// Daum 주소API 실행함수 수정 버튼 클릭시 이벤트 발생
	    document.getElementById("waddress").addEventListener("click", function(){ 
	       new daum.Postcode({
	       oncomplete: function(data) { //선택시 입력값 세팅
	           document.getElementById("address").value = data.address; // 주소 넣기        
	       }
	   }).open();
	});
	}
	// 전화번호 입력시 중간에 '-'를 넣어주는 함수
	const Hyphen = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '') //전체에서  0~9사이에 아무 숫자 '하나'  찾음 
		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
		}

	
	function insert(){
		// opener : 부모창, 부모창의 아이디값의 value에 현제(자식) 페이지 의 아이디의 value값을 넣어줌
		opener.document.getElementById("userName").value = document.getElementById("name").value
		opener.document.getElementById("userAddress").value = document.getElementById("address").value
		opener.document.getElementById("userPhone").value = document.getElementById("phone").value
				
		// 팝업 닫기
		window.close();
		
		
	}
</script>


	<table align="center" width="750px">
				
		<tr>	
		<td>이름</td>			
			<td><input type="text"  name="userName" placeholder="이름을 입력하세요" required id="name"></td>
			<td></td>
		</tr>
		
		<tr>
			<td>주소</td>	
			<td><input type="text" name="address" id="address" placeholder="주소를 입력하세요" required></td>
			<td><input type="button" id="waddress" value ="주소입력!" ></input></td>

		</tr>
		<tr>
			<td>전화번호(-포함)</td>	
			<td><input type="tel" maxlength="13" name="phone" placeholder="전화번호 입력해주세요(-입력)010-1234-5678" oninput="Hyphen(this)" required id="phone"></td>
			<td></td>
		</tr>	
		
	</table>
	<br>
	<div class="btns" align="center">				
		<button type="button" id="joinBtn" onclick="insert()">수정하기</button>
	</div>
	
	

</body>
</html>