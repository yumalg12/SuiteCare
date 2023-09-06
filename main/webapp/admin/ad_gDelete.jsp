<%@ page import = "caregiver.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 삭제</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
String g_id = request.getParameter("g_id");

CaregiverDAO dao = new CaregiverDAO(); 
int del = dao.del(g_id);

if(del == -1) out.println("<script>alert('회원 정보 삭제 실패'); location.replace('admin_caregiver.jsp');</script>");
else out.println("<script>alert('회원 정보 삭제 완료'); location.replace('admin_caregiver.jsp');</script>");
%>

</body>
</html>