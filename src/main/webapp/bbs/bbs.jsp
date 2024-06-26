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
<title>리뷰목록 창</title>
</head>
<body>
<div id="wrap">
  <div id="page_header">
    <div class="logo"><a href="/termproject/main/main.jsp"><img src="image/logo.jpg" width="200" height="50" /></a></div>
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
  <%
      String mId=null;
      if(session.getAttribute("mId")!= null){
         mId=(String)session.getAttribute("mId"); 
      }
      int pageNumber=1; //처음 1페이지
      if (request.getParameter("pageNumber")!=null){
         pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
      }
   %>
<div class="container">
         <div class="row">
         <form method="post" name="search" action="searchbbs.jsp">
            <table class="pull-right">
               <tr>
                  <td><select class="form-control" name="searchField">
                        <option value="0">선택</option>
                        <option value="bTitle" name="bTitle">제목</option>
                        <option value="mId" name="mId">작성자</option>
                  </select></td>
                  <td><input type="text" class="form-control"
                     placeholder="검색어 입력" name="searchText" maxlength="100"></td>
                  <td><button type="submit" class="btn btn-success">검색</button></td>
               </tr>
            </table>
         </form>
         
            <table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
               <thead>
                  <tr>
                     <th style="background-color: #eeeeee; text-align:center;">번호</th>
                     <th style="background-color: #eeeeee; text-align:center;">제목</th>
                     <th style="background-color: #eeeeee; text-align:center;">작성자</th>
                     <th style="background-color: #eeeeee; text-align:center;">작성일</th>
                  </tr>
               </thead> 
               <tbody>
                  <%
                     BbsDAO bbsDAO=new BbsDAO();
                     ArrayList<Bbs> list=bbsDAO.getList(pageNumber); //현재의 페이지에서 가져온 목록
                     for(int i=0;i<list.size();i++){
                  %>   
                  <tr>
                     <td><%=list.get(i).getbId()%></td>
                     <td><a href="view.jsp?bId=<%=list.get(i).getbId()%>"><%=list.get(i).getbTitle()%></a></td>
                     <td><%=list.get(i).getmId()%></td>
                     <td><%=list.get(i).getbDate()%></td>
                  </tr>
                  <%
                     }
                  %>
               </tbody>   
            </table>
               <%
                  if(pageNumber!=1)   {
               %>
                  <a href="bbs.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arraw-left">이전</a>
               <%   
                  }if (bbsDAO.nextPage(pageNumber+1)){
               %>
                  <a href="bbs.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arraw-left">다음</a>
               <%   
                  }
               %>
            <a href="write.jsp" class="btn   btn-primary pull-right">글 작성하기</a>   
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