<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>SC 스위트케어 | 시급 입력하기</title>
<%@ include file="/header-import.jsp"%>

<link rel="stylesheet" href="${context}/assets/css/popup.css" />

</head>

<body>
<%
g_id = request.getParameter("g_id");
String g_name = request.getParameter("g_name");
String res_code = request.getParameter("res_code");
%>
	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<h2>시급 입력하기</h2>
					</header>

					<div class="form_wrapper">
						<div class="form_row">
						<label>간병인의 선호시급</label><div class="form_row">
						<label>1순위</label><input type="text" value="${wageArr[2]}원" readonly>
						<label>2순위</label><input type="text" value="${wageArr[1]}원" readonly>
						<label>3순위</label><input type="text" value="${wageArr[0]}원" readonly>
						</div>
						</div>
					<form action="../match/apply" method="post" name="hourwageForm" id="hourwageForm">
						<input type="hidden" name="type" value="hourwage"/>
						<input type="hidden" name="g_id" value=<%=g_id %>>
						<input type="hidden" name="res_code" value=<%=res_code %>>
						<input type="hidden" name="g_name" value=<%=g_name %>>
						<hr>
							<div class="form_row">
								<label for="hourwage">빠른매칭 시급</label>
								<div style="display: flex; align-items: center; gap: 5px;">
						<input type="number" id="hourwage" name="hourwage" value="${wageArr[2]}" required autofocus readonly>원
								</div>
							</div>
							<div class="form_button">
								<button class="button special" type="submit">예약 진행</button>
							</div>
						</form>

					</div>
					<!-- /container -->
				</div>
			</div>
		</div>
	</section>

</body>
	 <script>
        document.getElementById("hourwageForm").addEventListener("submit", function () {
        });
    </script>
    
    
</html>