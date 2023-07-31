<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SC 스위트케어 | 간병 예약</title>
<%@ include file="/header-import.jsp"%>

<script>

function back() {
	var f = document.hospForm;
	f.action = "rescareloc.jsp";
	f.submit();
}

function searchhosp() {
	var popupUrl = "searchmap.jsp";
    var popupOptions = 'width=800,height=600,scrollbars=yes,resizable=yes';

    var mapPopup = window.open(popupUrl, 'mapPopup', popupOptions);
   
}
function setHospitalInfo(hospname, hospaddr) {
    document.getElementById('hospname').value = hospname;
    document.getElementById('hospaddr').value = hospaddr;
}

function check() {
	var f = document.hospForm;
	var hospname = document.hospForm.hospname.value;
	var hospaddr = document.hospForm.hospaddr.value;
	var hospdetail_addr = document.hospForm.hospdetail_addr.value;
	
	if(hospname=="") {
		alert("병원명을 입력해 주세요");
		return false;
	} else if(hospaddr=="") {
		alert("주소를 입력해 주세요.");
		return false;
	} else if(hospdetail_addr=="") {
		alert("나머지 주소를 입력해 주세요.");
		return false;
	} else {
	f.action = "inserthospaddr.jsp";
	f.submit(); 
	return true;}
}
</script>

</head>

<body>
	<%@ include file="/header.jsp"%>

<% 
request.setCharacterEncoding("utf-8");
String m_id = (String)session.getAttribute("m_id");
String caretaker_code = (String)session.getAttribute("caretaker_code");
String res_code = (String)session.getAttribute("res_code");

%>
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Eleifend vitae urna</p>
				<h2>SC SuiteCare</h2>
			</header>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>maecenas sapien feugiat ex purus</p>
						<h2>병원 주소 입력</h2>
					</header>

					<div class="form_wrapper">
<form name="hospForm">
			<div class="form_row">
				<label>병원명</label>
				<div class="form_row_sub">
					<input type="text" name="hospname" id="hospname" placeholder="병원명">
					<input type="button" onclick="searchhosp()" value="병원 찾기">
				</div>
			</div>

			<div class="form_row">
				<label class="addr-label">병원 주소</label><input type="text" id="hospaddr" placeholder="병원 주소" title="병원 주소" onInput="javascript:setAddress()" required>
				<label class="addr-label">상세 병동</label><input type="text" id="hospdetail_addr" placeholder="상세 병동" title="나머지 주소" onInput="javascript:setAddress()" required>

			</div>
			<div class="form_button">
		 <input type="button" class="button" onclick="back();" value="뒤로가기">
		 <input type="reset" class="button alt" value="초기화"> 
		 <input type="button" class="button special" onclick="check();" value="확인">
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