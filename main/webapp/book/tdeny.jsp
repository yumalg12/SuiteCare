<%@ page import = "book.*" %>
<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭승인</title>
<%@ include file="/header-import.jsp"%>
</head>
<body>
<%
String b_id = request.getParameter("b_id");
String res_code = request.getParameter("res_code");

BookDAO dao = new BookDAO();

int result = dao.denybook(b_id);

if (result == 1) {
%>
	<script>
	    alert("매칭거절이 완료되었습니다.");
	    window.location.href="./tapplyList.jsp?res_code=<%=res_code%>";
	</script>
	<%
	            } else {
	            	%>
	 <script>
	 	alert("오류발생");
	 	window.location.href="./tapplyList.jsp?res_code=<%=res_code%>";
	 </script>
	            	<% 
	            }
					%>
</body>
</html>