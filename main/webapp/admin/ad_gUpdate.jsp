<%@ page import = "caregiver.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>SC 스위트케어 | 관리자 수정</title>
<%@ include file="/header-import.jsp" %>

	</head>
	
<script>
function update() {
	var f = document.updateForm;
	f.action = "ad_gUpdateCheck.jsp";
}
</script>

<body>

<%
request.setCharacterEncoding("utf-8");
g_id = request.getParameter("g_id");

CaregiverDAO dao = new CaregiverDAO(); 
List<CaregiverVO> list = dao.giver_info(g_id);

CaregiverVO listvo = (CaregiverVO) list.get(0);

String name = listvo.getG_name();
String gender = listvo.getG_gender();
String birth = listvo.getG_birth();
String phone = listvo.getG_phone();
String email = listvo.getG_email();
String address = listvo.getG_address();
String sms_yn = listvo.getG_sms_yn();
String email_yn = listvo.getG_email_yn();
%>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>간병인 회원정보 수정</p>
						<h2></h2>
					</header>
					
<!-- form 시작 -->
	<form name="updateForm" action="javascript:update();">
	<input type="hidden" name="type" value="update"/>
		<div class="form_wrapper">
		
			<div class="form_row">
				<label for="g_id">아이디</label>
				<input type="text" id="g_id" name="g_id" value="<%=g_id %>" readonly>
			</div>	
			
			<div class="form_row">
				<label for="g_name">이름</label>
				<input type="text" id="g_name" name="g_name" value="<%=name %>" readonly>
			</div>	
			
			<div class="form_row">
				<label for="g_gender">성별</label>
				<input type="text" id="g_gender" name="g_gender" value="<%=gender %>" readonly>
			</div>
			
			<div class="form_row">
				<label for="g_birth">생년월일</label>
				<input type="text" id="g_birth" name="g_birth" value="<%=birth %>" readonly>
			</div>
			
			<div class="form_row">
				<label for="g_phone">핸드폰번호</label>
				<input type="text" id="g_phone" name="g_phone" value="<%=phone %>" placeholder="핸드폰 번호를 입력하세요." maxlength="11">
			</div>
				
			<div class="form_row">
				<label for="g_email">이메일</label>
				<input type="text" id="g_email" name="g_email" value="<%=email %>" placeholder="이메일을 입력하세요.">
			</div>
				
			<div class="form_row">
				<label for="g_address">주소</label>
				<input type="text" id="g_address" name="g_address" value="<%=address %>" placeholder="주소를 입력하세요.">
			</div>
			
			<div class="form_row">
				<label for="g_sms_yn">sms 수신동의</label>
				<input type="text" id="g_sms_yn" name="g_sms_yn" value="<%=sms_yn %>" placeholder="Y or N">
			</div>
			
			<div class="form_row">
				<label for="g_email_yn">email 수신동의</label>
				<input type="text" id="g_email_yn" name="g_email_yn" value="<%=email_yn %>" placeholder="Y or N">
			</div>

			<div>
				<input class="button special" type="submit" value="수정 완료" >
			</div>

		</div>
		
	</form>
	<!-- form 끝 -->

				</div>
			</div>
		</div>
	</section>

</body>
</html>