<%@ page import = "member.*" %>
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
	f.action = "ad_mUpdateCheck.jsp";
}
</script>

<body>

<%
request.setCharacterEncoding("utf-8");
m_id = request.getParameter("m_id");

MemberDAO dao = new MemberDAO(); 
List<MemberVO> list = dao.listMembers(m_id);

MemberVO listvo = (MemberVO) list.get(0);

String m_name = listvo.getM_name();
String m_gender = listvo.getM_gender();
String m_phone = listvo.getM_phone();
String m_email = listvo.getM_email();
String m_address = listvo.getM_address();
String m_sms_yn = listvo.getM_sms_yn();
String m_email_yn = listvo.getM_email_yn();
%>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>회원 정보 수정</p>
						<h2></h2>
					</header>
					
<!-- form 시작 -->
	<form name="updateForm" action="javascript:update();">
	<input type="hidden" name="type" value="update"/>
		<div class="form_wrapper">
		
			<div class="form_row">
				<label for="m_id">아이디</label>
				<input type="text" id="m_id" name="m_id" value="<%=m_id %>" readonly>
			</div>	
			
			<div class="form_row">
				<label for="m_name">이름</label>
				<input type="text" id="m_name" name="m_name" value="<%=m_name %>" readonly>
			</div>	
			
			<div class="form_row">
				<label for="m_gender">성별</label>
				<input type="text" id="m_gender" name="m_gender" value="<%=m_gender %>" readonly>
			</div>
			
			<div class="form_row">
				<label for="m_phone">핸드폰번호</label>
				<input type="text" id="m_phone" name="m_phone" value="<%=m_phone %>" placeholder="핸드폰 번호를 입력하세요." maxlength="11">
			</div>
				
			<div class="form_row">
				<label for="m_email">이메일</label>
				<input type="text" id="m_email" name="m_email" value="<%=m_email %>" placeholder="이메일을 입력하세요.">
			</div>
				
			<div class="form_row">
				<label for="m_address">주소</label>
				<input type="text" id="m_address" name="m_address" value="<%=m_address %>" placeholder="주소를 입력하세요.">
			</div>
			
			<div class="form_row">
				<label for="m_sms_yn">sms 수신동의</label>
				<input type="text" id="m_sms_yn" name="m_sms_yn" value="<%=m_sms_yn %>" placeholder="Y or N">
			</div>
			
			<div class="form_row">
				<label for="m_email_yn">email 수신동의</label>
				<input type="text" id="m_email_yn" name="m_email_yn" value="<%=m_email_yn %>" placeholder="Y or N">
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