<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="/termproject/css/bootstrap.css">
<link href="layout.css" rel="stylesheet" type="text/css" />
<title>로그인</title>
</head>
<body>
<div id="wrap">
  <div id="page_header">
    <div class="logo"><a href="/termproject/main/main.jsp"><img src="image/logo.jpg" width="200" height="50" /></a></div>
    <div class="login"><a href="/termproject/join/join.jsp">회원가입</a></div>

  </div>
  <div class="menu_bar">
    <ul id="MenuBar1" class="MenuBarHorizontal">
   	  <li><a href="/termproject/pControl?action=list">All products</a></li>
    </ul>
  </div>
	<div id="head_image">
	<img src="/termproject/product/image/archivepke8_02.png" width="1200" height="240" />
	</div>
  <div id="main">
  <div class="container">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron " style="padding-top:20px;">
            <form method="post" action="loginAction.jsp">
               <h3 style="text-align:center;">로그인화면</h3>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="아이디" name="mId" maxlength="20">
               </div>
               <div class="form-group">
                  <input type="password" class="form-control" placeholder="비밀번호" name="mPassword" maxlength="20">
               </div>   
               <input type="submit" class="btn btn-primary form-control" value="로그인">
            </form>
      </div>
      <div class="col-lg-4"></div>
      
   </div>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="/termproject/js/bootstrap.js"></script>

  </div>
  <div id="top_btn"><a href="#"> <input class="top" type="image" value="" src="image/top.png"/></a></div>
  <div id="footer">
    <div class="footer"><img src="image/footer.png" width="436" height="137" /></div>
  </div>
</div>
</div>
</body>
</html>