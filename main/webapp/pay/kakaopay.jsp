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

<link rel="stylesheet" href="${context}/assets/css/popup.css" />

</head>

<body>

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
					<div class="form_row">
						<label>결제 금액</label> <select name="kp_item">
							<c:forEach var="start" begin="10000" end="100000" step="10000">
								<c:set var="display" value="${start }원 "/>
								<option value="${start }">${display }</option>
							</c:forEach>
						</select>
					</div>

					<div class="form_button">
						<button type="button" class="button special" id="charge_kakao">충전하기</button>
					</div>

					<form id="kakaopay" name="kakaopay" action="${context}/Payment/addpay.do" method="get">
						<input id="amountRsp" type="hidden" name="amountRsp" value="">
						<input id="pay_method" type="hidden" name="pay_method" value="">
						<input id="merchant_uid" type="hidden" name="merchant_uid" value="">
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
$('#charge_kakao').click(function() {

	var userCode = "imp10528306"; //아임포트 개인 가맹점식별코드-->회원가입 후 발급받아야함
	IMP.init(userCode);
	
	var m = $('select[name="kp_item"]').val();//셀렉트박스 값 변수에 저장
	console.log(m);

	IMP.request_pay({
		pg : "kakaopay",
		pay_method : "kakao",	
		merchant_uid : "sc" + Math.random() * 100,
		name : "SC 스위트케어",
		amount : m,
		currency : "KRW",
		language : "",
		
	},

	function(rsp) {
		console.log(rsp);
		if (rsp.success) {
			var msg = '결제 완료!';
			msg += '결제 금액:'
					+ rsp.paid_amount;
			msg += '결제수단:'
					+ rsp.pay_method;
			msg += '주문번호:'
					+ rsp.merchant_uid;

			document.getElementById("amountRsp").value = rsp.paid_amount;
			document.getElementById("pay_method").value = rsp.pay_method;
			document.getElementById("merchant_uid").value = rsp.merchant_uid;
		

			document.getElementById("kakaopay").submit();

		} else {
			var msg = '결제에 실패하였습니다.';
		}
		alert(msg);
		
	});
});
</script>

</body>
</html>