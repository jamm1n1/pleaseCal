<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.member.model.vo.*"%>
    <% Member loginUser = (Member)request.getAttribute("loginUser"); %>
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
#user{
margin-top:20%;
}
body{
background-image:url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150404_201%2Fbbilla_1428082120293qFxQp_JPEG%2F%25C7%25CF%25B3%25AA%25BE%25B2%25B9%25D9%25C5%25C1%25C8%25AD%25B8%25E9_05_1920x1080_20150402-01.jpg&type=a340')
}
</style>
</head>
<body>

</head>
<body>

<jsp:include page = "../common/menu.jsp"/>

<div id="check" align="center">

<h3 id="user">회원님의 아이디는 "<%=loginUser.getUserId() %>" 입니다. d(*ゝωб*)</h3>

<button onClick="home();">돌아가기</button>
		</div>
<script>
function home(){
        location.href = "<%= request.getContextPath()%>/LoginPage.do"; 
               }   

</script>
</body>
</html>