<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE HTML>
<html>
<head>
<title>SC 스위트케어 | 일반 본문</title>
	<%@ include file="/header-import.jsp"%>

<script>
<%String g_id = (String) session.getAttribute("g_id");
String m_id = (String) session.getAttribute("m_id");%>

console.log("<%=g_id%>");
if ("<%=g_id%>" != "null") {
	window.location.href="gMain.jsp";
}

function loginForm() {
	var loginForm = document.frmLogin;
	var id = document.frmLogin.g_id.value;
	var pw = document.frmLogin.g_pw.value;
	
	if(!id || !pw) {
		alert("아이디와 비밀번호를 모두 입력해주세요.")
	}
	else {
		loginForm.action="./gCheck.jsp";
		loginForm.submit();
	}
}
</script>

<style>
.form_button a {
cursor: pointer;
}
.form_button a:hover {
text-decoration: underline;
}
</style>
</head>

<body>
<% if(m_id!=null) {
	%><script> 
	 var confirmed = confirm("기존 로그인된 계정에서 로그아웃합니다. \n계속하시겠습니까?");
     if (confirmed) {
         window.location.href = "../logout.jsp"; // 로그아웃 처리 페이지로 이동
     }else {
    	    window.location.href = "<%=context%>/member/main"; 
     }
	</script>
<% } else {%>
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
							<div class="form_row">
								<label>아이디</label>
								<input type="text" class="form-control" placeholder="아이디" name="g_id">
							</div>
							<div class="form_row">
								<label>비밀번호</label>
								<input type="password" class="form-control" placeholder="비밀번호" name="g_pw">
							</div>
							<div class="form_button" >
								<button type="submit" class="button special">로그인</button>
								<span class="button alt" onclick="location.href='<%=context%>/careGiver/join'">회원가입</span>
							</div>
					</form>
					<div class="form_button" >
								<a onclick="location.href='gFindId.jsp'">아이디찾기</a>&nbsp;
								<a onclick="location.href='gFindPw.jsp'">비밀번호찾기</a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="/footer.jsp"%>

<% } %>
</body>
</html>