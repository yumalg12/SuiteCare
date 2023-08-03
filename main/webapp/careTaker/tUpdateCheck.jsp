<%@ page import = "caretaker.*" %>
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
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
TakerDAO dao = new TakerDAO();
String m_id = (String)session.getAttribute("m_id");
String t_code = request.getParameter("t_code");
String t_name = request.getParameter("t_name");
String t_gender = request.getParameter("t_gender");
String t_age = request.getParameter("t_age");
String t_height = request.getParameter("t_height");
String t_weight = request.getParameter("t_weight");
String diagnosis = request.getParameter("diagnosis");

TakerVO vo = new TakerVO();
vo.setM_id(m_id);
vo.setT_name(t_name);
vo.setT_gender(t_gender);
vo.setT_age(t_age);
vo.setT_height(t_height);
vo.setT_weight(t_weight);
vo.setDiagnosis(diagnosis);
vo.setT_code(t_code);

int result = dao.update(vo);

if(result == 1) {
	%>
	<script>
		alert("회원정보 수정이 완료되었습니다.");
		window.location.href='./mMain.jsp';
	</script>
	<% 	
} else {
%>

	<script>
		alert("에러, 정보 수정을 완료하지 못했습니다.\n다시 시도해주세요.");
		window.location.href='../member/mMain.jsp';
	</script>
<% 
}
%>
</body>
</html>