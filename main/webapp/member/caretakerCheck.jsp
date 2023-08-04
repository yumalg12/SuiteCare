<%@ page import = "member.*" %>
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
String m_id = request.getParameter("m_id");
String m_pw = request.getParameter("m_pw");


MemberDAO dao = new MemberDAO();

int ok = dao.logincheck(m_id, m_pw);
System.out.println("ok = " + ok);

MemberVO vo = new MemberVO();

if(ok== 1) {
	vo = dao.userLogin(m_id, m_pw);
	session.setAttribute("m_id", vo.getM_id());
	//session.setMaxInactiveInterval(60); //1분간 아이디 유지

%>
<script>
alert("로그인 성공")
location.href='<%=request.getContextPath()%>/member/mMain.jsp';
</script>
<%
} else if(ok==2) {
	System.out.println("비밀번호불일치");
	
%>
<script>
alert("비밀번호가 일치하지 않습니다.")
location.href='<%=request.getContextPath()%>/caretakerLogin.jsp';
</script>
<%
}
else if(ok==3) {
	System.out.println("ID불일치");
	
%>
<script>
alert("아이디가 일치하지 않습니다.")
location.href='<%=request.getContextPath()%>/caretakerLogin.jsp';
</script> 
<% }%>
</body>
</html>