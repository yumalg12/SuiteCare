<%@ page import="reservation.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  isELIgnored="false" %>
	<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 간병 예약</title>
<%@ include file="/header-import.jsp"%>
<script src="<%=context%>/assets/js/progress.js"></script>                                                                                              
<script>
function checkForm() {
	var selectname=document.getElementById("tname").value;
	if(selectname=="") {
		alert("피간병인 이름을 선택해주세요.");
		return false;
	}
	return true;	
}

function inserttinfo() {
	window.location.href = "../careTaker/takerInfo.jsp";
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

	<!-- Two -->
	<section id="two" class="wrapper style2">
	
	<div id="res-progress">
	<ul>
	<li class="active">피간병인 선택</li>
	<li>피간병인 정보 입력</li>
	<li>간병장소 선택</li>
	<li>예약 일시 지정</li>
	<li>빠른매칭 서비스</li>
	</ul>
	</div>
	
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>maecenas sapien feugiat ex purus</p>
						<h2>피간병인 정보 선택</h2>
					</header>
					<div class="form_wrapper">
						<form action="/suiteCare/reservation/name" method = "post" name="cnameform"
							onSubmit="return checkForm();">
							<div class="form_row">
								<label>피간병인 이름</label> 
								<div>
								<select name="tname" id="tname">
									<option value="">간병받으실 분 선택</option>
									<c:forEach var="tnameList" items="${nameList}"> 
								
									<option value=${tnameList.t_name}>${tnameList.t_name}</option>
									</c:forEach> 
								</select>
								<div style="text-align: center; margin: 1rem;">
								<a onclick="inserttinfo();" style="cursor: pointer; ">다른 피간병인 정보 등록하기</a> 
								</div>
								</div>
							</div>
							<div class="form_button">
								<input type="submit" class="button special" value="선택">
							</div>
							<input type="hidden" name="type" value="tinfo"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
		<%@ include file="/footer.jsp"%>
	
</body>
</html>