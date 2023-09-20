<%@ page import = "member.*" %>
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

String name = request.getParameter("name");
String phone = request.getParameter("phone");

findDAO dao = new findDAO();

String find_id = dao.pFindId(name, phone);

out.print("<script>");
if (find_id != null && !find_id.equals("") && !find_id.equals("null")){
	out.print("alert('회원님의 아이디는 "+find_id+"입니다.');");
	out.print("location.href='"+request.getContextPath()+"/member/mLogin.jsp';");
} else {
	System.out.println("이름 불일치");	
	out.print("alert('입력한 정보와 일치하는 가입정보가 없습니다.');");
	out.print("location.href='"+request.getContextPath()+"/member/tFindId.jsp';");
 } 
out.print("</script>");
%>
</body>
</html>