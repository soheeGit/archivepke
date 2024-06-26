<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bbs.BbsDAO" %>
<%@page import="bbs.Bbs" %>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deleteAction</title>
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
         script.println("location.href='login.jsp'"); //로그인 안된사람은 로그인 페이지로 이동
         script.println("</script>");
         
      }
      int bId=0;
      if(request.getParameter("bId")!=null){
         bId=Integer.parseInt(request.getParameter("bId")); //
      }
      if(bId==0){
         PrintWriter script=response.getWriter();
         script.println("<script>");
         script.println("alert('유효하지 않는 글입니다')"); 
         script.println("location.href='bbs.jsp'");
         script.println("</script>");
      }
      
      
      Bbs bbs=new BbsDAO().getBbs(bId);
      if(!mId.equals(bbs.getmId())){
         PrintWriter script=response.getWriter();
         script.println("<script>");
         script.println("alert('권한이 없습니다.')"); 
         script.println("location.href='bbs_member.jsp'");
         script.println("</script>");
      }   
      else{   
         BbsDAO bbsDAO =new BbsDAO();
         int result= bbsDAO.delete(bId); 
         if (result== -1)
         {
            PrintWriter script=response.getWriter();
            script.println("<script>");
            script.println("alert('글 삭제에 실패했습니다.')"); 
            script.println("history.back()");
            script.println("</script>");
         }
         else
         {
            PrintWriter script=response.getWriter();
            script.println("<script>");      
            script.println("location.href='bbs_member.jsp'");  //게시글 성공시 bbs페이지로 감
            script.println("</script>");
         }
         
      }   
   %>
   
</body>
</html>