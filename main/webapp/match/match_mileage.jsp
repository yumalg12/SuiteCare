<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 결제</title>
<%@include file="../header-import.jsp"%>

<link rel="stylesheet" href="${context}/assets/css/popup.css" />

<%
g_id = request.getParameter("g_id");
String res_code = request.getParameter("res_code");
String g_name = request.getParameter("g_name");
%>
<script>
function startPayment() {
	let m_current_mileage = ${m_current_mile};
	let fSalary = ${total_fee};
	if (m_current_mileage < fSalary) {
		if (confirm("마일리지 잔액이 부족합니다. 마일리지 충전을 진행하시겠습니까?")) {
			location.href = "${context}/pay/paycon.jsp";
		} else { //테스트용으로 승인처리 바로 진행
			location.href='${context}/match/apply?hourwage=${hourwage }&res_code=<%= res_code %>&type=apply&g_id=<%= g_id %>';
		}
	} else {
		if (confirm("결제를 진행하시겠습니까?")) {
			//차감 처리 필요
			location.href='${context}/match/apply?hourwage=${hourwage }&res_code=<%= res_code %>&type=apply&g_id=<%= g_id %>';
		}
	}
}

</script>
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
						<label>기간</label><input type="text" value="${start_date } ~ ${end_date }" readonly>
					</div>
					
					<div class="form_row">
						<label>시간</label><input type="text" value="출근: ${start_time } / 퇴근: ${end_time}" readonly>
					</div>
					
					<hr>
					
					<div class="form_row">
					<label>결제 금액</label><input type="text"
						value="<fmt:formatNumber value="${total_fee }"
						pattern="#,###" />원 (시급: <fmt:formatNumber value="${Integer.parseInt(hourwage)}" pattern="#,###" />원)" readonly>
					</div>
					<div class="form_row">
						<label>마일리지 잔액</label>
						<div>
							<input type="text" value="<fmt:formatNumber value="${m_current_mile }" pattern="#,###" />" readonly>
							<span style="color:red;"
						        <c:choose>
						            <c:when test="${m_current_mile < total_fee}"></c:when>
						            <c:otherwise>style="display: none;"</c:otherwise>
						        </c:choose>
							>*잔액이 부족합니다. 마일리지를 충전하세요.</span>
						</div>
					</div>

					<div class="form_button">
						<button class="button" onclick="location.href='${context}/pay/paycon.jsp'">마일리지 충전</button>
						<button class="button special" onclick="javascript:startPayment();">결제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

</body>
</html>