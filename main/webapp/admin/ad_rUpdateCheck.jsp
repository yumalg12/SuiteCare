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
<title>수정 확인</title>
<%@ include file="/header-import.jsp" %>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
ReservationDAO dao = new ReservationDAO();
String mid = request.getParameter("mid");
String caretaker_code = request.getParameter("caretaker_code");
String caregiver_id = request.getParameter("caregiver_id");
String res_code = request.getParameter("res_code");
String merchant_uid = request.getParameter("merchant_uid");
String res_date = request.getParameter("res_date");

ReservationVO vo = new ReservationVO();
vo.setM_id(mid);
vo.setCaretaker_code(caretaker_code);
vo.setCaregiver_id(caregiver_id);
vo.setRes_code(res_code);
vo.setMerchant_uid(merchant_uid);
vo.setRes_date(res_date);

int result = dao.update(vo);

if(result == 1) {
	%>
	<script>
		alert("예약정보 수정이 완료되었습니다.");
		window.location.href='${context}/admin/admin_reservation.jsp';
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