<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import = "member.*" %>
<%@ page import = "java.util.*" %>

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
						<p> SuiteCare </p>
						<h2>마이페이지</h2>
					</header>
					<br><br>

	<%
	request.setCharacterEncoding("utf-8"); 
	String id = (String)session.getAttribute("m_id"); 
	
	MemberDAO dao = new MemberDAO();
	List<MemberVO> list = dao.listMembers(id);


	for(int i=0; i<list.size(); i++) {
		MemberVO listvo = (MemberVO) list.get(i);
	
		String m_id = listvo.getM_id();
		String m_pw = listvo.getM_pw();
		String m_name = listvo.getM_name();
		String m_gender = listvo.getM_gender();
		String m_phone = listvo.getM_phone();
		String m_email = listvo.getM_email();
		String m_address = listvo.getM_address();
		String m_sms_yn = listvo.getM_sms_yn();
		String m_email_yn = listvo.getM_email_yn();

		 %>
					
	<script>
	
		
	function validateForm() {
	      console.log('확인');
	      var m_phone = document.minfoform.m_phone.value;
	      var m_email = document.minfoform.m_email.value;
	      var m_address = document.minfoform.m_address.value;


			if(m_phone=="") {
				alert("휴대폰 번호를 입력해주세요.");
				return false;
			}
			

			if(m_email=="") {
				alert("이메일을 입력해주세요.");
				return false;
			}
			

			if(m_address=="") {
				alert("주소를 입력해주세요.");
				return false;
			}
	      
	   }
	
	   function change_pw() {
		      window.open("http://localhost:8060/suiteCare/member/changePw.jsp", "name(about:blank)", "width=500, height=500");
		   }
	   
	   
	function setAddress() {
		//주소를 한 input으로 합치는 함수
	    let zipcode = document.getElementById("zipcode").value;
	    let jibunAddress = document.getElementById("jibunAddress").value;
	    let roadAddress = document.getElementById("roadAddress").value;
	    let namujiAddress = document.getElementById("namujiAddress").value;
	    
	    if (!roadAddress){
	    	document.tSignupForm.m_address.innerHTML = "(우) " + zipcode + " " + jibunAddress + " " + namujiAddress;
	    } else {
	    	document.tSignupForm.m_address.innerHTML = "(우) " + zipcode + " " + roadAddress + " " + namujiAddress;    	
	    }  hui
	    
	    console.log(document.tSignupForm.m_address.innerHTML);
	}

	
	function setSMSYN() {
		//체크박스에 따라 DB에 넘어갈 값 변경
		if (document.minfoForm.sms_switch.checked){
			document.getElementById("sms_switch_text").innerHTML = "Yes";
			document.minfoForm.m_sms_yn.value = "Y";
		} else {
			document.getElementById("sms_switch_text").innerHTML = "No";
			document.minfoForm.m_sms_yn.value = "N";			
		}
	}

	
	function setEmailYN() {
		//체크박스에 따라 DB에 넘어갈 값 변경
		if (document.minfoForm.email_switch.checked){
			document.getElementById("email_switch_text").innerHTML = "Yes";
			document.minfoForm.m_email_yn.value = "Y";
		} else {
			document.getElementById("email_switch_text").innerHTML = "No";
			document.minfoForm.m_email_yn.value = "N";			
		}
	}
	
	</script>				
					
	<!-- form 시작 -->
	<form name="minfoForm" method="post" onSubmit="return validateForm();" action="./member_infoCheck.jsp">
		<div class="form_wrapper">
			<div class="form_row">
				<label for="id">아이디</label> <div class="form_row_sub">
				<input type="text" id="id" name=m_name value= "<%=m_id%>"disabled></div>
			</div>
			<div class="form_row">
				<label for="pw">비밀번호</label>
				<input type="password" name="pw" value= "<%=m_pw%>"disabled><br>
				<input type="button" value="비밀번호 변경" onclick="change_pw()">
			</div>
			<div class="form_row">
				<label for="name">이름</label> 
				<input type="text" id="name" name=m_name value="<%=m_name%>" disabled>
			</div>
			<div class="form_row">
				<label for="gender">성별</label>
				<input type="text" id="gender" name=m_gender value="<%=m_gender%>" disabled>

			</div>
			<div class="form_row">
				<label for="phone">휴대폰 번호</label>
				<input type="tel" id="phone" name="m_phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="<%=m_phone%>">
			</div>
			<div class="form_row">
				<label for="email">이메일</label>
				<input class="form-control" type="email" id="email" name="m_email" value="<%=m_email%>">
			</div>

			<div class="form_row">
			    <label>주소</label>
			    <input class="form-control" type="text" id="address" name="m_address" value="<%=m_address%>"><span></span>
				<span class="button default" onClick="javascript:execDaumPostcode()">주소검색</span><span></span>
			</div>
			
			<div class="form_row">
				<label for="sms_yn">SMS 수신 여부</label>
				<div onclick="javascript:setSMSYN()">
					<input type="checkbox" id="sms_switch" <%if(m_sms_yn.equals("Y")){%>checked<%}%>><label for="sms_switch" id="sms_switch_text" style="margin:0.3rem 0 0 0;">Yes</label>
					<input type="hidden" id="sms_yn" name="m_sms_yn" value="Y">

				</div>
			</div>
			<div class="form_row">
				<label for="email_yn">이메일 수신 여부</label>
				<div onclick="javascript:setEmailYN()">
					<input type="checkbox" id="email_switch" <%if(m_sms_yn.equals("Y")){%>checked<%}%>><label for="email_switch" id="email_switch_text" style="margin:0.3rem 0 0 0;">Yes</label>
					<input type="hidden" id="email_yn" name="m_email_yn" value="Y"/>

				</div>
			</div>
		</div>
			<div class="form_button">
			<input class="button special" type="submit" value=수정하기 >
			</div>
	</form>

	<!-- form 끝 -->

						</div>
					</div>
				</div>
			</section>
<%	} %>
<%@ include file="/footer.jsp" %>


	</body>
</html>