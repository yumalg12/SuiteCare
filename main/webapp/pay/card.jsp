<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<title>iamport</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<body>

 <div align="center">
 <p  style="color: #ac2925; margin-top: 30px">실제 출금 건이 발생하니 결제금액 1원을 선택해주세요!!!!.</p>
<input type="radio" name="cd_item" value="1"><span>1원</span>
<input type="radio" name="cd_item" value="10000"><span>10,000원</span>
<input type="radio" name="cd_item" value="15000"><span>15,000원</span><br/>
<input type="radio" name="cd_item" value="20000"><span>20,000원</span>
<input type="radio" name="cd_item" value="25000"><span>25,000원</span>
<input type="radio" name="cd_item" value="30000"><span>30,000원</span><br/>
<input type="radio" name="cd_item" value="35000"><span>35,000원</span>
<input type="radio" name="cd_item" value="40000"><span>40,000원</span>
<input type="radio" name="cd_item" value="50000"><span>50,000원</span>
<button type="button" id="charge_card">충 전 하 기</button>
 </div>
 
 <form id = "cardpay" name = "cardpay" action = "/suiteCare/Payment/addpay.do" method = "get">
  <input id = "amountRsp" name = "amountRsp" type = "hidden" value ="">
  <input id = "merchant_uidRsp" type = "hidden"  name = "merchant_uidRsp" value =""> 
  <input id = "pay_method" name = "pay_method" type = "hidden" value ="">
</form> 

<script>
 $('#charge_card').click(function () {

   var userCode = "imp10528306";
   IMP.init(userCode);

   var c = $('input[name="cd_item"]:checked').val();
   console.log(c);

   IMP.request_pay({
	     pg: "html5_inicis",
	     pay_method: "card",
	     merchant_uid: "sc" + new Date(),
	     name: "SC 스위트케어",
	     amount: c,	     
	     language: "",
	     buyer_tel: "010-1111-1111",
	     
   }, function (rsp) {
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
	   
   } else{
	   var msg = '결제에 실패하였습니다.';
   }
    alert(msg);
   });
 });
</script>


</body>
</html>