<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.uni.member.model.vo.Member" %>
    <%
    Member loginUser = (Member)session.getAttribute("loginUser");
     
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   
    
    <link rel="stylesheet" href="../resource/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    .login {
        min-height: 100vh;
      }
      
      .bg-image {
        background-image: url('https://contents.lotteon.com/itemimage/LO/10/23/17/05/83/_1/02/31/70/58/4/LO1023170583_1023170584_1.jpg');
        background-size: cover;
        background-position: center;
      }
      
      .login-heading {
        font-weight: 300;
      }
      
      .btn-login {
        font-size: 0.9rem;
        letter-spacing: 0.05rem;
        padding: 0.75rem 1rem;
      }
      .btn-insert {
        font-size: 0.9rem;
        letter-spacing: 0.05rem;
        padding: 0.3rem 0.5rem;
      }
  ul{
   list-style:none;
   }
   #kakao{
   margin-left: 28%;
   }
    </style>
</head>
<body>
    

    <div class="container-fluid ps-md-0">
        <div class="row g-0">
          <div class="d-none d-sm-flex col-sm-5 col-sm-5 bg-image"></div>
          <div class="col-md-8 col-lg-6">
            <div class="login d-flex align-items-center py-5">
              <div class="container">
                <div class="row">
                  <div class="col-md-9 col-lg-8 mx-auto">
                    <h3 class="login-heading mb-4">어서와요!</h3>
      
                    <!-- Sign In Form -->
                      <form id = "loginForm" action="<%=request.getContextPath()%>/loginMember.do" method="post" onsubmit="return loginValidate();">
                      <div class="form-floating mb-3">
                     
                        <input type="id" class="form-control" id="userId" placeholder="아이디를 입력하세요" name="userId" autofocus>
                        
                      </div>
                      <div class="form-floating mb-3">
                      
                        <input type="password" class="form-control" id="userPwd" placeholder="비밀번호를 입력하세요" name="userPwd">
                        
                      </div>
      
                      <div class="form-check mb-3">
                      
                      </div>
      
                      <div class="d-grid">
                        <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2" type="submit" width="40%">Sign in</button>
                    </div>
                        </form>
                        
                       
                        <div class="text-center">
                        <button class="btn btn-lg btn-primary btn-insert text-uppercase fw-bold mb-1" type="submit" width="40%" onclick="findid();">아이디및비밀번호 찾기</button>                   
                          <button class="btn btn-lg btn-primary btn-insert text-uppercase fw-bold mb-1" id = "enrollBtn" type="button" onclick="enrollPage();">회원가입</button>
                          <script>
                           function enrollPage(){
    	                    location.href = "<%= request.getContextPath()%>/newfacego.do"; 
                                   }                      
                           function findid(){
                               location.href = "<%= request.getContextPath()%>/findid"; 
                                      }
                         
                           
                          </script>
                        </div>
                     
                      </div>
  <div id="kakao">      
   <ul>
 
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
         <img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:60px;,width:60px;">
      </a>
	</li>
 

	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>.</span>
      </a>
	</li>
</ul>
</div>
<script>
function login(){
	 location.href = "<%= request.getContextPath()%>/LoginPage.do"; 
}

Kakao.init('41b691f572c4e925ecf7ab3d3c7a8b8f');
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (res) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (res) {       	  
        	  $.ajax({
                  url:"<%=request.getContextPath()%>/main.do",
                  data:{"id":res.id, "name":JSON.stringify(res.properties.nickname)}, //JSON.stringify문자열로 반환
                  Type:"post",
                  success:function(data){
                      //성공적으로 하고나면 이동할 url
                      location.href="<%=request.getContextPath()%>";
                  }
                  
               });			 
        		
        	 
          },
        
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

</body>
</html>