<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String patient_id = request.getParameter("patient_id");
String patient_pw = request.getParameter("patient_pw");

session.setAttribute("patient_id", patient_id);

%>
<script>
alert("로그인 성공")
location.href='<%=request.getContextPath()%>/patient/mypage.jsp';
</script>

</body>
</html>