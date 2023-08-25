<%@ page import="reservation.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SC 스위트케어 | 간병 예약</title>
<%@ include file="/header-import.jsp"%>
<script src="<%=context%>/assets/js/progress.js"></script>                                                                                              
<style>
.conB_content {
	text-align: center;
}

form:hover {
	transform: scale(1.1);
	transition: 0.1s linear;
}

.conB_content>.icon {
	font-size: 10rem;
	margin-top: 3rem;
}
</style>
<script>
function resstop() {
	alert("예약이 중지되었습니다.");
	window.location.href = "<%=context%>/member/main";
}
</script>
</head>

<body>
	<%@ include file="/header.jsp"%>

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Eleifend vitae urna</p>
				<h2>SC SuiteCare</h2>
			</header>
		</div>
	</section>
	<%
	request.setCharacterEncoding("utf-8");
	String caretaker_code = (String) session.getAttribute("caretaker_code");
	String res_code = (String) session.getAttribute("res_code");
	String r_code = request.getParameter("res_code");
	session.setAttribute("r_code", r_code);
	%>
	<!-- Two -->
	<section id="two" class="wrapper style2">
	
	<div id="res-progress">
	<ul>
	<li>피간병인 선택</li>
	<li>피간병인 정보 입력</li>
	<li class="active">간병장소 선택</li>
	<li>예약 일시 지정</li>
	<li>빠른매칭 서비스</li>
	</ul>
	</div>
	
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>maecenas sapien feugiat ex purus</p>
						<h2>간병장소 선택</h2>
					</header>

					<!-- One -->
					<div class="grid-style">

						<form id="formA" action="insertloc.jsp" method="post">
							<input type="hidden" name="home" value="home">
							<div class="box" onclick="insertValue('home')"
								style="cursor: pointer;">
								<div class="conB_content">
									<i class="fa-regular fa-house icon" style="color: #423730;"></i>
								</div>
								<div class="content">
									<header class="align-center">
										<h2>자택</h2>
									</header>
								</div>
							</div>
						</form>

						<form id="formB" action="reshospital.jsp" method="post">
							<input type="hidden" name="hospital" value="hospital">
							<div class="box" onclick="insertValue('hospital')"
								style="cursor: pointer;">
								<div class="conB_content">
									<i class="fa-regular fa-hospital icon" style="color: #423730;"></i>
								</div>
								<div class="content">
									<header class="align-center">
										<h2>병원</h2>
									</header>
								</div>
							</div>
						</form>

						
					</div>
<div class="form_button">
						 <input type="button" class="button alt" onclick="resstop();" value="예약 중지">
</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/footer.jsp"%>

</body>

<script>
	function insertValue(value) {
		var form;
		if (value === 'home') {
			form = document.getElementById('formA');
		} else if (value === 'hospital') {
			form = document.getElementById('formB');
		}

		// 폼을 서버로 전송 (form.submit() 호출)
		form.submit();
	}
	
	
</script>
</html>