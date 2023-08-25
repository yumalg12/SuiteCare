<%@ page import = "patient.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/header-import.jsp"%>
  <style>
    body {
      margin: 0;
      padding: 20px;
      font-family: Arial, sans-serif;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      border: 1px solid #ccc;
    }
    th, td {
      padding: 8px;
      border-bottom: 1px solid #ccc;
      text-align: left;
    }
  </style>

<meta charset="UTF-8">
<title>SC 스위트케어 | 피간병인 상세정보</title>

<link rel="stylesheet" href="<%=context %>/assets/css/popup.css" />

</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String res_code = request.getParameter("popres_code");

PatientresDAO dao = new PatientresDAO();
List<PatientresInfoVO> resinfoList = dao.listresinfo(res_code);
	%>
	<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>간병 받을 분</p>
						<h2>상세 정보</h2>
					</header>
<table>
<%
for(PatientresInfoVO vo : resinfoList) {
%>
	<tr>
		<td>Q1. 의식상태는 어떠신가요?</td>
		<td><%=vo.getConsciousness()%></td>
	</tr>
	<tr>
		<td>Q2. 식사를 어떻게 하고 계신가요?</td>
		<td><%=vo.getCare_meal_yn()%></td>
	</tr>
	<tr>
		<td>Q3. 대소변 해결은 어떻게 하시나요?</td>
		<td><%=vo.getCare_toilet()%></td>
	</tr>
	<tr>
		<td>Q4. 마비가 있는 상태신가요?</td>
		<td><%=vo.getState_paralysis()%></td>
	</tr>
	<tr>
		<td>Q5. 거동 및 운동 상태는 어떠신가요?</td>
		<td><%=vo.getState_mobility()%></td>
	</tr>
	<tr>
		<td>Q6. 욕창이 있으신가요?</td>
		<td><%=vo.getBedsore_yn()%></td>
	</tr>
	<tr>
		<td>Q7. 석션이 필요하신가요?</td>
		<td><%=vo.getSuction_yn()%></td>
	</tr>
	<tr>
		<td>Q8. 주기적으로 받는 외부치료가 있으신가요?</td>
		<td><%=vo.getOutpatient_yn()%></td>
	</tr>
	<tr>
		<td>Q9. 환자분에게 야간 돌봄이 필요하신가요?</td>
		<td><%=vo.getCare_night_yn()%></td>
	</tr>
	<tr>
		<td>Q10. 간병할 때 유의사항은 무엇인가요?</td>
		<td><%=vo.getNotice()%></td>
	</tr>
<%
}
%>
</table>

</div></div></div>
</body>
</html>