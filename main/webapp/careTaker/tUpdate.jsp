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
					
					<!-- Table -->
					<form name="tupdateForm">
					<table>
					<tr><td>이름</td><td style="width: 5rem;">성별</td><td>나이</td><td>키</td><td>몸무게</td><td style="width: 16rem;">지역</td><td style="width: 16rem;">상태 (병명)</td></tr>
					<tr><td><input type="text" name="t_name" id="t_name"  value="<%=name %>"></td>
					<td><input type="text" name="t_gender" id="t_gender"  value="<%=gender %>"></td>
					<td><input type="text" name="t_age" id="t_age"  value="<%=age %>" class="with_unit"> 세</td>
					<td><input type="text" name="t_height" id="t_height"  value="<%=height %>" class="with_unit"> cm</td>
					<td><input type="text" name="t_weight" id="t_weight"  value="<%=weight %>" class="with_unit"> kg</td>
					<td><input type="text" name="addr" id="addr"  value="주소"></td>
					<td><input type="text" name="diagnosis" id="diagnosis"  value="<%=diagnosis %>"></td>
					</tr>
					</table>
					<div class="form_button" >
						<span class="button" onclick="history.back(0)">취소</span>
						&nbsp;
						<button class="button special" onclick="location.href='tUpdateCheck.jsp'">수정 완료</button>
					</div>
				</div>
			</div>
		</div>
	</section>
<% } %>	

<%@ include file="/footer.jsp" %>

</body>
</html>