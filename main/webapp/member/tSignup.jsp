<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>SC 스위트케어 | 회원가입</title>
<<<<<<< HEAD
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />

	</head>
=======
<%@ include file="/header-import.jsp" %>
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/suiteCare/assets/js/execDaumPostcode.js"></script>

<<<<<<< HEAD
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
    let id = document.tSignup.m_id.value;
    let pw = document.tSignup.m_pw.value;

    if (!(document.tSignup.id.readOnly)) {
            alert("아이디 중복확인이 필요합니다.");
            setTimeout(function () { $("#duplicateID").focus(); }, 100);
        } else {
             	if ($(".wrongPWCheck").is(":visible")) {
                     alert("비밀번호 확인이 일치하지 않습니다.");
                     setTimeout(function () { $("#checkPW").focus(); }, 100);
                 } else {
                     $(".wrongNotice").hide();
                     document.tSignup.method = "post";
                     document.tSignup.action = "signup?page=caretaker";
                     document.tSignup.submit();
                 }
             }
=======
<script>
function signUpValidation() {
	  const id = $("#id").val().trim();
	  const name = $("#name").val().trim();
	  const pw = $("#pw").val();

	  // 중복 확인 검사
	  if (!$("#id").prop("disabled")) {
	    alert("아이디 중복확인이 필요합니다.");
	    $("#duplicateID").focus();
	    return false;
	  }

	  // 이름 검사
	  if (name.length < 2) {
	    alert("올바른 이름을 입력하십시오.");
	    $("#name").focus();
	    return false;
	  }

	  // 비밀번호 유효성 검사
	  if (pw.length < 4) {
	    alert("비밀번호는 4자리 이상이어야 합니다.");
	    $(".pw_check_notice").show();
	    $("#pw").focus();
	    return false;
	  }

	  // 비밀번호 확인 검사
	  if (!PWValidation()) {
	    alert("비밀번호 확인이 일치하지 않습니다.");
	    $(".pw_check_notice").show();
	    $("#pw").focus();
	    return false;
	  }

	  // 성별 검사
	  if ($("#gender").val() == "") {
	    alert("성별을 선택하십시오.");
	    $("#gender").focus();
	    return false;
	  }

	  // 모든 검증 통과
	  document.tSignupForm.method = "post";
	  document.tSignupForm.action = "/suiteCare/membersignup";
	  document.tSignupForm.submit();
	  return true;
	}

function PWValidation(){
	//비밀번호 확인 검사
	let pw = $("#pw").val();
	let pwcheck = $("#pw_check").val();
	
	if (pw != pwcheck) {		
		$(".pw_check_notice").show();
		return false;
	} else {
		$(".pw_check_notice").hide();
		return true;
	}
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
}


function setEmailYN() {
	//체크박스에 따라 DB에 넘어갈 값 변경
<<<<<<< HEAD
	if (document.tSignup.email_switch.checked){
		document.getElementById("email_switch_text").innerHTML = "Yes";
		document.tSignup.m_email_yn.value = "Y";
	} else {
		document.getElementById("email_switch_text").innerHTML = "No";
		document.tSignup.m_email_yn.value = "N";			
=======
	if (document.tSignupForm.email_switch.checked){
		document.getElementById("email_switch_text").innerHTML = "Yes";
		document.tSignupForm.m_email_yn.value = "Y";
	} else {
		document.getElementById("email_switch_text").innerHTML = "No";
		document.tSignupForm.m_email_yn.value = "N";			
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
	}
}

function setSMSYN() {
	//체크박스에 따라 DB에 넘어갈 값 변경
<<<<<<< HEAD
	if (document.tSignup.sms_switch.checked){
		document.getElementById("sms_switch_text").innerHTML = "Yes";
		document.tSignup.msms_yn.value = "Y";
	} else {
		document.getElementById("sms_switch_text").innerHTML = "No";
		document.tSignup.msms_yn.value = "N";			
	}
}

function isDuplicateID() {
	//중복확인 함수
	let _id = $("#id").val();
	
	if (!(_id)){
	    alert("올바른 아이디를 입력하십시오.");
=======
	if (document.tSignupForm.sms_switch.checked){
		document.getElementById("sms_switch_text").innerHTML = "Yes";
		document.tSignupForm.m_sms_yn.value = "Y";
	} else {
		document.getElementById("sms_switch_text").innerHTML = "No";
		document.tSignupForm.m_sms_yn.value = "N";			
	}
}

function setID() {
	//ID 입력값을 정리하기 위함
	let id = $("#id").val();
	let m_id = $("#m_id").val();
	m_id = id.trim().toLowerCase();
	console.log(m_id);
}


function isDuplicateID() {
	//중복확인 함수
	let _id = $("#id").val();
	let m_id = "";
	let regExp = /^[a-z0-9_.]{4,}$/;
	
	if (!regExp.test(_id)){
	    alert("ID는 4자 이상의 영문, 숫자로 이루어진 문자여야 합니다.");
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
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
<<<<<<< HEAD
		                $("#id").prop("readonly", true);
=======
		                m_id = _id.trim().toLowerCase();
		                $("#m_id").val(m_id);
		                $("#id").prop("disabled", true);
		                console.log(m_id);
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
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
    let zipcode = document.getElementById("zipcode").value;
    let jibunAddress = document.getElementById("jibunAddress").value;
    let roadAddress = document.getElementById("roadAddress").value;
    let namujiAddress = document.getElementById("namujiAddress").value;
    
    if (!roadAddress){
<<<<<<< HEAD
    	document.tSignup.m_address.value = "(우) " + zipcode + " " + jibunAddress + " " + namujiAddress;
    } else {
    	document.tSignup.m_address.value = "(우) " + zipcode + " " + roadAddress + " " + namujiAddress;    	
    }
    
    console.log(document.tSignup.m_address.value);
}

</script>

	<body>
=======
    	document.tSignupForm.m_address.innerHTML = "(우) " + zipcode + " " + jibunAddress + " " + namujiAddress;
    } else {
    	document.tSignupForm.m_address.innerHTML = "(우) " + zipcode + " " + roadAddress + " " + namujiAddress;    	
    }
    
    console.log(document.tSignupForm.m_address.innerHTML);
}

</script>
	</head>

	<body>
<%@ include file="/header.jsp" %>
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4

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
<<<<<<< HEAD
	<form name="tSignup" method="POST" action="/suiteCare/membersignup">
		<div class="form_wrapper">
			<div class="form_row">
				<label for="id">아이디</label> <div class="form_row_sub"><input 
				type="text" id="id" name="m_id" required maxlength="20">

				<span class="button default" onclick="javascript:isDuplicateID()">중복확인</span></div>
			</div>
			<div class="form_row">
				<label for="pw">비밀번호</label> <input type="password" id="pw" name="m_pw" required>

			</div>
			<div class="form_row">
				<label for="pw">비밀번호 확인</label> <input 
				type="password" id="pw_check" required>
				<span class="wrongPWCheck"></span><span class="wrongPWCheck"><i class="fa-solid fa-circle-exclamation"></i> 비밀번호 확인이 일치하지 않습니다.</span>
			</div>
			<div class="form_row">
				<label for="name">이름</label> <input type="text" id="name" name="m_name" required>
			</div>
			<div class="form_row">
				<label for="gender">성별</label> <select id="gender" name="m_gender">

					<option value="">성별 선택</option>
					<option value="여성">여성</option>
					<option value="남성">남성</option>
				</select>
			</div>
			<div class="form_row">
				<label for="phone">휴대폰 번호</label> <input type="tel" id="phone" name="m_phone"

					pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
			</div>
			<div class="form_row">
				<label for="email">이메일</label> <input class="form-control" type="email" id="email" name="m_email" required>

=======
	<form name="tSignupForm" action="javascript: signUpValidation();">
		<div class="form_wrapper">
			<div class="form_row">
				<label for="id">아이디</label> <div class="form_row_sub">
				<input type="text" id="id" placeholder="아이디 (영문, 숫자 4~20자)" title="아이디 (영문, 숫자 4~20자)" maxlength="20" required>
				<input type="hidden" id="m_id" name="m_id">
				<span class="button default" onclick="javascript:isDuplicateID()">중복확인</span></div>
			</div>
			<div class="form_row">
				<label for="pw">비밀번호</label> <input type="password" id="pw" name="m_pw" placeholder="비밀번호 (4자 이상)" title="비밀번호 (4자 이상)" oninput="javascript:PWValidation();" required>

			</div>
			<div class="form_row">
				<label for="pw">비밀번호 확인</label>
				<input type="password" id="pw_check" placeholder="비밀번호 확인 (비밀번호와 동일한 값)" title="바밀번호 확인 (비밀번호와 동일한 값)" oninput="javascript:PWValidation()" required>
				<span class="pw_check_notice"></span><span class="pw_check_notice" style="color: red; display: none;"><i class="fa-solid fa-circle-exclamation"></i> 비밀번호 확인이 일치하지 않습니다.</span>
			</div>
			<div class="form_row">
				<label for="name">이름</label> <input type="text" id="name" name="m_name" pattern="[가-힣]{2,10}" placeholder="한글 실명" title="한글 실명" required>
			</div>
			<div class="form_row">
				<label for="t_gender">성별</label>
				<div>
				<input type="radio" id="man" name="t_gender" value="남">
				<label for="man">남자</label>
				<input type="radio" id="woman" name="t_gender" value="여">
				<label for="woman">여자</label> 
				</div>
			</div>		
			<div class="form_row">
				<label for="phone">휴대폰 번호</label>
				<input type="tel" id="phone" name="m_phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="휴대폰 번호 (000-0000-0000 형식)" title="휴대폰 번호 (000-0000-0000 형식)" required>
			</div>
			<div class="form_row">
				<label for="email">이메일</label>
				<input class="form-control" type="email" id="email" name="m_email" placeholder="이메일 주소 (xxx@xxxxx.xxx 형식)" title="이메일 주소 (xxx@xxxxx.xxx 형식)" required>
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
			</div>
			<div class="form_row">
			    <label>주소</label>
				<span class="button default" onClick="javascript:execDaumPostcode()">주소검색</span>
<<<<<<< HEAD
				<label class="addr-label">우편번호</label><input type="text" id="zipcode" pattern="[0-9]{5}" maxlength="5" onInput="javascript:setAddress()" required>
				<label class="addr-label">지번 주소</label><input type="text" id="jibunAddress" onInput="javascript:setAddress()" required>
				<label class="addr-label">도로명 주소</label><input type="text" id="roadAddress" onInput="javascript:setAddress()" required>
				<label class="addr-label">나머지 주소</label><input type="text" id="namujiAddress" onInput="javascript:setAddress()" required>
			<input type="hidden" id="address" name="m_address" value="">

			</div>
=======
				<input type="hidden" id="zipcode" pattern="[0-9]{5}" placeholder="우편번호 (숫자 5자리)" title="우편번호 (숫자 5자리)" maxlength="5" required>
				<input type="hidden" id="jibunAddress" placeholder="지번 주소" title="지번 주소" required>
				<input type="hidden" id="roadAddress" placeholder="도로명 주소" title="도로명 주소" required>
				<input type="hidden" id="namujiAddress" placeholder="나머지 주소" title="나머지 주소" required>
			<span></span><textarea id="address" name="m_address"></textarea>
			</div>
			
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
			<div class="form_row">
				<label for="sms_yn">SMS 수신 여부</label>
				<div onclick="javascript:setSMSYN()">
					<input type="checkbox" id="sms_switch" checked><label for="sms_switch" id="sms_switch_text" style="margin:0.3rem 0 0 0;">Yes</label>
					<input type="hidden" id="sms_yn" name="m_sms_yn" value="Y"/>

				</div>
			</div>
			<div class="form_row">
				<label for="email_yn">이메일 수신 여부</label>
				<div onclick="javascript:setEmailYN()">
					<input type="checkbox" id="email_switch" checked><label for="email_switch" id="email_switch_text" style="margin:0.3rem 0 0 0;">Yes</label>
					<input type="hidden" id="email_yn" name="m_email_yn" value="Y"/>

				</div>
			</div>
<<<<<<< HEAD
			<div class="form_button">
			<input type="hidden" name="type" value="signUp">
				<button type="submit" class="button special">회원가입</button>
			</div>
		</div>

	</form>
=======
			<div class="form_button_three">
				<button type="reset" class="button alt">초기화</button>
				<div>
				<button onclick = "history.back()" class="button">취소</button>
				<button type="submit" class="button special">회원가입</button>
				</div>
			</div>
		</div>
				<input type="hidden" name="type" value="signUp"/>
	</form>

>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
	<!-- form 끝 -->
	
						</div>
					</div>
				</div>
			</section>

<%@ include file="/footer.jsp" %>


	</body>
</html>