<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/header-import.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="review" items="${review }">
		<span>친절도 >>> ${review.re_kind }</span>
		<span>시간 >>> ${review.re_time }</span>
		<span>전문도 >>> ${review.re_pro }</span>
		<span>일처리 >>> ${review.re_speed }</span>
		<span>의사소통 >>> ${review.re_com }</span>
		<span>비용 >>> ${review.re_price }</span>
		<span>평가 >>> ${review.comment }</span>
	</c:forEach>
</body>
</html>