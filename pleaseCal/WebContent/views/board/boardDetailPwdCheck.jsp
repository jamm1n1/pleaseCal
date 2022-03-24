<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>게시글 비밀번호 확인</title>
</head>
<body>

	<form>
	
		<%-- 게시글 번호 히든으로 넘기기 - 해당 게시글 번호의 비밀번호 확인하기 위해 하기 위해 --%>
		<input type="hidden" name="bno" value="${b.boardNo}">
		
		<table>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td> 비밀번호 입력 </td>
				<td>
					<input type="text" id="pwd" name="pwd" autofocus>
					<button type="submit" id="submit" name="submit" value="확인">확인</button>
				</td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
		</table>
	
	</form>
	
	<script>
		// 확인 버튼 클릭 시
		$("#submit").click(function() {
			// 입력한 비밀번호와 해당 게시글 비밀번호를 변수에 담아서
			let input = $("#pwd").val().trim();
			let pwd = ${b.boardPwd};
			
			// 입력창 비워진 채로 확인 버튼 클릭 시
			if(input == null) {
				alert("비밀번호를 입력해주세요.");
				$("#pwd").focus();
				return false;
			}
			
			// 둘이 일치하지 않으면
			if(input != null && input != pwd) {
				// 알림 띄우기
				alert("비밀번호가 일치하지 않습니다.");
				$("#pwd").focus();
				return false;
			
			// 일치하는 경우
			} else {
				// 부모 페이지를 해당 게시글 상세 페이지로 전환하고
				opener.location.href="<%=request.getContextPath()%>/boardDetail.do?bno=${b.boardNo}";
				// 팝업창 닫기
				close();
			}
			
		})
		
	</script>
	
</body>
</html>