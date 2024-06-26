<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>logoutAction</title>
</head>
<body>
   <%
   
      session.invalidate();
      
   %>
   <script>
      location.href='/termproject/main/main.jsp';
   </script>
</body>
</html>