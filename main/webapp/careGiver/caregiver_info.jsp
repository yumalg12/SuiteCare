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
								<div class="form_row">
									<img src="<%=file_repo %>${info.g_profile }" alt="" style="width:150px; height:150px;"/>
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
								    <label>주소</label>
									<span class="button default" onClick="javascript:execDaumPostcode()">주소검색</span>
									<input type="hidden" id="zipcode" pattern="[0-9]{5}" placeholder="우편번호 (숫자 5자리)" title="우편번호 (숫자 5자리)" maxlength="5" required>
									<input type="hidden" id="jibunAddress" placeholder="지번 주소" title="지번 주소" required>
									<input type="hidden" id="roadAddress" placeholder="도로명 주소" title="도로명 주소" required>
									<input type="hidden" id="namujiAddress" placeholder="나머지 주소" title="나머지 주소" required>
									<span></span><textarea id="address" name="g_address">${info.g_address}</textarea>
								</div>
								
								<div class="form_row">
								<label for="location">서비스</label>
								<div>
									<div class="form_row">
										<label class="rank-label">1순위</label>
										<c:set var="ser1" value="${info.g_service1}"/>
										<select name="g_service1"  id="sel">
											<option value = "1">==선택==</option>
											<option value="0" <c:if test="${ser1 eq 0}">selected</c:if>>지정하지 않음</option>
											<c:forEach var="service" items="${service }">
												<option value="${service.service_code }" <c:if test="${service.service_code eq ser1}">selected</c:if>>${service.service_name }</option>
											</c:forEach>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">2순위</label>
										<c:set var="ser2" value="${info.g_service2}"/>
										<select name="g_service2"  id="sel">
											<option value = "1">==선택==</option>
											<option value="0" <c:if test="${ser2 eq 0}">selected</c:if>>지정하지 않음</option>
											<c:forEach var="service" items="${service }">
												<option value="${service.service_code }" <c:if test="${service.service_code eq ser2}">selected</c:if>>${service.service_name }</option>
											</c:forEach>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">3순위</label>
										<c:set var="ser3" value="${info.g_service3}"/>
										<select name="g_service3"  id="sel">
											<option value = "1">==선택==</option>
											<option value="0" <c:if test="${ser3 eq 0}">selected</c:if>>지정하지 않음</option>
											<c:forEach var="service" items="${service }">
												<option value="${service.service_code }" <c:if test="${service.service_code eq ser3}">selected</c:if>>${service.service_name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							        
								<c:set var="qualifications" value="${fn:split(info.g_qualification,'&')}" />
								<div class="form_row" id="qualDiv">
									<div class="col">
										<label for="qual" class="qualification">자격증 </label>
									</div>
									<div>
									<c:forEach var="qual" items="${qualifications}">
										<div>
											<input type="text" value="${qual }" name="qual" class="qtext">
											<span id="delete">삭제</span>
										</div>
									</c:forEach>
									<input type="button" value="추가" id="add">
									</div>
								</div>
								
								<div class="form_row">
								<label for="location">선호지역</label>
								<div>
									<div class="form_row">
										<label class="rank-label">1순위</label>
										<c:set var="loc1" value="${info.g_location1}"/>
										<select name="g_location1"  id="loc">
											<option value = "1">==선택==</option>
											<option value="0" <c:if test="${loc1 eq 0}">selected</c:if>>지정하지 않음</option>
											<c:forEach var="loc" items="${location }">
												<option value="${loc.sido_code }" <c:if test="${loc.sido_code eq loc1}">selected</c:if>>${loc.sido }</option>
											</c:forEach>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">2순위</label>
										<c:set var="loc2" value="${info.g_location2}"/>
										<select name="g_location2"  id="loc">
											<option value = "1">==선택==</option>
											<option value="0" <c:if test="${loc2 eq 0}">selected</c:if>>지정하지 않음</option>
											<c:forEach var="loc" items="${location }">
												<option value="${loc.sido_code }" <c:if test="${loc.sido_code eq loc2}">selected</c:if>>${loc.sido }</option>
											</c:forEach>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">3순위</label>
										<c:set var="loc3" value="${info.g_location3}"/>
										<select name="g_location3"  id="loc">
											<option value = "1">==선택==</option>
											<option value="0" <c:if test="${loc3 eq 0}">selected</c:if>>지정하지 않음</option>
											<c:forEach var="loc" items="${location }">
												<option value="${loc.sido_code }" <c:if test="${loc.sido_code eq loc3}">selected</c:if>>${loc.sido }</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div> 
							
							<div class="form_row">
								<label for="location">선호시급</label>
								<div>
									<div class="form_row">
										<label class="rank-label">1순위</label>
										<c:set var="hw1" value="${info.g_hourwage1}"/>
										<select name="g_hourwage1"  id="hw">
											<option value = "0">==선택==</option>
											<option value="1" <c:if test="${hw1 eq 1}">selected</c:if>>지정하지 않음</option>
											<c:forEach var="start" begin="10000" end="35000" step="5000">
												<c:set var="display" value="${start }원 ~ ${start+5000 }"/>
												<option value="${start }" <c:if test="${hw1 eq start}">selected</c:if>>${display }원 미만</option>
											</c:forEach>
											<option value="2" <c:if test="${hw1 eq 2}">selected</c:if>>그 이상</option>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">2순위</label>
										<c:set var="hw2" value="${info.g_hourwage2}"/>
										<select name="g_hourwage2"  id="hw">
											<option value = "0">==선택==</option>
											<option value="1" <c:if test="${hw2 eq 1}">selected</c:if>>지정하지 않음</option>
											<c:forEach var="start" begin="10000" end="35000" step="5000">
												<c:set var="display" value="${start }원 ~ ${start+5000 }"/>
												<option value="${start }" <c:if test="${hw2 eq start}">selected</c:if>>${display }원 미만</option>
											</c:forEach>
											<option value="2" <c:if test="${hw2 eq 2}">selected</c:if>>그 이상</option>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">3순위</label>
										<c:set var="hw3" value="${info.g_hourwage3}"/>
										<select name="g_hourwage3"  id="hw">
											<option value = "0">==선택==</option>
											<option value="1" <c:if test="${hw3 eq 1}">selected</c:if>>지정하지 않음</option>
											<c:forEach var="start" begin="10000" end="35000" step="5000">
												<c:set var="display" value="${start }원 ~ ${start+5000 }"/>
												<option value="${start }" <c:if test="${hw3 eq start}">selected</c:if>>${display }원 미만</option>
											</c:forEach>
											<option value="2" <c:if test="${hw3 eq 2}">selected</c:if>>그 이상</option>
										</select>
									</div>
								</div>
							</div> 
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
      $("#add").before("<div><input type='text' name='qual' class='qtext'><span id='delete'>삭제</span></div>");

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
			   	} else if($("#sel").val() == 0){
			   		alert("서비스를 선택해주세요.");
			   	} else if($("#loc").val() == 0){
			   		alert("선호지역을 선택해주세요.");
			   	} else if($("#hw").val() == 0){
			   		alert("선호시급을 선택해주세요.");
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
