<%@ page import = "book.*" %>
<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭신청취소</title>
</head>
<body>
<% String g_id = (String)session.getAttribute("g_id");
String res_code = request.getParameter("res_code");

BookDAO dao = new BookDAO();

dao.delMatch(g_id, res_code);
%>
</body>
<script>
	    alert("매칭신청이 취소되었습니다.");
	    window.location.href="../careGiver/gMain.jsp";
	</script>
</html>