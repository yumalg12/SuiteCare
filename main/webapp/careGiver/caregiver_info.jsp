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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/suiteCare/assets/js/execDaumPostcode.js"></script>

</head>

<body>

	<%@ include file="../header.jsp" %>
	<% String file_repo = "/suiteCare/assets/profile/"; %>

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
								<div style="
    margin-bottom: 2rem;
    justify-content: center;
    align-items: center;
    display: flex;
">
									<img src="<%=file_repo %>${info.g_profile }" alt="" style="height: 150px; margin: 0 auto;"/>
								</div>   
								
								<div class="form_row">
									<label for="id">아이디</label>      
									<input type="text" name="id" value="${info.g_id }" readonly>
								</div>   
							   
								<div class="form_row">
									<label for="pw">비밀번호</label>
								<div class="form_row_sub">
									<input type="password" name="pw" value="asdfasdf" readonly>
									<input type="button" value="비밀번호 변경" onclick="change_pw()">
								</div>
								</div>

								<div class="form_row">
									<label for="name">이름</label>
									<input type="text" name="name" id="name" value="${info.g_name }">
								</div>
							
								<div class="form_row">
									<label for="gender">성별</label>
									<div style="margin-top: 0.3rem;">
									<input type="radio" id="man" name="gender" value="M"<c:if test="${info.g_gender eq 'M' }">checked</c:if>>
									<label for="man">남자</label>
									<input type="radio" id="woman" name="gender" value="W"<c:if test="${info.g_gender eq 'W' }">checked</c:if>>
									<label for="woman">여자</label>
									</div>
								</div>
							         
								<div class="form_row">
									<label for="birth">생년월일</label>
									<input type="text" name="birth" value="${info.g_birth }" readonly>
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
								
								<c:set var="address" value="${fn:split(info.g_address,'/')}" />
								<div class="form_row">
								    <label>주소</label>
									<span class="button default" onClick="javascript:execDaumPostcode()">주소검색</span>
									<span></span>
								    <textarea class="form-control" id="address" name="g_address">${address[0]} ${address[1]} ${address[2]} ${address[3]}</textarea>
								</div>
								
								
								<c:set var="representatives" value="${info.g_representative}" />
								<c:set var="etc" value="${fn:split(info.g_representative,')')}" />
								<div class="form_row">
									<label for="service">서비스</label>
									<div>
									<div>
	                                    <input type="checkbox" name="service" id="service" value = "욕창"<c:if test='${fn:contains(representatives, "욕창")}'>checked</c:if>>
	                                    <label for="service" style="margin:0.3rem 0 0 0;">욕창</label>
									</div>
									<div>
	                                    <input type="checkbox" name="service" id="service2" value = "뇌병변"<c:if test='${fn:contains(representatives, "뇌병변")}'>checked</c:if>>
	                                    <label for="service2" style="margin:0.3rem 0 0 0;">뇌병변</label>
									</div>
									<div>
	                                    <input type="checkbox" name="service" id="service3" value = "외상환자"<c:if test='${fn:contains(representatives, "외상환자")}'>checked</c:if>>
	                                    <label for="service3" style="margin:0.3rem 0 0 0;">외상환자</label>
									</div>
									<div>
	                                    <input type="checkbox" id="service_etc" class="act" value = "etc"<c:if test='${fn:length(etc) eq 2}'>checked</c:if>>
	                                    <label for="service_etc" style="margin:0.3rem 0 0 0;">기타</label>
	                                    <input type="text" name="service" id="ser_etc" value="${etc[1]}" readonly />
									</div>
									</div>
								</div>
							        
								<c:set var="qualifications" value="${fn:split(info.g_qualification,'&')}" />
								<div class="form_row" id="qualDiv">
									<label for="qual" class="qualification">자격증 </label>
								<div>
								<c:forEach var="qual" items="${qualifications}">
									<div class="form_row_sub">
										<input type="text" placeholder="자격증" value="${qual }" name="qual" class="qtext">
										<span id='delete' style='margin-top: 0.7rem; cursor: pointer;'>삭제</span>
									</div>
								</c:forEach>
								</div>
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
									<input type="text" value="${info.g_signup_date }" readonly>
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
   
	function setAddress() {
		//주소를 한 input으로 합치는 함수
	    let zipcode = document.getElementById("zipcode").value;
	    let jibunAddress = document.getElementById("jibunAddress").value;
	    let roadAddress = document.getElementById("roadAddress").value;
	    let namujiAddress = document.getElementById("namujiAddress").value;
	    
	    if (!roadAddress){
	    	document.infoForm.g_address.value = "(우)" + zipcode + "/" + jibunAddress + "/" + namujiAddress;
	    } else {
	    	document.infoForm.g_address.value = "(우)" + zipcode + "/" + roadAddress + "/" + namujiAddress;    	
	    }
	    
	    console.log(document.joinForm.g_address.value);
	}
   
   $(document).on('click', '#add' , function() {
	      $("#add").parent().parent().append("<div class='form_row_sub'><input type='text' placeholder='자격증' name='qual' class='qtext'><span id='delete' style='margin-top: 0.7rem; cursor: pointer;'>삭제</span></div>");

	      var qualCnt = 0;
	      $("#qualDiv > .qtext").each(function(){
	         qualCnt++;
	        });
	   
	      $(".qualification").attr("rowspan", qualCnt);
	   });

	   $(document).on('click', '#delete' , function() {
		   $(this).parent().remove();
		   $(this).prev().remove();
		   $(this).next().remove();
		   $(this).remove();
	   });
	   
	   $(document).ready(function() {
			$("#qualDiv > div > .form_row_sub:first").find(":last-child").remove();
			$("#qualDiv > div > .form_row_sub:first").append("<input type='button' value='추가' id='add'>");
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
			   		if($("#service_etc").prop("checked")) {
			   			var etc = "(기타)" + $("#ser_etc").val();
			   			$("#ser_etc").val(etc);
			   		}
					document.getElementById("infoForm").submit();
			   	}
	   		}
	   	}
   });
   
	$(function(){
		$("#service_etc").change(function(){
			if($("#service_etc").prop("checked")){
				$("#ser_etc").attr("readonly", false);
			}else{
				$("#ser_etc").attr("readonly", true);
			}
		});
	});
   
   function change_pw() {
      window.open("<%=context%>/careGiver/Change_pw.jsp", "name(about:blank)", "width=500, height=500");
   }

</script>
