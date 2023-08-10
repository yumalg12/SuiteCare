<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String m_id = (String)session.getAttribute("m_id");
String caretaker_code = (String)session.getAttribute("caretaker_code");
String res_code = (String)session.getAttribute("res_code");
String r_code = (String)session.getAttribute("r_code");

ReservationDAO dao = new ReservationDAO();
System.out.println("res_code : "+res_code);
System.out.println("r_code : "+r_code);
try {
    if (res_code != null || r_code != null) {
        String targetCode = (res_code != null) ? res_code : r_code;
        
        int result = dao.updatehome(targetCode);

        if (result == 1) {
            response.sendRedirect("reshome.jsp");
        } else {
        	%>
        	<script>
        	 alert("업데이트 오류");
             location.href='<%=request.getContextPath()%>/reservation/reshome.jsp';
        	</script>
        	<%
        	     
        	} }}catch (Exception e) {
        	e.printStackTrace();
        	}
        	%>
</body>
</html>