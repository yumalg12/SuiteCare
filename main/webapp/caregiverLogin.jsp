<<<<<<< HEAD:main/webapp/caregiverLogin.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>SC 스위트케어 | 로그인</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

=======
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
	<script src="https://kit.fontawesome.com/d75ead5752.js"></script>
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
>>>>>>> parent of e2fd0b3 (no message):main/webapp/careGiver/caregiverLogin.jsp
<script>
function loginForm() {
	var loginForm = document.frmLogin;
	var id = document.frmLogin.id.value;
	var pw = document.frmLogin.pw.value;
	
	if(!id || !pw) {
		alert("아이디와 비밀번호를 모두 입력해주세요.")
	}
	else {
<<<<<<< HEAD:main/webapp/caregiverLogin.jsp
		loginForm.action="./patientCheck.jsp";
=======
		loginForm.action="./caregiverCheck.jsp";
>>>>>>> parent of e2fd0b3 (no message):main/webapp/careGiver/caregiverLogin.jsp
		loginForm.submit();
	}
}
</script>
<<<<<<< HEAD:main/webapp/caregiverLogin.jsp
</head>
<body>
	<%@ include file="/header.jsp"%>

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Eleifend vitae urna</p>
				<h2>Suite Care</h2>
			</header>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>간병인 등록하기</p>
						<h2>로그인</h2>
					</header>
						<div class="form_wrapper">
					<form name="frmLogin" method="post" onsubmit="return loginForm();">

							<div class="form-row">
								<input type="text" class="form-control" placeholder="아이디"
									name="id"> <br>
							</div>
							<div class="form-row">
								<input type="password" class="form-control" placeholder="비밀번호"
									name="pw"> <br>
							</div>
							<div class="form_button" >
								<button type="submit" class="button special">로그인</button>
								<span class="button alt" onclick="location.href='caregiverSignup.jsp'">회원가입</span>
							</div>
					</form>
					
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>

	<%@ include file="/footer.jsp"%>


=======


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
>>>>>>> parent of e2fd0b3 (no message):main/webapp/careGiver/caregiverLogin.jsp
</body>
</html>