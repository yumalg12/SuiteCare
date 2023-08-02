<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE HTML>
<html>
<head>
<<<<<<< HEAD:main/webapp/patientLogin.jsp
<<<<<<< HEAD:main/webapp/patientLogin.jsp
<title>SC 스위트케어 | 로그인</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
=======
<title>SC 스위트케어 | 일반 본문</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../assets/css/main.css" />
>>>>>>> parent of e2fd0b3 (no message):main/webapp/member/caretakerLogin.jsp
=======
<title>SC 스위트케어 | 일반 본문</title>
	<%@ include file="/header-import.jsp"%>
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4:main/webapp/member/caretakerLogin.jsp

<script>
function loginForm() {
	var loginForm = document.frmLogin;
	var m_id = document.frmLogin.m_id.value;
	var m_pw = document.frmLogin.m_pw.value;
	
	if(!m_id || !m_pw) {
		alert("아이디와 비밀번호를 모두 입력해주세요.")
	}
	else {
		loginForm.action="./caretakerCheck.jsp";s
		loginForm.submit();
	}
}
</script>
</head>
<body>
<<<<<<< HEAD:main/webapp/patientLogin.jsp
<<<<<<< HEAD:main/webapp/patientLogin.jsp
=======

>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4:main/webapp/member/caretakerLogin.jsp
	<%@ include file="/header.jsp"%>
=======

	<%@ include file="../header.jsp"%>
>>>>>>> parent of e2fd0b3 (no message):main/webapp/member/caretakerLogin.jsp

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
						<p>간병인 찾기</p>
						<h2>로그인</h2>
					</header>
						<div class="form_wrapper">
					<form name="frmLogin" method="post" onsubmit="return loginForm();">

<<<<<<< HEAD:main/webapp/patientLogin.jsp
							<div class="form-row">
								<input type="text" class="form-control" placeholder="아이디"
<<<<<<< HEAD:main/webapp/patientLogin.jsp
									name="id"> <br>
							</div>
							<div class="form-row">
								<input type="password" class="form-control" placeholder="비밀번호"
									name="pw"> <br>
=======
									name="m_id"> <br>
							</div>
							<div class="form-row">
								<input type="password" class="form-control" placeholder="비밀번호"
									name="m_pw"> <br>
>>>>>>> parent of e2fd0b3 (no message):main/webapp/member/caretakerLogin.jsp
=======
							<div class="form_row">
								<label>아이디</label><input type="text" class="form-control" placeholder="아이디"
									name="m_id">
							</div>
							<div class="form_row">
								<label>비밀번호</label><input type="password" class="form-control" placeholder="비밀번호"
									name="m_pw">
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4:main/webapp/member/caretakerLogin.jsp
							</div>
							<div class="form_button" >
								<button type="submit" class="button special">로그인</button>
								<span class="button alt" onclick="location.href='tSignup.jsp'">회원가입</span>
							</div>
					</form>
					
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="/footer.jsp"%>


</body>
</html>