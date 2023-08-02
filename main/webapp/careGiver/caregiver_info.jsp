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
	<% String file_repo = "/suiteCare/src/main/webapp/assets/profile/"; %>

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
									<img src="<%=file_repo %>${info.g_profile }" alt="" style="width:150px; height:150px;"/>
									<input type="file" name="profile">
								</div>   
								
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
                                    	<input type="checkbox" name="sms_yn" id="sms_switch" value = "Y" <c:if test="${info.g_sms_yn eq 'Y' }">checked</c:if>>
                                    	<label for="sms_switch" id= "sms_switch_text"style="margin:0.3rem 0 0 0;"> SMS 소식을 수신합니다.</label>
									</div>
								</div>
								
								<div class="form_row">
									<label for="email"> 이메일 </label>
									<input type="text" name="email" value="${info.g_email }" id="email">
									
								</div>
								<div class="form_row">
								<label for="email_yn">이메일 수신 여부</label>
									<div onclick="javascript:setEmailYN()">
									<input type="checkbox" name="email_yn" id="email_switch" <c:if test="${info.g_email_yn eq 'Y' }">checked</c:if> value="Y">
									<label for="email_switch" id="email_switch_text" style="margin:0.3rem 0 0 0;"> 메일로 소식을 수신합니다.</label>
									</div>
								</div>
								
								<div class="form_row">
									<label for="address"> 주소 </label>
									<input type="text" name="address" value="${info.g_address }" id="address">
								</div>
							
								<div class="form_row">
									<label for="service">서비스</label>
									<div>
	                                    <input type="checkbox" name="service" id="service" value = "1">
	                                    <label for="service" style="margin:0.3rem 0 0 0;">1</label>
									</div>
									<div>
	                                    <input type="checkbox" name="service" id="service2" value = "2">
	                                    <label for="service2" style="margin:0.3rem 0 0 0;">2</label>
									</div>
									<div>
	                                    <input type="checkbox" name="service" id="service3" value = "3">
	                                    <label for="service3" style="margin:0.3rem 0 0 0;">3</label>
									</div>
									<!-- <div>
	                                    <input type="checkbox" name="service" id="service_etc" class="act" value = "etc">
	                                    <label for="service_etc" style="margin:0.3rem 0 0 0;">기타</label>
	                                    <input type="text" id="ser_etc" disabled>
									</div> -->
								</div>
								
								<c:set var="qualifications" value="${fn:split(info.g_qualification,'&')}" />
								<div class="form_row" id="qualDiv">
									<div class="col">
										<label for="qual" class="qualification">자격증 </label>
									</div>
									<c:forEach var="qual" items="${qualifications}">
										<div>
											<input type="text" value="${qual }" name="qual" class="qtext">
											<span id="delete">삭제</span>
										</div>
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
	   $("#addRepre").before("<input type='text' name='repre' class='rtext'><span id='delete'>삭제</span>");  
	   
       var repreCnt = 0;
       $("#repreDiv > .rtext").each(function(){
          repreCnt++;
         });
       
       $(".representative").attr("rowspan", repreCnt);
   });
      
   $(document).on('click', '#add' , function() {
      $("#add").before("<input type='text' name='qual' class='qtext'><span id='delete'>삭제</span>");

      var qualCnt = 0;
      $("#qualDiv > .qtext").each(function(){
         qualCnt++;
        });
   
      $(".qualification").attr("rowspan", qualCnt);
   });

   $(document).on('click', '#delete' , function() {
	   alert("삭제");
	   $(this).prev().remove();
	   $(this).remove();
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
   
   function change_pw() {
      window.open("http://localhost:8060/suiteCare/careGiver/Change_pw.jsp", "name(about:blank)", "width=500, height=500");
   }

</script>
