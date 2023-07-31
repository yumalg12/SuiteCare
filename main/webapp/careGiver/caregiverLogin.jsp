 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>


	<!--          meta 선언          -->
	<meta charset="UTF-8">
	<meta name = "viewport" content="width=device-width", initial-scale="1"> 

	<!--          link 선언          -->
	<link rel="stylesheet" href="./css/bootstrap.css">
	<link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/style_index.css">

	<!--          script 선언          -->
	<script src="js/bootstrap.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="./js/script.js"></script>

<style>
.navbar{
	background-color: white;
	border: none;
	padding: 10px;
	margin: 10px;
	margin-left: 70px;
    margin-right: 70px;
}

.btn {
	background-color: #3F2305;
	border: none;
}
.btn-primary:hover {
  	color: #fff;
  	background-color: #DFD7BF;
}
</style>

<title>스위트 케어</title>
</head>
<body>
<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class = "navbar-brand" href="index.jsp">SC 스위트케어</a>
		</div>
		
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="patientLogin.jsp">간병인찾기</a>
				<li><a href="caregiverLogin.jsp">간병일감찾기</a>
				<li><a href="customerServiceCenter.jsp">고객센터</a>
			</ul>
		</div>
</nav>
<hr>
<script>
function loginForm() {
	var loginForm = document.frmLogin;
	var id = document.frmLogin.id.value;
	var pw = document.frmLogin.pw.value;
	
	if(!id || !pw) {
		alert("아이디와 비밀번호를 모두 입력해주세요.")
	}
	else {
		loginForm.action="./caregiverCheck.jsp";
		loginForm.submit();
	}
}
</script>


<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron" style="padding-top: 20px;">
			<form name="frmLogin" method="post" onsubmit="return loginForm();">
				<h3 style="text-align:center;">간병인 로그인</h3><br/>
				<div class="form-group">		
					<input type="text" class = "form-control" placeholder="아이디" name="id"/> <br>
    			</div>
    			<div class="form-group">
    				<input type="password" class = "form-control" placeholder="비밀번호" name="pw"/> <br>
    			</div>
    			<input type="submit" class="btn btn-primary form-control" value="로그인"/>
			</form>	<br>
					
    		<form name="registform" action = "regist.jsp" method=post>
    		<input type="submit" class="btn btn-primary form-control" value="회원가입" />
    		</form>	<br>
    		
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		<a href="cFindId.jsp">아이디 찾기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="cFindPw.jsp">비밀번호 찾기</a><br>
    				
		</div>
	</div>
</div>
</body>
</html>