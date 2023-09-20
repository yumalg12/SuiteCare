<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SC 스위트케어 | 리뷰</title>
<%@ include file="/header-import.jsp"%>

<link rel="stylesheet" href="${context}/assets/css/popup.css" />

<style>
span{
margin-top: 0.3rem;
}
</style>
</head>
<body>
	<section id="finishlist" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>내가 작성한</p>
						<h2>후기</h2>
					</header>
					<div class="form_wrapper">
						<c:forEach var="review" items="${mreview }">
							<div class="form_row">
								<label>친절도</label><span value="${review.re_kind }"></span>
							</div>
							<div class="form_row">
								<label>시간</label><span value="${review.re_time }"></span>
							</div>
							<div class="form_row">
								<label>전문도</label><span value="${review.re_pro }"></span>
							</div>
							<div class="form_row">
								<label>일처리</label><span value="${review.re_speed }"></span>
							</div>
							<div class="form_row">
								<label>의사소통</label><span value="${review.re_com }"></span>
							</div>
							<div class="form_row">
								<label>비용</label><span value="${review.re_price }"></span>
							</div>
							<div class="form_row">
								<label>총 평가</label><span>${review.comment }</span>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
	document.querySelectorAll("span").forEach(e=>e.innerHTML = "⭐".repeat(e.attributes.value.value));
	</script>
</body>
</html>