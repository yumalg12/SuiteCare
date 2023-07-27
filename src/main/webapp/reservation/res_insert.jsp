<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약번호 구하기</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String m_id = (String)session.getAttribute("m_id");
String caretaker_code = (String)session.getAttribute("caretaker_code");
String consciousness = request.getParameter("consciousness");
String care_meal_yn = request.getParameter("care_meal_yn");
String care_toilet = request.getParameter("care_toilet");
String state_paralysis = request.getParameter("state_paralysis");
String state_mobility = request.getParameter("state_mobility");
String bedsore_yn = request.getParameter("bedsore_yn");
String suction_yn = request.getParameter("suction_yn");
String outpatient_yn = request.getParameter("outpatient_yn");
String care_night_yn = request.getParameter("care_night_yn");
String notice = request.getParameter("notice");

ReservationDAO dao = new ReservationDAO();

if(m_id !=null && caretaker_code!=null) {
	
	ReservationVO vo = new ReservationVO();
	
	vo.setM_id(m_id);
	vo.setCaretaker_code(caretaker_code);
	vo.setConsciousness(consciousness);
	vo.setCare_meal_yn(care_meal_yn);
	vo.setCare_toilet(care_toilet);
	vo.setState_paralysis(state_paralysis);
	vo.setState_mobility(state_mobility);
	vo.setBedsore_yn(bedsore_yn);
	vo.setSuction_yn(suction_yn);
	vo.setOutpatient_yn(outpatient_yn);
	vo.setCare_night_yn(care_night_yn);
	vo.setNotice(notice);
	
	
	String res_code = dao.insert(vo);
	session.setAttribute("res_code", res_code);

%>
<script>
	alert("예약코드가 생성되었습니다.\n<%=res_code%>");
	location.href='<%=request.getContextPath()%>/reservation/rescareloc.jsp';
</script>

<% }else {
	%>
<script>
	alert("정보가 없습니다");
	location.href='<%=request.getContextPath()%>/reservation/respatient.jsp';
</script>
<%
}
%>
</body>
</html>