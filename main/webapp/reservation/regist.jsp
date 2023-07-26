<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

	<!--          meta 선언          -->
	<meta charset="UTF-8">
	<meta name = "viewport" content="width=device-width", initial-scale="1"> 

	<!--          link 선언          -->
	<link rel = "stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="./css/style.css">
	
	<!--          script 선언          -->
    <script src="https://code.jquery.com/jquery-3.1.1min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>

<style>
body {

}
h1 {

}
table {
    margin-left:auto; 
    margin-right:auto;
    border: none;
}
tr, td {
	padding: 10px;
}
.sbmt {
	margin-top: 10px;
	width: 50px;
	height: 30px;
	background-color: whitesmoke;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid-black;
}
</style>
<script>
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if(data.buildingName !== '' && data.apartment === 'Y'){
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if(extraRoadAddr !== ''){
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }
      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
      if(fullRoadAddr !== ''){
        fullRoadAddr += extraRoadAddr;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
      document.getElementById('roadAddress').value = fullRoadAddr;
      document.getElementById('jibunAddress').value = data.jibunAddress;

      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if(data.autoRoadAddress) {
        //예상되는 도로명 주소에 조합형 주소를 추가한다.
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

      } else if(data.autoJibunAddress) {
          var expJibunAddr = data.autoJibunAddress;
          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
      } else {
          document.getElementById('guide').innerHTML = '';
      }
      
     
    }
  }).open();
}
</script>
<script type="text/javascript">
function fn_overlapped(){
	   
	var _id = $("#user_id").val();
    
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
  
    $.ajax({
       type:"post",
       async:false,  
       url:"overlapped.jsp",
       dataType:"text",
       data: {id:_id},
       success:function (data){
    	   console.log(data.replace(/(<([^>]+)>)/ig,""));
    	   
    	   //alert(data);
    	   
          if(data.includes("false")){
       	    alert("사용할 수 있는 ID입니다.");
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#user_id').prop("disabled", true);
       	    $('#huser_id').val(_id);
          }else{
        	  alert("사용할 수 없는 ID입니다.");
          }
       },
       
       error:function(data,textStatus){
          alert("에러가 발생했습니다. " + textStatus);ㅣ
       },
       complete:function(data,textStatus){
          //alert("작업을완료 했습니다");
       }
    })  //end ajax	 
 }	


</script>

<script >
	function validateForm() {
		//console.log('확인');
		var id = document.Registform.user_id.value;
		var hid = document.Registform.huser_id.value;
		var pw1 = document.Registform.pwd1.value;
		var pw2 = document.Registform.pwd2.value;
		var name = document.Registform.user_name.value;
		var gender = document.getElementsByName("gender");
		var selectGen = "";
		var byear=document.getElementById("birth_Year").value;
		var bmonth=document.getElementById("birth_Month").value;
		var bday=document.getElementById("birth_Day").value;
		var calendar = document.getElementsByName("calendar");
		var selectCalendar = "";
		var hp1=document.getElementById("hp1").value;
		var hp2=document.Registform.hp2.value;
		var hp3=document.Registform.hp3.value;
		var mailID=document.Registform.mail_id.value;
		var mailDomain=document.getElementById("mail_option").value;
		var zipcode = document.Registform.zipcode.value;
		var namuji = document.Registform.namujiAddress.value;
		
		
	
		//최소 한개의 영문, 숫자, 특수문자 포함(정규표현식)
		var idv=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{5,11}$/
		if(!idv.test(id)) {
			alert("ID는 영문 대소문자와 숫자, 특수문자를 포함하는 5~11자리로 이루어져야합니다.")
			return false;
		}
		
		var pwv=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,12}$/
			if(!pwv.test(pw1)) {
				alert("비밀번호는 영문 대소문자와 숫자, 특수문자를 포함하는 6~12자리로 이루어져야합니다.")
				return false;
			}
		if(pw1!==pw2) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		if(name=="") {
			alert("이름을 입력해주세요.");
			return false;
		}
		
		//성별 확인
		for(var i=0; i<gender.length; i++) {
			if(gender[i].checked) {
				selectGen=gender[i].value;
				break;
			}
		}
		if(selectGen==="") {
			alert("성별을 선택해주세요");
			return false;
		}
		
		if(byear=="") {
			alert("출생년도를 선택하세요.");
			return false;
		}
		if(bmonth=="") {
			alert("출생월을 선택하세요.");
			return false;
		}
		if(bday=="") {
			alert("출생일을 선택하세요.");
			return false;
		}
		for(var i=0; i<calendar.length; i++) {
			if(calendar[i].checked) {
				selectCalendar=calendar[i].value;
				break;
			}
		}
		if(selectCalendar==="") {
			alert("양력/음력을 선택해주세요");
			return false;
		}
		if(hp1=="") {
			alert("핸드폰 번호 첫번째 부분을 선택하세요.");
			return false;
		}
		if(hp2.length<3||hp2.length>4) {
			alert("핸드폰 번호 두번째 부분은 3~4개의 숫자로 이루어져야합니다.");
			return false;
		}
		if(hp3.length<3||hp3.length>4) {
			alert("핸드폰 번호 세번째 부분은 3~4개의 숫자로 이루어져야합니다.");
			return false;
		}
		if(mailID=="") {
			alert("메일아이디를 입력해주세요.");
			return false;
		}
		if(mailDomain=="") {
			alert("메일주소를 선택해주세요.");
			return false;
		}
		if(zipcode=="") {
			alert("주소를 입력해주세요.");
			return false;
		}
		
		if(namuji=="") {
			alert("상세주소를 입력하지 않으셨습니다.");
			return false;
		}
		
		if(hid=="") {
			alert("아이디 중복검사를 실행해주세요.");
			return false;
		}
		
		return true;
		
		
		if(document.getElementById("sms").checked) {
			document.getElementById("sms_hidden").disabled=true;
		} else {
			document.getElementById("sms_hidden").disabled=false;
		}

		if(document.getElementById("email").checked) {
			document.getElementById("email_hidden").disabled=true;
		} else {
			document.getElementById("email_hidden").disabled=false;
		}
		
	}


</script>
<script>
function goindexForm() {
	location.href="index.jsp";
}
</script>

<script type="text/javascript">
	function mailChange() {
		var mailop=document.Registform.mail_option;
		var maildo=document.Registform.mail_domain;
		
		if(mailop.options[mailop.selectedIndex].value=='9') {
			maildo.disabled=false;
			maildo.value="";
			maildo.focus();
		}	else {
			maildo.disabled=true;
			maildo.value=mailop.options[mailop.selectedIndex].value;
		}
	}

</script>



<body>


	<form action="./regist_check.jsp" name="Registform" method="post" onSubmit="return validateForm();">
		<br><h3 align="center">예약 정보 등록</h3><br><br>
		
		
		 Q1. 보호자님께 필요한 간병 서비스는 무엇인가요? 
		<br>
		<input type="radio" id="term" name="service" value="기간제">
				<label for="term">기간제 간병</label>
		<input type="radio" id="hour" name="service" value="시간제">
				<label for="hour">시간제 간병</label>
		<br>
		<br>
		
		 Q2. 보호자님이 원하시는 간병 장소를 선택해주세요!
		 <br>
		<input type="radio" id="hospital" name="place" value="병원,의원">
				<label for="hospital">병원,의원</label>
		<input type="radio" id="home" name="place" value="집">
				<label for="home">집</label>
		<br>
		<br>
		
		

		<div style="text-align: center;">
			<input class="sbmt" type="submit" value=가입 >
			<input class="sbmt" type="reset" value=초기화>
	 		<input class="sbmt" type="hidden" name="command" value="addMember">
	 		<input class="sbmt" type="button" value=취소 onClick="goindexForm()">
		</div>
	</form>

</body>

</html>