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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/suiteCare/assets/js/execDaumPostcode.js"></script>
	<script src="/suiteCare/test/gSignup.js"></script>

	<script>
		function signUpValidation() {
			const id = $("#id").val().trim();
			const name = $("#name").val().trim();
			const pw = $("#pw").val();
		
			// 중복 확인 검사
			if (!$("#id").prop("disabled")) {
				alert("아이디 중복확인이 필요합니다.");
				$("#id").focus();
				return false;
			}
		
			// 이름 검사
			if (name.length < 2) {
				alert("올바른 이름을 입력하십시오.");
				$("#name").focus();
				return false;
			}
		
			// 비밀번호 유효성 검사
			if (pw.length < 4) {
				alert("비밀번호는 4자리 이상이어야 합니다.");
				$(".pw_check_notice").show();
				$("#pw").focus();
				return false;
			}
		
			// 비밀번호 확인 검사
			if (!PWValidation()) {
				alert("비밀번호 확인이 일치하지 않습니다.");
				$(".pw_check_notice").show();
				$("#pw").focus();
				return false;
			}
		
			// 성별 검사
			if (document.joinForm.g_gender.value == "") {
				alert("성별을 선택하세요.");
				return false;
			}
			
			if($("#service_etc").prop("checked")) {
	 			var etc = "(기타)" + $("#ser_etc").val();
	 			$("#ser_etc").val(etc);
			}
			
			// 생년월일 검사
			if(document.joinForm.g_birth.value == "") {
				alert("생년월일을 입력하세요.");
				return false;
			}
			
			//이메일 검사
			let emailPattern = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-z]+$/;
	
			if (!emailPattern.test($("#email").val())) {
				alert("올바른 이메일을 입력하세요.");
				$("#email").focus();
				return false;
			}
			
			//주소 검사
			if (document.joinForm.g_address.value == ""){
				alert("주소를 입력하세요.");
				$("#address").focus();
				return false;
			}
			
			//선택지 검사
			const g_serviceArr = [document.joinForm.g_service1.value, document.joinForm.g_service2.value, document.joinForm.g_service3.value];
			if (g_serviceArr.includes("1")){
				alert("서비스 1~3순위를 모두 선택하세요.");
				return false;
			}
			const g_locationArr = [document.joinForm.g_location1.value, document.joinForm.g_location2.value, document.joinForm.g_location3.value];
			if (g_locationArr.includes("1")){
				alert("선호지역 1~3순위를 모두 선택하세요.");
				return false;
			}
			const g_hourwageArr = [document.joinForm.g_hourwage1.value, document.joinForm.g_hourwage2.value, document.joinForm.g_hourwage3.value];
			if (g_hourwageArr.includes("1")){
				alert("선호시급 1~3순위를 모두 선택하세요.");
				return false;
			}
	
			// 휴대폰 번호 형식 정리
			$("#phone").val($("#phone").val().split("-").join(""));
			
			$('select > option:disabled').attr("disabled",false);
			
			//모든 검증 통과
			document.getElementById("joinForm").submit();
		}
	
	function PWValidation(){
		//비밀번호 확인 검사
		let pw = $("#pw").val();
		let pwcheck = $("#pw_check").val();
		
		if (pw != pwcheck) {		
			$(".pw_check_notice").show();
			return false;
		} else {
			$(".pw_check_notice").hide();
			return true;
		}
	}
	
	function setID() {
		//ID 입력값을 정리하기 위함
		let id = $("#id").val();
		let g_id = $("#g_id").val();
		g_id = id.trim().toLowerCase();
		console.log(g_id);
	}
	
	function isDuplicateID() {
		//중복확인 함수
		let _id = $("#id").val();
		let g_id = "";
		let regExp = /^[a-z0-9_.]{4,}$/;
		
		if (!regExp.test(_id)){
		alert("ID는 4자 이상의 영문, 숫자로 이루어진 문자여야 합니다.");
		setTimeout(function () { $("#id").focus(); }, 100);
		} else {
			 $.ajax({
			    type: "get",
			    async: false,
			    url: "<%=context%>/careGiver/join",
			    dataType: "json",
			    data: {id: _id, type: "isDuplicateID"},
			    success: function(data, textStatus) {
			    	console.log(data.isDuplicateID);
			        if (data.isDuplicateID == 0) {
			            alert("사용할 수 있는 ID입니다.");
			            g_id = _id.trim().toLowerCase();
			            $("#g_id").val(g_id);
			            $("#id").prop("disabled", true);
			            console.log(g_id);
			        } else if (data.isDuplicateID == 1) {
			            alert("사용할 수 없는 ID입니다.");
			    	  setTimeout(function () { $("#id").focus(); }, 100);
			        } else {
			        	console.log("count: -1 (error)");
			            alert("오류가 발생했습니다.");
			        }
			    },
			    error: function(data, textStatus) {
			    	console.log("data: "+ data +" / textStatus: "+textStatus);
			        alert("오류가 발생했습니다.");
			    },
			    complete: function(data, textStatus) {
			    }
			});
		}
	}
	
	function setAddress() {
		//주소를 한 input으로 합치는 함수
	  let zipcode = document.getElementById("zipcode").value;
	  let jibunAddress = document.getElementById("jibunAddress").value;
	  let roadAddress = document.getElementById("roadAddress").value;
	  let namujiAddress = document.getElementById("namujiAddress").value;
	  
	  if (!roadAddress){
	  	document.joinForm.g_address.value = "(우)" + zipcode + " " + jibunAddress + " " + namujiAddress;
	  } else {
	  	document.joinForm.g_address.value = "(우)" + zipcode + " " + roadAddress + " " + namujiAddress;    	
	  }
	  
	  console.log(document.joinForm.g_address.value);
	}
	
	function setMaxDate() {
		let dateobj = new Date();
		let month = dateobj.getMonth() < 10? "0"+dateobj.getMonth():dateobj.getMonth();
		let date = dateobj.getDate() < 10? "0"+dateobj.getDate():dateobj.getDate();
		let fourteen = (dateobj.getFullYear() - 14)+"-"+month+"-"+date;
		let ninety = (dateobj.getFullYear() - 90)+"-"+month+"-"+date;
		
		document.joinForm.g_birth.max = fourteen;
		document.joinForm.g_birth.min = ninety;
	}
	
	</script>
	
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
						<p>asdf</p>
						<h2>회원가입</h2>
					</header>
					
				 <!-- form 시작 -->
					<form name="joinForm"  id="joinForm" method=post action=join enctype="multipart/form-data">
						<div class="form_wrapper">
								<div onclick="javascript:setImg()" style="margin: 3rem 0;display: grid;justify-items: center;">
									<div style="border: 1px solid #ccc; border-radius: 10rem; background: white; width: 10rem; padding: 10px; height: 10rem;">
										<img id="defult_img_png" src="" style="width: 100%;">
									</div>
							<div>
								<input type="checkbox" id="default_img" name="default_img" value="default" onclick="javascript:showImgSelector();">
								<label for="default_img" id="default_img_text" style="margin:0.3rem 0 0 0;">기본 프로필사진 사용</label>
							</div>
							<input type="file" name="g_profile" id="g_profile" style="margin-top: 0.5rem;">
							</div>

							<div class="form_row">
								<label for="id">아이디</label> <div class="form_row_sub">
								<input type="text" id="id" placeholder="아이디" title="아이디 (영문, 숫자 4~20자)" maxlength="20" required>
								<input type="hidden" id="g_id" name="g_id">
								<span class="button default" onclick="javascript:isDuplicateID()">중복확인</span></div>
							</div>
										 
							<div class="form_row">
								<label for="pw">비밀번호</label> <input type="password" id="pw" name="g_pw" placeholder="비밀번호" title="비밀번호 (4자 이상)" oninput="javascript:PWValidation();" required>
							</div>
							<div class="form_row">
								<label for="pw">비밀번호 확인</label>
								<input type="password" id="pw_check" placeholder="비밀번호 확인" title="바밀번호 확인 (비밀번호와 동일한 값)" oninput="javascript:PWValidation()" required>
								<span class="pw_check_notice"></span><span class="pw_check_notice" style="color: red; display: none;"><i class="fa-solid fa-circle-exclamation"></i> 비밀번호 확인이 일치하지 않습니다.</span>
							</div>
						
							<div class="form_row">
								<label for="name">이름</label>
								<input type="text" name="g_name" id="name" placeholder="이름" required>
							</div>
						
							<div class="form_row">
								<label for="gender">성별</label>
								<div style="margin-top: 0.3rem;" onclick="javascript:setDefaultProfilePic();">
									<input type="radio" id="man" name="g_gender" value="M">
									<label for="man">남자</label>
									<input type="radio" id="woman" name="g_gender" value="W">
									<label for="woman">여자</label>
								</div>
							</div>
						     
							<div class="form_row">
								<label for="birth">생년월일</label>
								<input type="date" name="g_birth" placeholder="생년월일" onclick="setMaxDate()" min="1900-01-01" required>
							</div>
							<div class="form_row">
								<label for="phone"> 휴대폰 </label>
								<input type="tel" id="phone" name="g_phone" maxlength="13" placeholder="휴대폰 번호" title="휴대폰 번호 (000-0000-0000 형식)" required>
							</div>
							
							<div class="form_row">
								<label for="sms_yn">SMS 수신 여부</label>
								<div onclick="javascript:setSMSYN()">
                                   	<input type="checkbox" name="g_sms_yn" id="sms_switch" value = "Y" checked>
                                   	<label for="sms_switch" id= "sms_switch_text" style="margin:0.3rem 0 0 0;"> SMS 소식을 수신합니다.</label>
								</div>
							</div>
							
							<div class="form_row">
								<label for="email"> 이메일 </label>
								<input type="email" id="email" name="g_email" placeholder="이메일 주소" title="이메일 주소 (xxx@xxxxx.xxx 형식)" required>
							</div>
							<div class="form_row">
							<label for="email_yn">이메일 수신 여부</label>
								<div onclick="javascript:setEmailYN()">
								<input type="checkbox" name="g_email_yn" id="email_switch" value="Y" checked>
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
							<span></span><textarea id="address" name="g_address" required></textarea>
							</div>
							
							<div class="form_row">
								<label for="location">제공 가능한 서비스</label>
								<div>
									<div class="form_row">
									<label class="rank-label">1순위</label>
										<select name="g_service1"  id="sel" onchange="javascript:disableSelectedValue(this);">
											<option value = "1">==선택==</option>
											<option value="0">지정하지 않음</option>
											<option value="요리">요리</option>
											<option value="목욕">목욕</option>
											<option value="재활운동보조">재활운동보조</option>
											<option value="외출동행">외출동행</option>
											<option value="청소">청소</option>
											<option value="빨래">빨래</option>
											<option value="운전">운전</option>
										</select>

									<label class="rank-label">2순위</label>
										<select name="g_service2"  id="sel" onchange="javascript:disableSelectedValue(this);">
											<option value = "1">==선택==</option>
											<option value="0">지정하지 않음</option>
											<option value="요리">요리</option>
											<option value="목욕">목욕</option>
											<option value="재활운동보조">재활운동보조</option>
											<option value="외출동행">외출동행</option>
											<option value="청소">청소</option>
											<option value="빨래">빨래</option>
											<option value="운전">운전</option>
										</select>

									<label class="rank-label">3순위</label>
										<select name="g_service3"  id="sel" onchange="javascript:disableSelectedValue(this);">
											<option value = "1">==선택==</option>
											<option value="0">지정하지 않음</option>
											<option value="요리">요리</option>
											<option value="목욕">목욕</option>
											<option value="재활운동보조">재활운동보조</option>
											<option value="외출동행">외출동행</option>
											<option value="청소">청소</option>
											<option value="빨래">빨래</option>
											<option value="운전">운전</option>
										</select>
									</div>
								</div>
							</div>
						    
							<div class="form_row" id="qualDiv">
									<label for="qual" class="qualification">보유 자격증 </label>
								<div>
									<div class="form_row_sub">
										<input type="text" placeholder="자격증" name="qual" class="qtext">
										<input type="button" value="추가" id="add">
									</div>
								</div>
							</div>
						
							<div class="form_row">
								<label for="location">선호지역</label>
								<div>
									<div class="form_row">
									<label class="rank-label">1순위</label>
										<select name="g_location1"  id="sel" onchange="javascript:disableSelectedValue(this);">
											<option value = "1">==선택==</option>
											<option value="0">지정하지 않음</option>
											<option value="서울특별시">서울특별시</option>
											<option value="부산광역시">부산광역시</option>
											<option value="인천광역시">인천광역시</option>
											<option value="경기도">경기도</option>
											<option value="제주특별자치도">제주특별자치도</option>
										</select>

									<label class="rank-label">2순위</label>
										<select name="g_location2"  id="sel" onchange="javascript:disableSelectedValue(this);">
											<option value = "1">==선택==</option>
											<option value="0">지정하지 않음</option>
											<option value="서울특별시">서울특별시</option>
											<option value="부산광역시">부산광역시</option>
											<option value="인천광역시">인천광역시</option>
											<option value="경기도">경기도</option>
											<option value="제주특별자치도">제주특별자치도</option>
										</select>

									<label class="rank-label">3순위</label>
										<select name="g_location3"  id="sel" onchange="javascript:disableSelectedValue(this);">
											<option value = "1">==선택==</option>
											<option value="0">지정하지 않음</option>
											<option value="서울특별시">서울특별시</option>
											<option value="부산광역시">부산광역시</option>
											<option value="인천광역시">인천광역시</option>
											<option value="경기도">경기도</option>
											<option value="제주특별자치도">제주특별자치도</option>
										</select>
									</div>
								</div>
							</div> 
							
							<div class="form_row">
								<label for="hourwage">선호시급</label>
								<div>
									<div class="form_row">
									<label class="rank-label">1순위</label>
										<select name="g_hourwage1"  id="sel" onchange="javascript:disableSelectedValue(this);">
											<option value = "1">==선택==</option>
											<option value="0">지정하지 않음</option>
											<c:forEach var="start" begin="10000" end="15000" step="1000">
												<c:set var="display" value="${start }원 "/>
												<option value="${start }">${display }</option>
											</c:forEach>
											<option value="2">그 이상</option>
										</select>

									<label class="rank-label">2순위</label>
										<select name="g_hourwage2"  id="sel" onchange="javascript:disableSelectedValue(this);">
											<option value = "1">==선택==</option>
											<option value="0">지정하지 않음</option>
											<c:forEach var="start" begin="10000" end="15000" step="1000">
												<c:set var="display" value="${start }원 "/>
												<option value="${start }">${display }</option>
											</c:forEach>
											<option value="2">그 이상</option>
										</select>

									<label class="rank-label">3순위</label>
										<select name="g_hourwage3"  id="sel" onchange="javascript:disableSelectedValue(this);">
											<option value = "1">==선택==</option>
											<option value="0">지정하지 않음</option>
											<c:forEach var="start" begin="10000" end="15000" step="1000">
												<c:set var="display" value="${start }원 "/>
												<option value="${start }">${display }</option>
											</c:forEach>
											<option value="2" <c:if test="${hw3 eq 2}">selected</c:if>>그 이상</option>
										</select>
									</div>
								</div>
							</div> 
						</div>
					
						<div class="form_button">
							<input type="hidden" name="command" value="signup">
							<span type="submit" class="button special" id="join" onclick="signUpValidation();">회원가입</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../footer.jsp"%>
</body>
</html>

<script>
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
   
	function showImgSelector() {
	    let g_profile = document.getElementById("g_profile");
	    let default_img_png = document.getElementById("defult_img_png");
	    
	    if (g_profile.style.display === "none") {
	        g_profile.style.display = "";
	        default_img_png.style.display = "none";
	    } else {
	        g_profile.style.display = "none";
	        default_img_png.style.display = "";
	        default_img_png.src = "<%=context%>/assets/profile/man.png";
	    }
	}

	function setDefaultProfilePic() {
	    let gender =document.joinForm.g_gender.value;
	    let defaultImg = document.getElementById("defult_img_png");

	    if (gender === "M") {
	        defaultImg.src = "<%=context%>/assets/profile/man.png";
	    } else if (gender === "W") {
	        defaultImg.src = "<%=context%>/assets/profile/woman.png";
	    }
	}

	function disableSelectedValue(element) {
		  const selectBoxes = element.parentElement.querySelectorAll('select');
		  const selectedVals = [selectBoxes[0].value, selectBoxes[1].value, selectBoxes[2].value];

		  selectBoxes.forEach((e) => {
		    if (e !== element) {
		      Array.from(e.options).forEach((option) => {
		        if (selectedVals.includes(option.value) && option.value !== '1' && option.value !== '0') {
		          option.disabled = true;
		        } else {
		          option.disabled = false;
		        }
		      });
		    }
		  });
		}

</script>
