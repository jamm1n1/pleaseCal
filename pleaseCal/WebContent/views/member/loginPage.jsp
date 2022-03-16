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
                     
                        <input type="id" class="form-control" id="userId" placeholder="아이디를 입력하세요" name="userId">
                        
                      </div>
                      <div class="form-floating mb-3">
                      
                        <input type="password" class="form-control" id="userPwd" placeholder="비밀번호를 입력하세요" name="userPwd">
                        
                      </div>
      
                      <div class="form-check mb-3">
                      
                      </div>
      
                      <div class="d-grid">
                        <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2" type="submit" width="40%">Sign in</button>
                        </form>
                        <div class="text-center">
                          <a class="small" href="#">회원 가입</a>
                        </div>
                      </div>
      
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

</body>
</html>