<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String patient_id = (String)session.getAttribute("patient_id");
String patient_code = (String)session.getAttribute("patient_code");
String res_code = (String)session.getAttribute("res_code");
ReservationDAO dao = new ReservationDAO();
String addr = request.getParameter("addr");
String detail_addr = request.getParameter("detail_addr");

PatientinfoVO vo = new PatientinfoVO();
vo.setAddr(addr);
vo.setDetail_addr(detail_addr);
vo.setPatient_code(patient_code);

int result = dao.updateaddr(vo);

if(result==1) {
	response.sendRedirect("res_date.jsp");
} else {
%>
<script>
alert("업데이트 오류");
location.href='<%=request.getContextPath()%>/reservation/reshome.jsp';
</script>

<% } %>
</body>
</html>