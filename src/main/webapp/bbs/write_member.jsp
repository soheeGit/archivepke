<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.io.PrintWriter"%>
<%@ page import ="bbs.BbsDAO"%>
<%@ page import ="bbs.Bbs"%>
<%@ page import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="/termproject/css/bootstrap.css">
<link href="layout.css" rel="stylesheet" type="text/css" />
<title>리뷰 작성</title>
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
   %>
<div class="container">
      <div class="row">
      <form method="post" action="writeAction.jsp">
      <table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
            <thead>
               <tr>
                  <th colspan="2" style="background-color:#eeeeee; text-align:center;">게시판 글쓰기 양식</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td><input type="text" class="form-control" placeholder="글 제목" name="bTitle" maxlength="50"></td>
               </tr>
               <tr>
                  <td><textarea class="form-control" placeholder="글 내용" name="bContent" maxlength="2048" style="height=350px;"></textarea></td>
               </tr>
            </tbody>   
         </table>   
         <input type="submit" class="btn btn-primary pull-right" value="글쓰기">         
      </form>
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