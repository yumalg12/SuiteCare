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

String tname = request.getParameter("tname");
String tgender = request.getParameter("tgender");
String tage = request.getParameter("tage");
String theight = request.getParameter("theight");
String tweight = request.getParameter("tweight");
String diagnosis = request.getParameter("diagnosis");

TakerVO vo = new TakerVO();

vo.setTname(tname); 
vo.setTgender(tgender);
vo.setTage(tage); 
vo.setTheight(theight);
vo.setTweight(tweight);
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