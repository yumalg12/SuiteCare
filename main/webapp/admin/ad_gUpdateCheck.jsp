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
<title>수정 확인</title>
<%@ include file="/header-import.jsp" %>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
CaregiverDAO dao = new CaregiverDAO();
String id = request.getParameter("g_id");
String phone = request.getParameter("g_phone");
String email = request.getParameter("g_email");
String address = request.getParameter("g_address");
String sms_yn = request.getParameter("g_sms_yn");
String email_yn = request.getParameter("g_email_yn");

CaregiverVO vo = new CaregiverVO();
vo.setG_id(id);
vo.setG_phone(phone);
vo.setG_email(email);
vo.setG_address(address);
vo.setG_sms_yn(sms_yn);
vo.setG_email_yn(email_yn);

int result = dao.adUpdate(vo);

if(result == 1) {
	%>
	<script>
		alert("회원정보 수정이 완료되었습니다.");
		window.location.href='${context}/admin/admin_caregiver.jsp';
	</script>
	<% 	
} else {
%>

	<script>
		alert("정보 수정을 완료하지 못했습니다.\n다시 시도해주세요.");
		history.back();
	</script>
<% 
}
%>
</html>