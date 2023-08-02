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

		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />	
		<link rel="stylesheet" href="../assets/css/main.css" />
	</head>
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="./assets/js/execDaumPostcode.js"></script>

<%@ include file="../header.jsp" %>

<style>
td {
	text-align: center;
}
.box {
	text-align: center;
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
					<tr><td>이름</td><td>코드</td><td>성별</td><td>나이</td><td>키</td><td>몸무게</td><td>상태(병명)</td></tr>
					<tr><td><input type="text" name="t_name" id="t_name"  value="<%=name %>" size="20"></td>
					<td><input type="text" name="t_code" id="t_code"  value="<%=code %>" size="20"></td>
					<td><input type="text" name="t_gender" id="t_gender"  value="<%=gender %>" size="20"></td>
					<td><input type="text" name="t_age" id="t_age"  value="<%=age %>" size="20"></td>
					<td><input type="text" name="t_height" id="t_height"  value="<%=height %>" size="20"></td>
					<td><input type="text" name="t_weight" id="t_weight"  value="<%=weight %>" size="20"></td>
					<td><input type="text" name="diagnosis" id="diagnosis"  value="<%=diagnosis %>" size="20"></td>
					</tr>
					</table>
					<div class="form_button" >
						<button class="button special" onclick="upcheck();">수정 완료</button>
						&nbsp;
						<span class="button alt" onclick="location.href='../member/mypage.jsp'">취소</span>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
<% } %>	

<%@ include file="../footer.jsp" %>

</body>
</html>l>