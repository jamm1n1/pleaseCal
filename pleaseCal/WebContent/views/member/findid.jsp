<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#check{
	    width:600px;
		height:300px;
	    border: 2px solid black;
		margin:auto;
		margin-top:15%;

}
#checkid{
width: 50%;
hieght:20%;

}
#checkpwd{
width: 50%;
hieght:20%;
}
body{
background-image:url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150404_201%2Fbbilla_1428082120293qFxQp_JPEG%2F%25C7%25CF%25B3%25AA%25BE%25B2%25B9%25D9%25C5%25C1%25C8%25AD%25B8%25E9_05_1920x1080_20150402-01.jpg&type=a340')
}
#go{
margin-top : 20%
}

</style>
</head>
<body>

<jsp:include page = "../common/menu.jsp"/>




 <div id="check" align="center">
<table>
<tr>
 <input id ="checkid"  type="button" value="아이디 찾기" style="background-color: aqua;"></input>
 <input id ="checkpwd"  type="button" value="비밀번호 찾기" onClick="location.href='<%=request.getContextPath() %>/findpwd.do'" ></input>
 </tr>
 </table>
 <form id="checkid" action="<%= request.getContextPath() %>/findcheckid.do" method="post" >
		<table id="go">
			<tr>
				<td><label>이름</label>
				<th><input type="name" name="name" id="name" ></th>
			</tr>
						
			<tr>
				<td width="50px"><label>전화 번호</label></td>
				<th><input id="tel" type="tel" name="tel" oninput="Hyphen(this)" id="tel"></th>
			</tr>
			
		</table>
		
		<br>
		<br>
		
		<div class="btns" align="center">
			<button  type="submit" onclick="check();">찾기</button>
		</div>
	</form>



<script>
const Hyphen = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '') //전체에서  0~9사이에 아무 숫자 '하나'  찾음 
		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
		}
		
function check(){
	if($("#name").val() == null || $("#tel").val() == null){
		window.alert("다 작성해야해요");
	}
	
}
	</script>

</body>
</html>