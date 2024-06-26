<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.io.PrintWriter"%>
<%@ page import ="bbs.Bbs"%>
<%@ page import ="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="/termproject/css/bootstrap.css">
<link href="layout.css" rel="stylesheet" type="text/css" />
<title>view</title>
</head>
<body>
<div id="wrap">
  <div id="page_header">
    <div class="logo"><a href="/termproject/main/main_member.jsp"><img src="image/logo.jpg" width="200" height="50" /></a></div>
    <div class="login"><%= session.getAttribute("mId") %>님 &gt;<a href="/termproject/login/logoutAction.jsp">로그아웃&nbsp;</a><a href="/termproject/cControl"><input type="image" name="cart1" src="image/cart1.jpg" width="20" height="20"/></a></div>

  </div>
  <div class="menu_bar">
    <ul id="MenuBar1" class="MenuBarHorizontal">
   	  <li><a href="/termproject/pControl?action=listMember">All products</a></li>
    </ul>
  </div>
  <div id="head_image">
	<img src="/termproject/product/image/archivepke8_02.png" width="1200" height="240" />
  </div>
  <div id="main">
  <%
      String mId=null;
      if(session.getAttribute("mId")!= null){
    	  mId=(String)session.getAttribute("mId");
      }
      
      int bId=0;
      if(request.getParameter("bId")!=null){
    	  bId=Integer.parseInt(request.getParameter("bId")); //
      }
      if(bId==0){
         PrintWriter script=response.getWriter();
         script.println("<script>");
         script.println("alert('유효하지 않는 글입니다')"); 
         script.println("location.href='bbs_member.jsp");
         script.println("</script>");
      }
      Bbs bbs=new BbsDAO().getBbs(bId);
   %>
<div class="container">
      <div class="row">
      <table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
            <thead>
               <tr>
                  <th colspan="3" style="background-color:#eeeeee; text-align:center;">게시판 글 보기</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td style="width:20%;">글 제목</td>
                  <td colspan="2"><%=bbs.getbTitle()%></td>
               </tr>
               <tr>
                  <td>작성자</td>
                  <td colspan="2"><%=bbs.getmId()%></td>      
               </tr>
               <tr>
                  <td>내용</td>
                  <td colspan="2" style="min-height:200px; text-align:left;"><%=bbs.getbContent()%></td>      
               </tr>
            </tbody>   
         </table>   
         <a href="bbs.jsp" class="btn btn-primary">목록</a> 
         <%
            if(mId !=null && mId.equals(bbs.getmId())){ //목록으로 돌아감
         %>
               <a href="update.jsp?bId=<%=bId%>" class="btn btn primary">수정하기</a>
               <a href="deleteAction.jsp?bId=<%=bId%>" class="btn btn primary">삭제하기</a>
         <%
            }
         %>                 
      </div>
   </div>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="/termproject/js/bootstrap.js"></script>
  
  
  </div>
  <div id="top_btn"><a href="#"> <input class="top" type="image" value="" src="image/top.png"/></a></div>
  <div id="footer">
    <div class="footer"><img src="image/footer.png" width="436" height="137" /></div>
  </div>
</div>
</body>
</html>