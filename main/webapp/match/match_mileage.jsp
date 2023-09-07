<%@ page import="book.*"%>
<%@ page import="reservation.*"%>
<%@ page import="member.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.concurrent.TimeUnit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 결제</title>
<%@include file="../header-import.jsp"%>

<link rel="stylesheet" href="${context}/assets/css/popup.css" />

</head>
<body>
	<%
g_id = request.getParameter("g_id");
String res_code = request.getParameter("res_code");
String g_name = request.getParameter("g_name");
String hourwage = request.getParameter("hourwage");
%>

<!-- Two -->
<section id="two" class="wrapper style2">
	<div class="inner">
		<div class="box">
			<div class="content">
				<header class="align-center">
					<p>간병 서비스</p>
					<h2>결제</h2>
				</header>
				<div class="form_wrapper">
					<div>
						<div class="form_row">
							<label>신청자 아이디</label> <input type="text" value="<%=m_id%>" readonly>
						</div>
						<div class="form_row">
							<label>예약 코드</label> <input type="text" value="<%=res_code%>" readonly>
						</div>
					</div>

					<div class="form_row">
						<label>간병인</label>
						<div class="form_row_sub">
							<input type="text" value="<%=g_name%>" readonly>
						</div>
					</div>
					<%
					ReservationDAO resdao = new ReservationDAO();
					List<ReservationVO> listres = resdao.resList(g_id, 1);
					for (int i = 0; i < listres.size(); i++) {
						ReservationVO listvo = (ReservationVO) listres.get(i);

						String start_date = listvo.getStart_date();
						String end_date = listvo.getEnd_date();
						String start_time = listvo.getStart_time();
						String end_time = listvo.getEnd_time();
						String t_name = listvo.getT_name();

						String workDate = start_date.substring(5) + " ~ " + end_date.substring(5);
						String workTimes = start_time.substring(0, 5) + " ~ " + end_time.substring(0, 5);

						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

						Date startDate = dateFormat.parse(start_date);
						Date endDate = dateFormat.parse(end_date);

						Calendar cal = Calendar.getInstance();
						cal.setTime(endDate);
						cal.add(Calendar.DAY_OF_MONTH, 7);
						Date lastDate = cal.getTime();
						String paymentdate = dateFormat.format(lastDate);

						int ghourwage = Integer.parseInt(hourwage);

						SimpleDateFormat dFormat = new SimpleDateFormat("HH:mm");
						Date starttime = dFormat.parse(start_time);
						Date endtime = dFormat.parse(end_time);

						long workdate = endDate.getTime() - startDate.getTime();
						long dworkdate = TimeUnit.MILLISECONDS.toDays(workdate); // 밀리초 단위 근무일자를 일자단위로 변환
						long worktime = endtime.getTime() - starttime.getTime();
						long hworktime = TimeUnit.MILLISECONDS.toHours(worktime); // 밀리초 단위 근무시간을 시간단위로 변환

						int wdate = (int) (dworkdate + 1);
						int totalSalary = (int) (wdate * hworktime * ghourwage);
					%>
					<div class="form_row">
						<label>간병 기간</label> <input type="text" value="<%=workDate%>" readonly>
					</div>
					<div class="form_row">
						<label>간병 시간</label> <input type="text" value="<%=workTimes%>" readonly>
					</div>
					<hr>
					<div class="form_row">
						<label>총 결제 금액</label> <input type="text" value="<%=totalSalary%>원 (시급 <%=ghourwage%>원)" readonly>
					</div>
					<%
					}
					%>
					
					<div class="form_row">
						<label>마일리지 잔액</label>
						<div>
						<%
						MemberDAO mdao = new MemberDAO();
						List<MemberVO> list = mdao.listMembers(m_id);
					
						for(int i=0; i<list.size(); i++) {
							MemberVO listvo = (MemberVO) list.get(i);
						
							Integer m_current_mileage = listvo.getM_current_mile();
					
							 %>
							<input type="text" value="<%=m_current_mileage %>" readonly>
							<%} %>
							<span class="notice">*잔액이 부족합니다. 마일리지를 충전하세요.</span>
						</div>
					</div>

					<div class="form_button">
						<button class="button" onclick="location.href='paycon.jsp'">마일리지 충전</button>
						<button class="button special" onclick="javascript:startPayment();">결제</button>
					</div>
					<div class="form_button">
						<a href="${context}/match/apply?hourwage=<%= hourwage %>&res_code=<%= res_code %>&type=apply&g_id=<%= g_id %>">매칭신청</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	function startPayment() {
		let m_current_mileage = document.getElementById("m_current_mileage").value;
		let fSalary = document.getElementById("fSalary").value;
		if (m_current_mileage < fSalary) {
			if (confirm("마일리지 잔액이 부족합니다. 마일리지 충전을 진행하시겠습니까?")) {
				location.href = "paycon.jsp";
			}
		} else {
			if (confirm("결제를 진행하시겠습니까?")) {
				alert("결제 진행 처리를 위해 update 쿼리문 실행 예정");
			}
		}
	}

</script>

</body>
</html>