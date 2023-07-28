<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function loginForm() {
	var loginForm = document.frmLogin;
	var id = document.frmLogin.patient_id.value;
	var pwd = document.frmLogin.patient_pw.value;
	
	if(!id || !pwd) {
		alert("아이디와 비밀번호를 모두 입력해주세요.")
	}
	else {
		loginForm.action="login_check.jsp";
		loginForm.submit();
	}
}
</script>

</head>
<body>
<h1> 로그인 </h1>
<table>
<form name ="frmLogin" method="post" onsubmit="return loginForm();">
<tr>
<td>아이디 </td> 
<td><input type="text" name="patient_id"></td></tr>
<tr>
<td>비밀번호 </td>
<td><input type="password" name="patient_pw"></td></tr>
<tr>
<td></td>
<td><input type="submit" value="로그인">
<input type="reset" value="초기화"></form></td></tr>
</table>



</body>
</html>