<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--          meta 선언          -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">

<!--          link 선언          -->
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/sc.css" />

<!--          script 선언          -->
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/d75ead5752.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="./js/script.js"></script>

<!-- Header -->
<header id="header" class="alt">
	<div class="logo">
		<a href="index.jsp">SC 스위트케어</a>
	</div>
	<a href="#menu">Menu</a>
</header>
<%String userID = (String) session.getAttribute("userID");%>

<!-- Nav -->
<nav id="menu">
	<ul class="links">
		<li><a href="index.jsp">Home</a></li>
		<li><a href="generic.jsp">간병인 찾기</a></li>
		<li><a href="generic.jsp">간병일감찾기</a></li>
		<li><a href="generic.jsp">마이페이지</a></li>
		<li><a href="generic.jsp">고객센터</a></li>
		<li><a href="elements.jsp">스타일 가이드</a></li>
		<li><a href="#">로그아웃</a></li>
	</ul>
</nav>