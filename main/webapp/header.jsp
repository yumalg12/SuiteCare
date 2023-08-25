<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@1&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
<!-- Header -->
<header id="header" class="alt">
	<div class="logo">
		<a href="<%=context%>/">SC 스위트케어</a>
	</div>
	<a href="#menu">Menu</a>
</header>

<!-- Nav -->
<nav id="menu">
	<ul class="links">
		<li><a href="<%=context%>/">Home</a></li>
		<li><a href="<%=context%>/member/mLogin">피간병인 메인</a></li>
		<%if(m_id!=null) { %><li><a href="<%=context%>/member/member_info.jsp">피간병인 마이페이지</a></li><% } %>
		<li><a href="<%=context%>/careGiver/caregiverLogin.jsp">간병인 메인</a></li>
		<%if(g_id!=null) { %><li><a href="<%=context%>/caregiver">간병인 마이페이지</a></li><% } %>
		<%if(m_id!=null || g_id!=null) { %><li><a href="<%=context%>/logout.jsp">로그아웃</a></li> <% } %>
		<li><a href="<%=context%>/generic.jsp">템플릿 기본틀</a></li>
		<li><a href="<%=context%>/elements.jsp">스타일 가이드</a></li>
	</ul>
		<p>메뉴는 모두 임시입니다! 필요한 대로 수정해 주세요👍</p>
</nav>