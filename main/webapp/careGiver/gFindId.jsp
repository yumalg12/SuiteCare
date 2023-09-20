<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>SC 스위트케어 | 아이디 찾기</title>
<%@ include file="/header-import.jsp"%>

</head>

<body>
	<%@ include file="/header.jsp"%>

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Premium Caregiver Matching Platform</p>
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
						<p>gFindId.jsp</p>
						<h2>아이디 찾기</h2>
					</header>

					<div class="form_wrapper">
						<form action="./gFindIdCheck.jsp" class="form-signin">
							<div class="form_row">
							<label for="name">이름</label>
							<input type="text" id="findname" name="name" pattern="[가-힣]{2,10}" placeholder="이름" title="한글 실명" required autofocus>
							</div>
							<div class="form_row">
							<label for="phone">핸드폰번호</label>
							<input type="tel" id="phone" name="phone" pattern="([0-9]{3}-[0-9]{4}-[0-9]{4})|([0][0-9]{10})" maxlength="13" placeholder="휴대폰 번호 (000-0000-0000 형식)" title="휴대폰 번호 (000-0000-0000 형식)" required>
							</div>
							<div class="form_button">
							<button class="button special" type="submit">아이디 찾기</button>
							</div>
						</form>

					</div>
					<!-- /container -->
</div></div></div></section>

<%@ include file="/footer.jsp" %>

</body>
</html>