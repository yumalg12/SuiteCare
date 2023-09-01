<%@ page import="caretaker.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 회원정보</title>
<%@ include file="/header-import.jsp"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<style>
.fc-col-header {
    margin: 0;
    padding: 0;
}
.fc-daygrid-day-number, .fc-col-header-cell-cushion {
text-decoration:none;
 cursor: default;
}
.fc-daygrid-day:hover{
font-weight: bold;
background-color: #DFD7BF50;
}
.fc-scroller{
overflow:hidden !important;
}
.fc .fc-button-primary{
background-color: transparent;
border: none;
outline: none;
}
.fc .fc-button-primary:hover{
background-color: #cccccc50;
}
.fc .fc-daygrid-day.fc-day-today{
background-color: #A4907Caa;
font-weight: bold;
}
.fc .fc-button-primary:not(:disabled):active, .fc .fc-button-primary:not(:disabled).fc-button-active{
background-color: #DFD7BFaa;
font-weight: bold;
}
.fc .fc-toolbar.fc-header-toolbar{
margin-left: 7.2rem;
}
.fc .fc-toolbar-title {
    font-size: 1.75em;
    margin: 0;
    display: inline;
    position: relative;
    top: 0.4rem;
}
</style>

</head>

<script>

</script>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<body>
	<%@ include file="/header.jsp"%>

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
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>회원이 등록한</p>
						<h2>피간병인 정보 조회</h2>
					</header>

					<form name="patientinfo">
						<table>
							<thead>
								<tr>
									<td>No.</td> <td>이름</td> <td>성별</td> <td>나이</td>
									<td>키</td> <td>몸무게</td> <td>진단명</td>
								</tr>
							</thead>
							<%
							request.setCharacterEncoding("utf-8");
							String mid = request.getParameter("mid");
							
							TakerDAO dao = new TakerDAO();

							List<TakerVO> list = dao.takerList(mid);
							for (int i = 0; i < list.size(); i++) {
								TakerVO listt = (TakerVO) list.get(i);

								String t_name = listt.getT_name();
								String t_gender = listt.getT_gender();
								String t_age = listt.getT_age();
								String t_height = listt.getT_height();
								String t_weight = listt.getT_weight();
								String diagnosis = listt.getDiagnosis();
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=t_name%></td>
								<td><%=t_gender%></td>
								<td><%=t_age%>세</td>
								<td><%=t_height%>cm</td>
								<td><%=t_weight%>kg</td>
								<td><%=diagnosis%></td>
							</tr>
							<%
							}
							%>
						</table>
					</form>
				</div>
			</div>
		</div>
	</section>

	<%@include file="/footer.jsp"%>
</body>

</html>