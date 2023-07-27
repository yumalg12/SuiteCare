<%@ page import = "caregiver.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>
<% 

request.setCharacterEncoding("utf-8");

%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

CaregiverDAO dao = new CaregiverDAO();

int ok = dao.logincheck(id, pw);
System.out.println("ok = " + ok);

CaregiverVO vo = new CaregiverVO();

if(ok== 1) {
	vo = dao.userLogin(id, pw);
	session.setAttribute("id", vo.getG_id());
	//session.setMaxInactiveInterval(60); //1분간 아이디 유지

%>
<script>
alert("로그인 성공")
location.href='<%=request.getContextPath()%>/mypage.jsp';
</script>
<%
} else if(ok==2) {
	System.out.println("비밀번호불일치");
	
%>
<script>
alert("비밀번호가 일치하지 않습니다.")
location.href='<%=request.getContextPath()%>/caregiverLogin.jsp';
</script>
<%
}
else if(ok==3) {
	System.out.println("ID불일치");
	
%>
<script>
alert("아이디가 일치하지 않습니다.")
location.href='<%=request.getContextPath()%>/caregiverLogin.jsp';
</script> 
<% }%>
</body>
</html>