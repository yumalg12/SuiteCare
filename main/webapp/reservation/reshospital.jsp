<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소입력</title>
</head>

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
		alert("병원명을 입력해주세요");
		return false;
	} else if(hospaddr=="") {
		alert("주소를 입력해주세요.");
		return false;
	} else if(hospdetail_addr=="") {
		alert("나머지 주소를 입력해주세요.");
		return false;
	} else {
	f.action = "inserthospaddr.jsp";
	f.submit(); 
	return true;}
}
</script>
<body>
<% 
request.setCharacterEncoding("utf-8");
String m_id = (String)session.getAttribute("m_id");
String caretaker_code = (String)session.getAttribute("caretaker_code");
String res_code = (String)session.getAttribute("res_code");

%>
<h3> 주소 찾기 </h3>
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


</body>
</html>