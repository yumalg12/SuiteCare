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
						<p>간병서비스</p>
						<h2>후기</h2>
					</header>
					<div class="form_wrapper">
					
					<c:if test="${empty reviewList}">
      					 <p>${message}</p>
    				</c:if>
    				<c:if test="${not hasData and not empty reviewList }">
    				 <p>${message}</p>
    				</c:if>
    				 <c:if test="${hasData}">
						<c:forEach var="review" items="${reviewList }">
							<div class="form_row">
								<label>친절도</label><span value="${review.avgReKind }"></span>
							</div>
							<div class="form_row">
								<label>시간</label><span value="${review.avgReTime }"></span>
							</div>
							<div class="form_row">
								<label>전문도</label><span value="${review.avgRePro }"></span>
							</div>
							<div class="form_row">
								<label>일처리</label><span value="${review.avgReSpeed }"></span>
							</div>
							<div class="form_row">
								<label>의사소통</label><span value="${review.avgReCom }"></span>
							</div>
							<div class="form_row">
								<label>비용</label><span value="${review.avgRePrice }"></span>
							</div>
							<div class="form_row">
								<label>최근 코멘트</label><span>✔ ${review.recentComments }</span>
							</div>
						</c:forEach>
					</c:if>
					</div>

					<input type="button" class="button special" onclick="window.close();" value="닫기">

					</div>
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