<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberDAO" %>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="member" class="member.Member" scope="page"/>
<jsp:setProperty name="member" property="mId" /> 
<jsp:setProperty name="member" property="mPassword" /> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginAction</title>
</head>
<body>
   <%
      String mId=null;
   if(session.getAttribute("mId")!=null){
	   mId=(String)session.getAttribute("mId");
   }
   if(mId !=null){
      PrintWriter script=response.getWriter();
      script.println("<script>");
      script.println("alert('이미 로그인 되어있습니다')");
      script.println("locatin.href='main_member.jsp'");
      script.println("</script>");
   }
      MemberDAO memberDAO=new MemberDAO();
      int result=memberDAO.login(member.getmId(),member.getmPassword());
      if (result==1)
      {
         session.setAttribute("mId",member.getmId());
         PrintWriter script=response.getWriter();
         script.println("<script>");
         script.println("location.href='/termproject/main/main_member.jsp'");
         script.println("</script>");
      }
      else if(result==0)
      {
         PrintWriter script=response.getWriter();
         script.println("<script>");
         script.println("alert('비밀번호가 틀립니다.')");
         script.println("history.back()");
         script.println("</script>");
      }
      else if (result==-1)
      {
         PrintWriter script=response.getWriter();
         script.println("<script>");
         script.println("alert('존재하지않는 아이디 입니다.')");
         script.println("history.back()");
         script.println("</script>");
      }
      else if (result==-2)
      {
         PrintWriter script=response.getWriter();
         script.println("<script>");
         script.println("alert('데이터 베이스 오류!.')");
         script.println("history.back()");
         script.println("</script>");
      }
   %>
   
</body>
</html>