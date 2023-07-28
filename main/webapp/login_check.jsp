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
String m_id = request.getParameter("patient_id");
String patient_pw = request.getParameter("patient_pw");

session.setAttribute("m_id", m_id);

%>
<script>
alert("로그인 성공")
location.href='<%=request.getContextPath()%>/reservation/rescaretaker.jsp';
</script>

</body>
</html>