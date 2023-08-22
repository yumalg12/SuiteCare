<%@ page import = "caretaker.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>SC 스위트케어 | 메인페이지</title>
<%@ include file="/header-import.jsp" %>

	</head>
	
<style>
.with_unit{
	width: calc(100% - 40px) !important;
    display: inline !important;
    margin-right: 0.2rem !important;
  }
</style>
<script>
function upcheck() {
	var f = document.tupdateForm;
	f.method = "post";
	f.action = "tUpdateCheck.jsp";
	f.submit();
}
</script>
<body>
<%@ include file="/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");
String m_id = (String)session.getAttribute("m_id");
String t_name = request.getParameter("t_name");

TakerDAO dao = new TakerDAO(); 
List<TakerVO> list = dao.takernameList(m_id, t_name);

for(int i=0; i<list.size(); i++) {
   TakerVO listvo = (TakerVO) list.get(i);
   
   String id = listvo.getM_id();
   String code = listvo.getT_code();
   String name = listvo.getT_name();
   String gender = listvo.getT_gender();
   String age = listvo.getT_age();
   String height = listvo.getT_height();
   String weight = listvo.getT_weight();
   String diagnosis = listvo.getDiagnosis();
%>

<!-- One -->
   <section id="One" class="wrapper style3">
      <div class="inner">
         <header class="align-center">
            <p>adsfasdfsdf</p>
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
						<p>간병 받을 분</p>
						<h2>기본 정보 수정</h2>
					</header>
					
<!-- form 시작 -->
	<form name="tupdateForm" action="javascript:upcheck();">
		<div class="form_wrapper">
			<div class="form_row">
				<label for="t_name">이름</label>
				<input type="text" id="t_name" name="t_name" value="<%=name %>" placeholder="피간병인 이름을 입력하세요." maxlength="15">
				<input type="hidden" name="t_code" value="<%=code %>">
			</div>
			
			<div class="form_row">
				<label for="t_gender">성별</label>
				<div>
				<input type="radio" id="man" name="t_gender" value="남">
				<label for="man">남자</label>
				<input type="radio" id="woman" name="t_gender" value="여">
				<label for="woman">여자</label> 
				</div>
			</div>		
			<script>
			if ("<%=gender %>" == "남"){
				document.getElementById("man").checked = true;
			} else {
				document.getElementById("woman").checked = true;
			}
			</script>	
			
			<div class="form_row">
				<label for="t_age">나이</label>
				<input type="number" id="t_age" name="t_age" value="<%=age %>" placeholder="피간병인 나이를 입력하세요." min="0" max="150" maxlength="3">
			</div>
			
			<div class="form_row">
				<label for="t_height">키 (cm)</label>
				<input type="number" id="t_height" name="t_height" value="<%=height %>" placeholder="피간병인 키를 입력하세요." min="50" max="250" maxlength="3">
			</div>
				
			<div class="form_row">
				<label for="t_weight">몸무게 (kg)</label>
				<input type="number" id="t_weight" name="t_weight" value="<%=weight %>" placeholder="피간병인 몸무게를 입력하세요." min="10" max="350" maxlength="3">
			</div>
				
			<div class="form_row">
				<label for="diagnosis">진단명</label>
				<input type="text" id="diagnosis" name="diagnosis" value="<%=diagnosis %>" placeholder="진단명을 입력하세요.">
			</div>
		<div class="form_button_three">
	 		<span class="button alt" style="width: fit-content" onclick="history.back(-1)">취소</span>
			<div>
			<input class="button" type="reset" value=초기화>
			<input class="button special" type="submit" value="수정 완료" >
			</div>
		</div>
		</div>
		
	</form>
	<!-- form 끝 -->

				</div>
			</div>
		</div>
	</section>
<% } %>	

<%@ include file="/footer.jsp" %>

</body>
</html>