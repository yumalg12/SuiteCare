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
							<label>신청자</label> <input type="text" value="${m_name} (<%=m_id%>)" readonly>
						</div>
						<hr>
					</div>
						<div class="form_row">
							<label>예약 코드</label> <input type="text" value="<%=res_code%>" readonly>
						</div>

					<div class="form_row">
						<label>간병인</label><input type="text" value="<%=g_name%> (<%=g_id%>)" readonly>
					</div>
					
					<div class="form_row">
						<label>기간</label><input type="text" value="${work_period }" readonly>
					</div>
					
					<hr>
					
					<div class="form_row">
					<label>결제 금액</label><input type="text" value="${Integer.parseInt(hourwage)*30 }" readonly>
					</div>
					<div class="form_row">
						<label>마일리지 잔액</label>
						<div>
							<input type="text" value="${m_current_mileage }" readonly>
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