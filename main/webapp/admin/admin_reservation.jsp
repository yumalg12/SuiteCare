<%@ page import="reservation.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 예약정보</title>
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
						<p>SC 스위트케어</p>
						<h2>예약 정보 조회</h2>
					</header>

					<form name="resinfo">
						<table>
							<thead>
								<tr>
									<td>No.</td> <td>피간병인 아이디</td> <td>피간병인 코드</td> <td>간병인 아이디</td>
									<td>예약코드</td> <td>결제주문번호</td> <td>예약날짜</td> <td>상세정보</td> 
								</tr>
							</thead>
							<%
							request.setCharacterEncoding("utf-8");

							ReservationDAO dao = new ReservationDAO();

							List<ReservationVO> list = dao.allRes();
							for (int i = 0; i < list.size(); i++) {
								ReservationVO listt = (ReservationVO) list.get(i);
								
								String mid = listt.getM_id();
					            String caretaker_code = listt.getCaretaker_code();
					            String caregiver_id = listt.getCaregiver_id();
					            String res_code = listt.getRes_code();
					            String merchant_uid = listt.getMerchant_uid();
					            String res_date = listt.getRes_date();
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=mid%></td>
								<td><%=caretaker_code%></td>
								<td><%=caregiver_id%></td>
								<td><%=res_code%></td>
								<td><%=merchant_uid%></td>
								<td><%=res_date%></td>
								<td><a href="../admin/resInfo.jsp?res_code=<%=res_code%>&caretaker_code=<%=caretaker_code%>">더보기</a></td>
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