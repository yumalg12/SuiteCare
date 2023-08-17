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
<% String m_id = (String)session.getAttribute("m_id");
String res_code = request.getParameter("res_code");
String b_id = request.getParameter("b_id");
String g_id = request.getParameter("g_id");

BookDAO dao = new BookDAO();

int result = dao.approvebook(res_code, b_id);

if (result == 1) {
	int gresult = dao.updategid(g_id, res_code);
	if(gresult==1) {
	%>
	<script>
	    alert("매칭이 승인되었습니다.");
	    window.location.href='../member/mMain.jsp';
	</script>
	<%
	            }} else {
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