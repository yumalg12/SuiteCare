<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="payment.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<title>SC 스위트케어 | 결제</title>
<%@include file="../header-import.jsp"%>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>

<body>
	<%@include file="../header.jsp"%>

<!-- One -->
<section id="One" class="wrapper style3">
	<div class="inner">
		<header class="align-center">
			<p>adsfasdfsdf</p>
			<h2>Suite Care</h2>
		</header>
	</div>
</section>

<!-- Two -->
<section id="two" class="wrapper style2">
	<div class="inner">
		<div class="box">
			<div class="content">
				<header class="align-center">
					<p>간병인 찾기</p>
					<h2>결제 금액 선택</h2>
				</header>

				<div class="form_wrapper">
						<p style="color: #ac2925; margin-top: 30px">실제 출금 건이 발생하니 결제금액 1원을 선택해주세요!!!!.</p>
					<div class="form_row">

						<label>결제 금액</label> <select name="cd_item">
							<option value="1">1원</option>
							<option value="5000">5,000원</option>
							<option value="10000">10,000원</option>
							<option value="15000">15,000원</option>
							<option value="20000">20,000원</option>
							<option value="25000">25,000원</option>
							<option value="30000">30,000원</option>
							<option value="35000">35,000원</option>
							<option value="40000">40,000원</option>
							<option value="50000">50,000원</option>
						</select>
					</div>

					<div class="form_button">
						<button type="button" class="button special" id="charge_card">충전하기</button>
					</div>

					<form id="cardpay" name="cardpay"
						action="/suiteCare/Payment/addpay.do" method="get">
						<input id="amountRsp" name="amountRsp" type="hidden" value="">
						<input id="merchant_uidRsp" type="hidden" name="merchant_uidRsp" value="">
						<input id="pay_method" name="pay_method" type="hidden" value="">
						<c:forEach var="pay" items="${list }">
							<input type="hidden" id="phone" value="${pay.m_phone }">
						</c:forEach>
					</form>
					
				</div>
			</div>
		</div>
	</div>
</section>

<script>
$('#charge_card').click(function() {

	var userCode = "imp10528306";
	IMP.init(userCode);

	var c = $('select[name="cd_item"]').val();
	console.log(c);

	IMP.request_pay({
		pg : "html5_inicis",
		pay_method : "card",
		merchant_uid : "sc" + new Date(),
		name : "SC 스위트케어",
		amount : c,
		language : "",
		buyer_tel : document.getElementById("phone").value,
	},
	
	function(rsp) {
		console.log(rsp);
		if (rsp.success) {
			var msg = '결제 완료!';
			msg += '결제 금액:' + rsp.paid_amount;
			msg += '결제수단:' + rsp.pay_method;
			msg += '카드사명' + rsp.card_name;

			document.getElementById("amountRsp").value = rsp.paid_amount;
			document.getElementById("merchant_uidRsp").value = rsp.merchant_uid;
			document.getElementById("pay_method").value = rsp.pay_method;

			document.getElementById("cardpay").submit();

		} else {
			var msg = '결제에 실패하였습니다.';
		}
		alert(msg);
	});
});
</script>

<%@include file="../footer.jsp"%>

</body>
</html>