<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
	font-family: SF Pro KR, SF Pro Display, SF Pro Icons, AOS Icons, Apple Gothic, HY Gulim, MalgunGothic, HY Dotum, Lexi Gulim, Helvetica Neue, Helvetica, Arial, sans-serif;
	.layerPopup img {
		margin-bottom:20px;
	}
	
	.layerPopup:before {
		display:block;
		content:"";
		position:fixed;
		left:0;
		top:0;
		width:100%;
		height:100%;
		background:rgba(0,0,0,.5);
		z-index:9000
	}
	
	.layerPopup .layerBox {
		z-index:10000;   
		position:fixed;
		left:85%;
		top:48%;
		transform:translate(-50%, -50%);
		padding:30px;
		background:#fff;
		border-radius:6px;
	}
	
	.layerPopup .layerBox .title {
		margin-bottom:10px;
		padding-bottom:10px;
		font-weight:600;
		border-bottom:1px solid #d9d9d9;
	}
	
	.layerPopup .layerBox .btnTodayHide {
		font-size:14px;
		font-weight:600;
		color:black; 
		float:left;
		text-decoration:none;
		width:150px; 
		height:30px;
		line-height:30px;
		border:black solid 1px;
		text-align:center;
		text-decoration:none;
	}
	
	.layerPopup div {
		display: nline;
	}
	
	.layerPopup form {
		margin-top:5px;
		font-size:16px; font-weight:600;
		weight:100%;
		height:30px;
		line-height:30px
	}
	
	.layerPopup #close {
		font-size:16px;
		font-weight:600;
		width:40px;
		height:30px;
		color:black;
		float:right;
		line-height:30px;
		text-align:center;
		text-decoration:underline;
	}
	
	.layerPopup a {
		text-decoration:none;
		color:black;
		width:50px;
		height:40px;
	}
</style>

<script>
	// 24시간 기준 쿠키 설정 함수
	function setCookie( name, value, expiredays ) {
		// 오늘 날짜 담기
		var todayDate = new Date();
		// set 으로 쿠키 소멸 날짜 설정 (+1 하루)
		todayDate.setDate( todayDate.getDate() + expiredays ); 
		// 쿠키 설정
		// todayDate.toGMTString() : UTC 기준의 시간에 expiredays 라는 매개변수로 받은 값에 의해 쿠키 설정
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	
	// 팝업 닫기
	function closePop() {
		// 오늘 하루 안 보기 체크되어 있으면
        if ( document.pop_form.chkbox.checked ) {
            // setCookie() 함수로 매개변수 던져서 실행
            // 쿠키 이름, 값, 기간(1은 하루, 7은 일주일)
        	setCookie( "maindiv", "done" , 1 );
        }
		// 팝업 사라지도록
        document.all['layer_popup'].style.visibility = "hidden";
    }

</script>


</head>
<body>

	<!-- layer popup content -->
	<div class="layerPopup" id="layer_popup" style="visibility: visible;">
    	<div class="layerBox">
        	<h4 class="title">공지사항</h4>
        	<div class="cont">
            	<p>
            		<%-- index에서 include하기 때문에 index에서의 경로를 가져와야 함 --%>
            		<%-- 홈에서부터 시작하는 경로 넣기 --%>
					<img src="<%=request.getContextPath()%>/resources/image/popup.jpg" width=350 height=500 usemap="#popup" alt="event page">
            	</p>
        	</div>
          	<form name="pop_form">
	        	<div id="check" >
	        		<input type="checkbox" name="chkbox" value="checkbox" id='chkbox' >
	        		<label for="chkbox">오늘 하루동안 보지 않기</label>
	       		</div>
	       		<%-- 닫기 클릭 시 closePop() 함수 실행 --%>
				<div id="close" ><a href="javascript:closePop();">닫기</a></div>    
			</form>
		</div>
	</div>
	
	<script>
		
		// 쿠키 가져와서 담기
		cookiedata = document.cookie;   
		// 쿠키 없으면 팝업 띄우도록
	    if ( cookiedata.indexOf("maindiv=done") < 0 ) {     
	        document.all['layer_popup'].style.visibility = "visible";
	    // 쿠키 있으면 팝업 안 띄워지게 스타일 숨기기
	    } else {
	        document.all['layer_popup'].style.visibility = "hidden";
	    }
	
	</script>
	
	
</body>
</html>