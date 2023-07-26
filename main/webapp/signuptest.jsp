<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>SC 스위트케어 | 회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
	</head>

	<body>
<%@ include file="/header.jsp" %>

		<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>간병 서비스를 제공받을 분</p>
						<h2>회원가입</h2>
					</header>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>회원가입</p>
								<h2>필수정보</h2>
							</header>

	<!-- form 시작 -->
	
	<%String id = request.getParameter("id");
	String pw = request.getParameter("pw");%>
	
	
	<form name="patientSignup" method="POST" action="signuptest.jsp">
		<div class="form_wrapper">
			<div class="form_row">
				<label for="id">아이디</label> <div class="form_row_sub"><input class="form-control" 
				type="text" id="id" name="id" disabled value="<%=id %>">
				<span class="button default">중복확인</span></div>
			</div>
			<div class="form_row">
				<label for="pw">비밀번호</label> <input class="form-control" 
				type="password" id="pw" name="pw" disabled value="<%=pw %>">
			</div>
			<div class="form_row">
				<label for="name">이름</label> <input class="form-control" 
				type="text" id="name" name="name" disabled>
			</div>
			<div class="form_row">
				<label for="gender">성별</label> <select class="form-control" id="gender" name="gender">
					<option value="">성별</option>
					<option value="male">남성</option>
					<option value="female">여성</option>
				</select>
			</div>
			<div class="form_row">
				<label for="phone">휴대폰 번호</label> <input class="form-control" 
				type="tel" id="phone" name="phone"
					pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" disabled>
			</div>
			<div class="form_row">
				<label for="email">이메일</label> <input class="form-control"
					type="email" id="email" name="email" disabled>
			</div>
			<div class="form_row">
				<label for="address">주소</label> <div class="form_row_sub"><input class="form-control input_with_button"
					type="text" id="address" name="address"><span class="button default">주소검색</span>
			</div></div>
			<div class="form_row">
				<label for="sms_yn">SMS 수신 여부</label>
					<input type="checkbox" id="sms_switch">
					<input type="hidden" id="sms_yn" name="sms_yn" onclick="javascript:setSMSYN()"/>
			</div>
			<div class="form_row">
				<label for="email_yn">이메일 수신 여부</label>
					<input type="checkbox" id="email_switch" onclick="javascript:setEmailYN()">
					<input type="hidden" id="email_yn" name="email_yn"/>
			</div>
			<div class="form_button">
				<button type="submit" class="button special">회원가입</button>
			</div>
		</div>

	</form>
	<!-- form 끝 -->
	
						</div>
					</div>
				</div>
			</section>

<%@ include file="/footer.jsp" %>


	</body>
</html>