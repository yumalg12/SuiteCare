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
					<form action="../match/apply" method="post" name="hourwageForm" id="hourwageForm">
						<input type="hidden" name="type" value="hourwage"/>
						<input type="hidden" name="g_id" value=<%=g_id %>>
						<input type="hidden" name="res_code" value=<%=res_code %>>
						<input type="hidden" name="g_name" value=<%=g_name %>>
							<div class="form_row">
								<label for="hourwage">빠른매칭 시급</label>
								<div style="display: flex; align-items: center; gap: 5px;">
						<select id="hourwage" name="hourwage" value="${wageArr[2]}" required autofocus>
						<c:forEach var="wage" items="${wageArr}">
							<option value="${wage}"
						        <c:choose>
						            <c:when test="${wage == wageArr[2]}">selected</c:when>
						            <c:otherwise></c:otherwise>
						        </c:choose>
						        >${wage}
					        </option>
						</c:forEach>
						</select>
						원
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