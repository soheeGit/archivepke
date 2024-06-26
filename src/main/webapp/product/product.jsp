<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>상품목록</title>
<link href="/termproject/product/layout.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="wrap">
  <div id="page_header">
    <div class="logo"><a href="/termproject/main/main.jsp"><img src="/termproject/product/image/logo.jpg" width="200" height="50" /></a></div>
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
  
 <c:forEach items="${products}" var="product" >
  <form action="productDetail.jsp" name="frm"> <!-- 아이템디테일에 정보보냄 -->
    <div class="product">
      <div class="productpic"><a href="/termproject/pdControl?action=nm&pId=${product.pId}"><img src="/termproject/product${ product.pImage }" width="230" height="300" /></div>
      <span class="price"><p>${ product.pName }&nbsp;&nbsp;${ product.price }원</p></a></span>
    </div>
  </form>
  </c:forEach>
  
  </div>
  <div id="top_btn"><a href="#"> <input class="top" type="image" value="" src="/termproject/product/image/top.png"/></a></div>
  <div id="footer">
    <div class="footer"><img src="/termproject/product/image/footer.png" width="436" height="137" /></div>
  </div>
</div>
</body>
</html>