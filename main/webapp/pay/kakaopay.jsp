<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="java.util.*"%>
<%@ page import="payment.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
PayVO payvo = new PayVO();
%>
<body>
<div align="center">
<input type="radio" name="kp_item" value="5000"><span>5,000원</span>
<input type="radio" name="kp_item" value="10000"><span>10,000원</span>
<input type="radio" name="kp_item" value="15000"><span>15,000원</span><br/>
<input type="radio" name="kp_item" value="20000"><span>20,000원</span>
<input type="radio" name="kp_item" value="25000"><span>25,000원</span>
<input type="radio" name="kp_item" value="30000"><span>30,000원</span><br/>
<input type="radio" name="kp_item" value="35000"><span>35,000원</span>
<input type="radio" name="kp_item" value="40000"><span>40,000원</span>
<input type="radio" name="kp_item" value="50000"><span>50,000원</span>
<button type="button" class="btn btn-outline-dark" id="charge_kakao">충 전 하 기</button>
 </div>
 
 <form id = "kakaopay" name = "kakaopay" action = "/suiteCare/Payment/addpay.do" method = "get">
  <input id = "amountRsp" type = "hidden" name = "amountRsp" value ="">
  <input id = "merchant_uidRsp" type = "hidden"  name = "merchant_uidRsp" value =""> 
  <input id = "pay_method" type = "hidden" name = "pay_method" value ="">
 </form> 

<script> 
 

 $('#charge_kakao').click(function () {
	
	 var userCode = "imp10528306"; //아임포트 개인 가맹점식별코드-->회원가입 후 발급받아야함
	 IMP.init(userCode);
	 var m = $('input[name="kp_item"]:checked').val();//라디오박스 체크 값 변수에 저장
     console.log(m);
	
    IMP.request_pay({
     pg: "kakaopay",
     pay_method: "kakao",
     merchant_uid: "sc" + new Date(),
     name: "SC 스위트케어",
     amount: m,
     currency: "KRW",
     language: "",
     buyer_tel: <%= payvo.getM_phone()%>,
     
    }, function (rsp) {
 	   console.log(rsp);
 	   if (rsp.success) {
 		  var msg = '결제 완료!';
 		  msg += '결제 금액:' + rsp.paid_amount;
 		  msg += '결제수단:' + rsp.pay_method;
 		  msg += '주문번호:' + rsp.merchant_uid;

 	   document.getElementById("amountRsp").value = rsp.paid_amount;
 	   document.getElementById("merchant_uidRsp").value = rsp.merchant_uid;
 	   document.getElementById("pay_method").value = rsp.pay_method;
 	   
 	   document.getElementById("kakaopay").submit(); 
 	 
    } else{
 	   var msg = '결제에 실패하였습니다.';
    }
     alert(msg);
     //document.location.href="";
    
    });
  });
 </script>



</body>
</html>