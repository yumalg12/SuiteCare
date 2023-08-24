<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SC 스위트케어 | 빠른 매칭 서비스 체크</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String m_id = (String)session.getAttribute("m_id");
String res_code = (String)session.getAttribute("res_code");
String r_code = (String)session.getAttribute("r_code");

ReservationDAO dao = new ReservationDAO();


String pre_location_1 = request.getParameter("pre_location_1");
 String pre_location_2 = request.getParameter("pre_location_2");
 String pre_location_3 = request.getParameter("pre_location_3");
 String pre_age_1 = request.getParameter("pre_age_1");
 String pre_age_2 = request.getParameter("pre_age_2");
 String pre_age_3 = request.getParameter("pre_age_3");
 String pre_gender = request.getParameter("pre_gender");
 String pre_qual = request.getParameter("pre_qual");
 String pre_repre_1 = request.getParameter("pre_repre_1");
 String pre_repre_2 = request.getParameter("pre_repre_2");
 String pre_repre_3 = request.getParameter("pre_repre_3");
 String pre_hourwage_1 = request.getParameter("pre_hourwage_1");
 String pre_hourwage_2 = request.getParameter("pre_hourwage_2");
 String pre_hourwage_3 = request.getParameter("pre_hourwage_3");
 
 ReservationInfoVO vo = new ReservationInfoVO();
 
 vo.setPre_location_1(pre_location_1);
 vo.setPre_location_2(pre_location_2);
 vo.setPre_location_3(pre_location_3);
 vo.setPre_age_1(pre_age_1);
 vo.setPre_age_2(pre_age_2);
 vo.setPre_age_3(pre_age_3);
 vo.setPre_gender(pre_gender);
 vo.setPre_qual(pre_qual);
 vo.setPre_repre_1(pre_repre_1);
 vo.setPre_repre_2(pre_repre_2);
 vo.setPre_repre_3(pre_repre_3);
 vo.setPre_hourwage_1(pre_hourwage_1);
 vo.setPre_hourwage_2(pre_hourwage_2);
 vo.setPre_hourwage_3(pre_hourwage_3);
 
 if(res_code!=null) {
 vo.setRes_code(res_code);


int result = dao.updatepre(vo);

if(result == 1) {
	session.removeAttribute("res_code");
	%>
	<script>
		alert("매칭서비스 정보 등록이 완료되었습니다.");
		window.location.href='<%=context%>/member/main';
	</script>
	<% 	
} else {
%>

	<script>
		alert("에러, 정보 등록을 완료하지 못했습니다.\n다시 시도해주세요.");
		window.location.href='./matchService.jsp';
	</script>
<% 
}} else if(res_code==null) {
	vo.setRes_code(r_code);


	int result = dao.updatepre(vo);

	if(result == 1) {
		session.removeAttribute("r_code");
		%>
		<script>
			alert("매칭서비스 정보 등록이 완료되었습니다.");
			window.location.href='<%=context%>/member/main';
		</script>
		<% 	
	} else {
	%>

		<script>
			alert("에러, 정보 등록을 완료하지 못했습니다.\n다시 시도해주세요.");
			window.location.href='./matchService.jsp';
		</script>
	<% 
	}}
%>
</body>
</html>