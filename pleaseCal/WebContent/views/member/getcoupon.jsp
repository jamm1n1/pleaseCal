<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.coupon.model.vo.*"%>
       <%
       ArrayList<Coupon> list = (ArrayList<Coupon>)request.getAttribute("list");

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background-image:url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMDVfMTA4%2FMDAxNTEyNDcxODEzNzM2.69xGdHcCqF7JqK6bxqvBjpS0_Fqa1IdpFw9i0yx0gmQg.j5bFkBxgrIbkb0eeQjovNDNXsNp_gSv1_b_eG2OCo_4g.JPEG.cfi%2F%25C4%25ED%25C6%25F9%25C0%25CC%25B9%25CC%25C1%25F6.jpg&type=sc960_832');
}
	.outer{
		width:800px;
		height:500px;
		color:blue;
		margin:auto;
		margin-top:50px;
	}
	.listArea{
		border:1px solid white;
		text-align:center;
	}
	#co1{
	margin-top:10%;
	margin-left:5%
	}
	#co2{
	margin-bottom:60%;
	margin-left:60%
	}
	#co3{
	margin-bottom:100%;
	margin-left:-150%
	
	}

</style>
</head>
<body>
<jsp:include page = "../common/menu.jsp"/>

<div class="outer">
		<br>
		
		<h1 align="center" style="color:yellow">쿠폰을가져라!</h1>
		<br>
		
		<table align="center">
		<tr>
		            <td width="70">쿠폰번호</td>				
						
		</tr>
		<tr>
		<form action="<%=request.getContextPath()%>/get.do" method="post">
		<td><input type="number" id="cid" name="cid"></input></td>
					
					<td><button onclick="get()">내려받기</button></td>
					
						</form>
        </tr>
        </table>
      
		<div id="co1">
		<h2>1번</h2>
		<img src="data:image/png;base64,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" >
			<div id="co2">
		<h2>2번</h2>
			<img src=https://www.cjthemarket.com/cjom/web/images/contents/benefit/welcome_coupon_02.jpg>	
					
			</div>			
			</div>
	
			
		
			
				
			
	
			
		
   
	</div>
	<script>
	
	 function get(){
		 
		 if($("#cid").val() == 1 || $("#cid").val() == 2){
 
	        window.alert("쿠폰받기 성공 ⸜(*'꒳'* )⸝");
	        }else{
	        	  window.alert("없는쿠폰이에요!");
	        	}		  
	        }
	     
	
	</script>
</body>
</html>