<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
​<%@ page import="java.util.*" %>
<%@ page import="cart.CartDAO" %>
<%@ page import="cart.Cart" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>장바구니 추가</title>
</head>
<style>
   body {text-align:center;}
</style>
<body>
<% 
   request.setCharacterEncoding("UTF-8");
	
	String pName = request.getParameter("pName");	
	String mId = (String)session.getAttribute("mId");
	Date cDate = new java.util.Date();
	
	Cart cart= new Cart(1, mId, cDate, pName);
	

	CartDAO cartDAO=new CartDAO();
	cartDAO.insertNotcId(cart);
	
   
    session.setAttribute("mId",cart.getmId());
%>
</body>
<script type="text/javascript">
   alert("상품이 추가되었습니다.");
   location.href="/termproject/cControl";
</script>
</html>