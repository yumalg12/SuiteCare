<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 결제</title>
<%@include file="../header-import.jsp"%>
<%
String m_id = (String) session.getAttribute("m_id");
%>

<style>
.conB_content {
    height: 9rem;
    display: flex;
	justify-content: center;
}

.conB_content img {
  display: block;
  width: 100%;
  max-width: 12rem;
  margin-bottom: 1rem;
}

.conB_content>.icon {
	font-size: 8rem;
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>adsfasdfsdf</p>
				<h2>Suite Care</h2>
			</header>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>간병인 찾기</p>
						<h2>결제 방식 선택</h2>
					</header>
					<div class="form_wrapper">

					<!-- One -->
					<div class="grid-style">

							<div class="box" onclick="location.href='<%=context%>/Payment/kakao.do'"
								style="cursor: pointer;">
								<div class="conB_content">
									<img src="../images/카카오페이_CI_combination_with_BG.svg">
								</div>
									<header class="align-center">
										<h2>카카오페이</h2>
									</header>
							</div>

							<div class="box" onclick="location.href='<%=context%>/Payment/card.do'"
								style="cursor: pointer;">
								<div class="conB_content">
									<i class="fa-regular fa-credit-card icon" style="color: #423730;"></i>
								</div>
									<header class="align-center">
										<h2>카드결제</h2>
									</header>
							</div>

					</div>					</div>
					
					
				</div>
			</div>
		</div>
	</section>

	<%@include file="../footer.jsp"%>
</body>
</html>