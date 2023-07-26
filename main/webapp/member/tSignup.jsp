<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>SC 스위트케어 | 회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
	</head>
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/suiteCare/assets/js/execDaumPostcode.js"></script>

<%@ include file="/header.jsp" %>

<style>
.addr-label{
	margin-left: 1.5rem;
	margin-top: 0.5rem;
	font-weight: 400;
}
</style>

<script>

function signUp() {
	//지금 이 검증함수 실행 안 하고 바로 membersignup 서블릿으로 넘어가는 중 (개발중이라서)
    let id = document.patientSignup.id.value;
    let pw = document.patientSignup.pw.value;

    if (!(document.patientSignup.id.readOnly)) {
            alert("아이디 중복확인이 필요합니다.");
            setTimeout(function () { $("#duplicateID").focus(); }, 100);
        } else {
             	if ($(".wrongPWCheck").is(":visible")) {
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
	//체크박스에 따라 DB에 넘어갈 값 변경
	if (document.patientSignup.email_switch.checked){
		document.getElementById("email_switch_text").innerHTML = "Yes";
		document.patientSignup.memail_yn.value = "Y";
	} else {
		document.getElementById("email_switch_text").innerHTML = "No";
		document.patientSignup.memail_yn.value = "N";			
	}
}

function setSMSYN() {
	//체크박스에 따라 DB에 넘어갈 값 변경
	if (document.patientSignup.sms_switch.checked){
		document.getElementById("sms_switch_text").innerHTML = "Yes";
		document.patientSignup.msms_yn.value = "Y";
	} else {
		document.getElementById("sms_switch_text").innerHTML = "No";
		document.patientSignup.msms_yn.value = "N";			
	}
}

function isDuplicateID() {
	//중복확인 함수
	let _id = $("#id").val();
	
	if (!(_id)){
	    alert("올바른 아이디를 입력하십시오.");
	    setTimeout(function () { $("#id").focus(); }, 100);
	} else {
		 $.ajax({
		        type: "post",
		        async: false,
		        url: "/suiteCare/membersignup",
		        dataType: "json",
		        data: {id: _id, type: "isDuplicateID"},
		        success: function(data, textStatus) {
		        	console.log(data.isDuplicateID);
		            if (data.isDuplicateID == 0) {
		                alert("사용할 수 있는 ID입니다.");
		                $("#id").prop("readonly", true);
		            } else if (data.isDuplicateID == 1) {
		                alert("사용할 수 없는 ID입니다.");
		        	    setTimeout(function () { $("#id").focus(); }, 100);
		            } else {
		            	console.log("count: -1 (error)");
		                alert("오류가 발생했습니다.");
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

function setAddress() {
	//주소를 한 input으로 합치는 함수
    let zipcode = document.patientSignup.zipcode.value;
    let jibunAddress = document.patientSignup.jibunAddress.value;
    let roadAddress = document.patientSignup.roadAddress.value;
    let namujiAddress = document.patientSignup.namujiAddress.value;
    
    if (!roadAddress){
	    document.patientSignup.address.value = "(우) " + zipcode + " " + jibunAddress + " " + namujiAddress;
    } else {
	    document.patientSignup.address.value = "(우) " + zipcode + " " + roadAddress + " " + namujiAddress;    	
    }
    
    console.log(document.patientSignup.address.value);
}

</script>

	<body>

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>adsfasdfsdf</p>
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
						<h2>회원가입</h2>
					</header>

	<!-- form 시작 -->
	<form name="patientSignup" method="POST" action="/suiteCare/membersignup">
		<div class="form_wrapper">
			<div class="form_row">
				<label for="id">아이디</label> <div class="form_row_sub"><input 
				type="text" id="id" name="mid" required maxlength="20">
				<span class="button default" onclick="javascript:isDuplicateID()">중복확인</span></div>
			</div>
			<div class="form_row">
				<label for="pw">비밀번호</label> <input 
				type="password" id="pw" name="mpw" required>
			</div>
			<div class="form_row">
				<label for="pw">비밀번호 확인</label> <input 
				type="password" id="pw_check" required>
				<span class="wrongPWCheck"></span><span class="wrongPWCheck"><i class="fa-solid fa-circle-exclamation"></i> 비밀번호 확인이 일치하지 않습니다.</span>
			</div>
			<div class="form_row">
				<label for="name">이름</label> <input 
				type="text" id="name" name="mname" required>
			</div>
			<div class="form_row">
				<label for="gender">성별</label> <select id="gender" name="mgender">
					<option value="">성별 선택</option>
					<option value="여성">여성</option>
					<option value="남성">남성</option>
				</select>
			</div>
			<div class="form_row">
				<label for="phone">휴대폰 번호</label> <input 
				type="tel" id="phone" name="mphone"
					pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
			</div>
			<div class="form_row">
				<label for="email">이메일</label> <input class="form-control"
					type="email" id="email" name="memail" required>
			</div>
			<div class="form_row">
			    <label>주소</label>
				<span class="button default" onClick="javascript:execDaumPostcode()">주소검색</span>
				<label class="addr-label">우편번호</label><input type="text" id="zipcode" pattern="[0-9]{5}" maxlength="5" onInput="javascript:setAddress()" required>
				<label class="addr-label">지번 주소</label><input type="text" id="jibunAddress" onInput="javascript:setAddress()" required>
				<label class="addr-label">도로명 주소</label><input type="text" id="roadAddress" onInput="javascript:setAddress()" required>
				<label class="addr-label">나머지 주소</label><input type="text" id="namujiAddress" onInput="javascript:setAddress()" required>
			<input type="hidden" id="address" name="maddress" value="">
			</div>
			<div class="form_row">
				<label for="sms_yn">SMS 수신 여부</label>
				<div onclick="javascript:setSMSYN()">
					<input type="checkbox" id="sms_switch" checked><label for="sms_switch" id="sms_switch_text" style="margin:0.3rem 0 0 0;">Yes</label>
					<input type="hidden" id="sms_yn" name="msms_yn" value="Y"/>
				</div>
			</div>
			<div class="form_row">
				<label for="email_yn">이메일 수신 여부</label>
				<div onclick="javascript:setEmailYN()">
					<input type="checkbox" id="email_switch" checked><label for="email_switch" id="email_switch_text" style="margin:0.3rem 0 0 0;">Yes</label>
					<input type="hidden" id="email_yn" name="memail_yn" value="Y"/>
				</div>
			</div>
			<div class="form_button">
			<input type="hidden" name="type" value="signUp">
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