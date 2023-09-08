<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약정보 삭제</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
String res_code = request.getParameter("res_code");

ReservationDAO dao = new ReservationDAO(); 
int del = dao.del(res_code);

if(del == -1) out.println("<script>alert('예약 정보 삭제 실패'); location.replace('admin_reservation.jsp');</script>");
else out.println("<script>alert('예약 정보 삭제 완료'); location.replace('admin_reservation.jsp');</script>");
%>

</body>
</html>