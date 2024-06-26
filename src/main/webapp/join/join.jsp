<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="/termproject/css/bootstrap.css">
<link href="layout.css" rel="stylesheet" type="text/css" />
<title>회원가입</title>
<script>
        function validatePassword() {
            var password = document.getElementById("mPassword").value;
            var confirmPassword = document.getElementById("mPasswordConfirm").value;

            if (password != confirmPassword) {
                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
<div id="wrap">
  <div id="page_header">
    <div class="logo"><a href="/termproject/main/main.jsp"><img src="image/logo.jpg" width="200" height="50" /></a></div>
    <div class="login"><a href="/termproject/login/login.jsp">로그인</a></div>
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
  <div class="container">
  <form action="joinAction.jsp" method="post" id="join">
    <div id="join">
      <div class="join1">회원가입</div>
      <div class="join2">가입자 정보를 입력하시오.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*모든 정보 필수</div>
       <p>&nbsp;</p>
       <p>&nbsp;</p>
       
       <table width="1200" height="400" border="1" cellpadding="3" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
    		<td width="154">아이디</td>
    		<td colspan="3"><input type="text" name="mId" id="idfield" class="product_type"/>
        	<input type="button" value="중복확인" class="dup" onclick="winopen()"><br>
    		</td>
    		<td width="154">이름</td>
    		<td width="430"><input type="text" name="mName" id="namefield" class="product_type"/></td>
  		</tr>
  		<tr>
    		<td>비밀번호</td>
    		<td width="428"><input type="password" name="password" id="pwfield" class="product_type"/></td>
    		<td width="154">비밀번호 확인</td>
    		<td width="430"><input type="password" name="mPassword" id="pwfield" class="product_type"/></td>
  		</tr>
  		<tr>
    		<td>이메일</td>
    		<td><input type="text" name="mEmail" id="emailfield" class="product_type" />
			</td>
    		<td width="154">전화번호 <br> (숫자만 입력)</td>
    		<td width="430"><input type="text" name="mPhone" id="phonefield" class="product_type"/></td>
  		</tr>
  		<tr>
    		<td>생년월일 <br> (주민번호 앞 6자리)</td>
    		<td width="428"><input type="text" name="mBirth" id="birthfield" class="product_type"/></td>
    		<td>주소</td>
    		<td><input type="text" name="mAddr" id="addrfield" class="product_type"/></td>
  		</tr>
		</table>
       	<div class="join3"><input type="image" name="sendbtn" src="image/join_20.PNG"></div>
    </div>
     </form>
     
         <!-- 
            <div class="jumbotron " style="padding-top:20px;">
                <form method="post" action="joinAction.jsp">
                    <h2 style="text-align:center;">회원가입</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="아이디" name="mId" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호" name="mPassword" id="mPassword" maxlength="20"> 
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호 확인" name="mPasswordConfirm" id="mPasswordConfirm" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="이름" name="mName" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="이메일" name="mEmail" maxlength="20">
                    </div>
                    <input type="submit" class="btn btn-primary form-control" value="회원가입" onclick="return validatePassword()">
                </form>
                </div>
                
                -->
       </div> 
    </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/termproject/js/bootstrap.js"></script>
  
 <script type="text/javascript">
 
 
  function winopen(){ 
   if(document.fr.idfield.value =="" || document.fr.idfield.value.length < 0){
      alert("아이디를 먼저 입력해주세요")
      document.fr.idfield.focus();
   }else{
      window.open("joinIdCheck.jsp?idfield="+document.fr.idfield.value,"","width=300, height=300");                                                                           //실제 체크는 joinIdCheck에서 일어남
   }  
}
  </script> 
  </div>
  <div id="top_btn"><a href="#"> <input class="top" type="image" value="" src="image/top.png"/></a></div>
  <div id="footer">
    <div class="footer"><img src="image/footer.png" width="436" height="137" /></div>
  </div>
</body>
</html>