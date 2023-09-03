<%@ page import="book.*"%>
<%@ page import="reservation.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
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
	String b_id = request.getParameter("b_id");

	String file_repo = "../assets/profile/";

	BookDAO dao = new BookDAO();

	List<BookVO> glist = dao.gList(g_id);
	for (int i = 0; i < glist.size(); i++) {
		BookVO gvo = (BookVO) glist.get(i);
		String g_name = gvo.getG_name();
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
						<div style="display: none;">
							<div class="form_row">
								<label>신청자 아이디</label> <input type="text" value="<%=m_id%>" readonly>
							</div>
							<div class="form_row">
								<label>예약 코드</label> <input type="text" value="<%=res_code%>" readonly>
							</div>
							<div class="form_row">
								<label>간병인 지원 코드 (book code)</label> <input type="text" value="<%=b_id%>" readonly>
							</div>
						</div>

						<div class="form_row">
							<label>간병인</label>
							<div class="form_row_sub">
								<input type="text" value="<%=g_name%> (<%=g_id%>)" readonly>
								<a class="button alt"
									onclick="javascript:openGinfoList('<%=g_id%>','<%=res_code%>','<%=b_id%>')">상세정보</a>
							</div>
						</div>
							<div class="form_row">
								<label>간병 기간</label> <input type="text" value="" readonly>
							</div>
							<div class="form_row">
								<label>간병 시간</label> <input type="text" value="" readonly>
							</div>
						<hr>
						<%
						}
						%>
						<div class="form_row">
						<%List<BookVO> applyList = dao.listTapply(res_code);
						
						for (int i = 0; i < applyList.size(); i++) {
							BookVO applyvo = (BookVO) applyList.get(i);
							String hourwage = applyvo.getHourwage();
							%>
						<label>요청 시급</label> <input type="text" value="<%=hourwage%>" readonly>
								<%}%>
						</div>
						<div class="form_row">
							<label>총 결제 금액</label> <input type="text" value="fSalary 또는 시급?" readonly>
						</div>
						<div class="form_row">
							<label>마일리지 잔액</label>
							<div>
								<input type="text" value="MemberVO.getCurrentMile" readonly>
								<span class="notice">*잔액이 부족합니다. 마일리지를 충전하세요.</span>
							</div>
						</div>

						<div class="form_button">
							<button class="button" onclick="location.href='paycon.jsp'">마일리지
								충전</button>
							<button class="button special"
								onclick="javascript:startPayment();">결제</button>
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

		function openGinfoList(gIdVal, resCodeVal, bIdVal) {
			window.open("${context}/book/ginfoList.jsp?g_id=" + gIdVal
					+ "&res_code=" + resCodeVal + "&b_id=" + bIdVal,
					"name(_blank)", "width=800, height=950");
		}
	</script>

</body>
</html>