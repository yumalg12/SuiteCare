<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약번호 구하기</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String patient_id = (String)session.getAttribute("patient_id");
String patient_code = (String)session.getAttribute("patient_code");

ReservationDAO dao = new ReservationDAO();

if(patient_id !=null && patient_code!=null) {
	String res_code = dao.insert(patient_id, patient_code);
	session.setAttribute("res_code", res_code);

%>
<script>
	alert("예약코드가 생성되었습니다.\n<%=res_code%>");
	location.href='<%=request.getContextPath()%>/reservation/rescareloc.jsp';
</script>

<% }else {
	%>
<script>
	alert("정보가 없습니다");
	location.href='<%=request.getContextPath()%>/reservation/respatient.jsp';
</script>
<%
}
%>
</body>
</html>