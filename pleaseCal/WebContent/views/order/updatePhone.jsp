<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form id="updateForm">
	
		<table>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td>전화번호(-포함)</td>	
					<td><input type="tel" maxlength="13" name="phone" placeholder="전화번호 입력해주세요(-입력)010-1234-5678" oninput="Hyphen(this)" required id="newPhone"></td>
					<td></td>
				<td>
					<button type="button" id="submit" name="submit" value="확인">확인</button>
				</td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
		</table>
	
	</form>
	
	<script>
	const Hyphen = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '') //전체에서  0~9사이에 아무 숫자 '하나'  찾음 
		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
		}
	
	$('#submit').click(function(){
		
		let phone = $('[name="phone"]').val();
		console.log(phone)
		
		if(phone == ""){
			
			alert("전화번호를 입력해주세요.");
			$('[name="phone"]').focus();
			return false;
			
		}else{
			
			opener.document.getElementById("buyerPhone").value = document.getElementById("newPhone").value
			// url 변경
			location.href="<%=request.getContextPath()%>/updatePhone.do?phone="+phone;
			// 부모창 새로고침
			opener.parent.location.reload();
			// 팝업 닫기
			window.close();
			
		}
		
		
		
		
	})
	
	
	</script>
	
</body>
</html>