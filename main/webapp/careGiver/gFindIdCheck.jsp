<%@ page import = "caregiver.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디확인</title>
</head>
<body>
<% 

request.setCharacterEncoding("utf-8");

%>
<%
String name = request.getParameter("name");
String phone = request.getParameter("phone");

findDAO dao = new findDAO();

int ok1 = dao.cIdcheck(name, phone);
System.out.println("ok = " + ok1);


if(ok1== 1) {
	String find_id = dao.cFindId(name, phone);
	//System.out.println(find_id);

%>
<script>
alert("회원님의 아이디는 <%=find_id%>입니다.");
location.href='<%=request.getContextPath()%>/caregiverLogin.jsp';
</script>
<%
} else if(ok1==2) {
	System.out.println("이름 불일치");
	
%>
<script>
alert("이름정보가 다릅니다.")
location.href='<%=request.getContextPath()%>/cFindId.jsp';
</script>
<%
} else if(ok1==3) {
	System.out.println("휴대전화 정보 불일치");
	
%>
<script>
alert("휴대전화 정보가 없습니다.")
location.href='<%=request.getContextPath()%>/cFindId.jsp';
</script>
<% } 

%>
</body>
</html>