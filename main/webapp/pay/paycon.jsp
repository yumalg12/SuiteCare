<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
  String test_id = "aaaa"; 
  session.setAttribute("m_id", test_id);
%>
<input type = "button" name = "kakaopay" onclick = "location.href='/suiteCare/Payment/kakao.do'" value = "카카오페이">
<input type = "button" name = "cardpay" onclick = "location.href='/suiteCare/Payment/card.do'" value = "카드결제">
</body>
</html>