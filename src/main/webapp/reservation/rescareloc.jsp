<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간병장소 정하기</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String m_id = (String)session.getAttribute("m_id");
String caretaker_code = (String)session.getAttribute("caretaker_code");
String res_code = (String)session.getAttribute("res_code");

%>

<form id="formA" action="insertloc.jsp" method="post">
	<input type="hidden" name="home" value="home">
	<input type="button" value="집" onclick="insertValue('home')">
</form>

<form id="formB" action="reshospital.jsp" method="post">
	<input type="hidden" name="hospital" value="hospital">
	<input type="button" value="병원" onclick="insertValue('hospital')">
</form>

</body>

<script>
function insertValue(value) {
    var form;
    if (value === 'home') {
        form = document.getElementById('formA');
    } else if (value === 'hospital') {
        form = document.getElementById('formB');
    }

    // 폼을 서버로 전송 (form.submit() 호출)
    form.submit();
}

</script>
</html>