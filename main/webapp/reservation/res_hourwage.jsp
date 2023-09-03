<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>SC 스위트케어 | 시급 입력하기</title>
<%@ include file="/header-import.jsp"%>

<link rel="stylesheet" href="${context}/assets/css/popup.css" />

</head>

<body>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<h2>시급 입력하기</h2>
					</header>

					<div class="form_wrapper">
						<form action="../book/applybook.jsp" method="post" name="hourwageForm">
							<div class="form_row">
								<label for="hourwage">희망시급</label>
								<div style="display: flex; align-items: center; gap: 5px;">
								<input type="text" id="hourwage" name="hourwage" required autofocus>원
								</div>
							</div>
							<div class="form_button">
								<button class="button special" type="submit">희망시급 저장</button>
							</div>
						</form>

					</div>
					<!-- /container -->
				</div>
			</div>
		</div>
	</section>

</body>
</html>