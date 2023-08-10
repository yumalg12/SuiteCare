<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header -->
<header id="header" class="alt">
	<div class="logo">
		<a href="<%=context%>/index.jsp">SC 스위트케어</a>
	</div>
	<a href="#menu">Menu</a>
</header>
<% String mid = (String)session.getAttribute("m_id");
String gid = (String)session.getAttribute("g_id");	%>
<!-- Nav -->
<nav id="menu">
	<ul class="links">
		<li><a href="<%=context%>/index.jsp">Home</a></li>
		<li><a href="<%=context%>/member/caretakerLogin.jsp">간병인 찾기</a></li>
		<li><a href="<%=context%>/careGiver/caregiverLogin.jsp">간병인 등록하기</a></li>
		<li><a href="<%=context%>/generic.jsp">고객센터</a></li>
		<li><a href="<%=context%>/elements.jsp">스타일 가이드</a></li>
		<li><a href="<%=context%>/pay/paycon.jsp">결제 페이지 접근용 임시메뉴</a></li>
		<% if(mid!=null || gid!=null) { %><li><a href="<%=context%>/logout.jsp">로그아웃</a></li> <% } %>
		<p>메뉴는 모두 임시입니다! 원하시는 대로 수정해 주세요👍</p>
	</ul>
</nav>