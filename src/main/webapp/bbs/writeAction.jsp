<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bbs.BbsDAO" %>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bTitle" /> 
<jsp:setProperty name="bbs" property="bContent" /> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP웹 사이트</title>
</head>
<body>
   <% 
      String mId=null;
      if(session.getAttribute("mId")!=null){
    	  mId=(String)session.getAttribute("mId");
      }
      if (mId==null){
         PrintWriter script=response.getWriter();
         script.println("<script>");
         script.println("alert('로그인하세요')"); 
         script.println("location.href='/termproject/login/login.jsp'"); //로그인 안된사람은 로그인 페이지로 이동
         script.println("</script>");
         
      }else{
         if(bbs.getbTitle()==null|| bbs.getbContent()==null){
            PrintWriter script=response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
         }else{
            BbsDAO bbsDAO =new BbsDAO();
            int result= bbsDAO.write(bbs.getbTitle(),mId,bbs.getbContent()); 
            if (result== -1)
            {
               PrintWriter script=response.getWriter();
               script.println("<script>");
               script.println("alert('글쓰기에 실패했습니다.')"); 
               script.println("history.back()");
               script.println("</script>");
            }
            else
            {
               PrintWriter script=response.getWriter();
               script.println("<script>");      
               script.println("location.href='bbs.jsp'");  //게시글 성공시 bbs페이지로 감
               script.println("</script>");
            }
         
         }
      }
      
   %>
   
</body>
</html>