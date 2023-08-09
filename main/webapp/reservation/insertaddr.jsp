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
String addr = request.getParameter("addr");
String detail_addr = request.getParameter("detail_addr");

ReservationVO vo = new ReservationVO();

vo.setAddr(addr);
vo.setDetail_addr(detail_addr);
vo.setCaretaker_code(caretaker_code);
if(res_code!=null) {
vo.setRes_code(res_code);


int result = dao.updateaddr(vo);

if(result==1) {
	response.sendRedirect("res_date.jsp");
} else {
%>
<script>
alert("업데이트 오류");
location.href='<%=request.getContextPath()%>/reservation/reshome.jsp';
</script>

<% }} else if(res_code==null) {
	vo.setRes_code(r_code);


int result = dao.updateaddr(vo);

if(result==1) {
	session.removeAttribute("r_code");
	%>
	<script>
	alert("자택주소 업데이트 완료");
	window.location.href='../member/mMain.jsp';
	</script>
	<%
} else {
%>
<script>
alert("업데이트 오류");
location.href='<%=request.getContextPath()%>/reservation/reshome.jsp';
</script>

<% }}%>

</body>
</html>