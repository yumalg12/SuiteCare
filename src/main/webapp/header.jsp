<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header -->
<header id="header" class="alt">
	<div class="logo">
		<a href="<%=request.getContextPath()%>/index.jsp">SC 스위트케어</a>
	</div>
	<a href="#menu">Menu</a>
</header>
<%//String userID = (String) session.getAttribute("userID");
request.setCharacterEncoding("utf-8");
%>

<!-- Nav -->
<nav id="menu">
	<ul class="links">
		<li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
		<li><a href="<%=request.getContextPath()%>/generic.jsp">간병인 찾기</a></li>
		<li><a href="<%=request.getContextPath()%>/generic.jsp">간병일감찾기</a></li>
		<li><a href="<%=request.getContextPath()%>/generic.jsp">마이페이지</a></li>
		<li><a href="<%=request.getContextPath()%>/generic.jsp">고객센터</a></li>
		<li><a href="<%=request.getContextPath()%>/elements.jsp">스타일 가이드</a></li>
		<li><a href="#">로그아웃</a></li>
	</ul>
</nav>