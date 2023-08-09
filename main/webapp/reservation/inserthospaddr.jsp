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
String m_id = (String)session.getAttribute("m_id");
String caretaker_code = (String)session.getAttribute("caretaker_code");
String res_code = (String)session.getAttribute("res_code");
String r_code = (String)session.getAttribute("r_code");

ReservationDAO dao = new ReservationDAO();
String hospname = request.getParameter("hospname");
String hospaddr = request.getParameter("hospaddr");
String hospdetail_addr = request.getParameter("hospdetail_addr");

ReservationVO vo = new ReservationVO();

vo.setLocation(hospname);
vo.setAddr(hospaddr);
vo.setDetail_addr(hospdetail_addr);
vo.setCaretaker_code(caretaker_code);
if(res_code!=null) {
vo.setRes_code(res_code);

int result = dao.updatehospaddr(vo);


if(result==1) {
	response.sendRedirect("res_date.jsp");
} else {
%>
<script>
alert("업데이트 오류");
location.href='<%=request.getContextPath()%>/reservation/reshospital.jsp';
</script>

<% }} else if(res_code==null) {
	vo.setRes_code(r_code);

int result = dao.updatehospaddr(vo);


if(result==1) {
	session.removeAttribute("r_code");
	%>
	<script>
	alert("병원주소 업데이트 완료");
	window.location.href='../member/mMain.jsp';
	</script>
	<%
} else {
%>
<script>
alert("업데이트 오류");
location.href='<%=request.getContextPath()%>/reservation/reshospital.jsp';
</script>

<% }}%>
}
</body>
</html>