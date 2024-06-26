<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.Member" scope="page"/>
<jsp:setProperty name="member" property="mId" /> 
<jsp:setProperty name="member" property="mPassword" /> 
<jsp:setProperty name="member" property="mName" /> 
<jsp:setProperty name="member" property="mEmail" /> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinAction 페이지</title>
</head>
<body>
    <%
            if(member.getmId()==null||member.getmPassword()==null||member.getmName()==null||member.getmEmail()==null){
                PrintWriter script=response.getWriter();
                script.println("<script>");
                script.println("alert('입력이 안된 사항이 있습니다.')");
                script.println("history.back()");
                script.println("</script>");

            }
            else
            {
                MemberDAO memberDAO=new MemberDAO();
                int result=memberDAO.join(member); // 위 유저 아이디 등등 인스턴스가 매개변수로 들어감 
                if (result== -1)
                {
                    PrintWriter script=response.getWriter();
                    script.println("<script>");
                    script.println("alert('이미 존재하는 아이디 입니다')"); 
                    script.println("history.back()");
                    script.println("</script>");
                }
                else
                {
                    session.setAttribute("mId",member.getmId());
                    PrintWriter script=response.getWriter();
                    script.println("<script>");
                    script.println("location.href='/termproject/main/main_member.jsp'");
                    script.println("</script>");
                }
            }
    %>
</body>
</html>