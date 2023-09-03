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

.conB_content> img {
	height: 10rem;
}

.wrapper.style2 .box {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 2rem;
    gap: 2rem;
}

.box .content {
    padding: 0 !important;
}
</style>
<%@ include file="/header-import.jsp"%>
</head>

<body>
	<%@ include file="/header.jsp"%>
	
	<!-- Banner -->
	<section class="banner full">
		<article>
		<%int num = (int) (Math.random() * 3 + 1); %>
		<img src="images/slide0<%=num %>.jpg" alt="" />
			<div class="inner">
				<header>
					<p>
						<a>Premium </a> Caregiver Matching Platform 
						</p>
					<h2>Suite Care</h2>
				</header>
			</div>
		</article>
	</section>

	<!-- One -->
	<section id="one" class="wrapper style2">
		<div class="inner">
			<div class="grid-style">

				<div>
					<div class="box"
					<% if(g_id == null) { %>
						onclick="location.href='/careGiver/caregiverLogin.jsp'"
						<% } else { %>
						onclick="location.href='main#matchinfo'"
						<% } %>
						style="cursor: pointer;">
						<div class="conB_content">
							<img src="<%=context%>/assets/images/gmain-matchinfo.png">
						</div>
						<div class="content">
							<header class="align-center">
								<p>간병인</p>
								<h2>매칭 정보</h2>
							</header>
						</div>
					</div>
				</div>

				<div>
					<div class="box" 
					<% if(g_id == null) { %>onclick="location.href='careGiver/caregiverLogin.jsp'"

						<% } else { %>onclick="location.href='main#myapplylist'"
							<% } %>
						style="cursor: pointer;">
						<div class="conB_content">
							<img src="<%=context%>/assets/images/gmain-myapplylist.png">
						</div>
						<div class="content">
							<header class="align-center">
								<p>간병인</p>
								<h2>내가 지원한 공고</h2>
							</header>
						</div>
					</div>
				</div>

				<div>
					<div class="box"
					<% if(g_id == null) { %>
						onclick="location.href='/careGiver/caregiverLogin.jsp'"
						<% } else { %>
						onclick="location.href='main#allapplylist'"
						<% } %>
						style="cursor: pointer;">
						<div class="conB_content">
							<img src="<%=context%>/assets/images/gmain-allapplylist.png">
						</div>
						<div class="content">
							<header class="align-center">
								<p>간병인</p>
								<h2>간병 공고 목록</h2>
							</header>
						</div>
					</div>
				</div>

				<div>
					<div class="box" 
					<% if(g_id == null) { %>
						onclick="location.href='/careGiver/caregiverLogin.jsp'"
						<% } else { %>
						onclick="location.href='main#finishlist'"
						<% } %>
						style="cursor: pointer;">
						<div class="conB_content">
							<img src="<%=context%>/assets/images/gmain-finishlist.png">
						</div>
						<div class="content">
							<header class="align-center">
								<p>간병인</p>
								<h2>간병 완료 목록</h2>
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
