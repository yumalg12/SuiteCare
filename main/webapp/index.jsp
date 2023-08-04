<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>SC 스위트케어</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<style>
.conB_content {
	text-align: center;
}

.box:hover {
	transform: scale(1.1);
	transition: 0.1s linear;
}

.conB_content>.icon {
	font-size: 10rem;
	margin-top: 3rem;
}
</style>
<%@ include file="/header-import.jsp"%>
</head>
<body>
	<%@ include file="/header.jsp"%>
	
	<!-- Banner -->
	<section class="banner full">
		<article>
		<%int num = (int) (Math.random() * 4 + 1); %>
			<img src="images/slide0<%=num %>.jpg" alt="" />
			<div class="inner">
				<header>
					<p>
						A free responsive web site template by <a
							href="https://templated.co">TEMPLATED</a>
					</p>
					<h2>Suite Care</h2>
				</header>
			</div>
		</article>
	</section>
<% String m_id = (String)session.getAttribute("m_id");
String g_id = (String)session.getAttribute("g_id");	%>
	<!-- One -->
	<section id="one" class="wrapper style2">
		<div class="inner">
			<div class="grid-style">

				<div>
					<div class="box"
					<% if(m_id == null) { %>
						onclick="location.href='./member/caretakerLogin.jsp'"
						<% } else { %>
						onclick="location.href='./member/mMain.jsp'"
						<% } %>
						style="cursor: pointer;">
						<div class="conB_content">

							<i class="fa-solid fa-magnifying-glass icon"
								style="color: #423730;"></i>
						</div>
						<div class="content">
							<header class="align-center">
								<p>간병 서비스를 제공받을 분</p>
								<h2>간병인 찾기</h2>
							</header>
						</div>
					</div>
				</div>

				<div>
					<div class="box" 
					<% if(g_id == null) { %>onclick="location.href='caregiverLogin.jsp'"
						<% } else { %>onclick="location.href='caregiver_info.jsp'"
							<% } %>
						style="cursor: pointer;">
						<div class="conB_content">
							<i class="fa-solid fa-pen-to-square icon" style="color: #423730;"></i>
						</div>
						<div class="content">
							<header class="align-center">
								<p>간병인 일감을 찾으시는 분</p>
								<h2>간병인 등록하기</h2>
							</header>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<%@ include file="/footer.jsp"%>

</body>
</html>