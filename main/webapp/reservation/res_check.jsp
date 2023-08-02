<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String m_id = (String)session.getAttribute("m_id");
String caretaker_code = (String)session.getAttribute("caretaker_code");
String res_code = (String)session.getAttribute("res_code");
ReservationDAO dao = new ReservationDAO();
String start_date = request.getParameter("startdate");
String end_date = request.getParameter("enddate");
String start_time = request.getParameter("starttime");
String end_time = request.getParameter("endtime");

ReservationInfoVO vo = new ReservationInfoVO();

vo.setRes_code(res_code);
vo.setStart_date(start_date);
vo.setEnd_date(end_date);
vo.setStart_time(start_time);
vo.setEnd_time(end_time);
vo.setCaretaker_code(caretaker_code);

int check_ok = dao.checkres(vo);

if(check_ok==0) {
	%>	
	<script>
	alert("기존 예약과 중복되었습니다. \n 확인해주세요.");
	window.location.href='./res_date.jsp';
	</script>
	<% 
} else {
int result = dao.insertresinfo(vo);

if(result>0) {
	session.removeAttribute("caretaker_code");
	%>
	<script>
	alert("예약 완료");
	location.href='<%=request.getContextPath()%>/reservation/matchService.jsp';
	</script>
	<%
} else {
	%>
	<script>
	alert("예약 실패");
	location.href='<%=request.getContextPath()%>/reservation/res_date.jsp';
	</script>
	<%
} }
%>
</body>
</html>