<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
​<%@ page import="java.util.*" %>
<%@page import="cart.CartDAO" %>
<%@page import="cart.Cart" %>
<%@ page import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="/termproject/css/bootstrap.css">
<link href="layout.css" rel="stylesheet" type="text/css" />
<title>장바구니</title>
</head>
<body>
<div id="wrap">
  <div id="page_header">
    <div class="logo"><a href="/termproject/main/main_member.jsp"><img src="/termproject/cart/image/logo.jpg" width="200" height="50" /></a></div>
    <div class="login"><%= session.getAttribute("mId") %>님 &gt;<a href="/termproject/login/logoutAction.jsp">로그아웃</a></div>

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
  <div class="txttitle">
  <h2><%= session.getAttribute("mId")%>님의 장바구니</h2>
  </div>
   <div class="container">
   <div class="row">
   
   
   <table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
    <thead>
    <tr>
        <th style="background-color: #eeeeee; text-align:center;">번호</th>
        <th style="background-color: #eeeeee; text-align:center;">상품명</th>
        <th style="background-color: #eeeeee; text-align:center;">담은시간</th>
    </tr>
    </thead>
    <c:forEach items="${carts}" var="c">
    <tbody>
    <tr>
      <td>${c.cId }</td>
      <td>${c.pName}</td>
      <td>${c.cDate }</td>
    </tr>
    </tbody>
    </c:forEach>
    </table>
   </div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="/termproject/js/bootstrap.js"></script>
  </div>
  <div id="top_btn"><a href="#"> <input class="top" type="image" value="" src="/termproject/cart/image/top.png"/></a></div>
  <div id="footer">
    <div class="footer"><img src="/termproject/cart/image/footer.png" width="436" height="137" /></div>
  </div>
</div>
</div>
</body>
</html>