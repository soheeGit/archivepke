<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>기본 틀</title>
<link href="layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrap">
  <div id="page_header">
    <div class="logo"><a href="/termproject/main/main.jsp"><img src="image/logo.jpg" width="200" height="50" /></a></div>
    <div class="login"><a href="/termproject/login/login.jsp">로그인</a>/<a href="/termproject/join/join.jsp">회원가입</a></div>

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
  
  
  </div>
  <div id="top_btn"><a href="#"> <input class="top" type="image" value="" src="image/top.png"/></a></div>
  <div id="footer">
    <div class="footer"><img src="image/footer.png" width="436" height="137" /></div>
  </div>
</div>
</body>
</html>