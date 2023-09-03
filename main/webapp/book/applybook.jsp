<%@ page import = "book.*" %>
<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String g_id = (String)session.getAttribute("g_id");
String res_code = (String)session.getAttribute("applycode");
String b_status = "신청완료";
String hourwage = request.getParameter("hourwage");

//System.out.println(res_code + " & " + g_id);

BookDAO dao = new BookDAO();

int checkb = dao.checkbook(res_code, g_id);

if(checkb==0) {
	System.out.println("g_id 정보 없음");
	
	BookVO vo = new BookVO();
	vo.setRes_code(res_code);
	vo.setG_id(g_id);
	vo.setB_status(b_status);
	vo.setHourwage(hourwage);
	
	dao.insertbook(vo);
	%>
	<script>
		alert("매칭신청이 완료되었습니다..")
		window.close();
		opener.location.href='<%=request.getContextPath()%>/caregiver/main';
	</script>
	<%
	session.removeAttribute("applycode");
	} else if (checkb==1) {
	System.out.println("g_id 정보있음");
	
	%>
	<script>
		alert("매칭승인 대기중입니다.")
		window.close();
		opener.location.href='<%=request.getContextPath()%>/caregiver/main';
	</script>
	<%
	session.removeAttribute("applycode");
	} 
%>
</body>
</html>