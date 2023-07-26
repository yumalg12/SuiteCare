<%@ page import = "patient.*" %>
<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.Time" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피간병인 마이페이지</title>
</head>
<script>

function insertPinfo() {
	window.location.href = "patientInfo.jsp";
}
function rescaregiver() {
	window.location.href = "../reservation/respatient.jsp";
}

</script>
<body>

<% 
request.setCharacterEncoding("utf-8");
String patient_id = (String)session.getAttribute("patient_id");

PatientresDAO dao = new PatientresDAO();
%>

<h3> 피간병인 정보 </h3>

<%
List<PatientinfoVO> pinfolist = dao.listpinfo(patient_id);
for(int i=0; i<pinfolist.size(); i++) {
	PatientinfoVO listp = (PatientinfoVO) pinfolist.get(i);
	
	String patient = listp.getPatient();
	String gender = listp.getGender();
	int age = listp.getAge();
	int height = listp.getHeight();
	int weight = listp.getWeight();
	String addr = listp.getAddr();
	String diagnosis = listp.getDiagnosis();
	
	String[] addrs = addr.split("\\s");
	
	String area = addrs[0];

	%>
	
<form name="patientinfo">
<table border=1>
<tr><td>이름</td><td> 성별</td> <td> 나이 </td> <td> 키</td> <td> 몸무게 </td> <td> 지역</td><td> 상태(병명)</td></tr>
<tr><td> <%=patient %> </td><td> <%=gender %> </td><td> <%=age %> </td> <td> <%=height %>cm </td> <td> <%=weight %>kg </td> <td> <%=area %> </td><td> <%=diagnosis %> </td></tr>
</table>
</form>

<%
}

%>
<button type="button" onclick="insertPinfo();">피간병인 정보 등록하기</button>

<h3> 간병인 예약정보 </h3>
<form name="resinfo">
<table border=1>
<tr><td> 피간병인 </td><td> 간병인</td> <td> 근무기간 </td> <td> 근무시간</td> <td> 결제금액 </td> <td> 결제여부</td></tr>

<%

List<PatientresVO> reslist = dao.listres(patient_id);
for(int i=0; i<reslist.size(); i++) {
	PatientresVO listvo = (PatientresVO) reslist.get(i);
	
	String patient = listvo.getPatient();
	Date start_date = listvo.getStartdate();
	Date end_date = listvo.getEnddate();
	Time start_time = listvo.getStarttime();
	Time end_time = listvo.getEndtime();
	String caregiver = listvo.getCaregiver();
	
	String workDate = start_date + "~" + end_date;
	String workTimes = start_time + "~" + end_time;
	
	long worktime = end_time.getTime() - start_time.getTime();
	int workHours = (int) (worktime / (1000 * 60 * 60));

	int totalWorkDays =  (int) ((end_date.getTime() - start_date.getTime()) / (1000 * 60 * 60 * 24)) + 1; 
	
	int salary = totalWorkDays * workHours * 10000;
	
	 String fSalary = String.format("%,d", salary);
	
	if(caregiver==null) {
%>

<tr><td> <%=patient %> </td><td> 미지정 </td><td> <%=workDate %> </td> <td> <%=workTimes %> </td> <td> <%=fSalary %>원 </td> <td> ... </td></tr>


<%
} else if(caregiver!= null) {
	%>

<tr><td> <%=patient %> </td><td> <%=caregiver %> </td><td> <%=workDate %> </td> <td> <%=workTimes %> </td> <td> <%=fSalary %>원 </td> <td> ... </td></tr>

<%
} 

}
%>
</table>
</form>
<button type="button" onclick="rescaregiver();">간병인 신청하기</button>
</body>
</html>