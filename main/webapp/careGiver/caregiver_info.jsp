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
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
		
	$(document).on('click', '#addRepre' , function() {
		$("#repreTbody").append("<tr id='repreTr'><td id='repreTd'><input type=text name='repre'></td></tr>")

		var repreCnt = 0;
		$("#repreTr > #repreTd").each(function(){
			repreCnt++;
        });
	
		$("#repreTbody .repre").attr("rowspan", repreCnt);
	});	
		
	$(document).on('click', '#add' , function() {
		$("#qualTbody").append("<tr id='qualTr'><td id='qualTd'><input type=text name='qual'></td></tr>")

		var qualCnt = 0;
		$("#qualTr > #qualTd").each(function(){
			qualCnt++;
        });
	
		$("#qualTbody .qual").attr("rowspan", qualCnt);
	});
	
	function change_pw() {
		window.open("http://localhost:8060/suiteCare/careGiver/Change_pw.jsp", "name(about:blank)", "width=500, height=500");
	}
	
</script>

</head>
<body>
	<c:forEach var="info" items="${info }">
		<form name="infoForm">
			<table id="infoTable" border=1>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" value="${info.g_id }" disabled></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="pw" disabled>
						<input type="button" value="비밀번호 변경" onclick="change_pw()">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${info.g_name }"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="M" <c:if test="${info.g_gender eq 'M' }">checked</c:if>>남
						<input type="radio" name="gender" value="W" <c:if test="${info.g_gender eq 'W' }">checked</c:if>>여
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth" value="${info.g_birth }" disabled></td>
				</tr>
				<tr>
					<td rowspan=2>휴대폰</td>
					<td><input type="text" name="phone" value="${info.g_phone }"></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="sms_yn" value = "Y" <c:if test="${info.g_sms_yn eq 'Y' }">checked</c:if>>SMS 소식을 수신합니다.</td>
				</tr>
				<tr>
					<td rowspan=2>이메일</td>
					<td><input type="text" name="email" value="${info.g_email }"></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="email_yn" value = "Y" <c:if test="${info.g_email_yn eq 'Y' }">checked</c:if>>메일로 소식을 수신합니다.</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" value="${info.g_address }"></td>
				</tr>
				
				<c:set var="representatives" value="${fn:split(info.g_representative,'&')}" />
				<tbody id="repreTbody">
					<c:forEach var="repre" items="${representatives}" varStatus="r">
				       <tr id="repreTr">
							<c:if test="${r.index eq 0 }">
								<td class="repre" rowspan="${fn:length(repre)}">대표서비스</td>
							</c:if>
							<td id="repreTd">
								<input type="text" value="${repre }" name="repre">
								<c:if test="${r.first}"><input type="button" value="추가" id="addRepre"></c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				
				<c:set var="qualifications" value="${fn:split(info.g_qualification,'&')}" />
				<tbody id="qualTbody">
					<c:forEach var="qual" items="${qualifications}" varStatus="status">
				       <tr id="qualTr">
				       		<c:if test="${status.index eq 0}">
								<td class="qual" rowspan="${fn:length(qual)}">자격증</td>
							</c:if>
							<td id='qualTd'>
								<input type="text" value="${qual }" name="qual">
								<c:if test="${status.first}"><input type="button" value="추가" id="add"></c:if>
							</td>
						</tr>
					</c:forEach> 
				</tbody>
				
				<tr>
					<td>위치</td>
					<td><input type="text" value="${info.g_location }"></td>
				</tr>
				<tr>
					<td>가입날짜</td>
					<td><input type="text" value="${info.g_signup_date }" disabled></td>
				</tr>
			
			</table>
		</form>
	</c:forEach>
</body>
</html>

