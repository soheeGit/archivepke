<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link href="layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrap">
  <div id="page_header">
    <div class="logo"><a href="#"><img src="image/logo.jpg" width="200" height="50" /></a></div>
    <div class="login"><%= session.getAttribute("mId") %>님 &gt;<a href="/termproject/login/logoutAction.jsp">로그아웃&nbsp;</a><a href="/termproject/cControl"><input type="image" name="cart1" src="image/cart1.jpg" width="20" height="20"/></a></div>
  </div>
  <div class="menu_bar">
    <ul id="MenuBar1" class="MenuBarHorizontal">
   	  <li><a href="/termproject/pControl?action=listMember">All products</a></li>
    </ul>
  </div>
  <div id="main">
  	<a href="#"><img src="image/main.jpg" width="1200" height="787" /></a>
  </div>
  <div id="new">
  	<div class="more">
  	  <div class="product_type">board</div>
  	  <div class="more_link"><a href="/termproject/bbs/bbs_member.jsp">&gt;&gt; 더보기</a></div>
    </div>
  </div>
   <div id="top_btn"><a href="#"><input class="top" type="image" value="" src="image/top.png"/></a></div>
  <div id="footer">
    <div class="footer"><img src="image/footer.png" width="436" height="137" /></div>
  </div>
</div>
</body>
</html>