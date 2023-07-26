<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피간병인 선택</title>
<script>
function checkForm() {
	var selectname=document.getElementById("pname").value;
	if(selectname=="") {
		alert("피간병인 이름을 선택해주세요.");
		return false;
	}
	return true;	
}

function insertPinfo() {
	window.location.href = "patientInfo.jsp";
}
</script>
</head>

<body>
<% 

request.setCharacterEncoding("utf-8");

%>
<%
String patient_id = (String)session.getAttribute("patient_id");
ReservationDAO dao = new ReservationDAO();

int ok = dao.pinfocheck(patient_id);

PatientinfoVO vo = new PatientinfoVO();

if(ok == 0) {
	System.out.println("정보없음");
	
	%>
	<script>
	alert("등록된 회원정보가 없습니다.");
	location.href='<%=request.getContextPath()%>/patient/patientinfo.jsp';
	</script>
	<%
} else if(ok == 1) {
	System.out.println("정보있음");
	List<PatientinfoVO> list = dao.listpname(patient_id);
	for(int i=0; i<list.size(); i++) {
		PatientinfoVO listvo = (PatientinfoVO) list.get(i);
		
		String patient = listvo.getPatient();
		
%>		
		<h3> 피간병인 정보 선택 </h3>
		<form action="./respatient_info.jsp" name="Pnameform" onSubmit="return checkForm();">
		<table><tr>
		<td>피간병인 이름</td>
		<td><select name="pname" id="pname">
		<option value="">==선택==</option>
		<option value=<%=patient%>><%=patient%></option>
		</select></td>
		<td><input type="submit" value="선택"></td></tr>
		</table>
		<button type="button" onclick="insertPinfo();">다른 피간병인 정보 등록하기</button>
		</form>
<%	
	}
	
}
%>
	
</body>
</html>