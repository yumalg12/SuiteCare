<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스위트 케어 | 회원가입</title>
<%@include file="header.jsp"%>
</head>

<style>
.form_wrapper {
	width: 50%;
	margin: 0 auto;
	max-width: 576px;
}

.form_row {
	margin-left: 0;
	margin-right: 0;
	margin-bottom: 2rem;
	display: grid;
	grid-template-columns: 0.5fr 1fr;
}

.form_btn {
	text-align: center;
	margin: 3rem 0;
}

.with_btn {
width: calc(100% - 90px);
    display: inline;
    margin-right: 5px;
    }
</style>
<body>
<%String id = request.getParameter("id"); %>
	<!-- form 시작 -->
	<form method="POST" action="/signuptest.jsp">
		<div class="form_wrapper">
			<h1>회원가입</h1>
			<div class="form_row">
				<label for="id">아이디</label>
				<div>
					<input class="form-control with_btn" type="text" id="id" name="id" disabled value="<%=id %>"><span class="btn btn-line-primary">중복확인</span></div>
			</div>
			<div class="form_row">
				<label for="pw">비밀번호</label>
				<input class="form-control" type="password" id="pw" name="pw" disabled>
			</div>
			<div class="form_row">
				<label for="name">이름</label> <input class="form-control" type="text"
					id="name" name="name" disabled>
			</div>
			<div class="form_row">
				<label for="gender">성별</label> <select class="form-control"
					id="gender" name="gender">
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
				<label for="address">주소</label> <div><input class="form-control with_btn"
					type="text" id="address" name="address"><span class="btn btn-line-primary">주소검색</span>
			</div></div>
			<div class="form_row">
				<label for="sms_yn">SMS 수신 여부</label> <input class=""
					type="checkbox" id="sms_yn" name="sms_yn">
			</div>
			<div class="form_row">
				<label for="email_yn">이메일 수신 여부</label> <input class=""
					type="checkbox" id="email_yn" name="email_yn">
			</div>

		</div>

	</form>
	<!-- form 끝 -->
	
	<script>
	
	
	
	</script>
	
	
	<%@include file="footer.jsp"%>
</body>
</html>