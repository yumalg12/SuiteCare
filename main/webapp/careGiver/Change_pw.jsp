<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경 | SC 스위트케어</title>
<%@ include file="/header-import.jsp"%>

<script>
	function len_pw(pw) {
		if (pw.length < 4) {
			alert("4자리 이상의 비밀번호를 설정해주세요.")
			return false;
		} else {
			return true;
		}
	}

	function validateForm() {
		console.log('확인');
		var new_pw = document.pwUpdate.new_pw.value;
		var pw_che = document.pwUpdate.pw_che.value;

		if (len_pw(new_pw)) {
			if (new_pw == pw_che) {
				return true;
			} else {
				alert("변경할 비밀번호가 일치하지 않습니다.");
				return false;
			}
		} else {
			return false;
		}
	}
</script>
</head>

<body style="margin: 20% auto;">
	
	<header class="align-center">
		<h2>비밀번호 변경</h2>
	</header>
	<form name="pwUpdate" action=${context}/suiteCare/caregiver/info
		method=post onSubmit="return validateForm();"
		style="text-align: center;">
		<div class="form_row">
			<label>현재 비밀번호</label><input type="password" name="origin_pw"
				id="origin_pw" class="pw" placeholder="현재 비밀번호">

		</div>
		<div class="form_row">
			<label>새 비밀번호</label><input type="password" name="new_pw" id="new_pw"
				class="pw" placeholder="새 비밀번호"> <label>새 비밀번호 확인</label><input
				type="password" name="pw_che" id="pw_che" class="pw"
				placeholder="새 비밀번호 확인">
		</div>
		<input type="hidden" name="command" value="pw_change">

		<div class="form_button">
			<span class="button alt" onclick="javascript:window.close();">취소</span>
			<input type="submit" class="button special" value="변경">
		</div>
	</form>

</body>
</html>

<style>
body {
	width: 400px;
	height: 300px;
	margin: 4% auto;
}

h1 {
	text-align: center;
	font-size: 45px;
}

table {
	margin: 0 auto;
	font-size: 20px;
}

.pw {
	height: 40px;
	width: 220px;
}
</style>