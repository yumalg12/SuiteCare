<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 결제</title>
<%@include file="../header-import.jsp"%>

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

<link rel="stylesheet" href="<%=context%>/assets/css/popup.css" />

</head>

<body>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>간병 서비스</p>
						<h2>결제 방식 선택</h2>
					</header>
					<div class="form_wrapper">
						<!-- One -->
						<div style="display: grid; grid-template-columns: 1fr 1fr;">

							<div class="box"
								onclick="location.href='<%=context%>/Payment/kakao.do'"
								style="cursor: pointer;">
								<div class="conB_content">
									<img src="../assets/images/카카오페이_CI_combination_with_BG.svg">
								</div>
								<header class="align-center">
									<h2>카카오페이</h2>
								</header>
							</div>

							<div class="box"
								onclick="location.href='<%=context%>/Payment/card.do'"
								style="cursor: pointer;">
								<div class="conB_content">
									<i class="fa-regular fa-credit-card icon"
										style="color: #423730;"></i>
								</div>
								<header class="align-center">
									<h2>카드결제</h2>
								</header>
							</div>

						</div>
						
						<div class="form_button">
						<button class="button alt" onclick="history.back()">뒤로가기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>