<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<title>SC 스위트케어 | 일반 본문</title>
		<%@ include file="/header-import.jsp"%>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="../assets/css/main.css" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
      
</head>

<body>

	<%@ include file="../header.jsp" %>

<!-- One -->
   <section id="One" class="wrapper style3">
      <div class="inner">
         <header class="align-center">
            <p>Eleifend vitae urna</p>
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
						<p>간병인</p>
						<h2>마이페이지</h2>
					</header>
					<br><br>
					
				   <!-- form 시작 -->
					<form name="infoForm"  id="infoForm" method=post action=caregiver>
						<c:forEach var="info" items="${info }">
						
							<div class="form_wrapper">
								<div class="form_row">
									<label for="id">아이디</label>      
									<input type="text" name="id" value="${info.g_id }" disabled>
								</div>   
							   
								<div class="form_row">
									<label for="pw">비밀번호</label>
									<input type="password" name="pw" disabled><br>
									<input type="button" value="비밀번호 변경" onclick="change_pw()">
								</div>
							
								<div class="form_row">
									<label for="name">이름</label>
									<input type="text" name="name" id="name" value="${info.g_name }">
								</div>
							
								<div class="form_row">
									<label for="gender">성별</label>
									<input type="radio" id="man" name="gender" value="M"<c:if test="${info.g_gender eq 'M' }">checked</c:if>>
									<label for="man">남자</label>
									<input type="radio" id="woman" name="gender" value="W"<c:if test="${info.g_gender eq 'W' }">checked</c:if>>
									<label for="woman">여자</label> <br><br>
								</div>
							         
								<div class="form_row">
									<label for="birth">생년월일</label>
									<input type="text" name="birth" value="${info.g_birth }" disabled>
								</div>
								<div class="form_row">
									<label for="phone"> 휴대폰 </label>
									<input type="text" name="phone" value="${info.g_phone }" id="phone">
								</div>
								
								<div class="form_row">
									<label for="sms_yn">SMS 수신 여부</label>
									<div onclick="javascript:setSMSYN()">
									<input type="checkbox" id="sms_switch" checked><label for="sms_switch" id= "sms_switch_text"style="margin:0.3rem 0 0 0;"> SMS 소식을 수신합니다.</label>
									<input type="hidden" name="sms_yn" value = "Y" <c:if test="${info.g_sms_yn eq 'Y' }">checked</c:if>>
									</div>
								</div>
								
								<div class="form_row">
									<label for="email"> 이메일 </label>
									<input type="text" name="email" value="${info.g_email }" id="email">
									
								</div>
								<div class="form_row">
								<label for="email_yn">이메일 수신 여부</label>
									<div onclick="javascript:setEmailYN()">
									<input type="checkbox" id="email_switch" checked><label for="email_switch" id= "email_switch_text"style="margin:0.3rem 0 0 0;"> 메일로 소식을 수신합니다.</label>
									<input type="hidden" name="email_yn" value = "Y" <c:if test="${info.g_email_yn eq 'Y' }">checked</c:if>>
									</div>
								</div>
								
								<div class="form_row">
									<label for="address"> 주소 </label>
									<input type="text" name="address" value="${info.g_address }" id="address">
								</div>
							
							
								<c:set var="representatives" value="${fn:split(info.g_representative,'&')}" />
								<div class="form_row" id="repreDiv">
									<label for="repre" class="representative"> 대표서비스 </label>
									<c:forEach var="repre" items="${representatives}">
										<input type="text" value="${repre }" name="repre" class="rtext"><br>
									</c:forEach>
									<input type="button" value="추가" id="addRepre">
								</div>
							        
								<c:set var="qualifications" value="${fn:split(info.g_qualification,'&')}" />
								<div class="form_row" id="qualDiv">
									<label for="qual" class="qualification">자격증 </label>
									<c:forEach var="qual" items="${qualifications}">
										<input type="text" value="${qual }" name="qual" class="qtext"><br>
									</c:forEach>
									<input type="button" value="추가" id="add">
								</div>
							
								<div class="form_row">
									<label for="location">선호지역</label>
									<select name="location"  id="sel">
										<c:set var="g_loc" value="${info.g_location}"/>
										<option value = "1">선택</option>
										<c:forEach var="loc" items="${location }">
											<option value="${loc.sido_code }" <c:if test="${loc.sido_code eq g_loc}">selected</c:if>>${loc.sido }</option>
										</c:forEach>
									</select>
								</div> 
							
								<div class="form_row">
									<label for="signup_date">가입날짜</label>
									<input type="text" value="${info.g_signup_date }" disabled>
								</div>   
							</div>
						
							<div style="text-align: center;" class="form_btn">
								<input type="hidden" name="command" value="update">
								<input class="button special"  type="button" value="수정" id="btn_updt">
							</div>
						</c:forEach>
					</form>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../footer.jsp"%>
</body>
</html>

<script>
   
   $(document).on('click', '#addRepre' , function() {
	   $("#addRepre").before("<input type='text' name='repre' class='rtext'><br>");  
	   
       var repreCnt = 0;
       $("#repreDiv > .rtext").each(function(){
          repreCnt++;
         });
       
       $(".representative").attr("rowspan", repreCnt);
   });
      
   $(document).on('click', '#add' , function() {
      $("#add").before("<input type='text' name='qual' class='qtext'><br>");

      var qualCnt = 0;
      $("#qualDiv > .qtext").each(function(){
         qualCnt++;
        });
   
      $(".qualification").attr("rowspan", qualCnt);
   });

   $(document).on('click', '#btn_updt' , function() {
	   if($("#email").val().length == 0){
	   		alert("이메일을 입력하세요.");
	   	} else if($("#email").val().length != 0) {
	   		var regExp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	   		if (!regExp.test($("#email").val())) {
	   			alert("올바를 이메일 양식을 입력하세요");
	   		} else {
			   	if($("#name").val().length == 0) {
			   		alert("이름을 입력하세요.");
			   	} else if($("#phone").val().length != 11){
			   		alert("올바른 휴대폰 번호를 입력하세요.");
			   	} else if($("#address").val().length == 0){
			   		alert("주소를 입력하세요.");
			   	} else if($("#sel").val() == 1){
			   		alert("선호지역을 선택해주세요.");
			   	} else {
					document.getElementById("infoForm").submit();
			   	}
	   		}
	   	}
	   
   });
   
   /* $(document).on('click', '#click' , function() {
	   $("#rtext").remove();
	   p = this.parentElement;
	   p.removeChild(this);
   }); */
   
   function change_pw() {
      window.open("http://localhost:8060/suiteCare/careGiver/Change_pw.jsp", "name(about:blank)", "width=500, height=500");
   }
	   
</script>
