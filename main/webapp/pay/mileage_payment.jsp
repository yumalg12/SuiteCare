<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 결제</title>
<%@include file="../header-import.jsp"%>
<%
g_id = request.getParameter("g_id");
String res_code = request.getParameter("res_code");
String b_id = request.getParameter("b_id");
%>

<link rel="stylesheet" href="<%=context%>/assets/css/popup.css" />

</head>
<body>

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
						<div class="form_row">
							<label>신청자 아이디</label> <input type="text" value="<%=m_id%>" readonly>
						</div>
						<div class="form_row">
							<label>간병인 아이디</label> <input type="text" value="<%=g_id%>" readonly>
						</div>
						<div class="form_row">
							<label>예약 코드</label> <input type="text" value="<%=res_code%>" readonly>
						</div>
						<div class="form_row">
							<label>b_id</label> <input type="text" value="<%=b_id%>" readonly>
						</div>
						<div class="form_row">
							<label>마일리지 잔액</label> <input type="text" value="<%//=currentMile%>" readonly>
						</div>
						<div class="form_row">
							<label>결제금액</label> <input type="text" value="<%//=fSalary%>" readonly>
						</div>
						<div class="form_button">
							<button class="button" onclick="location.href='paycon.jsp'">마일리지 충전</button>
							<button class="button special" onclick="javascript:startPayment();">결제</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		function startPayment() {
			let currentMile = document.getElementById("currentMile").value;
			let fSalary = document.getElementById("fSalary").value;
			if (currentMile < fSalary) {
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