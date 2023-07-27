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
		<link rel="stylesheet" href="../assets/css/main.css" />
<script>

function signUp() {
    let userID = document.patientSignup.userID.value;
    let userPW = document.patientSignup.userPW.value;

    if (!(document.patientSignup.userID.readOnly)) {
            alert("이메일 중복확인이 필요합니다.");
            setTimeout(function () { $("#duplicateID").focus(); }, 100);
        } else {
             	if ($("#wrongPWCheck").is(":visible")) {
                     alert("비밀번호 확인이 일치하지 않습니다.");
                     setTimeout(function () { $("#checkPW").focus(); }, 100);
                 } else {
                     $(".wrongNotice").hide();
                     document.patientSignup.method = "post";
                     document.patientSignup.action = "signup?page=caretaker";
                     document.patientSignup.submit();
                 }
             }
}


function setEmailYN() {
	if (document.patientSignup.email_switch.checked){
		document.patientSignup.email_yn.value = "Y";
	} else {
		document.patientSignup.email_yn.value = "N";			
	}
	console.log(document.patientSignup.email_yn.value);
}

function setSMSYN() {
	if (document.patientSignup.sms_switch.checked){
		document.patientSignup.sms_YN.value = "Y";
	} else {
		document.patientSignup.sms_yn.value = "N";			
	}
	console.log(document.patientSignup.sms_yn.value);
}

function duplicateID() {
	let _userID = $("#userID").val();
	
	if (!IDValidation(_userID)){
	    alert("올바른 이메일 아이디를 입력하십시오.");
	    $("#wrongID").show();
	    setTimeout(function () { $("#userID").focus(); }, 100);
	} else {
		 $.ajax({
		        type: "post",
		        async: false,
		        url: "",
		        dataType: "json",
		        data: {userID: _userID},
		        success: function(data, textStatus) {
		        	console.log(data.isEmailDuplicate);
		            if (data.isEmailDuplicate == false) {
		                alert("사용할 수 있는 ID입니다.");
		                $("#userID").prop("readonly", true);
		            } else {
		                alert("사용할 수 없는 ID입니다.");
		        	    setTimeout(function () { $("#userID").focus(); }, 100);
		            }
		        },
		        error: function(data, textStatus) {
		        	console.log("data: "+ data +" / textStatus: "+textStatus);
		            alert("오류가 발생했습니다.");
		        },
		        complete: function(data, textStatus) {
		        }
		    });
	}
}

</script>

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
	<form name="patientSignup" method="POST" action="membersignup">
		<div class="form_wrapper">
			<div class="form_row">
				<label for="id">아이디</label> <div class="form_row_sub"><input class="form-control" 
				type="text" id="id" name="id" required>
				<span class="button default">중복확인</span></div>
			</div>
			<div class="form_row">
				<label for="pw">비밀번호</label> <input class="form-control" 
				type="password" id="pw" name="pw" required>
			</div>
			<div class="form_row">
				<label for="pw">비밀번호 확인</label> <input class="form-control" 
				type="password" id="pw_check" required>
			</div>
			<div class="form_row">
				<label for="name">이름</label> <input class="form-control" 
				type="text" id="name" name="name" required>
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
					pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
			</div>
			<div class="form_row">
				<label for="email">이메일</label> <input class="form-control"
					type="email" id="email" name="email" required>
			</div>
			<div class="form_row">
				<label for="address">주소</label> <div class="form_row_sub"><input class="form-control input_with_button"
					type="text" id="address" name="address"><span class="button default">주소검색</span>
			</div></div>
			<div class="form_row">
				<label for="sms_yn">SMS 수신 여부</label>
					<input type="checkbox" id="sms_switch" onclick="javascript:setSMSYN()">
					<input type="hidden" id="sms_yn" name="sms_yn" value="N"/>
			</div>
			<div class="form_row">
				<label for="email_yn">이메일 수신 여부</label>
					<input type="checkbox" id="email_switch" onclick="javascript:setEmailYN()">
					<input type="hidden" id="email_yn" name="email_yn" value="N"/>
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