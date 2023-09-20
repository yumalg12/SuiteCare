<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>SC 스위트케어 | 관리자 수정</title>
<%@ include file="/header-import.jsp" %>

	</head>
	
<script>
function update() {
	var f = document.updateForm;
	f.action = "ad_rUpdateCheck.jsp";
}
</script>

<body>

<%
request.setCharacterEncoding("utf-8");
String res_code = request.getParameter("res_code");

ReservationDAO dao = new ReservationDAO(); 
List<ReservationVO> list = dao.uList(res_code);

ReservationVO listvo = (ReservationVO) list.get(0);

String mid = listvo.getM_id();
String caretaker_code = listvo.getCaretaker_code();
String caregiver_id = listvo.getCaregiver_id();
res_code = listvo.getRes_code();
String merchant_uid = listvo.getMerchant_uid();
String res_date = listvo.getRes_date();
%>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>예약 정보 수정</p>
						<h2></h2>
					</header>
					
<!-- form 시작 -->
	<form name="updateForm" action="javascript:update();">
	<input type="hidden" name="type" value="update"/>
		<div class="form_wrapper">
		
			<div class="form_row">
				<label for="mid">피간병인 아이디</label>
				<input type="text" id="mid" name="mid" value="<%=mid %>" placeholder="피간병인 아이디를 입력하세요.">
			</div>	
			
			<div class="form_row">
				<label for="caretaker_code">피간병인 코드</label>
				<input type="text" id="caretaker_code" name="caretaker_code" value="<%=caretaker_code %>" placeholder="피간병인 코드를 입력하세요.">
			</div>	
			
			<div class="form_row">
				<label for="caregiver_id">간병인 아이디</label>
				<input type="text" id="caregiver_id" name="caregiver_id" value="<%if(caregiver_id!=null) { %><%=caregiver_id %> <% } %>" placeholder="간병인 아이디를 입력하세요.">
			</div>
			
			<div class="form_row">
				<label for="res_code">예약코드</label>
				<input type="text" id="res_code" name="res_code" value="<%=res_code %>" placeholder="예약코드를 입력하세요.">
			</div>
			
			<div class="form_row">
				<label for="merchant_uid">결제주문번호</label>
				<input type="text" id="merchant_uid" name="merchant_uid" value="<%=merchant_uid %>" placeholder="결제주문번호를 입력하세요.">
			</div>
				
			<div class="form_row">
				<label for="res_date">예약날짜</label>
				<input type="text" id="res_date" name="res_date" value="<%=res_date %>" placeholder="이메일을 입력하세요.">
			</div>

			<div>
				<input class="button special" type="submit" value="수정 완료" >
			</div>

		</div>
		
	</form>
	<!-- form 끝 -->

				</div>
			</div>
		</div>
	</section>

</body>
</html>