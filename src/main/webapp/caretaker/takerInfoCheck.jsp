<%@ page import = "caretaker.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피간병인 정보 등록 확인</title>
</head>
<body>
<% 

request.setCharacterEncoding("utf-8");


TakerDAO dao = new TakerDAO();

String t_id = (String)session.getAttribute("m_id");
String t_name = request.getParameter("t_name");
String t_gender = request.getParameter("t_gender");
String t_age = request.getParameter("t_age");
String t_height = request.getParameter("t_height");
String t_weight = request.getParameter("t_weight");
String diagnosis = request.getParameter("diagnosis");

TakerVO vo = new TakerVO();

vo.setM_id(t_id);
vo.setT_name(t_name); 
vo.setT_gender(t_gender);
vo.setT_age(t_age); 
vo.setT_height(t_height);
vo.setT_weight(t_weight);
vo.setDiagnosis(diagnosis); 

dao.insert(vo);

%>
<script>
alert("피간병인 정보 등록이 완료되었습니다.");
window.location.href='../member/mypage.jsp';
</script>
<% 

	//else if(command!=null && command.equals("delTaker")) {
	//String id = request.getParameter("user_id");
	//dao.delTaker(id);
	//session.invalidate();
%>
	<script>
	//alert("회원탈퇴 완료 \n 안녕히 가세요.");
	//window.location.href='../index.jsp';
	</script>
<% 
//}
%>
</body>


</html>