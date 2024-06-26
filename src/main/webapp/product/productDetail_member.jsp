<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="/termproject/css/bootstrap.css">
<link href="/termproject/product/layout.css" rel="stylesheet" type="text/css" />
<title>상품상세설명</title>
<style>
.detail{
   height: 100px;
   width: *;
   text-align: left;
   vertical-align: middle;
   margin-left: 50px;
   font-size: 15px;
}

</style>
</head>
<body>
<div id="wrap">
  <div id="page_header">
    <div class="logo"><a href="/termproject/main/main_member.jsp"><img src="/termproject/product/image/logo.jpg" width="200" height="50" /></a></div>
    <div class="login"><%= session.getAttribute("mId") %>님 &gt;<a href="/termproject/login/logoutAction.jsp">로그아웃&nbsp;</a><a href="/termproject/cart/cart.jsp"><input type="image" name="cart1" src="/termproject/product/image/cart1.jpg" width="20" height="20"/></a></div>

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
  <div class="txttitle">
  <h2>상세 정보</h2></div>
     <form name="add" method="post" action="/termproject/cart/cartAction.jsp?pName=${products.pName }">
       <div class="container">
       <div class="product">
       <div class="productpic"><img src="/termproject/product${products.pImage}" width="230" height="300" />
       </div>
       <div class="cartpic"><a href="/termproject/cControl"><input type="image" src="/termproject/product/image/cart.jpg" width="50" height="50" value="장바구니 추가"/></a></div>
       </div>
       <div class="container2">
       <table class="detail">
      <colgroup>
         <col width="226">
         <col width="*">
      </colgroup>
      <tbody>
         <tr><th scope="row">제품 번호</th><td>${products.pId}</td></tr>
         <tr><th scope="row">제품명</th><td>${products.pName}</td></tr>
         <tr><th scope="row">가격</th><td>${products.price}</td></tr>
      	<tr><th>
      		<select name="size" id="size">
        		<option value="사이즈">사이즈</option>
        		<option value="1">small</option>
        		<option value="2">medium</option>
        		<option value="3">large</option>
      		</select>
      		<select name="amount" id="amount">
         		<option value="수량">수량</option>
        		<option value="1">1</option>
        		<option value="2">2</option>
        		<option value="3">3</option>
        		<option value="4">4</option>
        		<option value="4">5</option>
        		<option value="4">6</option>
        		<option value="4">7</option>
      		</select>
      		</th>
    	</tr>
      </tbody>
   </table>
  </div>
  <div class="productdetail">
   	<div class="picture"><img src="/termproject/product${products.pImage}" width="400" height="500" /></div><br><br>
    <div class="picture1"><img src="/termproject/product${products.pImage1}" width="400" height="500" /></div><br><br>
    <div class="picture2"><img src="/termproject/product${products.pImage2}" width="400" height="500" /></div><br><br>
    <div class="picture3"><img src="/termproject/product${products.pImage3}" width="400" height="500" /></div><br><br>
    <div class="picture4"><img src="/termproject/product${products.pImage4}" width="400" height="500" /></div><br><br>
    <div class="picture5"><img src="/termproject/product${products.pImage5}" width="400" height="500" /></div><br><br>
    <div class="picture6"><img src="/termproject/product${products.pImage6}" width="400" height="150" /></div><br><br>
    <div class="picture7"><img src="/termproject/product${products.pImage7}" width="400" height="350" /></div><br><br>
   <hr>
   	<h5>세탁 및 상품주의사항</h5>
   	<hr>
   	<h6>${products.pContent}</h6>
   	<hr>
   </div>
  </div>
     </form>
  </div>
  <div id="top_btn"><a href="#"> <input class="top" type="image" value="" src="/termproject/product/image/top.png"/></a></div>
  <div id="footer">
    <div class="footer"><img src="/termproject/product/image/footer.png" width="436" height="137" /></div>
  </div>
</div>
</body>
</html>