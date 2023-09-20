<%@ page import = "member.*" %>
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
MemberDAO dao = new MemberDAO();
String id = request.getParameter("m_id");
String m_phone = request.getParameter("m_phone");
String m_email = request.getParameter("m_email");
String m_address = request.getParameter("m_address");
String m_sms_yn = request.getParameter("m_sms_yn");
String m_email_yn = request.getParameter("m_email_yn");

MemberVO vo = new MemberVO();
vo.setM_id(id);
vo.setM_phone(m_phone);
vo.setM_email(m_email);
vo.setM_address(m_address);
vo.setM_sms_yn(m_sms_yn);
vo.setM_email_yn(m_email_yn);

int result = dao.updatee(vo);

if(result == 1) {
	%>
	<script>
		alert("회원정보 수정이 완료되었습니다.");
		window.location.href='${context}/admin/admin_caretaker.jsp';
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