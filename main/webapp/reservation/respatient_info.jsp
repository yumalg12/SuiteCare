<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피간병인 정보</title>
<script>

function recheck() {
	var f = document.Pinfoform;
	f.action = "respatient.jsp";
	f.submit();
}

function update() {
	var f = document.Pinfoform;
	f.action = "mypage.jsp";
	f.submit();
}

function reservation() {
	var f = document.Pinfoform;
	f.action = "res_insert.jsp";
	f.submit();
}
</script>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String patient_id = (String)session.getAttribute("patient_id");
ReservationDAO dao = new ReservationDAO();
String pname = request.getParameter("pname");

List<PatientinfoVO> list = dao.listPinfo(patient_id, pname);
for(int i=0; i<list.size(); i++) {
	PatientinfoVO listvo = (PatientinfoVO) list.get(i);
	
	String patient = listvo.getPatient();
	String patient_code = listvo.getPatient_code();
	int age = listvo.getAge();
	int height = listvo.getHeight();
	int weight = listvo.getWeight();
	String gender = listvo.getGender();
	String addr = listvo.getAddr();
	String detail_addr = listvo.getDetail_addr();
	String diagnosis = listvo.getDiagnosis();
	String consciousness = listvo.getConsciousness();
	String care_meal_yn = listvo.getCare_meal_yn();
	String care_toilet = listvo.getCare_toilet();
	String state_paralysis = listvo.getState_paralysis();
	String state_mobility = listvo.getState_mobility();
	String bedsore_yn = listvo.getBedsore_yn();
	String suction_yn = listvo.getSuction_yn();
	String outpatient_yn = listvo.getOutpatient_yn();
	String care_night_yn = listvo.getCare_night_yn();
	String notice = listvo.getNotice();
	
	session.setAttribute("patient_code", patient_code);
%>

<h3> <%=pname %>님의 정보</h3>

<form name="Pinfoform">
<table border=1>
<tr><td> 피간병인 코드 </td><td><%=patient_code %></td></tr>
<tr><td> 피간병인 이름 </td><td><%=patient %></td></tr>
<tr><td> 나이 </td><td><%=age %></td></tr>
<tr><td> 키 </td><td><%=height %></td></tr>
<tr><td> 몸무게 </td><td><%=weight %></td></tr>
<tr><td> 성별 </td><td><%=gender %></td></tr>
<tr><td> 진단명 </td><td><%=diagnosis %></td></tr>

<tr><td> 주소 </td><td><%=addr %></td></tr>
<tr><td> 상세주소 </td><td><%=detail_addr %></td></tr>
<tr><td> 의식상태 </td><td><%=consciousness %></td></tr>
<tr><td> 식사케어여부 </td><td><%=care_meal_yn %></td></tr>
<tr><td> 대소변케어여부 </td><td><%=care_toilet %></td></tr>
<tr><td> 마비 상태 </td><td><%=state_paralysis %></td></tr>
<tr><td> 거동 및 운동상태 </td><td><%=state_mobility %></td></tr>
<tr><td> 욕창 유무 </td><td><%=bedsore_yn %></td></tr>
<tr><td> 석션 필요 유무 </td><td><%=suction_yn %></td></tr>
<tr><td> 주기적 외부 칠요 여부 </td><td><%=outpatient_yn %></td></tr>
<tr><td> 야간케어여부 </td><td><%=care_night_yn %></td></tr>
<tr><td> 유의사항 </td><td><%=notice %></td></tr>
</table>
<button type="button" onclick="recheck();">다시선택</button>
<button type="button" onclick="update();">정보수정</button>
<button type="button" onclick="reservation();">예약하기</button>
</form>

<%
}
%>
</body>
</html>