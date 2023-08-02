<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<<<<<<< HEAD
<title>집주소입력</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
=======
<title>주소입력</title>
</head>
>>>>>>> parent of e2fd0b3 (no message)
=======
<title>SC 스위트케어 | 간병 예약</title>
<%@ include file="/header-import.jsp"%>
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4

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
<<<<<<< HEAD
<h3> 주소 찾기 </h3>
<<<<<<< HEAD
<form name="homeForm">
<table border=1 cellpadding="2">
<tr><td align="center"> 병원명 </td>
<td> <input type="text" name="hospname"> </td></tr>
<tr>
		<td align="center"> 주소 </td>
		<td>
 		<input type="button" onclick="execDaumPostcode()" value="주소 찾기"><br>
					  <br>
					  <p> 
					  
					   도로명 주소 <br><input type="text" id="hospaddr"  name="hospaddr" size="50"><br><br>
					   나머지 주소 <br><input type="text"  name="hospdetail_addr" size="50" />
					<!--<span id="guide" style="color:#999"></span>  -->
					   </p>
		</td></tr></table>
		 <input type="button" onclick="back();" value="뒤로가기"> <input type="button" onclick="check();" value="확인"> <input type="reset" value="초기화"> 
</form>
=======
<form name="hospForm">
<table border=1 cellpadding="2">
<tr><td align="center"> 병원명 </td>
<td> <input type="text" name="hospname" id="hospname"> <input type="button" onclick="searchhosp()" value="병원 찾기"></td></tr>
<tr>
		<td align="center"> 주소 </td>
		<td>
		<br>
		 <p> 
		도로명 주소 <br><input type="text" id="hospaddr"  name="hospaddr" size="50"><br><br>
		나머지 주소 <br><input type="text"  name="hospdetail_addr" size="50" />
		 </p>
		</td></tr></table>
		 <input type="button" onclick="back();" value="뒤로가기"> <input type="button" onclick="check();" value="확인"> <input type="reset" value="초기화"> 
</form>


>>>>>>> parent of e2fd0b3 (no message)
=======
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
			    <label>병원 주소</label><span></span>
				<label class="addr-label">도로명 주소</label><input type="text" id="hospaddr" name="hospaddr" placeholder="도로명 주소" title="도로명 주소" >
				<label class="addr-label">상세호수</label><input type="text" id="hospdetail_addr" name="hospdetail_addr" placeholder="상세호수" title="나머지 주소" >
			</div>
			<div class="form_button_three">
		 <input type="reset" class="button alt" value="초기화"> 
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


>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
</body>
</html>