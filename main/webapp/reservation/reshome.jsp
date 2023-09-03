<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 간병 예약</title>
<%@ include file="/header-import.jsp"%>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/suiteCare/assets/js/execDaumPostcode.js"></script>
<script src="${context}/assets/js/progress.js"></script>                                                                                              
<script>

function back() {
	var f = document.homeForm;
	f.action = "rescareloc.jsp";
	f.submit();
}

function check() {
	var f = document.homeForm;
    let roadAddress = document.getElementById("roadAddress").value;
    let namujiAddress = document.getElementById("namujiAddress").value;
	
    if (!roadAddress) {
        alert("주소를 입력해 주세요.");
        $("#jibunAddress").focus();
    } else if (!namujiAddress) {
        alert("나머지 주소를 입력해 주세요.");
        $("#namujiAddress").focus();
    } else {
	f.action = "insertaddr.jsp";
	f.submit(); 
	return true;}
}

function setAddress() {
	//주소를 hidden input으로 합치는 함수
	//우편번호가 없는데, 회원가입 폼이랑 맞추는 게 어떨지 제안합니다
    let roadAddress = document.getElementById("roadAddress").value;
    let namujiAddress = document.getElementById("namujiAddress").value;
    
    document.homeForm.addr.value = roadAddress + " " + namujiAddress;
    
    console.log(document.homeForm.addr.value);
}

function reshstop() {
	alert("예약이 중지되었습니다.");
	window.location.href = "${context}/member/main";
}

</script>

</head>

<body>
	<%@ include file="/header.jsp"%>

<% 
request.setCharacterEncoding("utf-8");
String caretaker_code = (String)session.getAttribute("caretaker_code");
String res_code = (String)session.getAttribute("res_code");
String r_code = (String)session.getAttribute("r_code");
System.out.println("res_code : "+res_code);
System.out.println("r_code : "+r_code);
%>
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Premium Caregiver Matching Platform</p>
				<h2>SuiteCare</h2>
			</header>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2">
	
	<div id="res-progress">
	<ul>
	<li>피간병인 선택</li>
	<li>피간병인 정보 입력</li>
	<li class="active">간병장소 선택</li>
	<li>예약 일시 지정</li>
	<li>빠른매칭 서비스</li>
	</ul>
	</div>
	
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>maecenas sapien feugiat ex purus</p>
						<h2>자택 주소 입력</h2>
					</header>

					<div class="form_wrapper">
<form name="homeForm" method="post">
			<div class="form_row">
			    <label>자택 주소</label>
				<span class="button default" onClick="javascript:execDaumPostcode()">주소검색</span>
				<div style="display: none;">
				<label class="addr-label">우편번호</label><input type="text" id="zipcode" pattern="[0-9]{5}" placeholder="우편번호 (숫자 5자리)" title="우편번호 (숫자 5자리)" maxlength="5" onInput="javascript:setAddress()">
				<label class="addr-label">지번 주소</label><input type="text" id="jibunAddress" placeholder="지번 주소" title="지번 주소" onInput="javascript:setAddress()">
				</div>
				<label class="addr-label">도로명 주소</label><input type="text" id="roadAddress" placeholder="도로명 주소" title="도로명 주소" onInput="javascript:setAddress()" required>
				<label class="addr-label">나머지 주소</label><input type="text" id="namujiAddress" placeholder="나머지 주소" title="나머지 주소" onInput="javascript:setAddress()" required>
			<input type="hidden" id="addr" name="addr" value=""> <!-- 주소 값으로는 이 input만 전송되게 됩니다 -->
			</div>
			<div class="form_button_three">
		 <input type="button" class="button alt" onclick="reshstop();" value="예약 중지">
		 <div>
		 <input type="button" class="button" onclick="back();" value="뒤로가기">
		 <input type="button" class="button special" onclick="check();" value="확인">
		 </div>
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